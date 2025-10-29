import 'dart:async';
import 'dart:io' show File, Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:garden_app/data/session.dart';
import 'package:garden_app/services/task_event_api.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioIntroPage2 extends StatefulWidget {
  final VoidCallback? onFinished;
  const AudioIntroPage2({super.key, this.onFinished});

  @override
  State<AudioIntroPage2> createState() => _AudioIntroPage2State();
}

class _AudioIntroPage2State extends State<AudioIntroPage2> {
  final AudioRecorder _rec = AudioRecorder(); // record v5
  final AudioPlayer _player = AudioPlayer(); // just_audio

  bool _isRecording = false;
  bool _isPaused = false;
  Duration _elapsed = Duration.zero;
  Timer? _ticker;

  String? _nativePath;
  String? _webUrl;

  DateTime? _startedAt;

  @override
  void dispose() {
    _ticker?.cancel();
    _player.dispose();
    _rec.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _elapsed = _elapsed + const Duration(seconds: 1);
      });
    });
  }

  // Future<String> _makeNativePath() async {

  //   final dir = await getApplicationDocumentsDirectory();
  //   final ts = DateTime.now().millisecondsSinceEpoch;
  //   return '${dir.path}/voice_$ts.m4a';
  // }

  Future<String> _makeNativePath() async {
    // Gauname ID tiesiogiai, kadangi reikia jį įtraukti į kelią
    final accountId = await Session.getAccountId();
    const String recordingTaskCode =
        'sodo_vizualizacija'; // Paimta iš _startRecording()

    final dir = await getApplicationDocumentsDirectory();
    final String ts = DateTime.now().toUtc().toIso8601String().replaceAll(
      RegExp(r'[^\w]'),
      '_',
    ); // Datą paverčiame failo vardu

    // NAUJAS UNIKALUS PAVADINIMAS: accountId_taskCode_timestamp.m4a
    final String filename = '${accountId}_${recordingTaskCode}_$ts.m4a';

    return '${dir.path}/$filename';
  }

  Future<void> _startRecording() async {
    try {
      final hasPerm = await _rec.hasPermission();
      if (!hasPerm) {
        _snack('Nėra mikrofono leidimo.');
        return;
      }
      if (await _rec.isRecording()) {
        _snack('Įrašymas jau vyksta.');
        return;
      }

      _elapsed = Duration.zero;
      _startedAt = DateTime.now();

      if (kIsWeb) {
        await _rec.start(
          const RecordConfig(
            encoder: AudioEncoder.opus,
            sampleRate: 48000,
            bitRate: 128000,
          ),
          path: 'web',
        );
        _webUrl = null;
        _nativePath = null;
      } else {
        final path = await _makeNativePath();
        await _rec.start(
          const RecordConfig(
            encoder: AudioEncoder.aacLc,
            sampleRate: 44100,
            bitRate: 128000,
          ),
          path: path,
        );
        _nativePath = path;
        _webUrl = null;
      }

      setState(() {
        _isRecording = true;
        _isPaused = false;
      });
      _startTicker();
      // **********************************************************
      // TIESIOGINĖ DB FIKSACIJA (MINIMALU)
      // **********************************************************
      const String recordingTaskCode = 'sodo_vizualizacija';
      final accountId = await Session.getAccountId();

      if (accountId != null) {
        // Reikalingas TaskService importas (kurį turite būti atlikęs)
        // TaskService.reportAudioRecordStart(
        //   accountId: accountId,
        //   taskCode: recordingTaskCode,
        // );

        // NAUDOJAME TIESIOGINĮ API KVETIMĄ, KAIP JŪS PRAŠĖTE PILDYTI ANKSČIAU
        TaskEventApi.send(
          pin: accountId.toString(),
          taskCode: recordingTaskCode,
          event: 'AUDIO_RECORD_START',
          payload: null,
        );
      }
      // **********************************************************

      _snack('Įrašymas pradėtas.');
    } catch (e) {
      _snack('Klaida pradedant įrašymą: $e');
    }
  }

  Future<void> _pauseRecording() async {
    try {
      if (!_isRecording || _isPaused) return;
      await _rec.pause();
      _ticker?.cancel();
      setState(() => _isPaused = true);
    } catch (e) {
      _snack('Klaida stabdant: $e');
    }
  }

  Future<void> _resumeRecording() async {
    try {
      if (!_isRecording || !_isPaused) return;
      await _rec.resume();
      setState(() => _isPaused = false);
      _startTicker();
    } catch (e) {
      _snack('Klaida tęsiant: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      if (!_isRecording) return;

      final result = await _rec.stop();
      _ticker?.cancel();

      if (kIsWeb) {
        _webUrl = result;
        _nativePath = null;
        if (_webUrl != null) {
          await _player.setUrl(_webUrl!);
        }
      } else {
        _nativePath = result;
        _webUrl = null;
        print('ĮRAŠYTA SĖKMINGAI! Kelias: $_nativePath');
        if (_nativePath != null) {
          await _player.setFilePath(_nativePath!);
        }
      }

      setState(() {
        _isRecording = false;
        _isPaused = false;
      });
      _snack('Įrašymas sustabdytas.');
    } catch (e) {
      _snack('Klaida sustabdant: $e');
    }
  }

  Future<void> _play() async {
    try {
      if (_player.playing) {
        await _player.stop();
      }
      await _player.seek(Duration.zero);
      await _player.play();
    } catch (e) {
      _snack('Nepavyko paleisti įrašo: $e');
    }
  }

  String _fmt(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return h == '00' ? '$m:$s' : '$h:$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final hasResult = kIsWeb ? _webUrl != null : _nativePath != null;
    final resultLabel = kIsWeb ? _webUrl ?? '' : _nativePath ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paprašysiu paspausti balso įrašymo mygtuką ir kelias minutes pakalbėti apie Sodą, '
            'ką jame matai, kas vyksta. Kai jausi, kad kalbėti jau nebesinori – sustabdyk įrašymą.\n\n'
            'Tavo balso įrašas svarbus moksliniais tikslais. Jei nenori – spausk „Tęsti be įrašymo“.',
            textAlign: TextAlign.justify,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Icon(
                _isRecording
                    ? (_isPaused ? Icons.pause_circle : Icons.mic)
                    : Icons.mic_none,
                color: Colors.green[700],
              ),
              const SizedBox(width: 8),
              Text(
                _fmt(_elapsed),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: _isRecording ? null : _startRecording,
                icon: const Icon(Icons.fiber_manual_record),
                label: const Text('Įrašyti'),
              ),
              OutlinedButton.icon(
                onPressed: _isRecording && !_isPaused ? _pauseRecording : null,
                icon: const Icon(Icons.pause),
                label: const Text('Pauzė'),
              ),
              OutlinedButton.icon(
                onPressed: _isRecording && _isPaused ? _resumeRecording : null,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Tęsti'),
              ),
              ElevatedButton.icon(
                onPressed: _isRecording ? _stopRecording : null,
                icon: const Icon(Icons.stop),
                label: const Text('Saugoti'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          if (hasResult) ...[
            const Divider(height: 24),
            Text(
              'Įrašas paruoštas perklausai:',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _play,
                  icon: const Icon(Icons.play_circle),
                  label: const Text('Leisti'),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],

          const SizedBox(height: 24),

          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pasirinkta tęsti be įrašymo')),
              );
            },
            child: const Text('Tęsti be įrašymo'),
          ),
        ],
      ),
    );
  }
}

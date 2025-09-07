import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart' show rootBundle;

class ExtraMeditationsPage extends StatefulWidget {
  const ExtraMeditationsPage({super.key});

  @override
  State<ExtraMeditationsPage> createState() => _ExtraMeditationsPageState();
}

class _ExtraMeditationsPageState extends State<ExtraMeditationsPage> {
  final _player = AudioPlayer();
  int? _currentIndex; 
  String? _lastError; 
  bool _assetsOk = false;


  final _tracks = const [
    _Track(
      fileName: 'kvepavimas.mp3',
      title: 'Trumpa kvėpavimo meditacija',
      prettyId: 'kvėpavimas',
    ),
    _Track(
      fileName: 'kunoskenavimas.mp3',
      title: 'Kūno skenavimas',
      prettyId: 'kūno skenavimas',
    ),
    _Track(
      fileName: 'kalnomeditacija.mp3',
      title: 'Kalno meditacija',
      prettyId: 'kalno meditacija',
    ),
    _Track(
      fileName: 'sedejimomeditacija.mp3',
      title: 'Sėdėjimo meditacija',
      prettyId: 'sėdėjimo meditacija',
    ),
    _Track(
      fileName: 'mylintisgerumas3.mp3',
      title: 'Mylintis gerumas',
      prettyId: 'mylintis gerumas',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initAudioSession();
    _wirePlayerEvents();
    _checkAssetsInManifest();
  }

  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  void _wirePlayerEvents() {

    _player.playerStateStream.listen(
      (state) {
        if (state.processingState == ProcessingState.completed) {
          _player.stop();
          _currentIndex = null;
          if (mounted) setState(() {});
        }
      },
      onError: (Object e, StackTrace st) {
        setState(() => _lastError = 'just_audio error: $e');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Grojimo klaida: $e')));
      },
    );
  }

  Future<void> _checkAssetsInManifest() async {
    try {
      final manifest = await rootBundle.loadString('AssetManifest.json');
      bool allPresent = true;
      for (final t in _tracks) {
        final path = 'assets/audio/${t.fileName}';
        if (!manifest.contains(path)) {
          allPresent = false;
          _lastError =
              'Trūksta $path (patikrink pubspec.yaml įrašą ir failo pavadinimą).';
        }
      }
      setState(() => _assetsOk = allPresent);
    } catch (e) {
      setState(() {
        _assetsOk = false;
        _lastError = 'Nepavyko perskaityti AssetManifest.json: $e';
      });
    }
  }

  Future<bool> _assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

 

  Future<void> _playIndex(int index) async {
    final assetPath = 'assets/audio/${_tracks[index].fileName}';

    if (!await _assetExists(assetPath)) {
      setState(
        () =>
            _lastError =
                'Nerastas asset: $assetPath. Patikrink pubspec.yaml ir failo pavadinimą.',
      );
      return;
    }

    try {
      if (_currentIndex != index) {
        _currentIndex = index;
        await _player.setAsset(assetPath);
      }
      await _player.play();
      setState(() => _lastError = null);
    } catch (e) {
      setState(
        () => _lastError = 'Nepavyko paleisti „${_tracks[index].title}“: $e',
      );
      _currentIndex = null;
    }
  }

  Future<void> _pause() async {
    try {
      await _player.pause();
      setState(() {});
    } catch (e) {
      setState(() => _lastError = 'Pause klaida: $e');
    }
  }

  Future<void> _stop() async {
    try {
      await _player.stop(); 
      _currentIndex = null; 
      setState(() {});
    } catch (e) {
      setState(() => _lastError = 'Stop klaida: $e');
    }
  }

  String _fmt(Duration? d) {
    if (d == null) return '--:--';
    final mm = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final ss = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    final hh = d.inHours;
    return hh > 0 ? '$hh:$mm:$ss' : '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        if (!_assetsOk || _lastError != null)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _lastError ??
                        'Įspėjimas: ne visi audio assetai rasti AssetManifest.json. Patikrink pubspec.yaml.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.red[800],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Patikrinti iš naujo',
                  onPressed: _checkAssetsInManifest,
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: _tracks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final track = _tracks[index];
              final isThis = _currentIndex == index;
              final isPlaying = isThis && _player.playing;

              
              final IconData mainIcon =
                  isPlaying ? Icons.pause_circle : Icons.play_circle_fill;
              final VoidCallback mainHandler =
                  isPlaying ? () => _pause() : () => _playIndex(index);

          
              final bool canStop = isThis;

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              track.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 28,
                            tooltip: isPlaying ? 'Pauzė' : 'Grojimas',
                            icon: Icon(mainIcon),
                            color: Colors.green[700],
                            onPressed: mainHandler,
                          ),
                          const SizedBox(width: 4),
                          IconButton(
                            iconSize: 26,
                            tooltip: 'Stop',
                            icon: const Icon(Icons.stop_circle),
                            color: canStop ? Colors.red[700] : Colors.grey[400],
                            onPressed: canStop ? _stop : null,
                          ),
                        ],
                      ),

                
                      if (isThis) ...[
                        const SizedBox(height: 4),
                        StreamBuilder<Duration?>(
                          stream: _player.durationStream,
                          builder: (context, snapDur) {
                            final total = snapDur.data ?? Duration.zero;
                            return StreamBuilder<Duration>(
                              stream: _player.positionStream,
                              builder: (context, snapPos) {
                                final pos = snapPos.data ?? Duration.zero;
                                final value =
                                    total.inMilliseconds == 0
                                        ? 0.0
                                        : (pos.inMilliseconds /
                                                total.inMilliseconds)
                                            .clamp(0.0, 1.0);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Slider(
                                      value: value,
                                      onChanged: (v) {
                                        final seekTo = Duration(
                                          milliseconds:
                                              (total.inMilliseconds * v)
                                                  .round(),
                                        );
                                        _player.seek(seekTo);
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _fmt(pos),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        Text(
                                          _fmt(total),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 4),
                      ],

               
                      Text(
                        track.prettyId,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isThis ? Colors.grey[700] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Track {
  final String fileName; 
  final String title; 
  final String prettyId; 
  const _Track({
    required this.fileName,
    required this.title,
    required this.prettyId,
  });
}

import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:garden_app/models/task.dart';
import 'package:http/http.dart' as http;

String get _baseUrl {
  if (kIsWeb) return 'http://127.0.0.1:8000';
  if (Platform.isAndroid) return 'http://10.0.2.2:8000';
  return 'http://127.0.0.1:8000';
}

class TaskEventApi {
  static Future<void> send({
    required String pin,
    required String taskCode,
    required String event,
    DateTime? clientTime,
    Map<String, dynamic>? payload,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/tasks/event/');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'pin': pin,
        'task_code': taskCode,
        'event': event,
        'client_time': (clientTime ?? DateTime.now()).toUtc().toIso8601String(),
        if (payload != null) 'payload': payload,
      }),
    );

    if (res.statusCode != 201) {
      print('DJANGO 400 KLAIDA BODY: ${res.body}');
      throw Exception('TaskEvent klaida: ${res.statusCode} ${res.body}');
    }
  }
}

// lib/services/task_service.dart

// Importuojame esamą API klasę
// Pakeiskite į teisingą kelio adresą

// Užduočių (Task) verslo logikos sluoksnis
class TaskService {
  // Nustatome įvykio tipo pavadinimą, kuris atitiks logiką Django pusėje
  static const String _completionEvent = 'TASK_COMPLETED';
  static const String _audioListenEvent = 'AUDIO_LISTEN'; // <-- NAUJA KONSTANTA
  static const String _audioRecordStartEvent = 'AUDIO_RECORD_START';
  // lib/services/task_service.dart
  static Future<List<Task>> getTasksForWeek(int weekNumber) async {
    // PAVYZDYS: Čia turėtų būti API kvietimas. Kol kas gražiname fiksuotą sąrašą.
    // Turėsite rasti būdą, kaip gauti Task objektus Flutteryje.
    return [];
  }

  static Future<void> reportAudioRecordStart({
      required int accountId,
      required String taskCode, // Unikalus užduoties kodas (pvz., 'sodo_vizualizacija_balso_irasas')
    }) async {
        try {
            // Naudojame TaskEventApi.send siųsti įvykį į Django
            await TaskEventApi.send(
                pin: accountId.toString(),
                taskCode: taskCode,
                event: _audioRecordStartEvent, // Naudojame naują konstantą
                payload: null, // Nesiunčiame papildomų duomenų
            );
        } catch (e) {
            // Spausdiname klaidą, jei nepavyko pasiekti API
            print('Klaida siunčiant įrašymo pradžios įvykį: $e'); 
        }
    }
  static Future<void> reportAudioListen({
    required int accountId,
    required String audioCode, // Pvz.: 'kvepavimas.mp3' arba 'relaksacija.mp3'
  }) async {
    try {
      // Audio įrašo kodą perduosime kaip task_code
      await TaskEventApi.send(
        pin: accountId.toString(),
        taskCode: audioCode, // Audio failo pavadinimas
        event: _audioListenEvent,
        payload: null,
      );
    } catch (e) {
      print('Klaida siunčiant audio klausymo įvykį: $e');
    }
  }

  // Grąžina atliktų užduočių skaičių
  static Future<int> getCompletedTaskCount({
    required int accountId,
    required int weekNumber,
  }) async {
    // PAVYZDYS: Čia turėtų būti API kvietimas.
    // Kol kas grąžiname 0.
    return 0;
  }
  // ... kiti TaskService metodai ...

  static Future<bool> isWeekCompleted({
    required int accountId,
    required int weekNumber,
  }) async {
    // 1. Gauti visus tasks šiai savaitei
    final tasks = await getTasksForWeek(weekNumber);
    if (tasks.isEmpty) {
      return true; // Jei nėra užduočių, laikome, kad savaitė baigta
    }

    // 2. Gauti atliktų užduočių skaičių
    final completedCount = await getCompletedTaskCount(
      accountId: accountId,
      weekNumber: weekNumber,
    );

    // 3. Patikrinti, ar atliktos visos užduotys
    return completedCount == tasks.length;
  }

  // ... kiti TaskService metodai ...
  // Funkcija, kuri paruošia duomenis ir iškviečia bendrąjį API metodą
  static Future<bool> completeTask({
    required String userPin, // Naudojame PIN kaip identifikatorių
    required String
    taskCode, // Užduoties kodas, kad Django žinotų, kurią atnaujinti
    String? mood,
  }) async {
    try {
      final Map<String, dynamic> payload = {};
      if (mood != null) {
        payload['mood'] = mood; // Jei mood nėra null, pridedame jį
      }

      await TaskEventApi.send(
        pin: userPin,
        taskCode: taskCode,
        event: _completionEvent, // Siunčiame konkretų įvykio tipą
        // Nereikia jokio papildomo payload, nes visa reikalinga info yra
        // pin, taskCode, event ir serverio laikas (fiksuojamas serveryje)
        payload: payload.isNotEmpty ? payload : null,
      );

      // Jei aukščiau esanti eilutė neįvykdė Exception, užklausa pavyko
      return true;
    } on Exception catch (e) {
      // Tvarkome klaidas, kurias išmetė TaskEventApi
      print('Nepavyko pažymėti užduoties kaip atliktos: $e');
      return false;
    }
  }

  // Čia vėliau galėtumėte pridėti ir kitus metodus, pvz.:
  // static Future<List<Task>> getTasks({required String userPin}) async { ... }
}


// lib/services/audio_api.dart (Naujas failas, arba pridėkite prie TaskEventApi)

// Pridėtas pagalbinis modelis
class AudioAssetModel {
  final String code;
  final String assetPath;

  AudioAssetModel(this.code, this.assetPath);

  factory AudioAssetModel.fromJson(Map<String, dynamic> json) {
    return AudioAssetModel(
      json['code'] as String,
      json['asset_path'] as String,
    );
  }
}


class AudioApi {
  // ... (Jūsų _baseUrl) ...
  
  // Sukurkite metodą, kuris gaus visus audio įrašus
  static Future<List<AudioAssetModel>> getAudioAssets() async {
    // Pavyzdinis endpoint, kurį reikės sukurti Django (žr. toliau ⬇️)
    final url = Uri.parse('$_baseUrl/api/audio/assets/'); 
    
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => AudioAssetModel.fromJson(json)).toList();
      } else {
        // ... Klaidos apdorojimas ...
        return [];
      }
    } catch (e) {
      // ... Klaidos apdorojimas ...
      return [];
    }
  }
}
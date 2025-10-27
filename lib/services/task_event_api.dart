import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
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

  // Funkcija, kuri paruošia duomenis ir iškviečia bendrąjį API metodą
  static Future<bool> completeTask({
    required String userPin, // Naudojame PIN kaip identifikatorių
    required String taskCode, // Užduoties kodas, kad Django žinotų, kurią atnaujinti
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
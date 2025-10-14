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

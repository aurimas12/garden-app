import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

String get _baseUrl {
  if (kIsWeb) return 'http://127.0.0.1:8000';
  if (Platform.isAndroid) return 'http://10.0.2.2:8000';
  return 'http://127.0.0.1:8000';
}

class QuestionnaireApi {
 
  static Future<void> submit({
    required int accountId,
    required String kind,
    required List<int?> answers, 
    int? total, 
    required String taskCode,
    DateTime? clientTime,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/questionnaire/submissions/');

    final res = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'X-Account-Id': accountId.toString(),
      },
      body: jsonEncode({
        'kind': kind,
        'answers': answers,
        'total': total,
        'task_code': taskCode,
        'client_time': (clientTime ?? DateTime.now()).toIso8601String(),
      }),
    );

    if (res.statusCode != 201) {
      throw Exception('Nepavyko išsiųsti: ${res.statusCode} ${res.body}');
    }
  }
}

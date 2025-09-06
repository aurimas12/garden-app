import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

String get _baseUrl {
  if (kIsWeb) return 'http://127.0.0.1:8000';
  if (Platform.isAndroid) return 'http://10.0.2.2:8000';
  return 'http://127.0.0.1:8000';
}

class EmojiApi {
  static Future<void> save({
    required int accountId,
    required String emoji,
    required String taskCode,
    DateTime? clientTime,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/emoji/choices/');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'account_id': accountId, // <-- per BODY
        'emoji': emoji,
        'task_code': taskCode,
        'client_time': (clientTime ?? DateTime.now()).toIso8601String(),
      }),
    );

    if (res.statusCode != 201) {
      throw Exception(
        'Nepavyko išsaugoti emoji: ${res.statusCode} ${res.body}',
      );
    }
  }
}

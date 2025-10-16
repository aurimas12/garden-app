import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform, SocketException;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

String get _baseUrl {
  if (kIsWeb) {
    return 'https://garden-api-o3yq.onrender.com'; // Flutter Web per Chrome
  }
  if (Platform.isAndroid) return 'http://10.0.2.2:8000'; // Android emulatorius
  return 'http://127.0.0.1:8000'; // iOS sim / desktop
}

class AuthApi {
  static Future<int> loginPin(String pin) async {
    final uri = Uri.parse('$_baseUrl/api/users/login/pin/');
    try {
      final res = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'pin': pin}),
          )
          .timeout(const Duration(seconds: 10));

      final body =
          res.body.isEmpty ? <String, dynamic>{} : jsonDecode(res.body);

      if (res.statusCode == 200 && body['ok'] == true) {
        final id = body['account_id'];
        if (id is int) return id;
        throw Exception('Blogas atsakymas: trūksta account_id');
      }

      final err = (body['error'] ?? '').toString();
      switch (err) {
        case 'PIN_REQUIRED':
          throw Exception('Įvesk 6 skaitmenų PIN.');
        case 'INVALID_PIN_FORMAT':
          throw Exception('PIN turi būti 6 skaitmenys.');
        case 'PIN_NOT_FOUND':
          throw Exception('Neteisingas PIN kodas.');
        default:
          throw Exception('Nepavyko prisijungti (${res.statusCode}).');
      }
    } on TimeoutException {
      throw Exception('Serveris neatsako (timeout).');
    } on SocketException {
      throw Exception('Nėra ryšio su serveriu.');
    }
  }
}

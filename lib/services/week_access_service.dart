// lib/services/week_access_service.dart
import 'dart:convert';
import 'dart:io' show Platform, SocketException;
import 'package:garden_app/services/task_event_api.dart';
import 'package:http/http.dart' as http;
import '../main.dart'; // Kad pasiektumėte _baseUrl
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
// *******************************************************************
// PAAIŠKINIMAS: Jums reikia apibrėžti _baseUrl panašiai kaip TaskEventApi:
// Prieš naudodami šį kodą, patikrinkite, ar _baseUrl yra pasiekiamas čia.
// Jei ne, nukopijuokite _baseUrl logiką iš TaskEventApi į šį failą.
// *******************************************************************

String get _baseUrl {
  if (kIsWeb) {
    return 'https://garden-api-o3yq.onrender.com'; // Flutter Web per Chrome
  }
  if (Platform.isAndroid) return 'http://10.0.2.2:8000'; // Android emulatorius
  return 'http://127.0.0.1:8000'; // iOS sim / desktop
}

class WeekAccessService {
  
  // 1. Gauname prisijungimo datą iš Django
  static Future<DateTime?> getAccountCreationDate(int accountId) async {
    final uri = Uri.parse('$_baseUrl/api/accounts/$accountId/');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Persikonvertuojame Django formatą į Dart DateTime
        return DateTime.parse(data['created_at']); 
      }
      return null;
    } catch (e) {
      print('Klaida gaunant prisijungimo datą: $e');
      return null;
    }
  }

  // 2. Patikriname, ar savaitė jau prieinama
  // static Future<bool> isWeekAvailable(int accountId, int weekNumber) async {
  //   // 1-oji savaitė visada prieinama
  //   if (weekNumber == 1) return true; 

  //   final creationDate = await getAccountCreationDate(accountId);

  //   if (creationDate == null) {
  //     // Jei nepavyko gauti datos, blokuojame viską, išskyrus 1 savaitę
  //     return false; 
  //   }

  //   final today = DateTime.now();
    
  //   // Dienų skaičius nuo prisijungimo
  //   final daysPassed = today.difference(creationDate).inDays;
    
  //   // Nustatome, kiek dienų reikalaujama (2 savaitė = 7d, 3 sav. = 14d, t.t.)
  //   final requiredDays = (weekNumber - 1) * 7; 
    
  //   // Savaitė atidaroma praėjus reikiamam dienų skaičiui.
  //   return daysPassed >= requiredDays;
  // }


  static Future<bool> isWeekAvailable(int accountId, int weekNumber) async {
    // 1-oji savaitė visada prieinama
    if (weekNumber == 1) return true;

    // Patikriname, ar visos praeitos savaitės užduotys yra atliktos.
    // Praeita savaitė yra weekNumber - 1.
    final previousWeekNumber = weekNumber - 1;

    // Senoji logika: Jei praeitos savaitės užduotys yra 100% atliktos,
    // nauja savaitė atrakinama NEDELSIANT.
    final isPreviousWeekCompleted = await TaskService.isWeekCompleted(
      accountId: accountId,
      weekNumber: previousWeekNumber,
    );

    return isPreviousWeekCompleted; // Grąžiname tik užbaigimo rezultatą
  }

}
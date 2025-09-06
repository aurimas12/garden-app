// lib/main.dart
import 'package:flutter/material.dart';

import 'package:garden_app/data/demesingas_laistymas.dart';
import 'package:garden_app/data/minciu_sejimas.dart';
import 'package:garden_app/data/pirmieji_vaisiai.dart';
import 'package:garden_app/data/puoselejimas.dart';
import 'package:garden_app/data/sodinukai.dart';
import 'package:garden_app/data/sodo_draugai.dart';
import 'package:garden_app/data/zydejimas.dart';
import 'package:garden_app/pin_login_page.dart';
import 'package:garden_app/services/sessions.dart';
import 'data/pasiruosimas_task.dart';

import 'models/task.dart';
import 'screens/main_screen.dart'; // tavo PIN ekranas
// import 'data/session.dart';            // SharedPreferences helperis

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Session.migratePrefs();
  // Paruošiam sekcijas kaip ir anksčiau
  final sections = <String, List<Task>>{
    'Pasiruošimas': buildPasiruosimasTasks(),
    'Minčių sėjimas': buildMinciuSejimasTasks(),
    'Sodinukai': buildSodinukaiTasks(),
    'Dėmesingas laistymas': buildDemesingasLaistymasTasks(),
    'Sodo draugai': buildSodoDraugaiTasks(),
    'Žydėjimas': buildZydejimasTasks(),
    'Pirmieji vaisiai': buildPirmiejiVaisiaiTasks(),
    'Puoselėjimas': buildPuoselejimasTasks(),
  };

  await Session.fixLegacy(); // 👈 svarbu
  // Patikrinam ar jau prisijungta (yra account_id)
  final accountId = await Session.getAccountId();
  final isLoggedIn = accountId != null;

  runApp(MyApp(sections: sections, isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final Map<String, List<Task>> sections;
  final bool isLoggedIn;
  const MyApp({super.key, required this.sections, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodas',
      theme: ThemeData(primarySwatch: Colors.green),
      // Jei prisijungta – rodom pagrindinį, jei ne – PIN puslapį
      home:
          isLoggedIn
              ? MainScreen(sections: sections)
              : PinLoginPage(sections: sections),
    );
  }
}

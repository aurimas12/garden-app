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
import 'screens/main_screen.dart';

import 'package:garden_app/services/sessions.dart';
import 'package:garden_app/task_utils.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final sections = <String, List<Task>>{
//     'Pasiruošimas': buildPasiruosimasTasks(),
//     'Minčių sėjimas': buildMinciuSejimasTasks(),
//     'Sodinukai': buildSodinukaiTasks(),
//     'Dėmesingas laistymas': buildDemesingasLaistymasTasks(),
//     'Sodo draugai': buildSodoDraugaiTasks(),
//     'Žydėjimas': buildZydejimasTasks(),
//     'Pirmieji vaisiai': buildPirmiejiVaisiaiTasks(),
//     'Puoselėjimas': buildPuoselejimasTasks(),
//   };

//   await Session.fixLegacy(); 

//   final accountId = await Session.getAccountId();
//   final isLoggedIn = accountId != null;

//   runApp(MyApp(sections: sections, isLoggedIn: isLoggedIn, accountId: accountId));
// }

// class MyApp extends StatelessWidget {
//   final Map<String, List<Task>> sections;
//   final bool isLoggedIn;
//   final int? accountId;
//   const MyApp({super.key, required this.sections, required this.isLoggedIn,this.accountId});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sodas',
//       theme: ThemeData(primarySwatch: Colors.green),
   
//       home:
//           // isLoggedIn
//           //     ? MainScreen(sections: sections)
//           //     : PinLoginPage(sections: sections),
          
//     );
//   }
// }



// main.dart

import 'package:flutter/material.dart';

// PRIDĖTI NAUJUS IMPORTUS:
import 'package:garden_app/services/sessions.dart';
import 'package:garden_app/task_utils.dart'; // <-- Turi importuoti filtravimo funkciją

// ... kiti importai ...

// ***************************************************************
// main() FUNKCIJOS PAKEITIMAI
// ***************************************************************

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  await Session.fixLegacy(); 

  final accountId = await Session.getAccountId();
  final isLoggedIn = accountId != null;

  // SVARBU: Perduodame accountId į MyApp
  runApp(MyApp(sections: sections, isLoggedIn: isLoggedIn, accountId: accountId)); 
}

// ***************************************************************
// MyApp KLASĖS PAKEITIMAI
// ***************************************************************

class MyApp extends StatelessWidget {
  final Map<String, List<Task>> sections;
  final bool isLoggedIn;
  final int? accountId; // <-- PRIDĖTAS LAUKAS

  // Atnaujiname konstruktorių
  const MyApp({super.key, required this.sections, required this.isLoggedIn, this.accountId}); 

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Sodas',
  //     theme: ThemeData(primarySwatch: Colors.green),
    
  //     home:
  //         isLoggedIn
  //             ? FutureBuilder<Map<String, List<Task>>>( // <-- NAUDOJAME FutureBuilder
  //                 // Iškviečiame filtravimo funkciją
  //                 future: getAvailableSections(sections, accountId!), 
  //                 builder: (context, snapshot) {
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     // Rodo krovimą, kol laukiame API atsakymo
  //                     return const Scaffold(
  //                       body: Center(child: CircularProgressIndicator()),
  //                     ); 
  //                   }
                    
  //                   if (snapshot.hasError) {
  //                     // Rodo klaidą, jei nepavyko pasiekti API
  //                     return Scaffold(
  //                       body: Center(child: Text('Klaida: ${snapshot.error}')), 
  //                     ); 
  //                   }
                    
  //                   // Sėkmės atveju naudojame filtruotas sekcijas
  //                   final filteredSections = snapshot.data ?? {};
  //                   return MainScreen(sections: filteredSections);
  //                 },
  //               )
  //             : PinLoginPage(sections: sections),
  //   );
  // }



  // main.dart (PATAISYTA)

@override
Widget build(BuildContext context) {
    // Saugiai gauname accountId. Jis bus null, jei neprisijungęs.
    final currentAccountId = accountId; 
    
    // Nustatome, ar rodomas pagrindinis ekranas (prisijungęs IR turi ID)
    final shouldShowMainScreen = isLoggedIn && currentAccountId != null;

    return MaterialApp(
      title: 'Sodas',
      theme: ThemeData(primarySwatch: Colors.green),
    
      home: shouldShowMainScreen 
          ? MainScreen(
              sections: sections, 
              // SVARBU: Perduodame accountId į MainScreen
              currentAccountId: currentAccountId, 
            )
          : PinLoginPage(sections: sections),
    );
}
}
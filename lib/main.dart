import 'package:flutter/material.dart';
import 'models/task.dart';
import 'screens/main_screen.dart';
import 'data/pasiruosimas_task.dart';

void main() {
  final sections = <String, List<Task>>{
    'Pasiruošimas': buildPasiruosimasTasks(),
  };
  runApp(MyApp(sections: sections));
}

class MyApp extends StatelessWidget {
  final Map<String, List<Task>> sections;
  const MyApp({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodas',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainScreen(sections: sections),
    );
  }
}

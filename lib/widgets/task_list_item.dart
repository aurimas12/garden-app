// lib/widgets/task_list_item.dart
import 'package:flutter/material.dart';
import 'package:garden_app/services/task_event_api.dart';
// Importuojate TaskService

// 1. Užduoties modelis (pavyzdys)
class Task {
  final String taskCode;
  bool isCompleted;
  // ... kiti laukai ...
  Task({required this.taskCode, this.isCompleted = false});
}

class TaskListItem extends StatefulWidget {
  final Task task;

  const TaskListItem({required this.task, super.key});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  // 2. FUNKCIJOS ĮDĖJIMO VIETA (Šios klasės viduje)
  void _onTaskChecked(String taskCode) async {
    // PASTOBA: '1234' turite pakeisti į dinaminį kintamąjį, 
    // gautą iš jūsų autentifikacijos valdyklės (pvz., Provider, BLoC).
    const String userPin = '1234'; 
    
    // Rodyti, kad vyksta krovimas (UI)
    setState(() {}); 

    bool success = await TaskService.completeTask(
      userPin: userPin,
      taskCode: taskCode,
    );

    if (success) {
      // Atnaujinti UI: pažymėti elementą kaip atliktą
      setState(() {
        widget.task.isCompleted = true; // Atnaujiname lokalią būseną
      });
    } else {
      // Parodyti klaidą vartotojui (pvz., per SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Klaida: Nepavyko atnaujinti užduoties serveryje.')),
      );
    }
  }
  
  // ... build metodas ...

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Užduotis: ${widget.task.taskCode}'),
      // 3. FUNKCIJOS IŠKVIETIMO VIETA (Ant vartotojo sąsajos elemento)
      trailing: Checkbox(
        value: widget.task.isCompleted,
        onChanged: widget.task.isCompleted
            ? null // Jei jau atlikta, neleidžiame keisti
            : (bool? newValue) {
                if (newValue == true) {
                  // Iškviečiame logiką, perduodami užduoties kodą
                  _onTaskChecked(widget.task.taskCode);
                }
              },
      ),
    );
  }
}
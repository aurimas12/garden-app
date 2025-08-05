import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_detail_screen.dart';
import 'results_screen.dart';

class MainScreen extends StatefulWidget {
  final Map<String, List<Task>> sections;
  const MainScreen({super.key, required this.sections});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, bool> _expandedSections = {};
  final List<String> _sectionOrder = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _sectionOrder.addAll(widget.sections.keys);
    for (var s in _sectionOrder) {
      _expandedSections[s] = false;
    }
  }

  void _toggleSection(String section) {
    setState(() => _expandedSections[section] = !_expandedSections[section]!);
  }

  bool _isSectionLocked(String sectionTitle) {
    final i = _sectionOrder.indexOf(sectionTitle);
    if (i == 0) return false;
    final prevTasks = widget.sections[_sectionOrder[i - 1]]!;
    return prevTasks.any((t) => !t.done);
  }

  void _markTaskComplete(Task task, String? mood) {
    setState(() {
      task.done = true;
      task.mood = mood;
    });
  }

  Widget _buildSection(String title, List<Task> tasks) {
    final isExpanded = _expandedSections[title]!;
    final completed = tasks.where((t) => t.done).length;
    final isLocked = _isSectionLocked(title);

    return Opacity(
      opacity: isLocked ? 0.4 : 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: GestureDetector(
          onTap: isLocked ? null : () => _toggleSection(title),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD9EDDD),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.nature, color: Colors.green[700]),
                  title: Text(title, style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.expand_more),
                ),
                if (isExpanded && !isLocked)
                  Column(
                    children: [
                      ...tasks.map(
                        (task) => ListTile(
                          leading: Icon(
                            task.done
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: task.done ? Colors.green : Colors.grey,
                          ),
                          title: Text(task.text),
                          // onTap: () {
                          //   // 👇 Jei turime custom 5 puslapių ekraną – naudojam jį
                          //   if (task.screenBuilder != null) {
                          //     final screen = task.screenBuilder!.call(() {
                          //       _markTaskComplete(task, task.mood);
                          //     });
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (_) => screen),
                          //     );
                          //   } else {
                          //     // kitaip – senasis bendras ekr.
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder:
                          //             (_) => TaskDetailScreen(
                          //               task: task,
                          //               onComplete:
                          //                   (m) => _markTaskComplete(task, m),
                          //             ),
                          //       ),
                          //     );
                          //   }
                          // },
                          onTap: () {
                            if (task.screenBuilder != null) {
                              final screen = task.screenBuilder!.call(() {
                                setState(() {
                                  task.done = true;
                                });
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => screen),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => TaskDetailScreen(
                                        task: task,
                                        onComplete: (m) {
                                          setState(() {
                                            task.done = true;
                                            task.mood = m;
                                          });
                                        },
                                      ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$completed iš ${tasks.length} atlikta'),
                            const SizedBox(height: 4),
                            LinearProgressIndicator(
                              value:
                                  tasks.isNotEmpty
                                      ? completed / tasks.length
                                      : 0,
                              backgroundColor: Colors.grey[300],
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final body =
        _currentIndex == 0
            ? ListView(
              children:
                  widget.sections.entries
                      .map((e) => _buildSection(e.key, e.value))
                      .toList(),
            )
            : _currentIndex == 1
            ? ResultsScreen(sections: widget.sections)
            : const Center(child: Text('Nustatymai netrukus...'));

    return Scaffold(
      backgroundColor: const Color(0xFFF9FCF9),
      appBar: AppBar(
        title: const Text('Mano sodas'),
        backgroundColor: Colors.green,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: const Color(0xFFF9FCF9),
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Priminimai'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Rezultatai'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Nustatymai',
          ),
        ],
      ),
    );
  }
}

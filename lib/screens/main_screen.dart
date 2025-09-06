// import 'package:flutter/material.dart';
// import 'package:garden_app/screens/pages/extra_meditations.dart';
// import '../models/task.dart';
// import 'task_detail_screen.dart';
// import 'results_screen.dart';

// class MainScreen extends StatefulWidget {
//   final Map<String, List<Task>> sections;
//   const MainScreen({super.key, required this.sections});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final Map<String, bool> _expandedSections = {};
//   final List<String> _sectionOrder = [];
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _sectionOrder.addAll(widget.sections.keys);
//     for (var s in _sectionOrder) {
//       _expandedSections[s] = false;
//     }
//   }

//   void _toggleSection(String section) {
//     setState(() => _expandedSections[section] = !_expandedSections[section]!);
//   }

//   bool _isSectionLocked(String sectionTitle) {
//     final i = _sectionOrder.indexOf(sectionTitle);
//     if (i == 0) return false;
//     final prevTasks = widget.sections[_sectionOrder[i - 1]]!;
//     return prevTasks.any((t) => !t.done);
//   }

//   void _markTaskComplete(Task task, String? mood) {
//     setState(() {
//       task.done = true;
//       task.mood = mood;
//     });
//   }

//   Widget _buildSection(String title, List<Task> tasks) {
//     final isExpanded = _expandedSections[title]!;
//     final completed = tasks.where((t) => t.done).length;
//     final isLocked = false;
//     // final isLocked = _isSectionLocked(title);

//     return Opacity(
//       opacity: isLocked ? 0.4 : 1.0,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
//         child: GestureDetector(
//           onTap: isLocked ? null : () => _toggleSection(title),
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFFD9EDDD),
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.nature, color: Colors.green[700]),
//                   title: Text(title, style: const TextStyle(fontSize: 18)),
//                   trailing: const Icon(Icons.expand_more),
//                 ),
//                 if (isExpanded && !isLocked)
//                   Column(
//                     children: [
//                       ...tasks.map(
//                         (task) => ListTile(
//                           leading: Icon(
//                             task.done
//                                 ? Icons.check_circle
//                                 : Icons.radio_button_unchecked,
//                             color: task.done ? Colors.green : Colors.grey,
//                           ),
//                           title: Text(task.text),

//                           onTap: () {
//                             if (task.screenBuilder != null) {
//                               final screen = task.screenBuilder!.call(() {
//                                 setState(() {
//                                   task.done = true;
//                                 });
//                               });
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (_) => screen),
//                               );
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => TaskDetailScreen(
//                                         task: task,
//                                         onComplete: (m) {
//                                           setState(() {
//                                             task.done = true;
//                                             task.mood = m;
//                                           });
//                                         },
//                                       ),
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 16,
//                           right: 16,
//                           bottom: 16,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('$completed iš ${tasks.length} atlikta'),
//                             const SizedBox(height: 4),
//                             LinearProgressIndicator(
//                               value:
//                                   tasks.isNotEmpty
//                                       ? completed / tasks.length
//                                       : 0,
//                               backgroundColor: Colors.grey[300],
//                               color: Colors.green,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final body =
//         _currentIndex == 0
//             ? ListView(
//               children:
//                   widget.sections.entries
//                       .map((e) => _buildSection(e.key, e.value))
//                       .toList(),
//             )
//             : _currentIndex == 1
//             ? ResultsScreen(sections: widget.sections)
//             // : const Center(child: Text('Nustatymai netrukus...'));
//             : const ExtraMeditationsPage();

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FCF9),
//       appBar: AppBar(
//         title: const Text('Mano sodas'),
//         backgroundColor: Colors.green,
//       ),
//       body: body,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (i) => setState(() => _currentIndex = i),
//         backgroundColor: const Color(0xFFF9FCF9),
//         selectedItemColor: Colors.green[800],
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Priminimai'),
//           BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Rezultatai'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Extra'),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:garden_app/screens/pages/extra_meditations.dart';
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

  // Sekcijų banerių paveikslėliai (asset keliai)
  static const _sectionImages = {
    'Pasiruošimas': 'assets/sections/1.png',
    'Minčių sėjimas': 'assets/sections/2.png',
    'Sodinukai': 'assets/sections/3.png',
    'Dėmesingas laistymas': 'assets/sections/4.png',
    'Sodo draugai': 'assets/sections/5.png',
    'Žydėjimas': 'assets/sections/6.png',
    'Pirmieji vaisiai': 'assets/sections/7.png',
    'Puoselėjimas': 'assets/sections/8.png',
  };

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
    if (i <= 0) return false;
    final prevTasks = widget.sections[_sectionOrder[i - 1]]!;
    return prevTasks.any((t) => !t.done);
  }

  void _markTaskComplete(Task task, String? mood) {
    setState(() {
      task.done = true;
      task.mood = mood;
    });
  }

  String _subtitleForIndex(int i) => 'Savaitė ${i + 1}';

  Widget _buildHeaderBanner({
    required String title,
    required String imageAsset,
    required bool isExpanded,
    required bool isLocked,
    required int completed,
    required int total,
    required VoidCallback onTap,
  }) {
    final radius = BorderRadius.circular(12);

    return InkWell(
      onTap: isLocked ? null : onTap,
      borderRadius: radius,
      child: ClipRRect(
        borderRadius: radius,
        child: SizedBox(
          height: 120, // 👈 mažas, kompaktiškas baneris
          child: Stack(
            fit: StackFit.expand,
            children: [
              // paveikslėlis
              Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      color: const Color(0xFFE9F5EC),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.photo,
                        size: 42,
                        color: Colors.grey,
                      ),
                    ),
              ),

              // gradientas (lengvas, kad matytųsi vaizdas)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.25, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.55),
                    ],
                  ),
                ),
              ),

              // tekstai + „toggle“ rodyklė apačioje
              Positioned(
                left: 12,
                right: 12,
                bottom: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _subtitleForIndex(_sectionOrder.indexOf(title)),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 180),
                      turns: isExpanded ? 0.5 : 0.0,
                      child: const Icon(
                        Icons.expand_more,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),

              // plona progreso juosta apačioje
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LinearProgressIndicator(
                  value: total == 0 ? 0 : completed / total,
                  minHeight: 3,
                  backgroundColor: Colors.black26,
                  color: Colors.lightGreenAccent,
                ),
              ),

              // užrakintas overlay (jei naudoji „lock“ logiką)
              if (isLocked)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.lock, color: Colors.white70),
                        SizedBox(width: 8),
                        Text(
                          'Atrakinsite užbaigę ankstesnę savaitę',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Task> tasks) {
    final isExpanded = _expandedSections[title]!;
    final completed = tasks.where((t) => t.done).length;

    // jei nori aktyvuoti užrakinimą – naudok:
    // final isLocked = _isSectionLocked(title);
    final isLocked = false;

    final imageAsset =
        _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF8FFF4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHeaderBanner(
                title: title,
                imageAsset: imageAsset,
                isExpanded: isExpanded,
                isLocked: isLocked,
                completed: completed,
                total: tasks.length,
                onTap: () => _toggleSection(title),
              ),

              // turinys (užduočių sąrašas), rodom tik jei išskleista ir ne lock
              if (isExpanded && !isLocked)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9EDDD),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      ...tasks.map(
                        (task) => Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(
                              task.done
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: task.done ? Colors.green : Colors.grey,
                            ),
                            title: Text(task.text),
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
                      ),
                      // papildomas apatinis progreso tekstas
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$completed iš ${tasks.length} atlikta',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: LinearProgressIndicator(
                                value:
                                    tasks.isEmpty
                                        ? 0
                                        : completed / tasks.length,
                                backgroundColor: Colors.white,
                                color: Colors.green,
                                minHeight: 6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
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
            : const ExtraMeditationsPage();

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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Sekcijos'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Rezultatai'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Extra'),
        ],
      ),
    );
  }
}

// Mažas tekstų blokas banerio apačioje
class _BannerTextBlock extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _BannerTextBlock({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: .2,
            ),
          ),
          const SizedBox(height: 2),
        ],
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            height: 1.1,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black54,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

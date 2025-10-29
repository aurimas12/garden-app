// import 'package:flutter/material.dart';
// import 'package:garden_app/screens/pages/extra_meditations.dart';
// import '../models/task.dart';
// import 'task_detail_screen.dart';
// import 'results_screen.dart';

// class MainScreen extends StatefulWidget {
//   final Map<String, List<Task>> sections;

//   const MainScreen({super.key, required this.sections, required int accountId});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final Map<String, bool> _expandedSections = {};
//   final List<String> _sectionOrder = [];
//   int _currentIndex = 0;

//   static const _sectionImages = {
//     'Pasiruošimas': 'assets/sections/1.png',
//     'Minčių sėjimas': 'assets/sections/2.png',
//     'Sodinukai': 'assets/sections/3.png',
//     'Dėmesingas laistymas': 'assets/sections/4.png',
//     'Sodo draugai': 'assets/sections/5.png',
//     'Žydėjimas': 'assets/sections/6.png',
//     'Pirmieji vaisiai': 'assets/sections/7.png',
//     'Puoselėjimas': 'assets/sections/8.png',
//   };

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
//     if (i <= 0) return false;
//     final prevTasks = widget.sections[_sectionOrder[i - 1]]!;
//     return prevTasks.any((t) => !t.done);
//   }

//   void _markTaskComplete(Task task, String? mood) {
//     setState(() {
//       task.done = true;
//       task.mood = mood;
//     });
//   }

//   String _subtitleForIndex(int i) => 'Savaitė ${i + 1}';

//   Widget _buildHeaderBanner({
//     required String title,
//     required String imageAsset,
//     required bool isExpanded,
//     required bool isLocked,
//     required int completed,
//     required int total,
//     required VoidCallback onTap,
//   }) {
//     final radius = BorderRadius.circular(12);

//     return InkWell(
//       onTap: isLocked ? null : onTap,
//       borderRadius: radius,
//       child: ClipRRect(
//         borderRadius: radius,
//         child: SizedBox(
//           height: 120,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [

//               Image.asset(
//                 imageAsset,
//                 fit: BoxFit.cover,
//                 errorBuilder:
//                     (_, __, ___) => Container(
//                       color: const Color(0xFFE9F5EC),
//                       alignment: Alignment.center,
//                       child: const Icon(
//                         Icons.photo,
//                         size: 42,
//                         color: Colors.grey,
//                       ),
//                     ),
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: const [0.25, 1],
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.55),
//                     ],
//                   ),
//                 ),
//               ),

//               Positioned(
//                 left: 12,
//                 right: 12,
//                 bottom: 10,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             _subtitleForIndex(_sectionOrder.indexOf(title)),
//                             style: const TextStyle(
//                               fontSize: 11,
//                               color: Colors.white70,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(
//                             title,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     AnimatedRotation(
//                       duration: const Duration(milliseconds: 180),
//                       turns: isExpanded ? 0.5 : 0.0,
//                       child: const Icon(
//                         Icons.expand_more,
//                         color: Colors.white,
//                         size: 26,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: LinearProgressIndicator(
//                   value: total == 0 ? 0 : completed / total,
//                   minHeight: 3,
//                   backgroundColor: Colors.black26,
//                   color: Colors.lightGreenAccent,
//                 ),
//               ),

//               if (isLocked)
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.black.withOpacity(0.35),
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Icon(Icons.lock, color: Colors.white70),
//                         SizedBox(width: 8),
//                         Text(
//                           'Atrakinsite užbaigę ankstesnę savaitę',
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(String title, List<Task> tasks) {
//     final isExpanded = _expandedSections[title]!;
//     final completed = tasks.where((t) => t.done).length;

//     final isLocked = false;

//     final imageAsset =
//         _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Material(
//         elevation: 0,
//         borderRadius: BorderRadius.circular(16),
//         color: const Color(0xFFF8FFF4),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.green.withOpacity(0.08),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               _buildHeaderBanner(
//                 title: title,
//                 imageAsset: imageAsset,
//                 isExpanded: isExpanded,
//                 isLocked: isLocked,
//                 completed: completed,
//                 total: tasks.length,
//                 onTap: () => _toggleSection(title),
//               ),

//               if (isExpanded && !isLocked)
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFD9EDDD),
//                     borderRadius: const BorderRadius.vertical(
//                       bottom: Radius.circular(16),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       ...tasks.map(
//                         (task) => Card(
//                           elevation: 0,
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: ListTile(
//                             leading: Icon(
//                               task.done
//                                   ? Icons.check_circle
//                                   : Icons.radio_button_unchecked,
//                               color: task.done ? Colors.green : Colors.grey,
//                             ),
//                             title: Text(task.text),
//                             onTap: () {
//                               if (task.screenBuilder != null) {
//                                 final screen = task.screenBuilder!.call(() {
//                                   setState(() {
//                                     task.done = true;
//                                   });
//                                 });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (_) => screen),
//                                 );
//                               } else {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder:
//                                         (_) => TaskDetailScreen(
//                                           task: task,
//                                           onComplete: (m) {
//                                             setState(() {
//                                               task.done = true;
//                                               task.mood = m;
//                                             });
//                                           },
//                                         ),
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               '$completed iš ${tasks.length} atlikta',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 140,
//                               child: LinearProgressIndicator(
//                                 value:
//                                     tasks.isEmpty
//                                         ? 0
//                                         : completed / tasks.length,
//                                 backgroundColor: Colors.white,
//                                 color: Colors.green,
//                                 minHeight: 6,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
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
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Sekcijos'),
//           BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Rezultatai'),
//           BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Extra'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:garden_app/pin_login_page.dart';
import 'package:garden_app/screens/pages/extra_meditations.dart';
import 'package:garden_app/services/task_event_api.dart';
import 'package:garden_app/task_utils.dart';
import '../models/task.dart';
import 'task_detail_screen.dart';
// NAUJI IMPORTAI:
import '../services/week_access_service.dart'; // Savaitės prieinamumo servisas


class MainScreen extends StatefulWidget {
  final Map<String, List<Task>> sections;
  final int currentAccountId; // <-- PRIIMAME ID

  // Atnaujintas konstruktorius
  const MainScreen({
    super.key,
    required this.sections,
    required this.currentAccountId,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, bool> _expandedSections = {};
  final List<String> _sectionOrder = [];
  int _currentIndex = 0;

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

  // SENA LOGIKA: Tikrina, ar užblokuota dėl neužbaigtos praeitos savaitės.
  bool _isSectionLockedByCompletion(String sectionTitle) {
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
    required bool isTimeLocked, // <-- NAUJAS LAUKAS: Laiko užrakinimas
    required bool isCompletionLocked, // <-- SENAS LAUKAS: Užbaigimo užrakinimas
    required int completed,
    required int total,
    required bool isLocked,
    required VoidCallback? onTap, // Pakeistas į VoidCallback?
  }) {
    final radius = BorderRadius.circular(12);
    // Bendra užrakinimo būsena
    final isLocked = isTimeLocked || isCompletionLocked;

    return InkWell(
      onTap: isLocked ? null : onTap, // UŽBLOKUOJAME Paspaudimą
      borderRadius: radius,
      child: ClipRRect(
        borderRadius: radius,
        child: SizedBox(
          height: 120,
          child: Stack(
            fit: StackFit.expand,
            children: [
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

              // VIZUALINIS UŽRAKINIMAS
              if (isLocked)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(
                      0.45,
                    ), // Pilkumas/blokavimas
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          // NAUJAS PRANEŠIMAS: Laikas turi didesnį prioritetą
                          isTimeLocked
                              ? '' // <-- LAIKO UŽRAKINIMAS
                              : '', // <-- UŽBAIGIMO UŽRAKINIMAS
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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

  // lib/screens/main_screen.dart (pakeiskite visą metodą _buildSection)

  /// lib/screens/main_screen.dart (Pakeiskite visą metodą _buildSection)
  // lib/screens/main_screen.dart (pakeiskite visą metodą _buildSection)

  Widget _buildSection(String title, List<Task> tasks) {
    // Ieškome savaitės numerio (pvz., 'Minčių sėjimas' -> 2)
    final weekNumber = SECTION_TO_WEEK_MAP[title] ?? 99;

    // SENA LOGIKA: Užrakinimas dėl neužbaigtos praeitos savaitės
    final bool isCompletionLocked = _isSectionLockedByCompletion(title);

    // Kviečiame API tikrinti laiko užrakinimą
    return FutureBuilder<bool>(
      future: WeekAccessService.isWeekAvailable(
        widget.currentAccountId,
        weekNumber,
      ),
      builder: (context, snapshot) {
        // isTimeLocked yra TRUE, jei duomenys gauti IR FALSE
        final bool isTimeLocked = !(snapshot.data ?? false);

        // Bendra užrakinimo būsena (laikas IR užbaigimas)
        final bool isLocked = isTimeLocked || isCompletionLocked;

        final isExpanded = _expandedSections[title]!;
        final completed = tasks.where((t) => t.done).length;
        final imageAsset =
            _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

        // LOGIKA: Rasti pirmos neužbaigtos užduoties indeksą sekos užrakinimui
        final int firstIncompleteIndex = tasks.indexWhere((t) => !t.done);
        final int currentTaskIndex =
            firstIncompleteIndex == -1 ? tasks.length : firstIncompleteIndex;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(16),
            // Pilkiname fono spalvą, jei užrakinta
            color: isLocked ? Colors.grey.shade100 : const Color(0xFFF8FFF4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color:
                        isLocked
                            ? Colors.black12
                            : Colors.green.withOpacity(0.08),
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
                    isLocked: isLocked, // Naudojame isLocked čia
                    isTimeLocked: isTimeLocked,
                    isCompletionLocked: isCompletionLocked,
                    completed: completed,
                    total: tasks.length,
                    // UŽBLOKUOJAME Paspaudimą
                    onTap: isLocked ? null : () => _toggleSection(title),
                  ),

                  // Rodo užduotis TIK, kai savaitė atidaryta
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
                          // UŽDUOČIŲ SĄRAŠO LOGIKA
                          ...tasks.asMap().entries.map((entry) {
                            final int i = entry.key;
                            final Task task = entry.value;

                            // UŽDUOTIES SEKOS UŽRAKINIMAS: Atlikta ARBA yra pirma neužbaigta
                            final bool isSequentiallyAvailable =
                                task.done || i == currentTaskIndex;
                            final bool isSequentiallyLocked =
                                !isSequentiallyAvailable;

                            final VoidCallback? taskOnTap =
                                isSequentiallyAvailable
                                    ? () {
                                      if (task.screenBuilder != null) {
                                        final screen = task.screenBuilder!.call(
                                          () {
                                            setState(() {
                                              task.done = true;
                                            });
                                          },
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => screen,
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (_) => TaskDetailScreen(
                                                  task: task,
                                                  onComplete: (m) {
                                                    // NAUDOJAME _markTaskComplete (dabar jau egzistuoja!)
                                                    _markTaskComplete(task, m);
                                                  },
                                                ),
                                          ),
                                        );
                                      }
                                    }
                                    : null; // Išjungti paspaudimą, jei užrakinta

                            return Card(
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      task.done
                                          ? Icons.check_circle
                                          : (isSequentiallyLocked
                                              ? Icons.lock
                                              : Icons.radio_button_unchecked),
                                      color:
                                          task.done
                                              ? Colors.green
                                              : (isSequentiallyLocked
                                                  ? Colors.grey
                                                  : Colors.grey[700]),
                                    ),
                                    title: Text(
                                      task.text,
                                      style: TextStyle(
                                        color:
                                            isSequentiallyLocked
                                                ? Colors.grey
                                                : Colors.black,
                                      ),
                                    ),
                                    onTap: taskOnTap,
                                  ),

                                  // Vizualinis užrakinimas (pilkas sluoksnis)
                                  if (isSequentiallyLocked)
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          }),

                          // ... (Jūsų esama progreso rodymo logika) ...
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
      },
    );
  }
  // Widget _buildSection(String title, List<Task> tasks) {
  //   // Gauname savaitės numerį (pvz., 'Minčių sėjimas' -> 2)
  //   final weekNumber = SECTION_TO_WEEK_MAP[title] ?? 99;

  //   // SENA LOGIKA: Užrakinimas dėl neužbaigtos praeitos savaitės
  //   final bool isCompletionLocked = _isSectionLockedByCompletion(title);

  //   // Kviečiame API tikrinti laiko užrakinimą
  //   return FutureBuilder<bool>(
  //     future: WeekAccessService.isWeekAvailable(
  //       widget.currentAccountId,
  //       weekNumber,
  //     ),
  //     builder: (context, snapshot) {
  //       // isTimeLocked yra TRUE, jei duomenys gauti IR FALSE
  //       final bool isTimeLocked = !(snapshot.data ?? false);

  //       // Bendra užrakinimo būsena (laikas IR užbaigimas)
  //       final bool isLocked = isTimeLocked || isCompletionLocked;

  //       final isExpanded = _expandedSections[title]!;
  //       final completed = tasks.where((t) => t.done).length;
  //       final imageAsset =
  //           _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

  //       // LOGIKA: Rasti pirmos neužbaigtos užduoties indeksą sekos užrakinimui
  //       final int firstIncompleteIndex = tasks.indexWhere((t) => !t.done);
  //       final int currentTaskIndex =
  //           firstIncompleteIndex == -1 ? tasks.length : firstIncompleteIndex;

  //       return Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //         child: Material(
  //           elevation: 0,
  //           borderRadius: BorderRadius.circular(16),
  //           // Pilkiname fono spalvą, jei užrakinta
  //           color: isLocked ? Colors.grey.shade100 : const Color(0xFFF8FFF4),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color:
  //                       isLocked
  //                           ? Colors.black12
  //                           : Colors.green.withOpacity(0.08),
  //                   blurRadius: 8,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               children: [
  //                 _buildHeaderBanner(
  //                   title: title,
  //                   imageAsset: imageAsset,
  //                   isExpanded: isExpanded,
  //                   isLocked: isLocked, // Naudojame isLocked čia, kaip anksčiau
  //                   // NAUJI ARGUMENTAI: PERDUODAMI IŠVIRŠINIŲ METODŲ LOGIKAI
  //                   isTimeLocked: isTimeLocked, // <--- PRIDĖTAS
  //                   isCompletionLocked: isCompletionLocked, // <--- PRIDĖTAS
  //                   completed: completed,
  //                   total: tasks.length,
  //                   // UŽBLOKUOJAME Paspaudimą
  //                   onTap: isLocked ? null : () => _toggleSection(title),
  //                 ),

  //                 // Rodo užduotis TIK, kai savaitė atidaryta
  //                 if (isExpanded && !isLocked)
  //                   Container(
  //                     width: double.infinity,
  //                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xFFD9EDDD),
  //                       borderRadius: const BorderRadius.vertical(
  //                         bottom: Radius.circular(16),
  //                       ),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         // UŽDUOČIŲ SĄRAŠO LOGIKA
  //                         ...tasks.asMap().entries.map((entry) {
  //                           final int i = entry.key;
  //                           final Task task = entry.value;

  //                           // UŽDUOTIES SEKOS UŽRAKINIMAS: Atlikta ARBA yra pirma neužbaigta
  //                           final bool isSequentiallyAvailable =
  //                               task.done || i == currentTaskIndex;
  //                           final bool isSequentiallyLocked =
  //                               !isSequentiallyAvailable;

  //                           final VoidCallback? taskOnTap =
  //                               isSequentiallyAvailable
  //                                   ? () {
  //                                     if (task.screenBuilder != null) {
  //                                       final screen = task.screenBuilder!.call(
  //                                         () {
  //                                           setState(() {
  //                                             task.done = true;
  //                                           });
  //                                         },
  //                                       );
  //                                       Navigator.push(
  //                                         context,
  //                                         MaterialPageRoute(
  //                                           builder: (_) => screen,
  //                                         ),
  //                                       );
  //                                     } else {
  //                                       Navigator.push(
  //                                         context,
  //                                         MaterialPageRoute(
  //                                           builder:
  //                                               (_) => TaskDetailScreen(
  //                                                 task: task,
  //                                                 onComplete: (m) {
  //                                                   setState(() {
  //                                                     task.done = true;
  //                                                     task.mood = m;
  //                                                   });
  //                                                 },
  //                                               ),
  //                                         ),
  //                                       );
  //                                     }
  //                                   }
  //                                   : null; // Išjungti paspaudimą, jei užrakinta

  //                           return Card(
  //                             elevation: 0,
  //                             margin: const EdgeInsets.symmetric(vertical: 6),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: Stack(
  //                               children: [
  //                                 ListTile(
  //                                   leading: Icon(
  //                                     task.done
  //                                         ? Icons.check_circle
  //                                         : (isSequentiallyLocked
  //                                             ? Icons.lock
  //                                             : Icons.radio_button_unchecked),
  //                                     color:
  //                                         task.done
  //                                             ? Colors.green
  //                                             : (isSequentiallyLocked
  //                                                 ? Colors.grey
  //                                                 : Colors.grey[700]),
  //                                   ),
  //                                   title: Text(
  //                                     task.text,
  //                                     style: TextStyle(
  //                                       color:
  //                                           isSequentiallyLocked
  //                                               ? Colors.grey
  //                                               : Colors.black,
  //                                     ),
  //                                   ),
  //                                   onTap: taskOnTap,
  //                                 ),

  //                                 // Vizualinis užrakinimas (pilkas sluoksnis)
  //                                 if (isSequentiallyLocked)
  //                                   Positioned.fill(
  //                                     child: Container(
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.white.withOpacity(0.6),
  //                                         borderRadius: BorderRadius.circular(
  //                                           12,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                               ],
  //                             ),
  //                           );
  //                         }),

  //                         // ... (Jūsų esama progreso rodymo logika) ...
  //                         Padding(
  //                           padding: const EdgeInsets.only(top: 6),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Text(
  //                                 '$completed iš ${tasks.length} atlikta',
  //                                 style: const TextStyle(
  //                                   fontSize: 12,
  //                                   color: Colors.black54,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 width: 140,
  //                                 child: LinearProgressIndicator(
  //                                   value:
  //                                       tasks.isEmpty
  //                                           ? 0
  //                                           : completed / tasks.length,
  //                                   backgroundColor: Colors.white,
  //                                   color: Colors.green,
  //                                   minHeight: 6,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildSection(String title, List<Task> tasks) {
  //   // Gauname savaitės numerį (pvz., 'Minčių sėjimas' -> 2)
  //   final weekNumber = SECTION_TO_WEEK_MAP[title] ?? 99;

  //   // SENA LOGIKA: Užrakinimas dėl neužbaigtos praeitos savaitės
  //   final isCompletionLocked = _isSectionLockedByCompletion(title);

  //   // Kviečiame API tikrinti laiko užrakinimą
  //   return FutureBuilder<bool>(
  //     future: WeekAccessService.isWeekAvailable(
  //       widget.currentAccountId,
  //       weekNumber,
  //     ),
  //     builder: (context, snapshot) {
  //       // isTimeLocked: Ar savaitė jau atidaryta pagal API (duomenys gauti, bet False)
  //       final isTimeLocked = !(snapshot.data ?? false);

  //       // Bendra užrakinimo būsena (laikas IR užbaigimas)
  //       final isLocked = isTimeLocked || isCompletionLocked;

  //       final isExpanded = _expandedSections[title]!;
  //       final completed = tasks.where((t) => t.done).length;
  //       final imageAsset =
  //           _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

  //       return Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //         child: Material(
  //           elevation: 0,
  //           borderRadius: BorderRadius.circular(16),
  //           // Pilkiname fono spalvą, jei užrakinta
  //           color: isLocked ? Colors.grey.shade100 : const Color(0xFFF8FFF4),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color:
  //                       isLocked
  //                           ? Colors.black12
  //                           : Colors.green.withOpacity(0.08),
  //                   blurRadius: 8,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               children: [
  //                 _buildHeaderBanner(
  //                   title: title,
  //                   imageAsset: imageAsset,
  //                   isExpanded: isExpanded,
  //                   isTimeLocked: isTimeLocked,
  //                   isCompletionLocked: isCompletionLocked,
  //                   completed: completed,
  //                   total: tasks.length,
  //                   // UŽBLOKUOJAME Paspaudimą
  //                   onTap: isLocked ? null : () => _toggleSection(title),
  //                 ),

  //                 // Rodo užduotis TIK, kai nėra užrakinta
  //                 if (isExpanded && !isLocked)
  //                   Container(
  //                     width: double.infinity,
  //                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xFFD9EDDD),
  //                       borderRadius: const BorderRadius.vertical(
  //                         bottom: Radius.circular(16),
  //                       ),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         // ... užduočių sąrašas (ListTile) ...
  //                         ...tasks.map(
  //                           (task) => Card(
  //                             elevation: 0,
  //                             margin: const EdgeInsets.symmetric(vertical: 6),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: ListTile(
  //                               leading: Icon(
  //                                 task.done
  //                                     ? Icons.check_circle
  //                                     : Icons.radio_button_unchecked,
  //                                 color: task.done ? Colors.green : Colors.grey,
  //                               ),
  //                               title: Text(task.text),
  //                               // PATAISYMAS: Atkuriame navigaciją be _markTaskComplete
  //                               onTap: () {
  //                                 if (task.screenBuilder != null) {
  //                                   final screen = task.screenBuilder!.call(() {
  //                                     setState(() {
  //                                       task.done = true;
  //                                     });
  //                                   });
  //                                   Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(builder: (_) => screen),
  //                                   );
  //                                 } else {
  //                                   // Naudojame TaskDetailScreen
  //                                   Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder:
  //                                           (_) => TaskDetailScreen(
  //                                             task: task,
  //                                             // Naudojame tiesioginę setState() logiką
  //                                             onComplete: (m) {
  //                                               setState(() {
  //                                                 task.done = true;
  //                                                 task.mood = m;
  //                                               });
  //                                             },
  //                                           ),
  //                                     ),
  //                                   );
  //                                 }
  //                               },
  //                             ),
  //                           ),
  //                         ),

  //                         // ... (Progresbaras ir info) ...
  //                       ],
  //                     ),
  //                   ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  //   // NAUJAS METODAS SU FUTUREBUILDER
  //   Widget _buildSection(String title, List<Task> tasks) {

  //     // Gauname savaitės numerį (pvz., 'Minčių sėjimas' -> 2)
  //     final weekNumber = SECTION_TO_WEEK_MAP[title] ?? 99;

  //     // SENA LOGIKA: Užrakinimas dėl neužbaigtos praeitos savaitės
  //     final isCompletionLocked = _isSectionLockedByCompletion(title);

  //     // Kviečiame API tikrinti laiko užrakinimą
  //     return FutureBuilder<bool>(
  //         future: WeekAccessService.isWeekAvailable(widget.currentAccountId, weekNumber),
  //         builder: (context, snapshot) {

  //             // isTimeLocked: Ar savaitė jau atidaryta pagal API (duomenys gauti, bet False)
  //             // Laukimo metu (ConnectionState.waiting), dar nelaikome atidaryta
  //             final isTimeLocked = !(snapshot.data ?? false);

  //             // Bendra užrakinimo būsena (laikas IR užbaigimas)
  //             final isLocked = isTimeLocked || isCompletionLocked;

  //             final isExpanded = _expandedSections[title]!;
  //             final completed = tasks.where((t) => t.done).length;
  //             final imageAsset = _sectionImages[title] ?? 'assets/sections/pasiruosimas.jpg';

  //             return Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //                 child: Material(
  //                     elevation: 0,
  //                     borderRadius: BorderRadius.circular(16),
  //                     // Pilkiname fono spalvą, jei užrakinta
  //                     color: isLocked ? Colors.grey.shade100 : const Color(0xFFF8FFF4),
  //                     child: Container(
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(16),
  //                             boxShadow: [
  //                                 BoxShadow(
  //                                     color: isLocked ? Colors.black12 : Colors.green.withOpacity(0.08),
  //                                     blurRadius: 8,
  //                                     offset: const Offset(0, 4),
  //                                 ),
  //                             ],
  //                         ),
  //                         child: Column(
  //                             children: [
  //                                 _buildHeaderBanner(
  //                                     title: title,
  //                                     imageAsset: imageAsset,
  //                                     isExpanded: isExpanded,
  //                                     isTimeLocked: isTimeLocked, // <-- NAUJA BŪSENA
  //                                     isCompletionLocked: isCompletionLocked, // <-- SENA BŪSENA
  //                                     completed: completed,
  //                                     total: tasks.length,
  //                                     // UŽBLOKUOJAME paspaudimą per InkWell, perduodant null
  //                                     onTap: isLocked ? null : () => _toggleSection(title),
  //                                 ),

  //                                 // Rodo užduotis TIK, kai nėra užrakinta laiku ARBA užbaigimu
  //                                 if (isExpanded && !isLocked)
  //                                     Container(
  //                                         width: double.infinity,
  //                                         padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
  //                                         decoration: BoxDecoration(
  //                                             color: const Color(0xFFD9EDDD),
  //                                             borderRadius: const BorderRadius.vertical(
  //                                                 bottom: Radius.circular(16),
  //                                             ),
  //                                         ),
  //                                         child: Column(
  //                                             children: [
  //                                                 // ... užduočių sąrašas (ListTile) ...
  //                                                 ...tasks.map(
  //                                                     (task) => Card(
  //                                                         elevation: 0,
  //                                                         margin: const EdgeInsets.symmetric(vertical: 6),
  //                                                         shape: RoundedRectangleBorder(
  //                                                             borderRadius: BorderRadius.circular(12),
  //                                                         ),
  //                                                         child: ListTile(
  //                                                             leading: Icon(
  //                                                                 task.done
  //                                                                     ? Icons.check_circle
  //                                                                     : Icons.radio_button_unchecked,
  //                                                                 color: task.done ? Colors.green : Colors.grey,
  //                                                             ),
  //                                                             title: Text(task.text),
  //                                                             onTap: () {
  //                                                                 // ... Jūsų navigacijos logika ...
  //                                                             },
  //                                                         ),
  //                                                     ),
  //                                                 ),

  //                                                 // ... (Progresbaras ir info) ...
  //                                             ],
  //                                         ),
  //                                     ),
  //                             ],
  //                         ),
  //                     ),
  //                 ),
  //             );
  //         }
  //     );
  // }

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
            // : _currentIndex == 1
            // ? ResultsScreen(sections: widget.sections)
            : const ExtraMeditationsPage();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FCF9),
      appBar: AppBar(
        title: const Text('Mano sodas'),
        backgroundColor: Colors.green,
        actions: [
          // Atsijungimo mygtukas
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await TaskService.logout();
              
              // Po atsijungimo, nukreipiame į prisijungimo puslapį.
              // Naudokite tą maršrutą, kuris inicijuoja PIN įvedimą:
              // context.go('/'); // Pavyzdžiui, nukreipia į pradinį (root) maršrutą
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                // Naudojame PinLoginPage, kurią sukūrėte, su sekcijomis
                MaterialPageRoute(
                    builder: (ctx) => PinLoginPage(sections: widget.sections) 
                ),
                // Pašaliname visas kitas istorijos vietas, kad negalėtų grįžti atgal
                (Route<dynamic> route) => false, 
            );
              }
            },
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (i) => setState(() {
              if (i == 2) {
                _currentIndex = 1;
              } else {
                _currentIndex = i;
              }
            }),
        backgroundColor: const Color(0xFFF9FCF9),
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Sekcijos'),
          // BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Rezultatai'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Extra'),
        ],
      ),
    );
  }
}

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

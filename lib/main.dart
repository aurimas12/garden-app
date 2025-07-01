import 'package:flutter/material.dart';

void main() {
  runApp(SodasApp());
}

class SodasApp extends StatelessWidget {
  const SodasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodas App',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _codeController = TextEditingController();
  String? _error;

  void _checkCode() {
    if (_codeController.text == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      setState(() {
        _error = 'Neteisingas kodas. Bandyk dar kartą.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prisijungimas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Įvesk 6 skaitmenų kodą', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            TextField(
              controller: _codeController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kodas',
                border: OutlineInputBorder(),
                errorText: _error,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _checkCode, child: Text('Prisijungti')),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> sections = [
    {
      'icon': Icons.build,
      'title': 'Pasiruošimas',
      'enabled': true,
      'subItems': [
        {'text': 'Įrankių paruošimas', 'done': true},
        {'text': 'Planavimas', 'done': true},
        {'text': 'Tikslų nustatymas', 'done': false},
      ],
    },
    {
      'icon': Icons.spa,
      'title': 'Minčių sėjimas',
      'enabled': true,
      'subItems': [
        {'text': 'Pozityvios mintys', 'done': true},
        {'text': 'Meditacija', 'done': false},
        {'text': 'Žurnalizavimas', 'done': false},
      ],
    },
    {
      'icon': Icons.local_florist,
      'title': 'Sodinukai',
      'enabled': false,
      'subItems': [],
    },
    {
      'icon': Icons.opacity,
      'title': 'Dėmesingas laistymas',
      'enabled': false,
      'subItems': [],
    },
    {
      'icon': Icons.group,
      'title': 'Sodo draugai',
      'enabled': false,
      'subItems': [],
    },
    {
      'icon': Icons.local_florist_outlined,
      'title': 'Žydėjimas',
      'enabled': false,
      'subItems': [],
    },
    {
      'icon': Icons.eco,
      'title': 'Pirmieji vaisiai',
      'enabled': false,
      'subItems': [],
    },
  ];

  final Set<int> expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sodas'),
        backgroundColor: Colors.green.shade700,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dvi didelės kortelės viršuje
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Column(
              //   children: [
              //     LargeCard(
              //       title: 'Pasiruošimas',
              //       image:
              //           'https://via.placeholder.com/400x200.png?text=Pasiruošimas',
              //     ),
              //     SizedBox(height: 8),
              //     LargeCard(
              //       title: 'Minčių sėjimas',
              //       image:
              //           'https://via.placeholder.com/400x200.png?text=Minčių+sėjimas',
              //     ),
              //   ],
              // ),
            ),

            // Sąrašas su išskleidimu ir progresu
            Container(
              color: Colors.green.shade50,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: List.generate(sections.length, (index) {
                  final section = sections[index];
                  final bool enabled = section['enabled'] ?? true;
                  final bool isExpanded = expandedIndices.contains(index);

                  return Opacity(
                    opacity: enabled ? 1.0 : 0.5,
                    child: Card(
                      color:
                          enabled
                              ? Colors.green.shade100
                              : Colors.grey.shade300,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              section['icon'],
                              color:
                                  enabled
                                      ? Colors.green.shade800
                                      : Colors.grey.shade700,
                            ),
                            title: Text(
                              section['title'],
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    enabled
                                        ? Colors.black
                                        : Colors.grey.shade700,
                              ),
                            ),
                            trailing:
                                enabled
                                    ? Icon(
                                      isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      color: Colors.green.shade800,
                                    )
                                    : null,
                            onTap:
                                enabled
                                    ? () {
                                      setState(() {
                                        if (isExpanded) {
                                          expandedIndices.remove(index);
                                        } else {
                                          expandedIndices.add(index);
                                        }
                                      });
                                    }
                                    : null,
                          ),
                          if (enabled && isExpanded)
                            Container(
                              color: Colors.green.shade50,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SubItems
                                  ...(section['subItems'] as List<dynamic>).map(
                                    (sub) {
                                      final done = sub['done'] as bool;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              done
                                                  ? Icons.check_circle
                                                  : Icons
                                                      .radio_button_unchecked,
                                              size: 20,
                                              color:
                                                  done
                                                      ? Colors.green.shade800
                                                      : Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                sub['text'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      done
                                                          ? Colors.black
                                                          : Colors
                                                              .grey
                                                              .shade700,
                                                  decoration:
                                                      done
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),

                                  SizedBox(height: 12),

                                  // Progress bar
                                  Builder(
                                    builder: (context) {
                                      final subItems =
                                          section['subItems'] as List<dynamic>;
                                      final total = subItems.length;
                                      final doneCount =
                                          subItems
                                              .where((s) => s['done'] == true)
                                              .length;
                                      final progress =
                                          total == 0 ? 0.0 : doneCount / total;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LinearProgressIndicator(
                                            value: progress,
                                            color: Colors.green,
                                            backgroundColor:
                                                Colors.green.shade100,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '$doneCount iš $total atlikta',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green.shade800,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class LargeCard extends StatelessWidget {
  final String title;
  final String image;

  const LargeCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            image,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.black45,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}

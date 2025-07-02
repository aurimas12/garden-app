import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const SodasApp());
}

class SodasApp extends StatelessWidget {
  const SodasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodas App',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const LoginScreen(),
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
  bool _isLoading = true;
  List<String> allowedCodes = [];

  // ✅ Pakeisk čia į savo Google Sheets CSV eksportą
  final String csvUrl =
      'https://docs.google.com/spreadsheets/d/1P_Ou4e8JduU5e2fFRrMrLm1XBx6Qm-mDmhanMo0XZmY/export?format=csv';

  @override
  void initState() {
    super.initState();
    loadCodes();
  }

  Future<void> loadCodes() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('allowedCodes');

    if (saved != null && saved.isNotEmpty) {
      // Turim jau lokaliai
      allowedCodes =
          saved
              .split('\n')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList();
      setState(() {
        _isLoading = false;
      });
      return;
    }

    // Jei SharedPreferences tuščias → bandome atsisiųsti
    try {
      final response = await http.get(Uri.parse(csvUrl));
      if (response.statusCode == 200) {
        final content = response.body.trim();
        await prefs.setString('allowedCodes', content);
        allowedCodes =
            content
                .split('\n')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .toList();
      } else {
        _error = 'Klaida atsisiunčiant kodus (${response.statusCode})';
      }
    } catch (e) {
      _error = 'Klaida atsisiunčiant: $e';
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _checkCode() {
    final input = _codeController.text.trim();

    if (allowedCodes.contains(input)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      setState(() {
        _error = 'Neteisingas kodas. Bandyk dar kartą.';
      });
    }
  }

  Future<void> _refreshCodes() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(Uri.parse(csvUrl));
      if (response.statusCode == 200) {
        final content = response.body.trim();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('allowedCodes', content);

        setState(() {
          allowedCodes =
              content
                  .split('\n')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList();
          _error = 'Sąrašas atnaujintas!';
        });
      } else {
        setState(() {
          _error = 'Klaida atnaujinant: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Klaida atnaujinant: $e';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prisijungimas')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Įvesk 6 skaitmenų kodą',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _codeController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Kodas',
                        border: const OutlineInputBorder(),
                        errorText: _error,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _checkCode,
                      child: const Text('Prisijungti'),
                    ),
                    const SizedBox(height: 16),
                    // O
                  ],
                ),
              ),
    );
  }
}

//////////////////////////////////////////////////////////////////
// TAVO VISAS ORIGINALUS MainScreen BE JOKIŲ PAKEITIMŲ ČIA APAČIOJE
//////////////////////////////////////////////////////////////////

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
        title: const Text('Sodas'),
        backgroundColor: Colors.green.shade700,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green.shade50,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                            const SizedBox(width: 8),
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
                                  const SizedBox(height: 12),
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
                                          const SizedBox(height: 4),
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
        items: [
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

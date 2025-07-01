import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodų Sąrašas iš Google Drive',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: CodesListPage(),
    );
  }
}

class CodesListPage extends StatefulWidget {
  const CodesListPage({super.key});

  @override
  _CodesListPageState createState() => _CodesListPageState();
}

class _CodesListPageState extends State<CodesListPage> {
  List<String> codes = [];
  bool isLoading = true;
  String? error;

  // ✅ ČIA ĮRAŠYK SAVO GOOGLE DRIVE NUORODĄ SU FAILO ID
  final String csvUrl =
      'https://docs.google.com/spreadsheets/d/1P_Ou4e8JduU5e2fFRrMrLm1XBx6Qm-mDmhanMo0XZmY/export?format=csv';

  @override
  void initState() {
    super.initState();
    fetchCodes();
  }

  Future<void> fetchCodes() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final response = await http.get(Uri.parse(csvUrl));
      if (response.statusCode == 200) {
        final lines =
            response.body
                .split('\n')
                .map((line) => line.trim())
                .where((line) => line.isNotEmpty)
                .toList();

        setState(() {
          codes = lines;
        });

        print('✅ Gauti kodai iš Google Drive:');
        for (var c in lines) {
          print(c);
        }
      } else {
        setState(() {
          error = 'Atsisiuntimo klaida: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Klaida: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Drive Kodai')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : error != null
                ? Center(
                  child: Text(
                    error!,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                )
                : codes.isEmpty
                ? Center(child: Text('Nėra kodų failo duomenų'))
                : ListView.builder(
                  itemCount: codes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.green.shade50,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Icon(Icons.vpn_key, color: Colors.green),
                        title: Text(
                          codes[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}

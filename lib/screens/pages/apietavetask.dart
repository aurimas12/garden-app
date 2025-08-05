// Šie failai bus kuriami kaip atskiri puslapiai (Page1 - Page5) su visu kontekstu

import 'package:flutter/material.dart';

// Page1: Nuotaikos pasirinkimas
class MoodSelectionPage extends StatelessWidget {
  const MoodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kokia šiandien Tavo nuotaika?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pasirink nuotaiką:'),
            Wrap(
              spacing: 16,
              children: [
                IconButton(
                  icon: const Icon(Icons.sentiment_very_satisfied),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.sentiment_satisfied),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.sentiment_neutral),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.sentiment_dissatisfied),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.sentiment_very_dissatisfied),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page2'),
              child: const Text('Tęsti'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page2: Įžanga ir rolės pasirinkimas
class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apie Tave')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              child: Text(
                'Tai paskutinis pasiruošimo klausimynas, čia nebus mokslinių skalių, bet rasi įvairių klausimų apie Tave. Noriu tik priminti, kad duomenys yra anonimški ir konfidencialūs, gali prisiminti, kad prie programėlės jungiesi su simbolių kombinacija, o tai leidžia dar tvirčiau užtikrinti duomenų saugumą. Ačiū Tau, kad prisidedi prie mokslo pažangos ir visų mūsų gerovės. Tikiuosi, kad ši programa bus tiesiogiai naudinga ir Tau. Daugiau nebedaugžodžiausiu ir kviečiu pildyti klausimyną.\n\nKlausimynai medikams ir bestudijuojantiems šiek tiek skiriasi, pasirink Tau labiau tinkamą:',
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page3'),
              child: const Text('Esu medikas'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page3'),
              child: const Text('Esu studentas'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page3: Klausimai apie Tave (1 dalis) su formomis
class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Klausimynas (1 dalis)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Lytis:'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'Moteris', child: Text('Moteris')),
                DropdownMenuItem(value: 'Vyras', child: Text('Vyras')),
                DropdownMenuItem(value: 'Kita', child: Text('Kita')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const Text('Amžius:'),
            TextFormField(keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            const Text('Miestas, kuriame gyveni:'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'Vilnius', child: Text('Vilnius')),
                DropdownMenuItem(value: 'Kaunas', child: Text('Kaunas')),
                DropdownMenuItem(value: 'Klaipėda', child: Text('Klaipėda')),
                DropdownMenuItem(value: 'Šiauliai', child: Text('Šiauliai')),
                DropdownMenuItem(value: 'Panevėžys', child: Text('Panevėžys')),
                DropdownMenuItem(value: 'Kita', child: Text('Kita')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page4'),
              child: const Text('Tęsti'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page4: Klausimai apie Tave (2 dalis)
class FinalQuestionsPage extends StatelessWidget {
  const FinalQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Klausimynas (2 dalis)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Kaip vertini kolektyvo atmosferą?'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Labai gerai',
                  child: Text('Labai gerai'),
                ),
                DropdownMenuItem(value: 'Gerai', child: Text('Gerai')),
                DropdownMenuItem(
                  value: 'Vidutiniškai',
                  child: Text('Vidutiniškai'),
                ),
                DropdownMenuItem(value: 'Blogai', child: Text('Blogai')),
                DropdownMenuItem(
                  value: 'Labai blogai',
                  child: Text('Labai blogai'),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page5'),
              child: const Text('Baigti'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page5: Pabaigos žinutė
class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pabaiga')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tfu, visi klausimynai užpildyti! Ačiū, kad užpildei šį klausimyną. Liko tik viena pasiruošimo užduotis ir keliausime toliau.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

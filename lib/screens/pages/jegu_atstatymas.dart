import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// PAGE 1 – nuotaikos emoji
class JeguMoodEmojiPage extends StatefulWidget {
  const JeguMoodEmojiPage({super.key});

  @override
  State<JeguMoodEmojiPage> createState() => _JeguMoodEmojiPageState();
}

class _JeguMoodEmojiPageState extends State<JeguMoodEmojiPage> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final emojis = ['😊', '😐', '😢'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Kokia šiandien Tavo nuotaika?',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              emojis.map((e) {
                final selected = _selected == e;
                return GestureDetector(
                  onTap: () => setState(() => _selected = e),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.green[300] : Colors.grey[300],
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(e, style: const TextStyle(fontSize: 26)),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          'Pasirinkimas nėra privalomas – gali tęsti toliau.',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

/// PAGE 2 – pirmas klausimynas (0–5 skalė, 5 teiginiai)
class SavijautosScalePage extends StatefulWidget {
  const SavijautosScalePage({super.key});

  @override
  State<SavijautosScalePage> createState() => _SavijautosScalePageState();
}

class _SavijautosScalePageState extends State<SavijautosScalePage> {
  final List<int> _answers = List<int>.filled(5, -1);
  static const List<String> _labels = [
    '5\nVisą laiką',
    '4\nDidž. laiko dalį',
    '3\n>½ laiko',
    '2\n<½ laiko',
    '1\nKai kada',
    '0\nNiekada',
  ];
  final List<String> _questions = const [
    'Jaučiuosi linksmas ir geros nuotaikos',
    'Jaučiuosi ramus ir atsipalaidavęs',
    'Jaučiuosi aktyvus ir energingas',
    'Atsibundu žvalus ir pailsėjęs',
    'Mano kasdienis gyvenimas pilnas mane dominančių dalykų',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Šie klausimynai bus apie bendrą savijautą ir jėgų atstatymą.\n'
          'Pirmiausia, prašau pažymėti kiekvieną iš penkių teiginių pagal jausmus per pastarąsias dvi savaites:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        ...List.generate(_questions.length, (i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${i + 1}. ${_questions[i]}'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: List.generate(_labels.length, (val) {
                    final selected = _answers[i] == (5 - val);
                    return ChoiceChip(
                      label: Text(_labels[val], textAlign: TextAlign.center),
                      selected: selected,
                      onSelected: (_) => setState(() => _answers[i] = 5 - val),
                    );
                  }),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

/// PAGE 3 – antras klausimynas (1–4 skalė, 16 teiginių)
class RecoveryExperiencePage extends StatefulWidget {
  const RecoveryExperiencePage({super.key});

  @override
  State<RecoveryExperiencePage> createState() => _RecoveryExperiencePageState();
}

class _RecoveryExperiencePageState extends State<RecoveryExperiencePage> {
  final List<int> _answers = List<int>.filled(16, -1);
  static const List<String> _labels = [
    '1\nNesutinku',
    '2\nNei sutinku,\nnei nesutinku',
    '3\nSutinku',
    '4\nVisiškai\nsutinku',
  ];

  final List<String> _questions = const [
    'Jaučiu, kad galiu pats nuspręsti, kuo užsiimti',
    'Mokausi naujų dalykų',
    'Pamirštu apie darbą',
    'Pats (-i) nusprendžiu, ką ir kada veiksiu',
    'Visai negalvoju apie darbą',
    'Ilsiuosi ir atsipalaiduoju',
    'Ieškau intelektinių iššūkių',
    'Užsiimu dalykais, kurie man kelia iššūkių',
    'Pats pasirenku, kaip praleisiu laiką',
    'Atsitraukiu nuo darbo',
    'Užsiimu tuo, kas man padeda atsipalaiduoti',
    'Skiriu laiko atsipalaidavimui',
    'Darau dalykus taip, kaip man atrodo geriausia',
    'Skiriu laiko laisvalaikiui',
    'Užsiimu tuo, kas praplečia mano akiratį',
    'Atitrūkstu nuo darbo reikalų',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Antras klausimynas – apie savijautą ir laisvalaikį ne darbo metu.\n'
          'Pažymėk kiek sutinki ar nesutinki su pateiktais teiginiais:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        ...List.generate(_questions.length, (i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${i + 1}. ${_questions[i]}'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: List.generate(_labels.length, (val) {
                    final selected = _answers[i] == (val + 1);
                    return ChoiceChip(
                      label: Text(_labels[val], textAlign: TextAlign.center),
                      selected: selected,
                      onSelected: (_) => setState(() => _answers[i] = val + 1),
                    );
                  }),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

/// PAGE 4 – rezultatų paaiškinimas
class JeguResultsInfoPage extends StatelessWidget {
  const JeguResultsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tavo savijautos klausimyno rezultatas – 19. Kuo didesnis balas – tuo geresnė savijauta. '
      'Žemesnis nei 13 rodo prastą savijautą, o 7 ir mažiau – galimą klinikinę depresiją.\n\n'
      'Atsistatymo nuo streso skalėje surinkai – 53. Kuo didesnis balas – tuo didesnis gebėjimas atsistatyti.\n'
      'Vidurkis tarp medicinos darbuotojų – apie 51.\n\n'
      '0-7   8-12   13-19   20-25\n'
      '16-31   32-39   40-47   48-55   56-64',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

/// PAGE 5 – pabaiga
class JeguEndPage extends StatelessWidget {
  const JeguEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sveikinu, užpildei visas skales! Likę bendrieji klausimai apie Tave ir vizualizacija – ir pasiruošimas bus baigtas. '
      'Sodo programa daug dėmesio skirs Tavo savijautos gerinimui ir jėgų atstatymui. '
      'Po susipažinimo – pradėsime sodininkauti. Iki susitikimo rytoj!',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class apie1 extends StatelessWidget {
  const apie1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tfu, visi klausimynai užpildyti! Ačiū, kad užpildei šį klausimyną.  '
      'Liko tik viena pasiruošimo užduotis ir keliausime toliau. ',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

// Page3: Klausimai apie Tave (1 dalis) su formomis

class klausimynas1 extends StatefulWidget {
  const klausimynas1({super.key});

  @override
  State<klausimynas1> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<klausimynas1> {
  String? selectedGender;
  String? selectedSpecialybe;
  String? selectedCity;
  final TextEditingController ageController = TextEditingController();

  final List<String> genders = ['Moteris', 'Vyras', 'Kita'];
  final List<String> specialybes = [
    'Gydytojas',
    'Slaugytojas',
    'Gydytojas rezidentas',
    'Medicinos studentas',
    'Slaugos studentas',
    'Kita, įrašyk',
  ];
  final List<String> cities = [
    'Vilnius',
    'Kaunas',
    'Klaipėda',
    'Šiauliai',
    'Panevėžys',
    'Kita, įrašyk',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tavo lytis:'),
          ...genders.map(
            (gender) => RadioListTile<String>(
              title: Text(gender),
              value: gender,
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Amžius:'),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Įrašyk savo amžių'),
          ),
          const SizedBox(height: 16),

          const Text('Tavo specialybė:'),
          ...specialybes.map(
            (spec) => RadioListTile<String>(
              title: Text(spec),
              value: spec,
              groupValue: selectedSpecialybe,
              onChanged: (value) => setState(() => selectedSpecialybe = value),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Miestas, kuriame gyveni:'),
          ...cities.map(
            (city) => RadioListTile<String>(
              title: Text(city),
              value: city,
              groupValue: selectedCity,
              onChanged: (value) => setState(() => selectedCity = value),
            ),
          ),
          const SizedBox(height: 32),

          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Čia galima validuoti arba perduoti duomenis
          //       Navigator.pushNamed(context, '/page3');
          //     },
          //     child: const Text('Tęsti'),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class PsichologinisKlausimynasPage extends StatefulWidget {
  const PsichologinisKlausimynasPage({super.key});

  @override
  State<PsichologinisKlausimynasPage> createState() =>
      _PsichologinisKlausimynasPageState();
}

class _PsichologinisKlausimynasPageState
    extends State<PsichologinisKlausimynasPage> {
  final Map<String, String?> _answers = {};
  final TextEditingController _svorisController = TextEditingController();
  final TextEditingController _ugisController = TextEditingController();
  double _suicidalThoughtsValue = 0;

  Widget _buildQuestion(String question, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...options.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: _answers[question],
            onChanged: (value) => setState(() => _answers[question] = value),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuestion(
            'Kiek jauti gebantis tvarkytis su stresu, kuris susijęs su darbu?',
            ['Pakankamai', 'Nepakankamai'],
          ),
          _buildQuestion(
            'Ar sulauki kolegų palaikymo esant sunkioms situacijoms darbe?',
            ['Sulaukiu', 'Retkarčiais sulaukiu', 'Nesulaukiu', 'Kita'],
          ),
          _buildQuestion(
            'Kaip bendrai vertini kolektyvo, kuriame dirbi, atmosferą?',
            [
              'Labai gerai',
              'Gerai',
              'Vidutiniškai',
              'Blogai',
              'Labai blogai',
              'Kita',
            ],
          ),
          _buildQuestion(
            'Ar esi dabartinėje darbovietėje patyręs iš kolegų netinkamą elgesį - mobingą per pastaruosius tris mėnesius?',
            [
              'Taip, dažnai patiriu',
              'Retkarčiais vis patiriu',
              'Esu patyręs vieną ar kelis kartus',
              'Vienoje darbovietėje patiriu, o kitoje – ne',
              'Kita',
            ],
          ),
          _buildQuestion(
            'Kaip apskritai vertini savo gebėjimą susitvarkyti su kylančiais iššūkiais?',
            ['Labai gerai', 'Gerai', 'Vidutiniškai', 'Blogai', 'Labai blogai'],
          ),
          _buildQuestion(
            'Kiek valdai savo kasdienį gyvenimą (rutinas, pasirinkimus, prioritetus)?',
            [
              'Visiškai nevaldau',
              'Dažniausiai nevaldau',
              'Šiek tiek valdau',
              'Dažniausiai valdau',
              'Visiškai valdau',
            ],
          ),
          _buildQuestion(
            'Ar dažnai jauti, kad viskas turi būti padaryta tobulai?',
            ['Visiškai ne', 'Retai', 'Kartais', 'Dažnai', 'Visada'],
          ),
          _buildQuestion('Ar tau sunku deleguoti užduotis kitiems?', [
            'Labai sunku',
            'Sunku',
            'Kartais',
            'Lengva',
            'Labai lengva',
          ]),
          _buildQuestion(
            'Ar dažnai jaudiniesi, kad kiti gali pastebėti tavo klaidas darbe?',
            ['Labai dažnai', 'Dažnai', 'Kartais', 'Retai', 'Labai retai'],
          ),
          _buildQuestion(
            'Ar tau sunku atleisti sau už padarytas klaidas/įvykusius nemalonumus?',
            ['Labai sunku', 'Sunku', 'Vidutiniškai', 'Lengva', 'Labai lengva'],
          ),
          _buildQuestion(
            'Ar tau sunku atleisti kitiems už padarytas klaidas?',
            ['Labai sunku', 'Sunku', 'Vidutiniškai', 'Lengva', 'Labai lengva'],
          ),
          _buildQuestion('Ar jautiesi vertingas tik tada, kai dirbi?', [
            'Niekada',
            'Beveik niekada',
            'Kartais',
            'Beveik visada',
            'Visada',
          ]),
          _buildQuestion('Kiek esi patenkintas savo socialiniu gyvenimu?', [
            'Labai patenkintas',
            'Patenkintas',
            'Vidutiniškai',
            'Nepatenkintas',
            'Labai nepatenkintas',
          ]),
          const SizedBox(height: 16),
          const Text('Koks maždaug Tavo svoris (kg):'),
          TextField(
            controller: _svorisController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          const Text('Koks maždaug Tavo ūgis (cm):'),
          TextField(
            controller: _ugisController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Text('Minčių apie savižudybę dažnis (0 – niekada; 10 – visą laiką):'),
          Slider(
            value: _suicidalThoughtsValue,
            min: 0,
            max: 10,
            divisions: 10,
            label: _suicidalThoughtsValue.round().toString(),
            onChanged:
                (value) => setState(() => _suicidalThoughtsValue = value),
          ),
          const SizedBox(height: 16),
          _buildQuestion('Ar lankai psichoterapiją šiuo metu?', ['Taip', 'Ne']),
          _buildQuestion('Ar turi nustatytų psichikos sutrikimų?', [
            'Taip',
            'Ne',
          ]),
          _buildQuestion(
            'Ar vartoji vaistus dėl nustatytų psichikos sutrikimų?',
            ['Taip', 'Ne', 'Neturiu nustatytų psichikos sutrikimų'],
          ),
          _buildQuestion('Ar turi nustatytų lėtinių fizinių ligų?', [
            'Taip',
            'Ne',
          ]),
          _buildQuestion(
            'Ar vartoji vaistus dėl nustatytų lėtinių fizinių ligų?',
            ['Taip', 'Ne', 'Neturiu nustatytų lėtinių fizinių ligų'],
          ),

          const SizedBox(height: 32),
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Duomenų perdavimas arba validacija
          //       Navigator.pushNamed(context, '/page3');
          //     },
          //     child: const Text('Tęsti'),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class PsychoEducationFlow extends StatefulWidget {
  const PsychoEducationFlow({super.key});

  @override
  State<PsychoEducationFlow> createState() => _PsychoEducationFlowState();
}

class _PsychoEducationFlowState extends State<PsychoEducationFlow> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    _buildPage(
      title: 'Kokia šiandien Tavo nuotaika?',
      content: '''
Noriu Tau papasakoti apie esminius mūsų psichologijos komponentus, tai svarbi informacija.

4 komponentai yra šie:
• Mintys – tai, ką galvojame (žodžiai, vaizdiniai)
• Emocijos – pyktis, baimė, liūdesys, džiaugsmas ir t.t.
• Kūno pojūčiai – skausmas, dilgčiojimas, kaitimas
• Elgesys – ką darome: kalbame, sėdime, valgome, ir pan.
      ''',
    ),
    _buildPage(
      title: 'Situacijos interpretacija',
      content: '''
Įsivaizduok: tu pildai dokumentus, ir gauni netikėtą kvietimą iš vadovo ateiti pasikalbėti.

• „Turbūt padariau kažką blogai“ – sukelia nerimą, prakaitavimą, baimę
• „Galbūt nori apdovanoti“ – sukelia visai kitokį jausmą
• „Įdomu, ko vadovas nori?“ – neutrali reakcija

Mūsų būsena (pavargę, alkani, susipykę) stipriai paveikia interpretacijas.
      ''',
    ),
    _buildPage(
      title: 'Kaip keisti būseną?',
      content: '''
Norėdami padėti sau sunkiose situacijose galime keisti vieną iš 4 komponentų.

Pvz.:
• Pakeisti mintis: “Net jei padariau klaidą, susitvarkysiu”
• Elgesys: greičiau nueiti pasikalbėti
• Kūno pojūčiai: fizinis krūvis sumažins nerimą

Kasdienė būsena svarbi – sportas, miegas, savipriežiūra didina atsparumą.
      ''',
    ),
    _buildPage(
      title: 'Sąmoningas pasirinkimas',
      content: '''
Svarbu išmokti pastebėti mintis ir jų nepriimti automatiškai.

• Mąstymo stebėjimas leidžia keisti elgesį
• Tai leidžia formuoti įpročius pagal norimas pasekmes
• Leidžia kurti gyvenimą sąmoningai ir kryptingai
      ''',
    ),
    _buildPage(
      title: 'Trumpas pratimas',
      content: '''
Negalvok apie ką tik sode nuskintas, saldžias, dideles braškes…

Apie ką pagalvojai?

Mintys kyla greitai ir savaime. Mes jų nekontroliuojame tiek, kiek atrodo.

Daugiau apie mintis – kitame susitikime!
      ''',
    ),
  ];

  static Widget _buildPage({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Psichologinė informacija')),
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        itemBuilder: (_, index) => _pages[index],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _currentPage < _pages.length - 1 ? _nextPage : null,
          child: Text(_currentPage < _pages.length - 1 ? 'Kitas' : 'Pabaiga'),
        ),
      ),
    );
  }
}

class apie2s extends StatelessWidget {
  const apie2s({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Valio! Įvykdei visą pasiruošimą! ',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class apie3s extends StatelessWidget {
  const apie3s({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Susitiksime minčių sėjoje.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class apie1s extends StatelessWidget {
  const apie1s({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dabar noriu paprašyti Tavęs įsivaizduoti Sodą, kuriame Tau būtų malonu ir gera.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class AudioIntroPage extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkipRecording;

  const AudioIntroPage({
    super.key,
    required this.onContinue,
    required this.onSkipRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pasiruošimas įrašymui')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Paprašysiu paspausti balso įrašymo mygtuką ir kelias minutes pakalbėti apie Sodą, ką jame matai, kas vyksta. '
              'Kai jausi, kad kalbėti jau nebesinori – sustabdyk įrašymą. \n\n'
              'Tavo balso įrašas labai svarbus moksliniais tikslais – reikalingas mokytis iš balso nustatyti nuotaikos, charakterio ir kitus aspektus. '
              'O Tau ši praktika gali padėti įkūnyti ramybės pojūtį savyje.\n\n'
              'Jeigu nenori įrašinėti savo balso – gali paspausti mygtuką „Tęsti be įrašymo“.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: onContinue, child: const Text('Tęsti')),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onSkipRecording,
              child: const Text('Tęsti be įrašymo'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioIntroPage1 extends StatefulWidget {
  const AudioIntroPage1({super.key});

  @override
  State<AudioIntroPage1> createState() => _AudioIntroPageState();
}

class _AudioIntroPageState extends State<AudioIntroPage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paprašysiu paspausti balso įrašymo mygtuką ir kelias minutes pakalbėti apie Sodą, '
            'ką jame matai, kas vyksta. Kai jausi, kad kalbėti jau nebesinori – sustabdyk įrašymą.\n\n'
            'Tavo balso įrašas labai svarbus moksliniais tikslais - reikalingas mokytis iš balso '
            'nustatyti nuotaikos, charakterio ir kitus aspektus. O Tau ši praktika gali padėti '
            'įkūnyti ramybės pojūtį savyje.\n\n'
            'Jeigu nenori įrašinėti savo balso – gali paspausti mygtuką – „Tęsti be įrašymo”.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          // Mygtukas įrašymo pradžiai (kol kas be funkcijos)
          ElevatedButton.icon(
            onPressed: () {
              // Čia vėliau bus įrašymo startas
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Įrašymo pradžia (kol kas simuliacija)'),
                ),
              );
            },
            icon: const Icon(Icons.mic),
            label: const Text('Tęsti įrašymą'),
          ),
          const SizedBox(height: 16),

          // Mygtukas be įrašymo
          OutlinedButton(
            onPressed: () {
              // Čia galima dėti Navigator.pushNamed į kitą puslapį
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pasirinkta tęsti be įrašymo')),
              );
            },
            child: const Text('Tęsti be įrašymo'),
          ),
        ],
      ),
    );
  }
}

class PsichoKomponentaiPage extends StatefulWidget {
  final VoidCallback? onNext;

  const PsichoKomponentaiPage({super.key, this.onNext});

  @override
  State<PsichoKomponentaiPage> createState() => _PsichoKomponentaiPageState();
}

class _PsichoKomponentaiPageState extends State<PsichoKomponentaiPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu Tau papasakoti apie esminius mūsų psichologijos komponentus, '
            'tai svarbi informacija, nors galbūt jau ir girdėta, bet reikalinga, '
            'kad galėtumėm eiti toliau.',
            style: textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          Text('4 komponentai yra šie:', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          _bullet('Mintys'),
          _bullet('Emocijos'),
          _bullet('Kūno pojūčiai'),
          _bullet('Elgesys'),
          const SizedBox(height: 16),

          _subtitle('Paaiškinimai'),
          const SizedBox(height: 8),
          _paragraph(
            'Mintys – tai, ką galvojame, gali būti žodžiai ar vaizdiniai.',
            textTheme,
          ),
          _paragraph(
            'Emocijos, pavyzdžiui, pyktis, liūdesys, baimė, džiaugsmas, nuostaba, pasibjaurėjimas.',
            textTheme,
          ),
          _paragraph(
            'Kūno pojūčiai – tai, ką jaučiame kūne – skausmas, dilgčiojimas, kaitimas ir t.t.',
            textTheme,
          ),
          _paragraph(
            'Elgesys – tai, ką darome – kalbame, einame, sėdime, valgome, įsitempiame ar pan.',
            textTheme,
          ),
          const SizedBox(height: 16),

          _subtitle('Situacijos pavyzdys'),
          const SizedBox(height: 8),
          _paragraph(
            'O dabar įsivaizduok, kad esi darbuotojas viename iš ligoninės skyrių. '
            'Tu pildai dokumentus savo kabinete, gauni netikėtą skambutį iš vadovo, '
            'kuris pasako, kad pietų pertraukos metu užeitum pas jį pasikalbėti.',
            textTheme,
          ),
          Text('Ką pagalvojai?', style: textTheme.titleMedium),
          const SizedBox(height: 12),

          _subtitle('Kodėl tai svarbu'),
          const SizedBox(height: 8),
          _paragraph(
            'Tai, kaip mes interpretuosime situaciją ir ką tuo metu pagalvosime, '
            'paveiks mūsų emocijas, kūno pojūčius, elgesį ir tolesnes mintis.',
            textTheme,
          ),

          const SizedBox(height: 24),
          // Center(
          //   child: ElevatedButton(
          //     onPressed:
          //         widget.onNext ??
          //         () {
          //           // numatytoji elgsena: grįžti arba parodyti žinutę
          //           if (Navigator.canPop(context)) {
          //             Navigator.pop(context);
          //           } else {
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(
          //                 content: Text('Kitas žingsnis (nenustatytas)'),
          //               ),
          //             );
          //           }
          //         },
          //     child: const Text('Kitas'),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Text('•  '), Expanded(child: Text(text))],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class KvepavimoMeditacijaPage extends StatefulWidget {
  final VoidCallback? onNext;

  const KvepavimoMeditacijaPage({super.key, this.onNext});

  @override
  State<KvepavimoMeditacijaPage> createState() =>
      _KvepavimoMeditacijaPageState();
}

class _KvepavimoMeditacijaPageState extends State<KvepavimoMeditacijaPage> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/kvepavimas.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph(
            'Labas. Šiandien paprašysiu paklausyti trumpą – 4 minučių garso įrašą, '
            'kuriame mano kolegė pakvies tave sukoncentruoti dėmesį į kvėpavimą, '
            'o po to papasakosiu daugiau apie mintis!\n\n'
            'Kai išklausysi – spausk mygtuką „Tęsti”.',
            theme,
          ),
          const SizedBox(height: 12),
          _subtitle('Trumpa kvėpavimo meditacija'),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio1Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio1Page({super.key, this.onNext});

  @override
  State<Audio1Page> createState() => _Audio1PageState();
}

class _Audio1PageState extends State<Audio1Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/stebejimas.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph(
            'Kviečiu atlikti trumpą praktiką, kurios metu tiesiog reikės stebėti aplinką, '
            'būtų gerai, kad keletą minučių Tavęs netrigdytų kiti žmonės. '
            'Pilnaprotaujančio žiūrėjimo praktika.',
            theme,
          ),
          const SizedBox(height: 12),
          _subtitle('Trumpa kvėpavimo meditacija'),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio2Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio2Page({super.key, this.onNext});

  @override
  State<Audio2Page> createState() => _Audio2PageState();
}

class _Audio2PageState extends State<Audio2Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/judesiai.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Dėmesingų judesių praktika', theme),
          const SizedBox(height: 12),
          _subtitle('Trumpa kvėpavimo meditacija'),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio3Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio3Page({super.key, this.onNext});

  @override
  State<Audio3Page> createState() => _Audio3PageState();
}

class _Audio3PageState extends State<Audio3Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/kunoskenavimas.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Kūno skenavimo praktika. ', theme),
          const SizedBox(height: 12),
          _subtitle('Kūno skenavimo praktika. '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio4Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio4Page({super.key, this.onNext});

  @override
  State<Audio4Page> createState() => _Audio4PageState();
}

class _Audio4PageState extends State<Audio4Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/relaksacija.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph(
            'O dabar noriu pakviesti Tave raumenų relaksacijos pratimui. Būtų gerai, jei galėtum sėdėti.\n\n'
            'Šios relaksacijos metu girdėsi balso įrašą, kuris kvies palaipsniui įtempti ir atpalaiduoti tam tikras raumenų grupes.\n\n'
            'Jeigu kažkurių kūno dalių įtempti negali – viskas gerai, tiesiog gali įtempinėti savo pasirinktas raumenų grupes, '
            'pavyzdžiui, tik rankas ar spausti ir atleisti kumščius.\n\n'
            'Jeigu esi viešoje vietoje ir nenori, kad kiti matytų, kad šiuo metu darai relaksaciją – gali visos relaksacijos metu '
            'įtempinėti tik sėdmenų raumenis ir likti nepastebėtu!',
            theme,
          ),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio5Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio5Page({super.key, this.onNext});

  @override
  State<Audio5Page> createState() => _Audio5PageState();
}

class _Audio5PageState extends State<Audio5Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/kalnomeditacija.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Kalno meditacija', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio6Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio6Page({super.key, this.onNext});

  @override
  State<Audio6Page> createState() => _Audio6PageState();
}

class _Audio6PageState extends State<Audio6Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/sedejimomeditacija.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Sėdėjimo meditacija', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio7Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio7Page({super.key, this.onNext});

  @override
  State<Audio7Page> createState() => _Audio7PageState();
}

class _Audio7PageState extends State<Audio7Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/pedos.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Pėdos', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio8Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio8Page({super.key, this.onNext});

  @override
  State<Audio8Page> createState() => _Audio8PageState();
}

class _Audio8PageState extends State<Audio8Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/mylintisgerumas3.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Mylinčio gerumo meditacija', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio9Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio9Page({super.key, this.onNext});

  @override
  State<Audio9Page> createState() => _Audio9PageState();
}

class _Audio9PageState extends State<Audio9Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/esamojolaiko.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Mylinčio gerumo meditacija', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class Audio10Page extends StatefulWidget {
  final VoidCallback? onNext;

  const Audio10Page({super.key, this.onNext});

  @override
  State<Audio10Page> createState() => _Audio10PageState();
}

class _Audio10PageState extends State<Audio10Page> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // kai įrašas pasibaigia – atnaujinti mygtuko būseną
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // pasirenkama: neleisti loop’inti
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _preload();
  }

  Future<void> _preload() async {
    try {
      // ĮKELIAM šaltinį IŠ ANKSTO – taip play() veiks patikimai
      await _audioPlayer.setSource(AssetSource('audio/saugivieta.mp3'));
      setState(() => _isLoaded = true);
    } catch (e) {
      _showSnack('Nepavyko įkelti audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isLoaded) {
      _showSnack(
        'Audio dar neįkeltas. Palauk akimirką arba patikrink asset kelią.',
      );
      return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        // jei buvai sustabdęs iki STOP (ne pause), gali naudoti resume() / play()
        await _audioPlayer.resume();
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      _showSnack('Klaida grojant audio: $e');
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _paragraph('Mylinčio gerumo meditacija', theme),
          const SizedBox(height: 12),
          _subtitle(' '),
          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: _togglePlay,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(
              _isPlaying ? 'Pauzė' : (_isLoaded ? 'Klausyti' : 'Kraunama…'),
            ),
          ),

          const SizedBox(height: 24),

          if (widget.onNext != null)
            ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Tęsti"),
            ),
        ],
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _paragraph(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

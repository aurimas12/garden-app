import 'package:flutter/material.dart';

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

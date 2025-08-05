import 'package:flutter/material.dart';
import '../paged_task_screen.dart'; // dėl NextPageNotification

/// 1 psl. – nuotaikos emoji
class ProfMoodEmojiPage extends StatefulWidget {
  const ProfMoodEmojiPage({super.key});

  @override
  State<ProfMoodEmojiPage> createState() => _ProfMoodEmojiPageState();
}

class _ProfMoodEmojiPageState extends State<ProfMoodEmojiPage> {
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
                    padding:
                        const EdgeInsets.all(14),
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

/// 2 psl. – rolės pasirinkimas (medikas / studentas) su „Tęsti“
class ProfRoleSelectPage extends StatefulWidget {
  const ProfRoleSelectPage({super.key});

  @override
  State<ProfRoleSelectPage> createState() => _ProfRoleSelectPageState();
}

class _ProfRoleSelectPageState extends State<ProfRoleSelectPage> {
  String? _role; // 'medikas' arba 'studentas'

  Widget _roleCard(String label, String value, IconData icon) {
    final selected = _role == value;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _role = value),
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFD9EDDD) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? Colors.green : Colors.grey.shade300,
              width: selected ? 2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 36,
                color: selected ? Colors.green : Colors.black54,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.green.shade900 : Colors.black87,
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
    final canContinue = _role != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Toliau pateiksiu su darbu arba studijomis susijusią savijautos skalę.\n'
          'Prašau pasirink Tau labiau tinkamą rolę:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _roleCard('Esu medikas', 'medikas', Icons.local_hospital),
            _roleCard('Esu studentas', 'studentas', Icons.school),
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed:
                canContinue
                    ? () => NextPageNotification().dispatch(context)
                    : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Tęsti'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

/// 3 ir 4 psl. – Maslach (0–6) skale dalimis
class ProfMaslachScalePart extends StatefulWidget {
  final int from; // 1-based
  final int to; // 1-based
  const ProfMaslachScalePart({super.key, required this.from, required this.to});

  @override
  State<ProfMaslachScalePart> createState() => _ProfMaslachScalePartState();
}

class _ProfMaslachScalePartState extends State<ProfMaslachScalePart> {
  final Map<int, int> _answers = {}; // klausimoNr -> 0..6

  static const _labels = [
    '0\nNiekada',
    '1\n/Kartais per metus',
    '2\n/Kartą per mėn.',
    '3\n/K. m. per mėn.',
    '4\n/Kartą per sav.',
    '5\n/K. m. per sav.',
    '6\nKasdien',
  ];

  String _questionText(int n) {
    const all = {
      1: 'Jaučiu, kad darbas mane emociškai išsekina.',
      2: 'Darbo dienos pabaigoje jaučiuosi išeikvojęs jėgas.',
      3: 'Atsikėlęs ryte, prieš naują darbo dieną, jaučiuosi pavargęs.',
      4: 'Lengvai suprantu, kaip jaučiasi mano pacientai.',
      5: 'Su kai kuriais pacientais elgiuosi kaip su daiktais.',
      6: 'Visą dieną dirbdamas su žmonėmis jaučiu įtampą.',
      7: 'Veiksmingai tvarkausi su pacientų problemomis.',
      8: 'Jaučiuosi „perdegęs“ nuo darbo.',
      9: 'Savo darbu darau teigiamą poveikį kitiems.',
      10: 'Tapau atsainesnis žmonėms nuo darbo pradžios.',
      11: 'Nerimauju, kad tampu emociškai šaltesnis.',
      12: 'Jaučiuosi labai energingas.',
      13: 'Darbas kelia dirglumą ir susierzinimą.',
      14: 'Darbas reikalauja per daug pastangų.',
      15: 'Nelabai rūpi, kas nutinka kai kuriems pacientams.',
      16: 'Tiesioginis darbas su žmonėmis kelia per didelį stresą.',
      17: 'Lengvai sukuriu aplinką be įtampos.',
      18: 'Po darbo su pacientais jaučiuosi pakylėtas.',
      19: 'Esu įgyvendinęs daug vertingų dalykų.',
      20: 'Jaučiuosi ties jėgų ir kantrybės riba.',
      21: 'Emocines problemas sprendžiu labai ramiai.',
      22: 'Jaučiu, kad pacientai mane kaltina dėl kai kurių problemų.',
    };
    return '$n. ${all[n] ?? ''}';
  }

  Widget _answerChips(int q) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: List.generate(7, (i) {
        final selected = _answers[q] == i;
        return ChoiceChip(
          label: Text(_labels[i], textAlign: TextAlign.center),
          selected: selected,
          onSelected: (_) => setState(() => _answers[q] = i),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = List<int>.generate(
      widget.to - widget.from + 1,
      (i) => widget.from + i,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...items.map(
          (n) => Container(
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
                Text(
                  _questionText(n),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                _answerChips(n),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 5 psl. – pabaiga
class ProfEndPage extends StatelessWidget {
  const ProfEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Užpildei visą skalę, puiku! Dėl autorinių teisių grįžtamasis ryšys iškart neteikiamas,\n'
      'bet vėliau, po intervencijos, bus galima palyginti pokytį.\n\n'
      'Kitą kartą – klausimynas apie savybes (ekstraversija, neurotiškumas ir kt.).',
      textAlign: TextAlign.center,
    );
  }
}

// import 'package:flutter/material.dart';
// import '../paged_task_screen.dart'; // dėl NextPageNotification

// // If NextPageNotification is not defined in paged_task_screen.dart, define it here:
// import 'package:flutter/material.dart';

// class NextPageNotification extends Notification {
//   @override
//   void dispatch(BuildContext? context) {
//     super.dispatch(context);
//   }
// }

// /// 1 psl. – nuotaikos emoji
// class ProfMoodEmojiPage extends StatefulWidget {
//   const ProfMoodEmojiPage({super.key});

//   @override
//   State<ProfMoodEmojiPage> createState() => _ProfMoodEmojiPageState();
// }

// class _ProfMoodEmojiPageState extends State<ProfMoodEmojiPage> {
//   String? _selected;
//   @override
//   Widget build(BuildContext context) {
//     final emojis = ['😊', '😐', '😢'];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           'Kokia šiandien Tavo nuotaika?',
//           style: Theme.of(
//             context,
//           ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:
//               emojis.map((e) {
//                 final selected = _selected == e;
//                 return GestureDetector(
//                   onTap: () => setState(() => _selected = e),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: selected ? Colors.green[300] : Colors.grey[300],
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 6,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Text(e, style: const TextStyle(fontSize: 26)),
//                   ),
//                 );
//               }).toList(),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           'Pasirinkimas nėra privalomas – gali tęsti toliau.',
//           style: Theme.of(
//             context,
//           ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
//         ),
//       ],
//     );
//   }
// }

// /// 2 psl. – rolės pasirinkimas (medikas / studentas) su „Tęsti“
// class ProfRoleSelectPage extends StatefulWidget {
//   const ProfRoleSelectPage({super.key});

//   @override
//   State<ProfRoleSelectPage> createState() => _ProfRoleSelectPageState();
// }

// class _ProfRoleSelectPageState extends State<ProfRoleSelectPage> {
//   String? _role; // 'medikas' arba 'studentas'

//   Widget _roleCard(String label, String value, IconData icon) {
//     final selected = _role == value;
//     return Expanded(
//       child: InkWell(
//         onTap: () => setState(() => _role = value),
//         borderRadius: BorderRadius.circular(16),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 150),
//           padding: const EdgeInsets.all(16),
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: BoxDecoration(
//             color: selected ? const Color(0xFFD9EDDD) : Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: selected ? Colors.green : Colors.grey.shade300,
//               width: selected ? 2 : 1,
//             ),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 6,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Icon(
//                 icon,
//                 size: 36,
//                 color: selected ? Colors.green : Colors.black54,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 label,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: selected ? Colors.green.shade900 : Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final canContinue = _role != null;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           'Toliau pateiksiu su darbu arba studijomis susijusią savijautos skalę.\n'
//           'Prašau pasirink Tau labiau tinkamą rolę:',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: [
//             _roleCard('Esu medikas', 'medikas', Icons.local_hospital),
//             _roleCard('Esu studentas', 'studentas', Icons.school),
//           ],
//         ),
//         const SizedBox(height: 16),
//         // Align(
//         //   alignment: Alignment.centerRight,
//         //   child: ElevatedButton.icon(
//         //     onPressed:
//         //         canContinue
//         //             ? () => NextPageNotification().dispatch(context)
//         //             : null,
//         //     icon: const Icon(Icons.arrow_forward),
//         //     label: const Text('Tęsti'),
//         //     style: ElevatedButton.styleFrom(
//         //       backgroundColor: Colors.green,
//         //       foregroundColor: Colors.white,
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }

// /// 3 ir 4 psl. – Maslach (0–6) skale dalimis
// class ProfMaslachScalePart extends StatefulWidget {
//   final int from; // 1-based
//   final int to; // 1-based
//   const ProfMaslachScalePart({super.key, required this.from, required this.to});

//   @override
//   State<ProfMaslachScalePart> createState() => _ProfMaslachScalePartState();
// }

// class _ProfMaslachScalePartState extends State<ProfMaslachScalePart> {
//   final Map<int, int> _answers = {}; // klausimoNr -> 0..6

//   static const _labels = [
//     '0\nNiekada',
//     '1\n/Kartais per metus',
//     '2\n/Kartą per mėn.',
//     '3\n/K. m. per mėn.',
//     '4\n/Kartą per sav.',
//     '5\n/K. m. per sav.',
//     '6\nKasdien',
//   ];

//   String _questionText(int n) {
//     const all = {
//       1: 'Jaučiu, kad darbas mane emociškai išsekina.',
//       2: 'Darbo dienos pabaigoje jaučiuosi išeikvojęs jėgas.',
//       3: 'Atsikėlęs ryte, prieš naują darbo dieną, jaučiuosi pavargęs.',
//       4: 'Lengvai suprantu, kaip jaučiasi mano pacientai.',
//       5: 'Su kai kuriais pacientais elgiuosi kaip su daiktais.',
//       6: 'Visą dieną dirbdamas su žmonėmis jaučiu įtampą.',
//       7: 'Veiksmingai tvarkausi su pacientų problemomis.',
//       8: 'Jaučiuosi „perdegęs“ nuo darbo.',
//       9: 'Savo darbu darau teigiamą poveikį kitiems.',
//       10: 'Tapau atsainesnis žmonėms nuo darbo pradžios.',
//       11: 'Nerimauju, kad tampu emociškai šaltesnis.',
//       12: 'Jaučiuosi labai energingas.',
//       13: 'Darbas kelia dirglumą ir susierzinimą.',
//       14: 'Darbas reikalauja per daug pastangų.',
//       15: 'Nelabai rūpi, kas nutinka kai kuriems pacientams.',
//       16: 'Tiesioginis darbas su žmonėmis kelia per didelį stresą.',
//       17: 'Lengvai sukuriu aplinką be įtampos.',
//       18: 'Po darbo su pacientais jaučiuosi pakylėtas.',
//       19: 'Esu įgyvendinęs daug vertingų dalykų.',
//       20: 'Jaučiuosi ties jėgų ir kantrybės riba.',
//       21: 'Emocines problemas sprendžiu labai ramiai.',
//       22: 'Jaučiu, kad pacientai mane kaltina dėl kai kurių problemų.',
//     };
//     return '$n. ${all[n] ?? ''}';
//   }

//   Widget _answerChips(int q) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 6,
//       children: List.generate(7, (i) {
//         final selected = _answers[q] == i;
//         return ChoiceChip(
//           label: Text(_labels[i], textAlign: TextAlign.center),
//           selected: selected,
//           onSelected: (_) => setState(() => _answers[q] = i),
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final items = List<int>.generate(
//       widget.to - widget.from + 1,
//       (i) => widget.from + i,
//     );
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         ...items.map(
//           (n) => Container(
//             margin: const EdgeInsets.only(bottom: 12),
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 6,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _questionText(n),
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 const SizedBox(height: 10),
//                 _answerChips(n),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// 5 psl. – pabaiga
// class ProfEndPage extends StatelessWidget {
//   const ProfEndPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       'Užpildei visą skalę, puiku! Dėl autorinių teisių grįžtamasis ryšys iškart neteikiamas,\n'
//       'bet vėliau, po intervencijos, bus galima palyginti pokytį.\n\n'
//       'Kitą kartą – klausimynas apie savybes (ekstraversija, neurotiškumas ir kt.).',
//       textAlign: TextAlign.center,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:garden_app/screens/paged_task_screen.dart';

class PsichoKomponentaiPage extends StatelessWidget {
  final VoidCallback? onNext; // jei kada prireiktų vietinio mygtuko
  const PsichoKomponentaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SectionCard(
            children: [
              Text(
                'Noriu Tau papasakoti apie esminius mūsų psichologijos komponentus, '
                'tai svarbi informacija, nors galbūt jau ir girdėta, bet reikalinga, '
                'kad galėtumėm eiti toliau.',
                style: tt.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 12),
              Text('4 komponentai yra šie:', style: tt.titleMedium),
              const SizedBox(height: 8),
              const _Bullet('Mintys'),
              const _Bullet('Emocijos'),
              const _Bullet('Kūno pojūčiai'),
              const _Bullet('Elgesys'),
            ],
          ),

          const SizedBox(height: 12),
          _SectionCard(
            header: 'Paaiškinimai',
            children: [
              _P(
                'Mintys – tai, ką galvojame, gali būti žodžiai ar vaizdiniai.',
              ),
              _P(
                'Emocijos, pavyzdžiui, pyktis, liūdesys, baimė, džiaugsmas, nuostaba, pasibjaurėjimas.',
              ),
              _P(
                'Kūno pojūčiai – tai, ką jaučiame kūne – skausmas, dilgčiojimas, kaitimas ir t.t.',
              ),
              _P(
                'Elgesys – tai, ką darome – kalbame, einame, sėdime, valgome, įsitempiame ar pan.',
              ),
            ],
          ),

          const SizedBox(height: 12),
          _SectionCard(
            header: 'Situacijos pavyzdys',
            children: [
              _P(
                'Įsivaizduok, kad esi darbuotojas viename iš ligoninės skyrių. '
                'Tu pildai dokumentus savo kabinete, gauni netikėtą skambutį iš vadovo, '
                'kuris paprašo pietų pertraukos metu užeiti pasikalbėti.',
              ),
              Text('Ką pagalvojai?', style: tt.titleMedium),
            ],
          ),

          const SizedBox(height: 12),
          _SectionCard(
            header: 'Kodėl tai svarbu',
            children: [
              _P(
                'Tai, kaip interpretuosime situaciją ir ką tuo metu pagalvosime, '
                'paveiks mūsų emocijas, kūno pojūčius, elgesį ir tolesnes mintis.',
              ),
            ],
          ),

          // Jei norėtum vietinio "Kitas" mygtuko (dažniausiai nereikia, nes PagedTaskScreen turi savą):
          // if (onNext != null) ...[
          //   const SizedBox(height: 16),
          //   Align(
          //     alignment: Alignment.centerLeft,
          //     child: ElevatedButton(onPressed: onNext, child: const Text('Kitas')),
          //   ),
          // ],
        ],
      ),
    );
  }
}

// /// --- Maži vietiniai UI helperiai (ne globalus template) ---

class _SectionCard extends StatelessWidget {
  final String? header;
  final List<Widget> children;
  const _SectionCard({this.header, required this.children});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null) ...[
              Text(
                header!,
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
            ],
            ..._separated(children),
          ],
        ),
      ),
    );
  }

  static List<Widget> _separated(List<Widget> kids) {
    final out = <Widget>[];
    for (var i = 0; i < kids.length; i++) {
      out.add(kids[i]);
      if (i != kids.length - 1) out.add(const SizedBox(height: 8));
    }
    return out;
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Icon(Icons.circle, size: 6, color: Colors.green),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: tt.bodyMedium?.copyWith(height: 1.45),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      text,
      style: tt.bodyLarge?.copyWith(height: 1.45),
      textAlign: TextAlign.justify,
    );
  }
}


/// 1) Nuotaikos emoji – saugo per „Toliau“
class ProfMoodEmojiPage extends StatefulWidget {
  const ProfMoodEmojiPage({super.key, this.onChanged, this.onSubmitted});
  final ValueChanged<String?>? onChanged;
  final Future<void> Function(String? emoji)? onSubmitted;

  @override
  State<ProfMoodEmojiPage> createState() => _ProfMoodEmojiPageState();
}

class _ProfMoodEmojiPageState extends State<ProfMoodEmojiPage> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    // registruojam išsaugojimą ant „Toliau“
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      RegisterOnNextNotification(() async {
        try {
          await widget.onSubmitted?.call(_selected);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Nepavyko išsaugoti nuotaikos: $e')),
            );
          }
          // jei norėtum sulaikyti perėjimą, grąžink false
          // return false;
        }
        return true;
      }).dispatch(context);
    });

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
                  onTap: () {
                    setState(() => _selected = e);
                    widget.onChanged?.call(_selected);
                  },
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

/// 2) Rolės pasirinkimas – saugo per „Toliau“
class ProfRoleSelectPage extends StatefulWidget {
  const ProfRoleSelectPage({super.key, this.onChanged, this.onSubmitted});
  final ValueChanged<String?>? onChanged;
  final Future<void> Function(String role)? onSubmitted;

  @override
  State<ProfRoleSelectPage> createState() => _ProfRoleSelectPageState();
}

class _ProfRoleSelectPageState extends State<ProfRoleSelectPage> {
  String? _role; // 'medikas' | 'studentas'

  @override
  Widget build(BuildContext context) {
    // registruojam išsaugojimą ant „Toliau“
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      RegisterOnNextNotification(() async {
        if (_role == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Pasirink rolę, kad galėtume tęsti')),
          );
          return false; // sulaikom perėjimą, kol nepasirinkta
        }
        try {
          await widget.onSubmitted?.call(_role!);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Nepavyko išsaugoti rolės: $e')),
            );
          }
          // return false; // jei nori sulaikyti, atrakink
        }
        return true;
      }).dispatch(context);
    });

    Widget roleCard(String label, String value, IconData icon) {
      final selected = _role == value;
      return Expanded(
        child: InkWell(
          onTap: () {
            setState(() => _role = value);
            widget.onChanged?.call(_role);
          },
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
            roleCard('Esu medikas', 'medikas', Icons.local_hospital),
            roleCard('Esu studentas', 'studentas', Icons.school),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Pasirink ir spausk „Toliau“ apačioje.',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}

/// 3) Maslach dalis – saugo per „Toliau“ (leidžia ir dalinai užpildytą)
typedef ProfMaslachSubmit =
    Future<void> Function(
      int from,
      int to,
      Map<int, int> answers, // klausimoNr -> 0..6
    );

class ProfMaslachScalePart extends StatefulWidget {
  final int from; // 1-based
  final int to; // 1-based
  final ValueChanged<Map<int, int>>? onChanged;
  final ProfMaslachSubmit? onSubmitted;

  const ProfMaslachScalePart({
    super.key,
    required this.from,
    required this.to,
    this.onChanged,
    this.onSubmitted,
  });

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
          onSelected: (_) {
            setState(() => _answers[q] = i);
            widget.onChanged?.call(Map<int, int>.from(_answers));
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // registruojam išsaugojimą ant „Toliau“
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      RegisterOnNextNotification(() async {
        try {
          await widget.onSubmitted?.call(
            widget.from,
            widget.to,
            Map<int, int>.from(_answers),
          );
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Nepavyko išsaugoti Maslach dalies: $e')),
            );
          }
          // return false; // jei nori sulaikyti
        }
        return true;
      }).dispatch(context);
    });

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

/// 4) Pabaiga – be pokyčių
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

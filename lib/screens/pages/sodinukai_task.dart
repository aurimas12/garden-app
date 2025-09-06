// import 'package:flutter/material.dart';

// class SavaitesPradziaSavirupaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SavaitesPradziaSavirupaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šios savaitės užduočių blokelį noriu pradėti nuo pasirūpinimo savimi temos.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'Paliesime ir perdegimo temą, apie kurią kalbėsiu per trijų aspektų prizmę:',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 8),
//           _bullet('būtinybės gauti;'),
//           _bullet('įsisavinti tai, kas gaunama;'),
//           _bullet('svarbos duoti be lūkesčių gauti.'),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   static Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [const Text('•  '), Expanded(child: Text(text))],
//       ),
//     );
//   }
// }

// class PerdegimasGautiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerdegimasGautiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kai kalbame apie perdegimą, dažniausiai tai pasireiškia dirbantiems su žmonėmis, '
//             'kurie pasirinko specialybę, susijusią su davimu.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'Vienas svarbiausių aspektų, norint duoti ir neperdegti – mokėti gauti. '
//             'Svarbu iš pasaulio pasiimti tiek, kad galėtume atgauti jėgas.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 12),
//           Text('O gavimas gali būti labai įvairus:', style: theme.titleMedium),
//           const SizedBox(height: 8),
//           _bullet(
//             'Paskambinti draugei ar draugui ir išpasakoti savo rūpesčius.',
//           ),
//           _bullet(
//             'Paprašyti artimųjų prižiūrėti vaikus, kad galėtum atsipūsti.',
//           ),
//           _bullet('Pasiimti kelias neapmokamas atostogų dienas darbe.'),
//           _bullet(
//             'Neklausyti neįdomių istorijų ar išeiti iš susitikimo, kai jauti nuovargį.',
//           ),
//           _bullet('Nueiti anksčiau miegoti.'),
//           const SizedBox(height: 12),
//           Text(
//             'Galiu tęsti ir tęsti… Labai svarbu pasyviai nelaukti, kol „pasidarys geriau“, '
//             'ar tikėtis, kad dalykai savaime pasikeis, bet imtis aktyvių jėgų atgavimo veiksmų.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   static Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [const Text('•  '), Expanded(child: Text(text))],
//       ),
//     );
//   }
// }

// class JeguAtkurimoIdejosPage extends StatefulWidget {
//   final void Function(List<String>)? onSubmit;
//   final VoidCallback? onNext;

//   const JeguAtkurimoIdejosPage({super.key, this.onSubmit, this.onNext});

//   @override
//   State<JeguAtkurimoIdejosPage> createState() => _JeguAtkurimoIdejosPageState();
// }

// class _JeguAtkurimoIdejosPageState extends State<JeguAtkurimoIdejosPage> {
//   final List<TextEditingController> _controllers = List.generate(
//     3,
//     (_) => TextEditingController(),
//   );

//   @override
//   void dispose() {
//     for (final c in _controllers) {
//       c.dispose();
//     }
//     super.dispose();
//   }

//   void _addRow() {
//     setState(() => _controllers.add(TextEditingController()));
//   }

//   void _removeRow(int index) {
//     if (_controllers.length <= 1) return;
//     setState(() {
//       _controllers[index].dispose();
//       _controllers.removeAt(index);
//     });
//   }

//   void _submit() {
//     final values =
//         _controllers
//             .map((c) => c.text.trim())
//             .where((t) => t.isNotEmpty)
//             .toList();

//     widget.onSubmit?.call(values);

//     if (widget.onNext != null) {
//       widget.onNext!();
//     } else if (Navigator.canPop(context)) {
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Noriu pakviesti žemiau įrašyti keletą dalykų, kurie tau padeda atgauti jėgas. '
//             'Svarbu, kad pagalvotum apie tas veiklas, kurios labiausiai padeda, gali būti, kad tai nebūtinai tos veiklos, '
//             'kurios suteikia atsipalaidavimą. Pavyzdžiui, alkoholio gėrimas gali suteikti atsipalaidavimo būseną, '
//             'bet nebūtinai padėti atgauti jėgas. Gali būti, kad nuėjimas į muziejų ar kiną – gali suteikti malonių patyrimų, '
//             'bet vėlgi – nebūtinai atstatyti resursus. Tad prašau Tavęs įrašyk veiklas, kurios padeda būtent Tau atgauti jėgas. '
//             'Gali ir pagalvoti, rašyti nebūtina, bet užsirašius – didesnis šansas, kad prisiminsi ir ateityje tai panaudosi.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 16),

//           // Dinaminės eilutės
//           ...List.generate(_controllers.length, (i) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('${i + 1}. ', style: theme.bodyLarge),
//                   Expanded(
//                     child: TextField(
//                       controller: _controllers[i],
//                       decoration: const InputDecoration(
//                         hintText:
//                             'Įrašyk veiklą, kuri tau padeda atgauti jėgas',
//                         border: OutlineInputBorder(),
//                         isDense: true,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   IconButton(
//                     tooltip: 'Pašalinti eilutę',
//                     onPressed:
//                         _controllers.length > 1 ? () => _removeRow(i) : null,
//                     icon: const Icon(Icons.remove_circle_outline),
//                   ),
//                 ],
//               ),
//             );
//           }),

//           const SizedBox(height: 8),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: OutlinedButton.icon(
//               onPressed: _addRow,
//               icon: const Icon(Icons.add),
//               label: const Text('Pridėti eilutę'),
//             ),
//           ),

//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class SavaitesPabaigosTrumpaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SavaitesPabaigosTrumpaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šį kartą tiek, iki susitikimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class DzuginanciosVeiklosPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DzuginanciosVeiklosPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Praėjusį sykį prašiau Tavęs pagalvoti apie veiklas, kurios padeda atstatyti Tavo resursus. '
//             'O dabar noriu, kad pagalvotum ir surašytum užsiėmimų, kurie Tave džiugina, '
//             'sukelia malonių emocijų, atpalaiduoja ar kitaip pozityviai veikia.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: onNext,
//           //     style: ElevatedButton.styleFrom(
//           //       backgroundColor: Colors.green,
//           //     ),
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class IrasytiVeiklasPage extends StatefulWidget {
//   final VoidCallback? onNext;
//   const IrasytiVeiklasPage({super.key, this.onNext});

//   @override
//   State<IrasytiVeiklasPage> createState() => _IrasytiVeiklasPageState();
// }

// class _IrasytiVeiklasPageState extends State<IrasytiVeiklasPage> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu įrašyti tas veiklas žemiau pateiktame langelyje. '
//             'Rašymas gali padėti smegenims geriau įsiminti, nei tik pagalvojimas.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 16),
//           TextField(
//             controller: _controller,
//             maxLines: 6,
//             decoration: InputDecoration(
//               hintText: 'Įrašyk čia savo veiklas...',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           if (widget.onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: widget.onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class SuplanuotiVeiklaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SuplanuotiVeiklaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu šiandien arba rytoj suplanuoti ir padaryti vieną iš Tavo sugalvotų malonių veiklų, '
//             'būtų gerai, jeigu pasižymėtum tiksliai, kada tai padarysi. Tad, jei gali, atsidaryk kalendorių '
//             'savo telefone ar užrašinę – ir pažymėk, kada tiksliai, kurią malonią veiklą darysi.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class KavosAkimirkaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const KavosAkimirkaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kartais net 5 minutės stabtelėjimo, pavyzdžiui, uodžiant ir pamažu gurkšnojant '
//             'savo mėgstamą kavą – gali suteikti daugiau lengvumo kasdienybėje. Iki susitikimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class RibosSantykyjePage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const RibosSantykyjePage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Viena iš gavimo pusių – žinoti savo ribas/ribotumus ir su tuo susitaikyti. '
//             'Kaip ir su sodu, gi dažniausiai neleidžiame visiems, kas nori ateiti, skinti, ką nori, '
//             'daryti Tavo sode, ką nori. '
//             'Svarbu saugoti savo resursus ir juo labiau neleisti, jog mūsų sodą kažkas piktybiškai niokotų '
//             '(kiti asmenys ar mes patys). '
//             'Tam labai svarbu ribos santykyje. Pavyzdžiui, kai esame prastesnės nuotaikos, '
//             'tiesiog pasakyti kolegai, kad šiandien nesame nusiteikę kalbėti ir leisti sau patylėti, kiek norisi; '
//             'leisti sau nesijuokti, kai nejuokinga; kai kitam reikia paramos – leisti sau jos kitam nesuteikti, '
//             'jeigu negalime; kai kažkas kelia balsą – pasakyti, kad toks elgesys nepagarbus ir nenorime tęsti pokalbio, '
//             'jeigu tai tęsis ir pan.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class NePratimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const NePratimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     final questions = <String>[
//       'Ar galėtum padaryti kavos? (įsivaizduok, kad prašo Tavo kolega)',
//       'Ar galėtum su manimi susitikti, man reikia tavo pagalbos? (įsivaizduok, kad prašo Tavo artimasis)',
//       'Ar galėtum gauti man receptą, labai reikia?',
//       'Ar galėtum nusiųsti siuntą, dabar esu užsienyje?',
//     ];

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Jeigu gali, perskaityk kiekvieną sakinį garsiai (įsivaizduok, kad Tavęs to prašo kitas žmogus) '
//             'ir į kiekvieną iš jų garsiai ir ramiai atsakyk – „Ne“. Jei garsiai skaityti negali, perskaityk mintyse.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 16),
//           ...questions.map(
//             (q) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(q, style: theme.bodyMedium),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Ne.',
//                     style: theme.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.redAccent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class KaipBuvoTauPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const KaipBuvoTauPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Yra žmonių, kuriems pasakyti „Ne“ – nėra sudėtinga, bet yra tokių, kurie labai sunkiai geba pasakyti „Ne“. '
//             'Tik norėjau atkreipti dėmesį, kad sakyti „Ne“ – yra normalu. '
//             'Kai kuriems šis pratimas gali būti neutralus, kitiems sukelti stiprias emocijas, o kaip buvo Tau?',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class PasirupinimoPabaigaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PasirupinimoPabaigaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Vienas iš svarbių pasirūpinimo savimi pusių – pažinti savo ribas ir priimti jas. '
//             'O gi mylėti galime lengviau ir daugiau, kai patys esame pasipildę.\n\n'
//             'Iki kito pasirūpinimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class DekingumoIvadasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DekingumoIvadasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Dar vienas svarbus aspektas, norint neperdegti, yra gebėti įsisąmoninti gavimą. '
//             'Gebėti kuo pilniau patirti jėgų atstatymo akimirkas. Yra daugybė mokslinių tyrimų, '
//             'kurie rodo, kad dėkingumo praktikos padeda geriau jaustis. Tad kviesiu ir Tave šiandien '
//             'dėkingumo praktikai, tikiu, kad tokios praktikos gali padėti pasijusti tarsi labiau '
//             'užpildytam, labiau gavusiam. Jeigu Tavo rezervai visai ištuštėję, gali būti, kad ši praktika '
//             'kels pyktį ar susierzinimą, tad gali jos ir neatlikti arba atlikti patyrinėjant, kas vyksta, '
//             'kaip keičiasi Tavo jausmai, bet daugumai žmonių tokia praktika būna pozityvi patirtis.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 12),
//           Text('Spausk „Tęsti“ ir pradėkime.', style: theme.bodyMedium),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class DekingumoPraktikaPage extends StatefulWidget {
//   final VoidCallback? onNext;
//   const DekingumoPraktikaPage({super.key, this.onNext});

//   @override
//   State<DekingumoPraktikaPage> createState() => _DekingumoPraktikaPageState();
// }

// class _DekingumoPraktikaPageState extends State<DekingumoPraktikaPage> {
//   final TextEditingController _siandienController = TextEditingController();
//   final TextEditingController _savaiteController = TextEditingController();
//   final TextEditingController _menuoController = TextEditingController();
//   final TextEditingController _metaiController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Žemiau parašyk, už ką esi dėkingas:',
//             style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Šiandien,\nšią savaitę,\nšį mėnesį,\nšiais metais.\n\n'
//             'Jeigu nesugalvotum, gali apsvarstyti tokius variantus kaip: '
//             'kad esi gyvas, šiandien švietė saulė, kad šiandien neskauda kūno ir pan.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 16),
//           _inputField('Šiandien', _siandienController),
//           _inputField('Šią savaitę', _savaiteController),
//           _inputField('Šį mėnesį', _menuoController),
//           _inputField('Šiais metais', _metaiController),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           }
//           //         },
//           //     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _inputField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         maxLines: null,
//       ),
//     );
//   }
// }

// class DekingumoApibendrinimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DekingumoApibendrinimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kiek teko skaityti mokslinėje literatūroje ir girdėti iš realių pasakojimų – ši praktika labai veikia. '
//             'Nuolatinis dėkingumo praktikavimas gali pagerinti nuotaiką, jaustis labiau ryšyje su pasauliu ir kitais žmonėmis. '
//             'Šios praktikos gali padėti jausti, kad gauname. Tad kviečiu nepamiršti ir vis padėkoti sau, kitiems ar pasauliui!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class AciuUzPraktikasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const AciuUzPraktikasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ačiū Tau, kad tęsi praktikas.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class PozirisIDavimaIntroPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PozirisIDavimaIntroPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Pažįstu kelis medikus, kurie dalinosi vienu bendru aspektu, kuris padėjo jiems grįžti į darbą iš perdegimo. '
//             'Jie kalbėjo apie pasikeitusį požiūrį į davimą. '
//             'Po kurio laiko šią mintį radau ir knygoje, noriu pasidalinti ir su Tavimi – gal bus ir Tau įdomu ar naudinga.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class DavimasBeLukesciuPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DavimasBeLukesciuPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Jie kalbėjo apie tai, kad labiausiai padeda duoti – nelaukiant atlygio, t.y. nelaukiant, kad kas padėkos, nusišypsos, pagirs. '
//             'Daugeliu atveju atlygio laukimas sukuria naštą ir kančią, gali būti, kad mes dirbsime tokioje vietoje, '
//             'kur žmonės tiesiog pasitaikys mažiau dėkingi, kad tiesiog mums bijos padėkoti, ar bus dėl savo praeities sunkumų pikti, '
//             'kritiški ir nedėkingi. Jeigu einame į davimo profesiją be lūkesčio gauti, o tiesiog dalintis meile, savo įgūdžiais, kiek galime – '
//             'tai visai kita būsena, kuri gali būti savaime džiuginanti. '
//             'Jeigu viliamės, kad už gerą širdį mums atlygins – kiekvieną kartą nesulaukę atlygio galime patirti kančią ir galiausiai – sudegti.\n\n'
//             'Vis dėlto, davimas be gavimo neįmanomas, todėl pirma rašiau apie gavimą. '
//             'Itin svarbu – mokėti gauti iš gyvenimo, būti prisipildžiusiam, tik tada galime duoti be troškimo iškart gauti atgal.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class PerdegimoVengimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerdegimoVengimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Dalinuosi keliais davimo būdais, kurie, manoma, veda link perdegimo '
//             '(pagal Pascal Ide knygą „Perdegimo sindromas”):',
//             style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           _bullet('Gauti atlygį'),
//           _bullet('Padėti, nes jaučiamės kalti, kad nepadėjome'),
//           _bullet(
//             'Tapatintis su kito žmogaus ar savo susikurto vidinio modelio lūkesčiais (kad nebūtų mažesni)',
//           ),
//           _bullet('Siekti būti pripažintam dosniu žmogumi'),
//           _bullet('Bijoti kritikos, kad mums trūksta altruizmo'),
//           _bullet(
//             'Patenkinti kito poreikį, nes jis primena mums mūsų pačių trūkumą, o jis nepakeliamas',
//           ),
//           _bullet(
//             'Vengti nemalonaus pojūčio, kad esam egoistai ar niekam nenaudingi',
//           ),
//           _bullet('Taisyti klaidą atlikus veiksmą, kuriam trūko dosnumo.'),
//           const SizedBox(height: 20),
//           Text(
//             'Kiti svarbūs aspektai, kurie padeda neperdegti, gauti ir duoti:',
//             style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           _numbered('Laukti, kol pagalbos paprašys.'),
//           _numbered('Jaustis laisvu nepadėti, net jei kitam reikia pagalbos.'),
//           _numbered(
//             'Nemanyti, kad už pagalbą kitas yra skolingas, nes paties veiksmas yra be atlygio reikalavimo.',
//           ),
//           const SizedBox(height: 24),
//           // if (onNext != null)
//           //   Center(
//           //     child: ElevatedButton(
//           //       onPressed: onNext,
//           //       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//           //       child: const Text('Tęsti'),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [const Text('•  '), Expanded(child: Text(text))],
//       ),
//     );
//   }

//   Widget _numbered(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [const Text('–  '), Expanded(child: Text(text))],
//       ),
//     );
//   }
// }

// class PabaigaBeLukesciuPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PabaigaBeLukesciuPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mes nesame neišsenkantys indai, mes nesame Dievai ir turime rūpintis savimi, '
//             'pildyti save, o tada galėsime ir duoti tyriau. '
//             'Manau, kad davimas be lūkesčių – žymiai malonesnis. '
//             'O ką manai Tu?\n\n'
//             'Iki kito pasirūpinimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class MesNesameIndaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const MesNesameIndaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mes nesame neišsenkantys indai, mes nesame Dievai ir turime rūpintis savimi, '
//             'pildyti save, o tada galėsime ir duoti tyriau. '
//             'Manau, kad davimas, be lūkesčių – žymiai malonesnis. '
//             'O ką manai Tu?\n\n'
//             'Iki kito pasirūpinimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PerdegimoRizikosVeiksniaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerdegimoRizikosVeiksniaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     final List<String> rizikosVeiksniai = [
//       'Darbo perkrūvis',
//       'Mobingas',
//       'Konfliktai su kolegomis',
//       'Kompetencijų trūkumas',
//       'Supervizijų trūkumas',
//       'Gyvenimas vienam',
//       'Socialinių santykių trūkumas',
//       'Mažas fizinis aktyvumas',
//       'Laisvalaikio veiklų neturėjimas',
//       'Nepakankamas rūpinimąsis savimi',
//       'Perfekcionizmas',
//       'Suvokiamas žemas gebėjimas kontroliuoti įvykius',
//     ];

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Žemiau pateikiu rizikos veiksnius, kurie siejami su perdegimu.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'Perdegimo rizikos veiksniai:',
//             style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           ...rizikosVeiksniai.map(
//             (item) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 2),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('• '),
//                   Expanded(child: Text(item, style: theme.bodyMedium)),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class RizikosVeiksniuApmasymasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const RizikosVeiksniuApmasymasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kurie rizikos veiksniai būdingi būtent Tau? '
//             'Kuriuos iš jų gali pakeisti, o kurie pakeičiami mažai, '
//             'bet galbūt gali kurti su tais veiksniais lengvesnį santykį, '
//             'bandyti priimti, pakeisti požiūrį?',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class IkiKitoKartoPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const IkiKitoKartoPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Iki kito karto!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class MindfulnessJudesiaiIntroPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const MindfulnessJudesiaiIntroPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Atėjo laikas šiek tiek daugiau dėmesio skirti ir tiesiogiai kūnui. '
//             'Juk jis – esminis mūsų resursas! Tad šiandien kviesiu atlikti Mindfulness judesių praktiką. '
//             'Tau nereikės jokio specialaus pasiruošimo, tik būtų gerai, kad turėtum šiek tiek vietos pajudėti. '
//             'Jeigu dabar esi tokioje vietoje, kur negali atlikti šios praktikos – kviečiu įsijungti programėlę, '
//             'kai tokią galimybę rasi ir pratęsti!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class DemesinguJudesiuPraktikaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DemesinguJudesiuPraktikaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Dėmesingų judesių praktika',
//             style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PraktikosApibendrinimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PraktikosApibendrinimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ši praktika apjungė kelis aspektus – ir fizinį – šiek tiek pajudėjai, '
//             'ir sąmoningumo – leido patirti savo kūną sąmoningiau. '
//             'Daugiau apie kūną pratęsime ketvirtos savaitės praktikose.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class Sveikinimas21UzduotisPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const Sveikinimas21UzduotisPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'O dabar noriu pasveikinti Tave, jau padarei 21 užduotį!!!\n\n'
//             'Kažkur apie 2–4 savaitę žmonių motyvacija tęsti praktikas kiek pamažėja, '
//             'bet jeigu pavyksta atsilaikyti – praktikų pabaigoje ji vėl paauga. '
//             'Linkiu tęsti ir pamatyti šios 8 savaičių programos vaisius! '
//             'Tikiu, kad jie bus pozityvūs!\n\n'
//             'Siunčiu šiltų linkėjimų ir susitikime ketvirtos savaitės – dėmesingo laistymo praktikose. '
//             'Ten pradėsiu nuo motyvacijos, kaip ją atrasti ir nepaleisti gerų įpročių formavimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

/// ==========================================================================
/// BENDRI HELPERIAI VIENODAM STILIUI
/// ==========================================================================

Widget _page(List<Widget> children) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withSpacing(children, gap: 12),
    ),
  );
}

List<Widget> _withSpacing(List<Widget> widgets, {double gap = 12}) {
  final out = <Widget>[];
  for (var i = 0; i < widgets.length; i++) {
    out.add(widgets[i]);
    if (i != widgets.length - 1) out.add(SizedBox(height: gap));
  }
  return out;
}

class _H1 extends StatelessWidget {
  final String text;
  const _H1(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _H2 extends StatelessWidget {
  final String text;
  const _H2(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

class _P extends StatelessWidget {
  final String text;
  final TextAlign align;
  const _P(this.text, {this.align = TextAlign.justify});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.45),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 7),
          child: Icon(Icons.circle, size: 6, color: Color(0xFF2E7D32)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ),
      ],
    );
  }
}

class _Dash extends StatelessWidget {
  final String text;
  const _Dash(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 2), child: Text('–  ')),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ),
      ],
    );
  }
}

class _Quote extends StatelessWidget {
  final String text;
  const _Quote(this.text);
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: scheme.secondary.withOpacity(0.28)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontStyle: FontStyle.italic,
          height: 1.35,
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final VoidCallback? onNext;
  final String label;
  const _NextButton(this.onNext, {this.label = 'Tęsti'});
  @override
  Widget build(BuildContext context) {
    if (onNext == null) return const SizedBox.shrink();
    return Center(child: ElevatedButton(onPressed: onNext, child: Text(label)));
  }
}

InputDecoration _inputDecoration({String? hint, String? label}) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    isDense: true,
  );
}

/// ==========================================================================
/// PUSLAPIAI
/// ==========================================================================

class SavaitesPradziaSavirupaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SavaitesPradziaSavirupaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Šios savaitės užduočių blokelį noriu pradėti nuo pasirūpinimo savimi temos.',
      ),
      const _P(
        'Paliesime ir perdegimo temą, apie kurią kalbėsiu per trijų aspektų prizmę:',
      ),
      const _Bullet('būtinybės gauti;'),
      const _Bullet('įsisavinti tai, kas gaunama;'),
      const _Bullet('svarbos duoti be lūkesčių gauti.'),
      _NextButton(onNext),
    ]);
  }
}

class PerdegimasGautiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerdegimasGautiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kai kalbame apie perdegimą, dažniausiai tai pasireiškia dirbantiems su žmonėmis, '
        'kurie pasirinko specialybę, susijusią su davimu.',
      ),
      const _P(
        'Vienas svarbiausių aspektų, norint duoti ir neperdegti – mokėti gauti. '
        'Svarbu iš pasaulio pasiimti tiek, kad galėtume atgauti jėgas.',
      ),
      const _H2('O gavimas gali būti labai įvairus:'),
      const _Bullet(
        'Paskambinti draugei ar draugui ir išpasakoti savo rūpesčius.',
      ),
      const _Bullet(
        'Paprašyti artimųjų prižiūrėti vaikus, kad galėtum atsipūsti.',
      ),
      const _Bullet('Pasiimti kelias neapmokamas atostogų dienas darbe.'),
      const _Bullet(
        'Neklausyti neįdomių istorijų ar išeiti iš susitikimo, kai jauti nuovargį.',
      ),
      const _Bullet('Nueiti anksčiau miegoti.'),
      const _P(
        'Galiu tęsti ir tęsti… Labai svarbu pasyviai nelaukti, kol „pasidarys geriau“, '
        'ar tikėtis, kad dalykai savaime pasikeis, bet imtis aktyvių jėgų atgavimo veiksmų.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class JeguAtkurimoIdejosPage extends StatefulWidget {
  final void Function(List<String>)? onSubmit;
  final VoidCallback? onNext;

  const JeguAtkurimoIdejosPage({super.key, this.onSubmit, this.onNext});

  @override
  State<JeguAtkurimoIdejosPage> createState() => _JeguAtkurimoIdejosPageState();
}

class _JeguAtkurimoIdejosPageState extends State<JeguAtkurimoIdejosPage> {
  final List<TextEditingController> _controllers = List.generate(
    3,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addRow() => setState(() => _controllers.add(TextEditingController()));
  void _removeRow(int i) {
    if (_controllers.length <= 1) return;
    setState(() {
      _controllers[i].dispose();
      _controllers.removeAt(i);
    });
  }

  void _submit() {
    final values =
        _controllers
            .map((c) => c.text.trim())
            .where((t) => t.isNotEmpty)
            .toList();
    widget.onSubmit?.call(values);
    widget.onNext?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return _page([
      const _P(
        'Noriu pakviesti žemiau įrašyti keletą dalykų, kurie tau padeda atgauti jėgas. '
        'Svarbu, kad pagalvotum apie tas veiklas, kurios labiausiai padeda, gali būti, kad tai nebūtinai tos veiklos, '
        'kurios suteikia atsipalaidavimą. Pavyzdžiui, alkoholio gėrimas gali suteikti atsipalaidavimo būseną, '
        'bet nebūtinai padėti atgauti jėgas. Gali būti, kad nuėjimas į muziejų ar kiną – gali suteikti malonių patyrimų, '
        'bet vėlgi – nebūtinai atstatyti resursus. Tad prašau Tavęs įrašyk veiklas, kurios padeda būtent Tau atgauti jėgas. '
        'Gali ir pagalvoti, rašyti nebūtina, bet užsirašius – didesnis šansas, kad prisiminsi ir ateityje tai panaudosi.',
      ),
      ...List.generate(_controllers.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${i + 1}. ', style: theme.bodyLarge),
              Expanded(
                child: TextField(
                  controller: _controllers[i],
                  decoration: _inputDecoration(
                    hint: 'Įrašyk veiklą, kuri tau padeda atgauti jėgas',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'Pašalinti eilutę',
                onPressed: _controllers.length > 1 ? () => _removeRow(i) : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
            ],
          ),
        );
      }),
      Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton.icon(
          onPressed: _addRow,
          icon: const Icon(Icons.add),
          label: const Text('Pridėti eilutę'),
        ),
      ),
      Center(
        child: ElevatedButton(
          onPressed: _submit,
          child: const Text('Išsaugoti ir tęsti'),
        ),
      ),
    ]);
  }
}

class SavaitesPabaigosTrumpaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SavaitesPabaigosTrumpaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P('Šį kartą tiek, iki susitikimo!'),
      _NextButton(onNext),
    ]);
  }
}

class DzuginanciosVeiklosPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DzuginanciosVeiklosPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Praėjusį sykį prašiau Tavęs pagalvoti apie veiklas, kurios padeda atstatyti Tavo resursus. '
        'O dabar noriu, kad pagalvotum ir surašytum užsiėmimų, kurie Tave džiugina, '
        'sukelia malonių emocijų, atpalaiduoja ar kitaip pozityviai veikia.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class IrasytiVeiklasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const IrasytiVeiklasPage({super.key, this.onNext});

  @override
  State<IrasytiVeiklasPage> createState() => _IrasytiVeiklasPageState();
}

class _IrasytiVeiklasPageState extends State<IrasytiVeiklasPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kviečiu įrašyti tas veiklas žemiau pateiktame langelyje. '
        'Rašymas gali padėti smegenims geriau įsiminti, nei tik pagalvojimas.',
      ),
      TextField(
        controller: _controller,
        maxLines: 6,
        decoration: _inputDecoration(hint: 'Įrašyk čia savo veiklas...'),
      ),
      _NextButton(widget.onNext),
    ]);
  }
}

class SuplanuotiVeiklaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SuplanuotiVeiklaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kviečiu šiandien arba rytoj suplanuoti ir padaryti vieną iš Tavo sugalvotų malonių veiklų, '
        'būtų gerai, jeigu pasižymėtum tiksliai, kada tai padarysi. Tad, jei gali, atsidaryk kalendorių '
        'savo telefone ar užrašinę – ir pažymėk, kada tiksliai, kurią malonią veiklą darysi.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KavosAkimirkaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KavosAkimirkaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kartais net 5 minutės stabtelėjimo, pavyzdžiui, uodžiant ir pamažu gurkšnojant '
        'savo mėgstamą kavą – gali suteikti daugiau lengvumo kasdienybėje. Iki susitikimo!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class RibosSantykyjePage extends StatelessWidget {
  final VoidCallback? onNext;
  const RibosSantykyjePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Viena iš gavimo pusių – žinoti savo ribas/ribotumus ir su tuo susitaikyti. '
        'Kaip ir su sodu, gi dažniausiai neleidžiame visiems, kas nori ateiti, skinti, ką nori, '
        'daryti Tavo sode, ką nori. '
        'Svarbu saugoti savo resursus ir juo labiau neleisti, jog mūsų sodą kažkas piktybiškai niokotų '
        '(kiti asmenys ar mes patys). '
        'Tam labai svarbu ribos santykyje. Pavyzdžiui, kai esame prastesnės nuotaikos, '
        'tiesiog pasakyti kolegai, kad šiandien nesame nusiteikę kalbėti ir leisti sau patylėti, kiek norisi; '
        'leisti sau nesijuokti, kai nejuokinga; kai kitam reikia paramos – leisti sau jos kitam nesuteikti, '
        'jeigu negalime; kai kažkas kelia balsą – pasakyti, kad toks elgesys nepagarbus ir nenorime tęsti pokalbio, '
        'jeigu tai tęsis ir pan.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class NePratimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NePratimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final questions = <String>[
      'Ar galėtum padaryti kavos? (įsivaizduok, kad prašo Tavo kolega)',
      'Ar galėtum su manimi susitikti, man reikia tavo pagalbos? (įsivaizduok, kad prašo Tavo artimasis)',
      'Ar galėtum gauti man receptą, labai reikia?',
      'Ar galėtum nusiųsti siuntą, dabar esu užsienyje?',
    ];
    final theme = Theme.of(context).textTheme;

    return _page([
      const _P(
        'Jeigu gali, perskaityk kiekvieną sakinį garsiai (įsivaizduok, kad Tavęs to prašo kitas žmogus) '
        'ir į kiekvieną iš jų garsiai ir ramiai atsakyk – „Ne“. Jei garsiai skaityti negali, perskaityk mintyse.',
      ),
      ...questions.map(
        (q) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(q, style: theme.bodyMedium),
              const SizedBox(height: 4),
              Text(
                'Ne.',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
      _NextButton(onNext),
    ]);
  }
}

class KaipBuvoTauPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KaipBuvoTauPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Yra žmonių, kuriems pasakyti „Ne“ – nėra sudėtinga, bet yra tokių, kurie labai sunkiai geba pasakyti „Ne“. '
        'Tik norėjau atkreipti dėmesį, kad sakyti „Ne“ – yra normalu. '
        'Kai kuriems šis pratimas gali būti neutralus, kitiems sukelti stiprias emocijas, o kaip buvo Tau?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class PasirupinimoPabaigaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PasirupinimoPabaigaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Vienas iš svarbių pasirūpinimo savimi pusių – pažinti savo ribas ir priimti jas. '
        'O gi mylėti galime lengviau ir daugiau, kai patys esame pasipildę.\n\n'
        'Iki kito pasirūpinimo!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class DekingumoIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekingumoIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dar vienas svarbus aspektas, norint neperdegti, yra gebėti įsisąmoninti gavimą. '
        'Gebėti kuo pilniau patirti jėgų atstatymo akimirkas. Yra daugybė mokslinių tyrimų, '
        'kurie rodo, kad dėkingumo praktikos padeda geriau jaustis. Tad kviesiu ir Tave šiandien '
        'dėkingumo praktikai, tikiu, kad tokios praktikos gali padėti pasijusti tarsi labiau '
        'užpildytam, labiau gavusiam. Jeigu Tavo rezervai visai ištuštėję, gali būti, kad ši praktika '
        'kels pyktį ar susierzinimą, tad gali jos ir neatlikti arba atlikti patyrinėjant, kas vyksta, '
        'kaip keičiasi Tavo jausmai, bet daugumai žmonių tokia praktika būna pozityvi patirtis.',
      ),
      const _P('Spausk „Tęsti“ ir pradėkime.', align: TextAlign.left),
      _NextButton(onNext),
    ]);
  }
}

class DekingumoPraktikaPage extends StatefulWidget {
  final VoidCallback? onNext;
  const DekingumoPraktikaPage({super.key, this.onNext});

  @override
  State<DekingumoPraktikaPage> createState() => _DekingumoPraktikaPageState();
}

class _DekingumoPraktikaPageState extends State<DekingumoPraktikaPage> {
  final TextEditingController _siandienController = TextEditingController();
  final TextEditingController _savaiteController = TextEditingController();
  final TextEditingController _menuoController = TextEditingController();
  final TextEditingController _metaiController = TextEditingController();

  @override
  void dispose() {
    _siandienController.dispose();
    _savaiteController.dispose();
    _menuoController.dispose();
    _metaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Žemiau parašyk, už ką esi dėkingas:'),
      const _P(
        'Šiandien,\nšią savaitę,\nšį mėnesį,\nšiais metais.\n\n'
        'Jeigu nesugalvotum, gali apsvarstyti tokius variantus kaip: '
        'kad esi gyvas, šiandien švietė saulė, kad šiandien neskauda kūno ir pan.',
      ),
      _inputField('Šiandien', _siandienController),
      _inputField('Šią savaitę', _savaiteController),
      _inputField('Šį mėnesį', _menuoController),
      _inputField('Šiais metais', _metaiController),
      _NextButton(widget.onNext),
    ]);
  }

  Widget _inputField(String label, TextEditingController c) {
    return TextField(
      controller: c,
      decoration: _inputDecoration(label: label),
      maxLines: null,
    );
  }
}

class DekingumoApibendrinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekingumoApibendrinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kiek teko skaityti mokslinėje literatūroje ir girdėti iš realių pasakojimų – ši praktika labai veikia. '
        'Nuolatinis dėkingumo praktikavimas gali pagerinti nuotaiką, jaustis labiau ryšyje su pasauliu ir kitais žmonėmis. '
        'Šios praktikos gali padėti jausti, kad gauname. Tad kviečiu nepamiršti ir vis padėkoti sau, kitiems ar pasauliui!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class AciuUzPraktikasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AciuUzPraktikasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final body = Theme.of(context).textTheme.bodyLarge;
    return _page([
      Text(
        'Ačiū Tau, kad tęsi praktikas.',
        style: body,
        textAlign: TextAlign.center,
      ),
      _NextButton(onNext),
    ]);
  }
}

class PozirisIDavimaIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PozirisIDavimaIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Pažįstu kelis medikus, kurie dalinosi vienu bendru aspektu, kuris padėjo jiems grįžti į darbą iš perdegimo. '
        'Jie kalbėjo apie pasikeitusį požiūrį į davimą. '
        'Po kurio laiko šią mintį radau ir knygoje, noriu pasidalinti ir su Tavimi – gal bus ir Tau įdomu ar naudinga.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class DavimasBeLukesciuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DavimasBeLukesciuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Jie kalbėjo apie tai, kad labiausiai padeda duoti – nelaukiant atlygio, t.y. nelaukiant, kad kas padėkos, nusišypsos, pagirs. '
        'Daugeliu atveju atlygio laukimas sukuria naštą ir kančią, gali būti, kad mes dirbsime tokioje vietoje, '
        'kur žmonės tiesiog pasitaikys mažiau dėkingi, kad tiesiog mums bijos padėkoti, ar bus dėl savo praeities sunkumų pikti, '
        'kritiški ir nedėkingi. Jeigu einame į davimo profesiją be lūkesčio gauti, o tiesiog dalintis meile, savo įgūdžiais, kiek galime – '
        'tai visai kita būsena, kuri gali būti savaime džiuginanti. '
        'Jeigu viliamės, kad už gerą širdį mums atlygins – kiekvieną kartą nesulaukę atlygio galime patirti kančią ir galiausiai – sudegti.\n\n'
        'Vis dėlto, davimas be gavimo neįmanomas, todėl pirma rašiau apie gavimą. '
        'Itin svarbu – mokėti gauti iš gyvenimo, būti prisipildžiusiam, tik tada galime duoti be troškimo iškart gauti atgal.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class PerdegimoVengimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerdegimoVengimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dalinuosi keliais davimo būdais, kurie, manoma, veda link perdegimo '
        '(pagal Pascal Ide knygą „Perdegimo sindromas”).',
      ),
      const _H2('Kas veda link perdegimo'),
      const _Bullet('Gauti atlygį'),
      const _Bullet('Padėti, nes jaučiamės kalti, kad nepadėjome'),
      const _Bullet(
        'Tapatintis su kito žmogaus ar savo susikurto vidinio modelio lūkesčiais (kad nebūtų mažesni)',
      ),
      const _Bullet('Siekti būti pripažintam dosniu žmogumi'),
      const _Bullet('Bijoti kritikos, kad mums trūksta altruizmo'),
      const _Bullet(
        'Patenkinti kito poreikį, nes jis primena mums mūsų pačių trūkumą, o jis nepakeliamas',
      ),
      const _Bullet(
        'Vengti nemalonaus pojūčio, kad esam egoistai ar niekam nenaudingi',
      ),
      const _Bullet('Taisyti klaidą atlikus veiksmą, kuriam trūko dosnumo.'),
      const _H2('Kas padeda neperdegti'),
      const _Dash('Laukti, kol pagalbos paprašys.'),
      const _Dash('Jaustis laisvu nepadėti, net jei kitam reikia pagalbos.'),
      const _Dash(
        'Nemanyti, kad už pagalbą kitas yra skolingas, nes paties veiksmas yra be atlygio reikalavimo.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class PabaigaBeLukesciuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PabaigaBeLukesciuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Mes nesame neišsenkantys indai, mes nesame Dievai ir turime rūpintis savimi, '
        'pildyti save, o tada galėsime ir duoti tyriau. '
        'Manau, kad davimas be lūkesčių – žymiai malonesnis. '
        'O ką manai Tu?\n\n'
        'Iki kito pasirūpinimo!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class MesNesameIndaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MesNesameIndaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Mes nesame neišsenkantys indai, mes nesame Dievai ir turime rūpintis savimi, '
        'pildyti save, o tada galėsime ir duoti tyriau. '
        'Manau, kad davimas, be lūkesčių – žymiai malonesnis. '
        'O ką manai Tu?\n\n'
        'Iki kito pasirūpinimo!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class PerdegimoRizikosVeiksniaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerdegimoRizikosVeiksniaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final items = const [
      'Darbo perkrūvis',
      'Mobingas',
      'Konfliktai su kolegomis',
      'Kompetencijų trūkumas',
      'Supervizijų trūkumas',
      'Gyvenimas vienam',
      'Socialinių santykių trūkumas',
      'Mažas fizinis aktyvumas',
      'Laisvalaikio veiklų neturėjimas',
      'Nepakankamas rūpinimąsis savimi',
      'Perfekcionizmas',
      'Suvokiamas žemas gebėjimas kontroliuoti įvykius',
    ];
    return _page([
      const _P(
        'Žemiau pateikiu rizikos veiksnius, kurie siejami su perdegimu.',
      ),
      const _H2('Perdegimo rizikos veiksniai'),
      ...items.map((e) => _Bullet(e)),
      _NextButton(onNext),
    ]);
  }
}

class RizikosVeiksniuApmasymasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const RizikosVeiksniuApmasymasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kurie rizikos veiksniai būdingi būtent Tau? '
        'Kuriuos iš jų gali pakeisti, o kurie pakeičiami mažai, '
        'bet galbūt gali kurti su tais veiksniais lengvesnį santykį, '
        'bandyti priimti, pakeisti požiūrį?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class IkiKitoKartoPage extends StatelessWidget {
  final VoidCallback? onNext;
  const IkiKitoKartoPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P('Iki kito karto!', align: TextAlign.center),
      _NextButton(onNext),
    ]);
  }
}

class MindfulnessJudesiaiIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MindfulnessJudesiaiIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Atėjo laikas šiek tiek daugiau dėmesio skirti ir tiesiogiai kūnui. '
        'Juk jis – esminis mūsų resursas! Tad šiandien kviesiu atlikti Mindfulness judesių praktiką. '
        'Tau nereikės jokio specialaus pasiruošimo, tik būtų gerai, kad turėtum šiek tiek vietos pajudėti. '
        'Jeigu dabar esi tokioje vietoje, kur negali atlikti šios praktikos – kviečiu įsijungti programėlę, '
        'kai tokią galimybę rasi ir pratęsti!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class DemesinguJudesiuPraktikaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DemesinguJudesiuPraktikaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final body = Theme.of(context).textTheme.bodyLarge;
    return _page([
      Text(
        'Dėmesingų judesių praktika',
        style: body?.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      _NextButton(onNext),
    ]);
  }
}

class PraktikosApibendrinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PraktikosApibendrinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Ši praktika apjungė kelis aspektus – ir fizinį – šiek tiek pajudėjai, '
        'ir sąmoningumo – leido patirti savo kūną sąmoningiau. '
        'Daugiau apie kūną pratęsime ketvirtos savaitės praktikose.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class Sveikinimas21UzduotisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const Sveikinimas21UzduotisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'O dabar noriu pasveikinti Tave, jau padarei 21 užduotį!!!\n\n'
        'Kažkur apie 2–4 savaitę žmonių motyvacija tęsti praktikas kiek pamažėja, '
        'bet jeigu pavyksta atsilaikyti – praktikų pabaigoje ji vėl paauga. '
        'Linkiu tęsti ir pamatyti šios 8 savaičių programos vaisius! '
        'Tikiu, kad jie bus pozityvūs!\n\n'
        'Siunčiu šiltų linkėjimų ir susitikime ketvirtos savaitės – dėmesingo laistymo praktikose. '
        'Ten pradėsiu nuo motyvacijos, kaip ją atrasti ir nepaleisti gerų įpročių formavimo!',
      ),
      _NextButton(onNext),
    ]);
  }
}

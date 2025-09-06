// import 'package:flutter/material.dart';

// class InterpretacijosPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const InterpretacijosPage({super.key, this.onNext});

//   @override
//   State<InterpretacijosPage> createState() => _InterpretacijosPageState();
// }

// class _InterpretacijosPageState extends State<InterpretacijosPage> {
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _paragraph(
//             'Jei pagalvosime – „Turbūt padariau kažką blogai”, galime pajausti stiprų nerimą, baimę, gėdą, liūdesį ar pyktį, '
//             'gali pasikeisti kūno pojūčiai – pradėsime prakaituoti, rausti, gali net tapti sunku kvėpuoti, '
//             'galime pradėti impulsyviau elgtis, daryti daugiau klaidų.',
//             textTheme,
//           ),
//           _paragraph(
//             'Jei pagalvosime, kad mus nori apdovanoti – pasijausime visai kitaip. '
//             'Kai kurie galbūt pagalvos – „Įdomu, ko vadovas iš manęs nori?” – ir sureaguos gan neutraliai.',
//             textTheme,
//           ),
//           const SizedBox(height: 12),
//           _subtitle('Skirtingos interpretacijos → skirtingos reakcijos'),
//           _bullet(
//             'Ne retai į tą pačią situaciją žmonės reaguoja skirtingais būdais – tai priklauso nuo mūsų interpretacijų.',
//           ),
//           const SizedBox(height: 16),
//           _subtitle('Būsena labai svarbi'),
//           _paragraph(
//             'Mūsų reakcijos stiprumui ne retai labai svarbią reikšmę turi mūsų būsena tuo metu.',
//             textTheme,
//           ),
//           _bullet('Neišsimiegoję'),
//           _bullet('Nepavalgę'),
//           _bullet('Neseniai susipykę su artimuoju ar kolega'),
//           const SizedBox(height: 8),
//           _paragraph(
//             'Tokiais atvejais reaguosime ūmiau ir negatyviau.',
//             textTheme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [const Text('•  '), Expanded(child: Text(text))],
//       ),
//     );
//   }
// }

// class KeitimoStrategijosPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const KeitimoStrategijosPage({super.key, this.onNext});

//   @override
//   State<KeitimoStrategijosPage> createState() => _KeitimoStrategijosPageState();
// }

// class _KeitimoStrategijosPageState extends State<KeitimoStrategijosPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _paragraph(
//             'Norėdami padėti sau sunkiose situacijose galime prisiminti šiuos 4 psichologinius '
//             'komponentus ir kurį nors iš jų pakeisti. Keičiant vieną – keičiasi ir kiti.',
//             theme,
//           ),
//           const SizedBox(height: 12),

//           _subtitle('Pakeisti mintis'),
//           _paragraph(
//             'Galime bandyti pakeisti mintis – rasti racionalesnių, mus labiau raminančių:',
//             theme,
//           ),
//           _bullet('„Net, jeigu ir padariau kažką blogo, susitvarkysiu“.'),
//           _bullet('„Žmogiška daryti klaidas“.'),
//           _bullet('„Vadovas nebūtinai turi man nemalonių žinių“.'),
//           const SizedBox(height: 12),

//           _subtitle('Pakeisti kūno pojūčius ar emocijas'),
//           _paragraph(
//             'Pvz., pradėti daryti atsispaudimus tol, kol pavargsime – fizinis krūvis sumažins nerimą '
//             'ir pasijausime ramiau.',
//             theme,
//           ),
//           const SizedBox(height: 12),

//           _subtitle('Pakeisti elgesį'),
//           _paragraph(
//             'Galime keisti savo elgesį – nueiti pasikalbėti su vadovu kuo anksčiau ir taip sutrumpinti nerimavimo laiką.',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           _subtitle('Ilgalaikė būsena'),
//           _paragraph(
//             'Galime stengtis, kad ilgainiui mūsų kasdienė būsena būtų vis stabilesnė – skirti dėmesio savo '
//             'biologinėms ir psichologinėms būsenoms, formuoti kasdienius pasirūpinimo savimi įpročius. '
//             'Pavyzdžiui, kasdien sportuoti ir taip padidinti savo atsparumą nerimą keliančiose situacijose.',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           _subtitle('Esminė idėja'),
//           _paragraph(
//             'Iš esmės, svarbu keisti savo elgesį, įpročius, tuos keturis komponentus, jei norime jaustis geriau. '
//             'Bet tam, kad galėtume kitaip pasielgti, suformuoti naujus įpročius, pradžioje mums reikia išmokti '
//             'pastebėti savo mintis ir neleisti joms automatiškai apspręsti mūsų elgesio. Taip atsiras daugiau '
//             'pasirinkimų, kokį gyvenimą norime kurti ir gyventi. Tai leis formuoti savo elgesį pagal tai, kokių '
//             'pasekmių norime – tiek sąmoningiau rinktis elgesį, tiek pasekmes.',
//             theme,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
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
// }

// class BraskePratimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const BraskePratimasPage({super.key, this.onNext});

//   @override
//   State<BraskePratimasPage> createState() => _BraskePratimasPageState();
// }

// class _BraskePratimasPageState extends State<BraskePratimasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Trumpas pratimas'),
//           _paragraph(
//             'Pabaigai noriu paprašyti atlikti labai trumpą pratimą.',
//             theme,
//           ),
//           _paragraph(
//             'Prašau – negalvok apie ką tik sode nuskintas saldžias, dideles braškes. '
//             'Pabandyk užsimerkti ir keletą sekundžių negalvoti apie braškes.',
//             theme,
//           ),
//           const SizedBox(height: 12),
//           _subtitle('Apie ką galvojai?'),
//           _paragraph(
//             'Daugelis žmonių galvoja apie braškes ar bent jau šmėsteli toks vaizdinys.',
//             theme,
//           ),
//           _paragraph(
//             'Tokios jau tos mūsų smegenys – pagal gaunamus stimulus iš aplinkos suformuoja '
//             'ir pateikia greitai kylančias mintis, kurioms turime gan mažai kontrolės.',
//             theme,
//           ),
//           const SizedBox(height: 16),
//           _paragraph(
//             'Daugiau apie mintis papasakosiu kitame mūsų susitikime!',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Pabaiga (nenustatyta navigacija)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Pabaiga'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class MindfulnessIlgaPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MindfulnessIlgaPage({super.key, this.onNext});

//   @override
//   State<MindfulnessIlgaPage> createState() => _MindfulnessIlgaPageState();
// }

// class _MindfulnessIlgaPageState extends State<MindfulnessIlgaPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Mindfulness praktika'),
//           _paragraph(
//             'Tai, ką ką tik darei – yra Mindfulness praktika. Apie ją dar papasakosiu vėliau, '
//             'bet dabar noriu paklausti, ar pastebėjai, kad šios praktikos metu Tau kilo įvairių, '
//             'tarsi automatinių minčių? Manau, kad nesuklysiu, jei pasakysiu, kad tavo dėmesys nebuvo tik ten, '
//             'kur kvietė medituotojos balsas. Galbūt Tavo dėmesys nuklydo į dabartinius rūpesčius, galbūt pradėjo '
//             'vertinti praktiką – „neįdomu”, „įdomu“, „nesąmonė“, o gal iš viso neatlikai praktikos, nes dar prieš '
//             'įjungiant įrašą pagalvojai, kad nenori jos daryti. Gali būti, kad gan atidžiai buvai savo dėmesiu ten, kur '
//             'sakoma, bet vis tiek karts nuo karto bent trumpam “dingdavai” iš praktikos.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Minčių kontrolė – nelengva'),
//           _paragraph(
//             'Praeitą kartą prašiau tavęs negalvoti apie braškes, t.y. nukreipti savo dėmesį kur nors kitur, '
//             'o šį kartą prašiau dėmesį nukreipti tik į kvėpavimą. Ar gali sutikti, kad net valingai ir sąmoningai '
//             'stengiantis kontroliuoti mintis – tai nėra taip paprasta?',
//             theme,
//           ),
//           _paragraph(
//             'Kaip manai, kiek apskritai minčių per dieną kyla žmogui? Na, tai labai sunku pasakyti, bet mokslininkai '
//             'bando skaičiuoti mintis ir priskaičiuoja jų nuo kelių tūkstančių iki dešimčių tūkstančių per dieną. '
//             'Manoma, kad dauguma minčių dienos eigoje yra pasikartojančios, kaip užsukta plokštelė.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Santykis su mintimis'),
//           _paragraph(
//             'Turbūt sutiktum su manimi, kad sunkiai galime kontroliuoti savo mintis, bet galime su jomis turėti kitokį santykį, '
//             'galime mokytis valdyti dėmesį ir labiau rinktis, kiek tarsi patikėti jomis, įsitraukti į jas, o kiek automatinės mintys '
//             'kurs mūsų gyvenimą, o kiek mes būsime savo gyvenimo kūrėjai.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Ką ugdo Mindfulness'),
//           _bullet('Moko valdyti dėmesį.'),
//           _bullet(
//             'Moko išbūti su viskuo, kas kyla (tiek su maloniais, tiek su nemaloniais išgyvenimais).',
//           ),
//           _paragraph('Abu aspektai labai praverčia gyvenime.', theme),
//           const SizedBox(height: 8),

//           _subtitle('Pozityvumo ir skausmo priėmimas'),
//           _paragraph(
//             'Svarbu yra tiek mokėti atsigręžti į šviesiąją gyvenimo pusę, sąmoningai kreipti dėmesį į pozityvius aspektus, '
//             'tiek sąmoningai pasirinkti atsigręžti į skausmą ir su juo išbūti nekovojant, nes kova dažnai sukuria priešingą efektą – '
//             'nemalonios mintys ir emocijos sustiprėja.',
//             theme,
//           ),
//           _paragraph(
//             'Pavyzdžiui, yra mokslinių tyrimų, kurie rodo, kad žmonės, kurie išjaučia liūdesį greičiau intensyviau, leidžia sau verkti – '
//             'greičiau “atsistoja ant kojų”, nei tie, kurie visaip bando išvengti liūdesio patyrimo.',
//             theme,
//           ),
//           _paragraph(
//             'Manau, galime sutikti, kad skausmas yra neatsiejama žmogaus gyvenimo dalis, mes negalime išvengti rūpesčių, netekčių, ligų, '
//             'tačiau, galime ieškoti būdų, kaip su skausmu būti lengviau.',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           _subtitle('Viena iš mano mėgiamų citatų'),
//           _quote(
//             'Dieve, suteik man ramybės susitaikyti su tuo, ko negaliu pakeisti;\n'
//             'drąsos keisti, ką galiu pakeisti,\n'
//             'ir išminties tą skirtumą suprasti.',
//             context,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
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

//   Widget _quote(String text, BuildContext context) {
//     final scheme = Theme.of(context).colorScheme;
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: scheme.primaryContainer.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: scheme.primary.withOpacity(0.3)),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(fontStyle: FontStyle.italic, height: 1.3),
//         textAlign: TextAlign.left,
//       ),
//     );
//   }
// }

// class MindfulnessApibendrinimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MindfulnessApibendrinimasPage({super.key, this.onNext});

//   @override
//   State<MindfulnessApibendrinimasPage> createState() =>
//       _MindfulnessApibendrinimasPageState();
// }

// class _MindfulnessApibendrinimasPageState
//     extends State<MindfulnessApibendrinimasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Grįžkime prie Mindfulness'),
//           _paragraph(
//             'Yra daugybė tyrimų, kurie rodo, kad Mindfulness praktikavimas gali padėti '
//             'sumažinti stresą, depresiją, nerimą, skausmą ir apskritai pagerinti gyvenimo gerovę.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Mindfulness Sodo programoje'),
//           _paragraph(
//             'Sodo programoje karts nuo karto pakviesiu tave panašioms praktikoms, '
//             'svarbu, jog žinotum – kad tam nereikia ypatingo pasiruošimo. '
//             'Mindfulness galima atlikti ir triukšmingoje aplinkoje, svarbu, kad tuo metu '
//             'turėtum galimybę stabtelti – prisėsti, ramiai pastovėti ar atsigulti.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Ne visuomet maloni patirtis'),
//           _paragraph(
//             'Taip pat svarbu, jog žinotum, kad Mindfulness praktikavimas nebūtinai turi sukelti '
//             'malonius pojūčius ar ramybę. Ne retai, ypač atliekant Mindfulness pirmus kartus – '
//             'tai gali būti ir nemaloni patirtis. Smegenys mokosi naujo buvimo būdo.',
//             theme,
//           ),
//           const SizedBox(height: 8),

//           _subtitle('Kaip sodo priežiūra'),
//           _paragraph(
//             'Kaip ir sodo priežiūra – ne visuomet tik lengva ar maloni – bet gi smagu pasimėgauti vaisiais. '
//             'Tad, jeigu patirsi nemalonių patyrimų meditacijų ar kitų praktikų metu – kviečiu neišsigąsti, '
//             'o išbūti su tuo ir tiesiog keliauti toliau.',
//             theme,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class SportoBakterijosPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const SportoBakterijosPage({super.key, this.onNext});

//   @override
//   State<SportoBakterijosPage> createState() => _SportoBakterijosPageState();
// }

// class _SportoBakterijosPageState extends State<SportoBakterijosPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Maža istorija apie įpročius (su šypsena)'),
//           _paragraph(
//             'Prieš ruošiant šią Sodo programą – išgirdau įdomią mintį, noriu pasidalinti ja su Tavimi. '
//             'Siūlau ją priimti šiek tiek su humoru, bet galima ir rimtai. Kalba ėjo apie sportą.',
//             theme,
//           ),
//           _paragraph(
//             'Turbūt gali sutikti, kad nesportuojantiems žmonėms pradėti reguliariai sportuoti yra sunku. '
//             'Įdomu tai, kad po keletos mėnesių sporto, kūne galiausiai „prisidaugina“ „sportininkių“ bakterijų, '
//             'kurios pradeda taip veikti žmogų – kad jam pasidaro žymiai lengviau prisiversti sportuoti. '
//             'Tarsi sakytų – „Mums reikia sporto, kad išgyventumėm, padarysim taip, kad norėtum sportuoti ir toliau!“',
//             theme,
//           ),
//           const SizedBox(height: 8),
//           _subtitle('Įžanga į naujus įpročius'),
//           _paragraph(
//             'Tad… norint pakeisti įpročius, reikia padaryti įžangą, kol „prisigamins“ tam tikrų bakterijų, '
//             'o po to jau jos dirbs už Tave! 😊 (galioja ir prastiems įpročiams, tad būk atidus, kurias bakterijas auginsi! 😊)',
//             theme,
//           ),
//           const SizedBox(height: 8),
//           _paragraph(
//             'Kitą kartą papasakosiu daugiau apie mąstymo įpročius.',
//             theme,
//           ),
//           _paragraph('Draugiškų minčių, iki susitikimo.', theme),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class MinciuZaidasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MinciuZaidasPage({super.key, this.onNext});

//   @override
//   State<MinciuZaidasPage> createState() => _MinciuZaidasPageState();
// }

// class _MinciuZaidasPageState extends State<MinciuZaidasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Mintys ir mąstymo procesai'),
//           _paragraph(
//             'Kaip turbūt jau supratai, šią savaitę daugiau dėmesio skirsime mintims bei mąstymo procesams. '
//             'Noriu pakviesti tave pažaisti su mintimis. Prašau, neskubant perskaityk toliau parašytus sakinius:',
//             theme,
//           ),
//           const SizedBox(height: 12),

//           _quote('Jonas ėjo savo įprastu keliu į mokyklą...', context),
//           const SizedBox(height: 8),
//           _quote(
//             'Jis besijaudindamas galvojo apie matematikos pamoką...',
//             context,
//           ),
//           const SizedBox(height: 8),
//           _quote(
//             'Jonas nebuvo tikras ar vėl suvaldys klasę šiandien...',
//             context,
//           ),
//           const SizedBox(height: 8),
//           _quote(
//             'Tačiau tai nebuvo jo kaip sargo ir durininko pagrindinė pareiga...',
//             context,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _quote(String text, BuildContext context) {
//     final scheme = Theme.of(context).colorScheme;
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: scheme.primaryContainer.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: scheme.primary.withOpacity(0.3)),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(fontStyle: FontStyle.italic, height: 1.3),
//         textAlign: TextAlign.left,
//       ),
//     );
//   }
// }

// class PrasmiuPriskyrimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const PrasmiuPriskyrimasPage({super.key, this.onNext});

//   @override
//   State<PrasmiuPriskyrimasPage> createState() => _PrasmiuPriskyrimasPageState();
// }

// class _PrasmiuPriskyrimasPageState extends State<PrasmiuPriskyrimasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Interpretacijos galia'),
//           _paragraph(
//             'Ar pastebėjai, kaip mūsų protas greitai ir automatiškai priskyrė prasmes, '
//             'nors ir iš nedidelio kiekio informacijos?',
//             theme,
//           ),
//           _paragraph(
//             'Ar sutinki, kad apskritai, dažniausiai mes negalime matyti situacijos ar fakto tiesiog kaip fakto – '
//             'mes nuolat interpretuojame ir priskiriame prasmes. Ir emocinės mūsų reakcijos dažniausiai gimsta ne iš „nuogo fakto“, '
//             'o iš to įvykio interpretacijos.',
//             theme,
//           ),
//           const SizedBox(height: 8),
//           _subtitle('Nuo ko priklauso interpretacijos?'),
//           _bullet(
//             'Nuo prasmės, kurią suteikiame įvykiui („geras“ ar „blogas“).',
//           ),
//           _bullet('Nuo ankstesnės patirties ir prisiminimų.'),
//           _bullet('Nuo esamos būsenos (nuovargio, alkio, streso).'),
//           _bullet('Nuo konteksto ir lūkesčių.'),
//           const SizedBox(height: 16),
//           _paragraph(
//             'O mūsų interpretacijos priklauso ne tik nuo paties įvykio, tačiau ir nuo prasmės, kurią jam suteikiame, '
//             'prieš tai buvusios patirties ir daugelio kitų dalykų…',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed:
//           //         widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(
//           //                 content: Text('Kitas žingsnis (nenustatytas)'),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [Text('•  '), Expanded(child: Text(text))],
//       ),
//     );
//   }
// }

// class BusenosPoveikisPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const BusenosPoveikisPage({super.key, this.onNext});

//   @override
//   State<BusenosPoveikisPage> createState() => _BusenosPoveikisPageState();
// }

// class _BusenosPoveikisPageState extends State<BusenosPoveikisPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Pavyzdžiai iš skirtingų būsenų'),
//           _paragraph(
//             'Pavyzdžiui, nuo mūsų būsenos. Kviečiu perskaityti dar kelias istorijas ir pareflektuoti:',
//             theme,
//           ),
//           const SizedBox(height: 12),

//           _subtitle('Situacija 1 – neigiama būsena'),
//           _paragraph(
//             'Įsivaizduok, kad darbe ar studijose tik ką susipykai su kolega. '
//             'Jautiesi piktas, nusivylęs, pažemintas, nerimastingas... '
//             'Lipdamas laiptais žemyn susitinki kitą kolegą, stabteli pasikalbėti, '
//             'bet jis tik kažką burbteli po nosimi ir nueina tolyn.',
//             theme,
//           ),
//           _paragraph(
//             'Dabar užsimerk ir minutę pabandyk įsivaizduoti situaciją '
//             '(prašau, nepraleisk šio punkto ir paskirk minutę įsivaizdavimui).',
//             theme,
//           ),
//           _paragraph('Kokios mintys ateis Tau į galvą?', theme),

//           const SizedBox(height: 16),

//           _subtitle('Situacija 2 – teigiama būsena'),
//           _paragraph(
//             'O dabar įsivaizduok, kad darbe ar studijose tik ką buvai viešai pagirtas už puikų darbą. '
//             'Jautiesi įvertintas, linksmas, savimi pasitikintis... '
//             'Lipdamas laiptais žemyn susitinki kolegą, stabteli pasikalbėti, '
//             'bet jis tik kažką burbteli po nosimi ir nueina tolyn.',
//             theme,
//           ),
//           _paragraph(
//             'Dabar užsimerk ir minutę pabandyk įsivaizduoti situaciją. '
//             '(vėl prašau, nepraleisk ir paskirk akimirką įsivaizdavimui).',
//             theme,
//           ),
//           _paragraph('Kokios mintys ateis Tau į galvą?', theme),

//           const SizedBox(height: 16),

//           _paragraph(
//             'Tai tik dar keli pavyzdžiai, leidžiantys giliau suvokti, '
//             'kad mūsų nuotaikos ir emocijos dar prieš nutinkant situacijoms '
//             'veikia mūsų interpretacijas ir mūsų pasaulio matymą.',
//             theme,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class VidinisSodasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const VidinisSodasPage({super.key, this.onNext});

//   @override
//   State<VidinisSodasPage> createState() => _VidinisSodasPageState();
// }

// class _VidinisSodasPageState extends State<VidinisSodasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Vidinio sodo puoselėjimas'),
//           _paragraph(
//             'Taigi, nuolatinis emocinių resursų atstatymas turi labai didelę reikšmę. '
//             'Mažesnis šansas, kad kolegos ar paciento kritika mus ilgam išmuš iš vėžių, '
//             'jeigu vis rūpinsimės savo vidiniu sodu.',
//             theme,
//           ),
//           _paragraph(
//             'Kalbant metaforomis, kaip ir sodo laistymas, ravėjimas, tręšimas padeda užauginti norimus augalus, '
//             'taip ir mūsų vidiniam sodui svarbus rūpestis ir puoselėjimas, kad būtume atsparesni liūtims, šalnoms, '
//             'kaitrai, kenkėjams ir kitiems nemaloniems netikėtumams, kurie gali mus užklupti.',
//             theme,
//           ),
//           const SizedBox(height: 8),
//           _subtitle('Ko tikėtis Sodo programoje'),
//           _paragraph(
//             'Tikiuosi, kad Sodo programos metu rasi Tau tinkamų „trašų“, kurios tiks būtent Tavo vidinam sodui '
//             'ir suteiks daugiau atsparumo bei klestėjimo.',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class MastymoKrastutinumaiPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MastymoKrastutinumaiPage({super.key, this.onNext});

//   @override
//   State<MastymoKrastutinumaiPage> createState() =>
//       _MastymoKrastutinumaiPageState();
// }

// class _MastymoKrastutinumaiPageState extends State<MastymoKrastutinumaiPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Mąstymo kraštutinumai – įžanga'),
//           _paragraph(
//             'Noriu tave supažindinti su mąstymo kraštutinumais. Mums visiems būdinga greitai apibendrinti informaciją, '
//             'kartais toks apibendrinimas gali sukelti papildomo nerimo. Žemiau rasi dažniausius mąstymo kraštutinumus ir jų pavyzdžius. '
//             'Kviečiu Tave pabandyti atpažinti, ar kurie iš jų būdingi ir Tau. O gal tau nebūdingi mąstymo kraštutinumai?',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           // 1) Perdėtas apibendrinimas
//           _sectionTitle('Perdėtas apibendrinimas'),
//           _paragraph(
//             'Daroma apibendrinta neigiama išvada, kuri gerokai neatitinka situacijos.',
//             theme,
//           ),
//           _bullet('Padariau klaidą, tai reiškia, kad esu nekompetentingas.'),
//           _bullet('Gavau kritikos, tai reiškia, kad esu blogas darbuotojas.'),
//           _bullet(
//             'Neišlaikiau egzamino, tai yra labai blogai, aš esu kvailas.',
//           ),

//           const SizedBox(height: 16),

//           // 2) Ateities numatymas
//           _sectionTitle('Ateities numatymas'),
//           _paragraph(
//             'Manoma, kad ateityje įvyks katastrofa ir nesvarstomi kiti, labiau tikėtini variantai.',
//             theme,
//           ),
//           _bullet(
//             'Padariau klaidą, todėl gausiu blogą atsiliepimą arba skundą.',
//           ),
//           _bullet(
//             'Nesurinkau visų reikalingų duomenų apie pacientą, jeigu jam kažkas nutiks, mane apkaltins.',
//           ),
//           _bullet('Ant manęs supyko artimasis – mūsų santykiai nutrūks.'),

//           const SizedBox(height: 16),

//           // 3) Emocinis mąstymas
//           _sectionTitle('Emocinis mąstymas'),
//           _paragraph('Manoma, kad tiesa yra tai, kaip jaučiuosi.', theme),
//           _bullet('Jaučiuosi nevykėlis, tai toks ir esu.'),
//           _bullet('Jaučiuosi negražus, toks ir esu.'),
//           _bullet('Jaučiuosi vienišas, tai nėra kam rūpiu.'),

//           const SizedBox(height: 16),

//           // 4) Personalizavimas
//           _sectionTitle('Personalizavimas'),
//           _paragraph(
//             'Manoma, kad kitų neigiami poelgiai arba kitiems nutikusios neigiamos situacijos susiję su mumis, '
//             'ir nesvarstomos kitos, labiau tikėtinos priežastys.',
//             theme,
//           ),
//           _bullet(
//             'Jeigu pacientas numirė – aš nepakankamai gerai atlikau savo darbą.',
//           ),
//           _bullet('Jeigu pacientas pyksta – padariau kažką ne taip.'),
//           _bullet('Jeigu kolega su manimi nepasisveikino – aš jam nepatinku.'),

//           const SizedBox(height: 16),

//           // 5) Mąstymas kategorijomis („privalau“, „turiu“)
//           _sectionTitle('Mąstymas kategorijomis: „privalau“, „turiu“'),
//           _paragraph(
//             'Susiję su nelanksčiu įsivaizdavimu, kaip pats žmogus ar kiti turi elgtis ir pervertinama, '
//             'kaip yra blogai, kai šie įsivaizdavimai nepatvirtinami.',
//             theme,
//           ),
//           _bullet('Aš turiu žinoti atsakymą į kiekvieną paciento klausimą.'),
//           _bullet('Turiu išlaikyti visus egzaminus.'),
//           _bullet('Privalau nedaryti klaidų.'),
//           _bullet(
//             'Aš turiu palaikyti tinkamą darbo ir asmeninio gyvenimo balansą.',
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   // Helpers
//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//       ),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  '),
//           Expanded(child: Text(text, textAlign: TextAlign.justify)),
//         ],
//       ),
//     );
//   }
// }

// class RacionalesnesMintysPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const RacionalesnesMintysPage({super.key, this.onNext});

//   @override
//   State<RacionalesnesMintysPage> createState() =>
//       _RacionalesnesMintysPageState();
// }

// class _RacionalesnesMintysPageState extends State<RacionalesnesMintysPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Racionalesnių minčių pavyzdžiai'),
//           _paragraph(
//             'Dabar pateiksiu racionalesnių minčių pavyzdžių, gal gali pasvarstyti, kaip Tau jos skamba. '
//             'Kokios mintys Tave nuramintų?',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           _sectionTitle(
//             '1. Aš turiu žinoti atsakymą į kiekvieną paciento klausimą.',
//           ),
//           _paragraph(
//             'Racionalesnė mintis: Neprivalau žinoti visko, jeigu klausimas man pasirodys svarbus, '
//             'galiu pacientui pasakyti, kad pasidomėsiu ir atsakysiu kito susitikimo metu.',
//             theme,
//           ),

//           const SizedBox(height: 16),

//           _sectionTitle(
//             '2. Padariau klaidą, tai reiškia, kad esu nekompetentingas.',
//           ),
//           _paragraph(
//             'Racionalesnė mintis: Klaidų darymas yra tiesiog žmogiško gyvenimo dalis, '
//             'galiu stengtis jų daryti mažiau, bet nutikus – neplakti savęs.',
//             theme,
//           ),

//           const SizedBox(height: 16),

//           _sectionTitle(
//             '3. Neišlaikiau egzamino, tai yra labai blogai, aš esu kvailas.',
//           ),
//           _paragraph(
//             'Racionalesnė mintis: Studentams taip nutinka, galėsiu pasimokyti ir atsiskaityti perlaikymo metu. '
//             'Egzamino neišlaikymas neatspindi mano visų gebėjimų.',
//             theme,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   // Helpers
//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//       ),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class SituacijuPratimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const SituacijuPratimasPage({super.key, this.onNext});

//   @override
//   State<SituacijuPratimasPage> createState() => _SituacijuPratimasPageState();
// }

// class _SituacijuPratimasPageState extends State<SituacijuPratimasPage> {
//   final List<TextEditingController> _controllers = List.generate(
//     4,
//     (_) => TextEditingController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Pratimas: Racionalesnės mintys situacijose'),
//           _paragraph(
//             'Paprašysiu dabar įsivaizduoti keletą situacijų ir sugalvoti tokių minčių, '
//             'kurios tavo manymu toj situacijoj, tam žmogui padėtų nurimti. '
//             'Tai nebūtinai turi būti panašios mintys, kurias aš rašiau, gali būti ir kitokio stiliaus.',
//             theme,
//           ),
//           const SizedBox(height: 16),

//           _situation(
//             '1. Įsivaizduok, kad 3 metų mergaitė netyčia numeta ir sudaužo vazelę, pradeda verkti. Ką jai pasakytum?',
//             _controllers[0],
//           ),
//           _situation(
//             '2. Įsivaizduok, kad kolega su tavimi nepasisveikino, pirma mintis – kad Tavęs nemėgsta. '
//             'Kokia būtų racionalesnė mintis?',
//             _controllers[1],
//           ),
//           _situation(
//             '3. Įsivaizduok, kad tavo draugas pirmą kartą laikė vairavimo egzaminą, bet nesėkmingai. '
//             'Jis sako, kad turbūt per vėlai pradėjo ir gal nebeverta stengtis, nes turbūt vis tiek neišlaikys. '
//             'Ką jam pasakytum?',
//             _controllers[2],
//           ),
//           _situation(
//             '4. Tavo draugė nerimauja, nes vakar gavo prastą atsiliepimą Pincete. Draugė sako, kad yra prasta specialistė, '
//             'o jei pamatys kolegos, tai galvos, kad ir visai nekompetentinga. Ką jai pasakytum?',
//             _controllers[3],
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Kitas'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _situation(String title, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 8),
//           TextField(
//             controller: controller,
//             decoration: const InputDecoration(
//               hintText: 'Įrašyk savo atsakymą čia...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: null,
//             keyboardType: TextInputType.multiline,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DraugiskosMintysPabaigaPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const DraugiskosMintysPabaigaPage({super.key, this.onNext});

//   @override
//   State<DraugiskosMintysPabaigaPage> createState() =>
//       _DraugiskosMintysPabaigaPageState();
// }

// class _DraugiskosMintysPabaigaPageState
//     extends State<DraugiskosMintysPabaigaPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Draugiškų minčių paieška'),
//           _paragraph(
//             'Tikiuosi, kad pavyko surasti draugiškų minčių. Jei jauti, kad dėl kažko itin stipriai '
//             'nerimauji ir vis grįžta mintys, gali pabandyti panašų pratimą pritaikyti ir sau. '
//             'Apsvarstyti, kokios racionalesnės mintys būtų naudingos ar ką Tau pasakytų draugas, '
//             'linkintis Tau gero.',
//             theme,
//           ),
//           const SizedBox(height: 8),
//           _paragraph(
//             'Tiek šį kartą, linkiu draugiškų minčių, susitiksime kitoje praktikoje!',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class MintysKaipDebesysPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MintysKaipDebesysPage({super.key, this.onNext});

//   @override
//   State<MintysKaipDebesysPage> createState() => _MintysKaipDebesysPageState();
// }

// class _MintysKaipDebesysPageState extends State<MintysKaipDebesysPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Mintys kaip debesys'),
//           _paragraph(
//             'Šiandien noriu parodyti Tau visai kitokį buvimo su mintimis būdą! '
//             'Šis būdas labiau skatina būti minčių stebėtoju ir smalsiai stebėti mintis, '
//             'nepaneriant stačia galva į minčių ir emocijų srautą.',
//             theme,
//           ),
//           _paragraph(
//             'Noriu paprašyti įsivaizduoti Tave neseniai kamavusią nemalonią mintį. '
//             'Tai gali būti bet kas – mintis apie darbą, šeimą, fizinę sveikatą ir pan. '
//             'Geriau pasirinkti ne pačią nemaloniausią mintį, o vidutiniškai nemalonią.',
//             theme,
//           ),
//           _paragraph(
//             'P.S. Jeigu minties nesugalvoji, daryk pratimą su viena iš mano siūlomų minčių:',
//             theme,
//           ),
//           _bullet('„Kaip nusišnekėjau per susitikimą, kokia gėda.”'),
//           _bullet('„Bijau, kad man nepavyks.”'),
//           _bullet('„Aš defektyvus.”'),
//           _paragraph(
//             'Dabar prašau prisimink savo sugalvotą nemalonią mintį. Pagalvok apie ją.',
//             theme,
//           ),
//           _paragraph(
//             'O dabar pabandyk įsivaizduoti savo mintis kaip debesis danguje. '
//             'Įsivaizduok, kad viena mintis pasirodo, praeina, ateina kita, '
//             'galbūt kažkuri užsilieka ilgiau, bet galiausiai debesys keičia vienas kitą…',
//             theme,
//           ),
//           _paragraph(
//             'Jei gali, užsimerk minutę ir įsivaizduok savo mintis kaip debesis, '
//             'o Tu – tarsi dangus, kuriame tie debesys keičia vienas kitą.',
//             theme,
//           ),
//           _paragraph('Kai atliksi šį pratimą – tęskime.', theme),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  '),
//           Expanded(child: Text(text, textAlign: TextAlign.justify)),
//         ],
//       ),
//     );
//   }
// }

// class SodoTyrinejimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const SodoTyrinejimasPage({super.key, this.onNext});

//   @override
//   State<SodoTyrinejimasPage> createState() => _SodoTyrinejimasPageState();
// }

// class _SodoTyrinejimasPageState extends State<SodoTyrinejimasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Smalsus sodo tyrinėjimas'),
//           _paragraph(
//             'O dabar įsivaizduokime sodą, kuriame – įvairios Tavo mintys, emocijos, kūno pojūčiai. '
//             'Įsivaizduokime, kad nueini į sodą ir smalsiai tyrinėji savo patirtis. '
//             'Tarsi nueitum į nepažįstamą sodą, kuriame auga įvairiausios gėlės, medžiai, daržovės, vaisiai – '
//             'ir smalsiai tyrinėtum, prieitum, apžiūrėtum, galbūt pauostytum, pačiupinėtum.',
//             theme,
//           ),
//           _paragraph(
//             'Gal gali akimirką pabandyti ir smalsiai patyrinėti dabartinę savo būseną.',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Kitas žingsnis (nenustatytas)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class MintiesPerformulavimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const MintiesPerformulavimasPage({super.key, this.onNext});

//   @override
//   State<MintiesPerformulavimasPage> createState() =>
//       _MintiesPerformulavimasPageState();
// }

// class _MintiesPerformulavimasPageState
//     extends State<MintiesPerformulavimasPage> {
//   final TextEditingController _thoughtCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _thoughtCtrl.dispose();
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
//           _subtitle('Trumpas pratimas: santykis su mintimi'),
//           _paragraph(
//             'Ir paskutinis trumpas pratimas. Pateiksiu tau pavyzdį, kokiu būdu dar galime elgtis su mintimis.',
//             theme,
//           ),
//           _paragraph('Pavyzdžiui, mintis – „Aš nepakankamas”.', theme),
//           _bullet('„Man kilo mintis, kad aš nepakankamas“.'),
//           _bullet('„Aš pastebiu, jog man kilo mintis, kad aš nepakankamas“.'),
//           const SizedBox(height: 12),

//           _subtitle('Pabandyk tu'),
//           _paragraph(
//             'Pabandyk savo nemalonią mintį pasakyti tokiu būdu:',
//             theme,
//           ),
//           _quote('Aš pastebiu, jog man kilo mintis, kad …', context),
//           const SizedBox(height: 8),

//           TextField(
//             controller: _thoughtCtrl,
//             decoration: const InputDecoration(
//               hintText:
//                   'Įrašyk čia savo sakinį „Aš pastebiu, jog man kilo mintis, kad…“',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: null,
//             keyboardType: TextInputType.multiline,
//           ),

//           const SizedBox(height: 16),
//           _paragraph(
//             'Ar sutiktum, kad atsiduriame šiek tiek kitokiame santykyje su savo mintimi?',
//             theme,
//           ),

//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             final text = _thoughtCtrl.text.trim();
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               SnackBar(content: Text(text.isEmpty ? 'Kitas žingsnis (nenustatytas)' : 'Išsaugota: $text')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   // Helpers
//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }

//   Widget _bullet(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  '),
//           Expanded(child: Text(text, textAlign: TextAlign.justify)),
//         ],
//       ),
//     );
//   }

//   Widget _quote(String text, BuildContext context) {
//     final scheme = Theme.of(context).colorScheme;
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(12),
//       margin: const EdgeInsets.only(bottom: 8),
//       decoration: BoxDecoration(
//         color: scheme.primaryContainer.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: scheme.primary.withOpacity(0.25)),
//       ),
//       child: Text(text, style: const TextStyle(fontStyle: FontStyle.italic)),
//     );
//   }
// }

// class SantykisSuMintimisApibendrinimasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const SantykisSuMintimisApibendrinimasPage({super.key, this.onNext});

//   @override
//   State<SantykisSuMintimisApibendrinimasPage> createState() =>
//       _SantykisSuMintimisApibendrinimasPageState();
// }

// class _SantykisSuMintimisApibendrinimasPageState
//     extends State<SantykisSuMintimisApibendrinimasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Apibendrinimas: santykis su mintimis'),
//           _paragraph(
//             'Visos šios technikos leidžia mums tarsi išlipti iš įprasto santykio su savo mintimis. '
//             'Tai jokiu būdu nereiškia, kad reikia vengti savo minčių! Minčių vengimas gali tik pabloginti mūsų savijautą. ',
//             theme,
//           ),
//           _paragraph(
//             'Šiuo pratimu norėjau Tau parodyti, kad galime turėti kitokį santykį su savo mintimis, '
//             'galime smalsiai stebėti savo mintis, pernelyg intensyviai į jas neįsitraukiant, '
//             'o kaip tik priimant kaip savo dalį, o tai gali padėti mums lengviau rinktis savo veiksmus '
//             'ir kurti gyvenimą kokio norime.',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Tęsti (nenustatyta navigacija)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class NerimastinguMinciuIvadasPage extends StatefulWidget {
//   final VoidCallback? onNext;

//   const NerimastinguMinciuIvadasPage({super.key, this.onNext});

//   @override
//   State<NerimastinguMinciuIvadasPage> createState() =>
//       _NerimastinguMinciuIvadasPageState();
// }

// class _NerimastinguMinciuIvadasPageState
//     extends State<NerimastinguMinciuIvadasPage> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _subtitle('Nerimastingos mintys'),
//           _paragraph(
//             'Noriu pasidalinti viena technika, ką galima daryti, jeigu nerimastingos mintys užsisuka kaip nesustabdoma plokštelė. '
//             'Vis sukasi ir sukasi, nors ir niekur nenuveda tik verčia jausti įtampą ir nerimą. '
//             'Ar Tau taip būna?',
//             theme,
//           ),
//           _paragraph(
//             'P.S. Net jeigu tokio minčių proceso nepastebėjai – vis tiek siūlau perskaityti, ką noriu papasakoti, gal kada pravers.',
//             theme,
//           ),
//           const SizedBox(height: 24),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: widget.onNext ??
//           //         () {
//           //           if (Navigator.canPop(context)) {
//           //             Navigator.pop(context);
//           //           } else {
//           //             ScaffoldMessenger.of(context).showSnackBar(
//           //               const SnackBar(content: Text('Tęsti (nenustatyta navigacija)')),
//           //             );
//           //           }
//           //         },
//           //     child: const Text('Tęsti'),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _subtitle(String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class NerimavimoTechnikaPage extends StatelessWidget {
//   final VoidCallback? onNext;

//   const NerimavimoTechnikaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nerimavimo technika'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _paragraph(
//               'Ši technika labiausiai tinka nerimastingoms mintims. O pratimas – paprastas. '
//               'Jeigu jauti, kad klimpsti į nerimastingas mintis ir nerandi sprendimo per 3 minutes – '
//               'stabtelk ir atidėk nerimą.',
//               theme,
//             ),
//             _paragraph(
//               'Gali užsirašyti nerimastingą mintį ir tuomet paskirk konkretų nerimavimo laiką. '
//               'Pavyzdžiui – nuo 18:00 iki 18:30. ',
//               theme,
//             ),
//             _paragraph(
//               'Užsistatyk žadintuvą ir atėjus laikui – nerimauk, nerimauk kiek tik gali! '
//               'Nuo 18:30 – vėl užsiimk kitais dalykais, ir, jei reikia – paskirk nerimavimo laiką kitą dieną. ',
//               theme,
//             ),
//             _paragraph(
//               'Jeigu iki nerimavimo laiko pasirodo nerimastingos mintys – gali pasakyti joms ačiū, '
//               'kad rūpinasi Tavimi ir rodo Tau pavojus, bet susitiksi su jomis nuo 18:00.',
//               theme,
//             ),
//             const SizedBox(height: 24),
//             // Center(
//             //   child: ElevatedButton(
//             //     onPressed: onNext ??
//             //         () {
//             //           if (Navigator.canPop(context)) {
//             //             Navigator.pop(context);
//             //           }
//             //         },
//             //     child: const Text('Tęsti'),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class NerimavimoTechnikaPage1 extends StatelessWidget {
//   final VoidCallback? onNext;

//   const NerimavimoTechnikaPage1({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nerimavimo technika'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _paragraph(
//               'Ši technika labiausiai tinka nerimastingoms mintims. O pratimas – paprastas. '
//               'Jeigu jauti, kad klimpsti į nerimastingas mintis ir nerandi sprendimo per 3 minutes – '
//               'stabtelk ir atidėk nerimą.',
//               theme,
//             ),
//             _paragraph(
//               'Gali užsirašyti nerimastingą mintį ir tuomet paskirk konkretų nerimavimo laiką. '
//               'Pavyzdžiui – nuo 18:00 iki 18:30. ',
//               theme,
//             ),
//             _paragraph(
//               'Užsistatyk žadintuvą ir atėjus laikui – nerimauk, nerimauk kiek tik gali! '
//               'Nuo 18:30 – vėl užsiimk kitais dalykais, ir, jei reikia – paskirk nerimavimo laiką kitą dieną. ',
//               theme,
//             ),
//             _paragraph(
//               'Jeigu iki nerimavimo laiko pasirodo nerimastingos mintys – gali pasakyti joms ačiū, '
//               'kad rūpinasi Tavimi ir rodo Tau pavojus, bet susitiksi su jomis nuo 18:00.',
//               theme,
//             ),
//             _paragraph(
//               'Paradoksalu, bet dažnai, atėjus nerimavimo laikui – nerimas jau būna sumažėjęs '
//               'ir tiek nerimauti nebesinori.',
//               theme,
//             ),
//             _paragraph(
//               'Jei susiduri su dažnu nerimavimu – labai rekomenduoju išbandyti šį pratimą, '
//               'žmonės dalinasi, kad jis padeda sumažinti nerimą!',
//               theme,
//             ),
//             const SizedBox(height: 24),
//             // Center(
//             //   child: ElevatedButton(
//             //     onPressed: onNext ??
//             //         () {
//             //           if (Navigator.canPop(context)) {
//             //             Navigator.pop(context);
//             //           }
//             //         },
//             //     child: const Text('Tęsti'),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _paragraph(String text, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
//     );
//   }
// }

// class NerimoPratimoPabaigaPage extends StatelessWidget {
//   final VoidCallback? onNext;

//   const NerimoPratimoPabaigaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pratimo pabaiga'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Šį kartą tiek. Labai kviečiu Tave pabandyti atlikti šį pratimą šiandien '
//               'arba rytoj, jei turėsi nerimastingų minčių! Iki kito susitikimo!',
//               style: theme.bodyLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green[800],
//               ),
//               textAlign: TextAlign.justify,
//             ),
//             const Spacer(),
//             // Center(
//             //   child: ElevatedButton(
//             //     onPressed: onNext ?? () => Navigator.pop(context),
//             //     style: ElevatedButton.styleFrom(
//             //       backgroundColor: Colors.green,
//             //     ),
//             //     child: const Text('Tęsti'),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NerimoTechnikosPastabaPage extends StatelessWidget {
//   final VoidCallback? onNext;

//   const NerimoTechnikosPastabaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pastaba apie techniką'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Paradoksalu, bet dažnai, atėjus nerimavimo laikui – nerimas jau būna sumažėjęs '
//               'ir tiek nerimauti nebesinori.\n\n'
//               'Jei susiduri su dažnu nerimavimu – labai rekomenduoju išbandyti šį pratimą, '
//               'žmonės dalinasi, kad jis padeda sumažinti nerimą!',
//               style: theme.bodyLarge,
//               textAlign: TextAlign.justify,
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext ?? () => Navigator.pop(context),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: const Text('Tęsti'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkirtingiAkiniaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SkirtingiAkiniaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ar sutiktum, kad kiekvienas žmogus pasaulį mato per šiek tiek kitokių spalvų akinius?',
//             style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
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

// class PasaulioAkiniaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PasaulioAkiniaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Galima sakyti, kad į pasaulį žvelgiame tarsi per akinius, '
//             'suformuotus kultūros, patirties, išsilavinimo, įsitikinimų, kitų žmonių... '
//             'Dauguma mūsų įsitikinimų apie save, kitus ir pasaulį susiformuoja ankstyvoje vaikystėje '
//             '(iki 5–7 metų), o vėliau ne retai esame linkę ieškoti to, kas juos patvirtina, '
//             'atmesdami priešingą informaciją. Taip įsitikinimai stiprėja, kartais iškraipydami '
//             'realybę, kad darosi sunku. Svarbu prisiminti – mūsų nuomonė nėra absoliuti tiesa, '
//             'nors dažnai taip ir atrodo.',
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

// class PilnaprotaujantisZiurejimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PilnaprotaujantisZiurejimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu atlikti trumpą praktiką, kurios metu tiesiog reikės stebėti aplinką, '
//             'būtų gerai, kad keletą minučių Tavęs netrigdytų kiti žmonės. '
//             'Pilnaprotaujančio žiūrėjimo praktika.',
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

// class AntrosSavaitesPabaigaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const AntrosSavaitesPabaigaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Sveikinu, įvykdei visas antros savaitės praktikas! '
//             'Lauksiu tavęs trečiosios savaitės praktikose, iki susitikimo!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             ElevatedButton(onPressed: onNext, child: const Text('Tęsti')),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

/// ==========================================================================
/// VIENODAS STILIUS VISIEMS PUSLAPIAMS (be global template; tik lokalūs helperiai)
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

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
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

/// ==========================================================================
/// PUSLAPIAI
/// ==========================================================================

class InterpretacijosPage extends StatefulWidget {
  final VoidCallback? onNext;
  const InterpretacijosPage({super.key, this.onNext});

  @override
  State<InterpretacijosPage> createState() => _InterpretacijosPageState();
}

class _InterpretacijosPageState extends State<InterpretacijosPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Jei pagalvosime – „Turbūt padariau kažką blogai”, galime pajausti stiprų nerimą, baimę, gėdą, liūdesį ar pyktį, '
        'gali pasikeisti kūno pojūčiai – pradėsime prakaituoti, rausti, gali net tapti sunku kvėpuoti, '
        'galime pradėti impulsyviau elgtis, daryti daugiau klaidų.',
      ),
      const _P(
        'Jei pagalvosime, kad mus nori apdovanoti – pasijausime visai kitaip. '
        'Kai kurie galbūt pagalvos – „Įdomu, ko vadovas iš manęs nori?” – ir sureaguos gan neutraliai.',
      ),
      const _H2('Skirtingos interpretacijos → skirtingos reakcijos'),
      const _Bullet(
        'Ne retai į tą pačią situaciją žmonės reaguoja skirtingais būdais – tai priklauso nuo mūsų interpretacijų.',
      ),
      const _H2('Būsena labai svarbi'),
      const _P(
        'Mūsų reakcijos stiprumui ne retai labai svarbią reikšmę turi mūsų būsena tuo metu.',
      ),
      const _Bullet('Neišsimiegoję'),
      const _Bullet('Nepavalgę'),
      const _Bullet('Neseniai susipykę su artimuoju ar kolega'),
      const _P('Tokiais atvejais reaguosime ūmiau ir negatyviau.'),
    ]);
  }
}

class KeitimoStrategijosPage extends StatefulWidget {
  final VoidCallback? onNext;
  const KeitimoStrategijosPage({super.key, this.onNext});

  @override
  State<KeitimoStrategijosPage> createState() => _KeitimoStrategijosPageState();
}

class _KeitimoStrategijosPageState extends State<KeitimoStrategijosPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Norėdami padėti sau sunkiose situacijose galime prisiminti šiuos 4 psichologinius '
        'komponentus ir kurį nors iš jų pakeisti. Keičiant vieną – keičiasi ir kiti.',
      ),
      const _H2('Pakeisti mintis'),
      const _P(
        'Galime bandyti pakeisti mintis – rasti racionalesnių, mus labiau raminančių:',
      ),
      const _Bullet('„Net, jeigu ir padariau kažką blogo, susitvarkysiu“.'),
      const _Bullet('„Žmogiška daryti klaidas“.'),
      const _Bullet('„Vadovas nebūtinai turi man nemalonių žinių“.'),
      const _H2('Pakeisti kūno pojūčius ar emocijas'),
      const _P(
        'Pvz., pradėti daryti atsispaudimus tol, kol pavargsime – fizinis krūvis sumažins nerimą '
        'ir pasijausime ramiau.',
      ),
      const _H2('Pakeisti elgesį'),
      const _P(
        'Galime keisti savo elgesį – nueiti pasikalbėti su vadovu kuo anksčiau ir taip sutrumpinti nerimavimo laiką.',
      ),
      const _H2('Ilgalaikė būsena'),
      const _P(
        'Galime stengtis, kad ilgainiui mūsų kasdienė būsena būtų vis stabilesnė – skirti dėmesio savo '
        'biologinėms ir psichologinėms būsenoms, formuoti kasdienius pasirūpinimo savimi įpročius. '
        'Pavyzdžiui, kasdien sportuoti ir taip padidinti savo atsparumą nerimą keliančiose situacijose.',
      ),
      const _H1('Esminė idėja'),
      const _P(
        'Iš esmės, svarbu keisti savo elgesį, įpročius, tuos keturis komponentus, jei norime jaustis geriau. '
        'Bet tam, kad galėtume kitaip pasielgti, suformuoti naujus įpročius, pradžioje mums reikia išmokti '
        'pastebėti savo mintis ir neleisti joms automatiškai apspręsti mūsų elgesio. Taip atsiras daugiau '
        'pasirinkimų, kokį gyvenimą norime kurti ir gyventi. Tai leis formuoti savo elgesį pagal tai, kokių '
        'pasekmių norime – tiek sąmoningiau rinktis elgesį, tiek pasekmes.',
      ),
    ]);
  }
}

class BraskePratimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const BraskePratimasPage({super.key, this.onNext});

  @override
  State<BraskePratimasPage> createState() => _BraskePratimasPageState();
}

class _BraskePratimasPageState extends State<BraskePratimasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Trumpas pratimas'),
      const _P('Pabaigai noriu paprašyti atlikti labai trumpą pratimą.'),
      const _P(
        'Prašau – negalvok apie ką tik sode nuskintas saldžias, dideles braškes. '
        'Pabandyk užsimerkti ir keletą sekundžių negalvoti apie braškes.',
      ),
      const _H2('Apie ką galvojai?'),
      const _P(
        'Daugelis žmonių galvoja apie braškes ar bent jau šmėsteli toks vaizdinys.',
      ),
      const _P(
        'Tokios jau tos mūsų smegenys – pagal gaunamus stimulus iš aplinkos suformuoja '
        'ir pateikia greitai kylančias mintis, kurioms turime gan mažai kontrolės.',
      ),
      const _P('Daugiau apie mintis papasakosiu kitame mūsų susitikime!'),
    ]);
  }
}

class MindfulnessIlgaPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MindfulnessIlgaPage({super.key, this.onNext});

  @override
  State<MindfulnessIlgaPage> createState() => _MindfulnessIlgaPageState();
}

class _MindfulnessIlgaPageState extends State<MindfulnessIlgaPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Mindfulness praktika'),
      const _P(
        'Tai, ką ką tik darei – yra Mindfulness praktika. Apie ją dar papasakosiu vėliau, '
        'bet dabar noriu paklausti, ar pastebėjai, kad šios praktikos metu Tau kilo įvairių, '
        'tarsi automatinių minčių? Manau, kad nesuklysiu, jei pasakysiu, kad tavo dėmesys nebuvo tik ten, '
        'kur kvietė medituotojos balsas. Galbūt Tavo dėmesys nuklydo į dabartinius rūpesčius, galbūt pradėjo '
        'vertinti praktiką – „neįdomu”, „įdomu“, „nesąmonė“, o gal iš viso neatlikai praktikos, nes dar prieš '
        'įjungiant įrašą pagalvojai, kad nenori jos daryti. Gali būti, kad gan atidžiai buvai savo dėmesiu ten, kur '
        'sakoma, bet vis tiek karts nuo karto bent trumpam “dingdavai” iš praktikos.',
      ),
      const _H2('Minčių kontrolė – nelengva'),
      const _P(
        'Praeitą kartą prašiau tavęs negalvoti apie braškes, t.y. nukreipti savo dėmesį kur nors kitur, '
        'o šį kartą prašiau dėmesį nukreipti tik į kvėpavimą. Ar gali sutikti, kad net valingai ir sąmoningai '
        'stengiantis kontroliuoti mintis – tai nėra taip paprasta?',
      ),
      const _P(
        'Kaip manai, kiek apskritai minčių per dieną kyla žmogui? Na, tai labai sunku pasakyti, bet mokslininkai '
        'bando skaičiuoti mintis ir priskaičiuoja jų nuo kelių tūkstančių iki dešimčių tūkstančių per dieną. '
        'Manoma, kad dauguma minčių dienos eigoje yra pasikartojančios, kaip užsukta plokštelė.',
      ),
      const _H2('Santykis su mintimis'),
      const _P(
        'Turbūt sutiktum su manimi, kad sunkiai galime kontroliuoti savo mintis, bet galime su jomis turėti kitokį santykį, '
        'galime mokytis valdyti dėmesį ir labiau rinktis, kiek tarsi patikėti jomis, įsitraukti į jas, o kiek automatinės mintys '
        'kurs mūsų gyvenimą, o kiek mes būsime savo gyvenimo kūrėjai.',
      ),
      const _H2('Ką ugdo Mindfulness'),
      const _Bullet('Moko valdyti dėmesį.'),
      const _Bullet(
        'Moko išbūti su viskuo, kas kyla (tiek su maloniais, tiek su nemaloniais išgyvenimais).',
      ),
      const _P('Abu aspektai labai praverčia gyvenime.'),
      const _H2('Pozityvumo ir skausmo priėmimas'),
      const _P(
        'Svarbu yra tiek mokėti atsigręžti į šviesiąją gyvenimo pusę, sąmoningai kreipti dėmesį į pozityvius aspektus, '
        'tiek sąmoningai pasirinkti atsigręžti į skausmą ir su juo išbūti nekovojant, nes kova dažnai sukuria priešingą efektą – '
        'nemalonios mintys ir emocijos sustiprėja.',
      ),
      const _P(
        'Pavyzdžiui, yra mokslinių tyrimų, kurie rodo, kad žmonės, kurie išjaučia liūdesį greičiau intensyviau, leidžia sau verkti – '
        'greičiau “atsistoja ant kojų”, nei tie, kurie visaip bando išvengti liūdesio patyrimo.',
      ),
      const _P(
        'Manau, galime sutikti, kad skausmas yra neatsiejama žmogaus gyvenimo dalis, mes negalime išvengti rūpesčių, netekčių, ligų, '
        'tačiau, galime ieškoti būdų, kaip su skausmu būti lengviau.',
      ),
      const _H2('Viena iš mano mėgiamų citatų'),
      const _Quote(
        'Dieve, suteik man ramybės susitaikyti su tuo, ko negaliu pakeisti;\n'
        'drąsos keisti, ką galiu pakeisti,\n'
        'ir išminties tą skirtumą suprasti.',
      ),
    ]);
  }
}

class MindfulnessApibendrinimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MindfulnessApibendrinimasPage({super.key, this.onNext});

  @override
  State<MindfulnessApibendrinimasPage> createState() =>
      _MindfulnessApibendrinimasPageState();
}

class _MindfulnessApibendrinimasPageState
    extends State<MindfulnessApibendrinimasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Grįžkime prie Mindfulness'),
      const _P(
        'Yra daugybė tyrimų, kurie rodo, kad Mindfulness praktikavimas gali padėti '
        'sumažinti stresą, depresiją, nerimą, skausmą ir apskritai pagerinti gyvenimo gerovę.',
      ),
      const _H2('Mindfulness Sodo programoje'),
      const _P(
        'Sodo programoje karts nuo karto pakviesiu tave panašioms praktikoms, '
        'svarbu, jog žinotum – kad tam nereikia ypatingo pasiruošimo. '
        'Mindfulness galima atlikti ir triukšmingoje aplinkoje, svarbu, kad tuo metu '
        'turėtum galimybę stabtelti – prisėsti, ramiai pastovėti ar atsigulti.',
      ),
      const _H2('Ne visuomet maloni patirtis'),
      const _P(
        'Taip pat svarbu, jog žinotum, kad Mindfulness praktikavimas nebūtinai turi sukelti '
        'malonius pojūčius ar ramybę. Ne retai, ypač atliekant Mindfulness pirmus kartus – '
        'tai gali būti ir nemaloni patirtis. Smegenys mokosi naujo buvimo būdo.',
      ),
      const _H2('Kaip sodo priežiūra'),
      const _P(
        'Kaip ir sodo priežiūra – ne visuomet tik lengva ar maloni – bet gi smagu pasimėgauti vaisiais. '
        'Tad, jeigu patirsi nemalonių patyrimų meditacijų ar kitų praktikų metu – kviečiu neišsigąsti, '
        'o išbūti su tuo ir tiesiog keliauti toliau.',
      ),
    ]);
  }
}

class SportoBakterijosPage extends StatefulWidget {
  final VoidCallback? onNext;
  const SportoBakterijosPage({super.key, this.onNext});

  @override
  State<SportoBakterijosPage> createState() => _SportoBakterijosPageState();
}

class _SportoBakterijosPageState extends State<SportoBakterijosPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Maža istorija apie įpročius (su šypsena)'),
      const _P(
        'Prieš ruošiant šią Sodo programą – išgirdau įdomią mintį, noriu pasidalinti ja su Tavimi. '
        'Siūlau ją priimti šiek tiek su humoru, bet galima ir rimtai. Kalba ėjo apie sportą.',
      ),
      const _P(
        'Turbūt gali sutikti, kad nesportuojantiems žmonėms pradėti reguliariai sportuoti yra sunku. '
        'Įdomu tai, kad po keletos mėnesių sporto, kūne galiausiai „prisidaugina“ „sportininkių“ bakterijų, '
        'kurios pradeda taip veikti žmogų – kad jam pasidaro žymiai lengviau prisiversti sportuoti. '
        'Tarsi sakytų – „Mums reikia sporto, kad išgyventumėm, padarysim taip, kad norėtum sportuoti ir toliau!“',
      ),
      const _H2('Įžanga į naujus įpročius'),
      const _P(
        'Tad… norint pakeisti įpročius, reikia padaryti įžangą, kol „prisigamins“ tam tikrų bakterijų, '
        'o po to jau jos dirbs už Tave! 😊 (galioja ir prastiems įpročiams, tad būk atidus, kurias bakterijas auginsi! 😊)',
      ),
      const _P('Kitą kartą papasakosiu daugiau apie mąstymo įpročius.'),
      const _P('Draugiškų minčių, iki susitikimo.'),
    ]);
  }
}

class MinciuZaidasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MinciuZaidasPage({super.key, this.onNext});

  @override
  State<MinciuZaidasPage> createState() => _MinciuZaidasPageState();
}

class _MinciuZaidasPageState extends State<MinciuZaidasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Mintys ir mąstymo procesai'),
      const _P(
        'Kaip turbūt jau supratai, šią savaitę daugiau dėmesio skirsime mintims bei mąstymo procesams. '
        'Noriu pakviesti tave pažaisti su mintimis. Prašau, neskubant perskaityk toliau parašytus sakinius:',
      ),
      const _Quote('Jonas ėjo savo įprastu keliu į mokyklą...'),
      const _Quote('Jis besijaudindamas galvojo apie matematikos pamoką...'),
      const _Quote('Jonas nebuvo tikras ar vėl suvaldys klasę šiandien...'),
      const _Quote(
        'Tačiau tai nebuvo jo kaip sargo ir durininko pagrindinė pareiga...',
      ),
    ]);
  }
}

class PrasmiuPriskyrimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const PrasmiuPriskyrimasPage({super.key, this.onNext});

  @override
  State<PrasmiuPriskyrimasPage> createState() => _PrasmiuPriskyrimasPageState();
}

class _PrasmiuPriskyrimasPageState extends State<PrasmiuPriskyrimasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Interpretacijos galia'),
      const _P(
        'Ar pastebėjai, kaip mūsų protas greitai ir automatiškai priskyrė prasmes, '
        'nors ir iš nedidelio kiekio informacijos?',
      ),
      const _P(
        'Ar sutinki, kad apskritai, dažniausiai mes negalime matyti situacijos ar fakto tiesiog kaip fakto – '
        'mes nuolat interpretuojame ir priskiriame prasmes. Ir emocinės mūsų reakcijos dažniausiai gimsta ne iš „nuogo fakto“, '
        'o iš to įvykio interpretacijos.',
      ),
      const _H2('Nuo ko priklauso interpretacijos?'),
      const _Bullet(
        'Nuo prasmės, kurią suteikiame įvykiui („geras“ ar „blogas“).',
      ),
      const _Bullet('Nuo ankstesnės patirties ir prisiminimų.'),
      const _Bullet('Nuo esamos būsenos (nuovargio, alkio, streso).'),
      const _Bullet('Nuo konteksto ir lūkesčių.'),
      const _P(
        'O mūsų interpretacijos priklauso ne tik nuo paties įvykio, tačiau ir nuo prasmės, kurią jam suteikiame, '
        'prieš tai buvusios patirties ir daugelio kitų dalykų…',
      ),
    ]);
  }
}

class BusenosPoveikisPage extends StatefulWidget {
  final VoidCallback? onNext;
  const BusenosPoveikisPage({super.key, this.onNext});

  @override
  State<BusenosPoveikisPage> createState() => _BusenosPoveikisPageState();
}

class _BusenosPoveikisPageState extends State<BusenosPoveikisPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Pavyzdžiai iš skirtingų būsenų'),
      const _P(
        'Pavyzdžiui, nuo mūsų būsenos. Kviečiu perskaityti dar kelias istorijas ir pareflektuoti:',
      ),
      const _H2('Situacija 1 – neigiama būsena'),
      const _P(
        'Įsivaizduok, kad darbe ar studijose tik ką susipykai su kolega. '
        'Jautiesi piktas, nusivylęs, pažemintas, nerimastingas... '
        'Lipdamas laiptais žemyn susitinki kitą kolegą, stabteli pasikalbėti, '
        'bet jis tik kažką burbteli po nosimi ir nueina tolyn.',
      ),
      const _P(
        'Dabar užsimerk ir minutę pabandyk įsivaizduoti situaciją (prašau, nepraleisk šio punkto ir paskirk minutę įsivaizdavimui).',
      ),
      const _P('Kokios mintys ateis Tau į galvą?'),
      const _H2('Situacija 2 – teigiama būsena'),
      const _P(
        'O dabar įsivaizduok, kad darbe ar studijose tik ką buvai viešai pagirtas už puikų darbą. '
        'Jautiesi įvertintas, linksmas, savimi pasitikintis... '
        'Lipdamas laiptais žemyn susitinki kolegą, stabteli pasikalbėti, '
        'bet jis tik kažką burbteli po nosimi ir nueina tolyn.',
      ),
      const _P(
        'Dabar užsimerk ir minutę pabandyk įsivaizduoti situaciją. (vėl prašau, nepraleisk ir paskirk akimirką įsivaizdavimui).',
      ),
      const _P('Kokios mintys ateis Tau į galvą?'),
      const _P(
        'Tai tik dar keli pavyzdžiai, leidžiantys giliau suvokti, '
        'kad mūsų nuotaikos ir emocijos dar prieš nutinkant situacijoms '
        'veikia mūsų interpretacijas ir mūsų pasaulio matymą.',
      ),
    ]);
  }
}

class VidinisSodasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const VidinisSodasPage({super.key, this.onNext});

  @override
  State<VidinisSodasPage> createState() => _VidinisSodasPageState();
}

class _VidinisSodasPageState extends State<VidinisSodasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Vidinio sodo puoselėjimas'),
      const _P(
        'Taigi, nuolatinis emocinių resursų atstatymas turi labai didelę reikšmę. '
        'Mažesnis šansas, kad kolegos ar paciento kritika mus ilgam išmuš iš vėžių, '
        'jeigu vis rūpinsimės savo vidiniu sodu.',
      ),
      const _P(
        'Kalbant metaforomis, kaip ir sodo laistymas, ravėjimas, tręšimas padeda užauginti norimus augalus, '
        'taip ir mūsų vidiniam sodui svarbus rūpestis ir puoselėjimas, kad būtume atsparesni liūtims, šalnoms, '
        'kaitrai, kenkėjams ir kitiems nemaloniems netikėtumams, kurie gali mus užklupti.',
      ),
      const _H2('Ko tikėtis Sodo programoje'),
      const _P(
        'Tikiuosi, kad Sodo programos metu rasi Tau tinkamų „trašų“, kurios tiks būtent Tavo vidinam sodui '
        'ir suteiks daugiau atsparumo bei klestėjimo.',
      ),
    ]);
  }
}

class MastymoKrastutinumaiPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MastymoKrastutinumaiPage({super.key, this.onNext});

  @override
  State<MastymoKrastutinumaiPage> createState() =>
      _MastymoKrastutinumaiPageState();
}

class _MastymoKrastutinumaiPageState extends State<MastymoKrastutinumaiPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Mąstymo kraštutinumai – įžanga'),
      const _P(
        'Noriu tave supažindinti su mąstymo kraštutinumais. Mums visiems būdinga greitai apibendrinti informaciją, '
        'kartais toks apibendrinimas gali sukelti papildomo nerimo. Žemiau rasi dažniausius mąstymo kraštutinumus ir jų pavyzdžius. '
        'Kviečiu Tave pabandyti atpažinti, ar kurie iš jų būdingi ir Tau. O gal tau nebūdingi mąstymo kraštutinumai?',
      ),
      const _H1('Perdėtas apibendrinimas'),
      const _P(
        'Daroma apibendrinta neigiama išvada, kuri gerokai neatitinka situacijos.',
      ),
      const _Bullet('Padariau klaidą, tai reiškia, kad esu nekompetentingas.'),
      const _Bullet('Gavau kritikos, tai reiškia, kad esu blogas darbuotojas.'),
      const _Bullet(
        'Neišlaikiau egzamino, tai yra labai blogai, aš esu kvailas.',
      ),
      const _H1('Ateities numatymas'),
      const _P(
        'Manoma, kad ateityje įvyks katastrofa ir nesvarstomi kiti, labiau tikėtini variantai.',
      ),
      const _Bullet(
        'Padariau klaidą, todėl gausiu blogą atsiliepimą arba skundą.',
      ),
      const _Bullet(
        'Nesurinkau visų reikalingų duomenų apie pacientą, jeigu jam kažkas nutiks, mane apkaltins.',
      ),
      const _Bullet('Ant manęs supyko artimasis – mūsų santykiai nutrūks.'),
      const _H1('Emocinis mąstymas'),
      const _P('Manoma, kad tiesa yra tai, kaip jaučiuosi.'),
      const _Bullet('Jaučiuosi nevykėlis, tai toks ir esu.'),
      const _Bullet('Jaučiuosi negražus, toks ir esu.'),
      const _Bullet('Jaučiuosi vienišas, tai nėra kam rūpiu.'),
      const _H1('Personalizavimas'),
      const _P(
        'Manoma, kad kitų neigiami poelgiai arba kitiems nutikusios neigiamos situacijos susiję su mumis, '
        'ir nesvarstomos kitos, labiau tikėtinos priežastys.',
      ),
      const _Bullet(
        'Jeigu pacientas numirė – aš nepakankamai gerai atlikau savo darbą.',
      ),
      const _Bullet('Jeigu pacientas pyksta – padariau kažką ne taip.'),
      const _Bullet(
        'Jeigu kolega su manimi nepasisveikino – aš jam nepatinku.',
      ),
      const _H1('Mąstymas kategorijomis: „privalau“, „turiu“'),
      const _P(
        'Susiję su nelanksčiu įsivaizdavimu, kaip pats žmogus ar kiti turi elgtis ir pervertinama, '
        'kaip yra blogai, kai šie įsivaizdavimai nepatvirtinami.',
      ),
      const _Bullet('Aš turiu žinoti atsakymą į kiekvieną paciento klausimą.'),
      const _Bullet('Turiu išlaikyti visus egzaminus.'),
      const _Bullet('Privalau nedaryti klaidų.'),
      const _Bullet(
        'Aš turiu palaikyti tinkamą darbo ir asmeninio gyvenimo balansą.',
      ),
    ]);
  }
}

class RacionalesnesMintysPage extends StatefulWidget {
  final VoidCallback? onNext;
  const RacionalesnesMintysPage({super.key, this.onNext});

  @override
  State<RacionalesnesMintysPage> createState() =>
      _RacionalesnesMintysPageState();
}

class _RacionalesnesMintysPageState extends State<RacionalesnesMintysPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Racionalesnių minčių pavyzdžiai'),
      const _P(
        'Dabar pateiksiu racionalesnių minčių pavyzdžių, gal gali pasvarstyti, kaip Tau jos skamba. '
        'Kokios mintys Tave nuramintų?',
      ),
      const _H1('1. Aš turiu žinoti atsakymą į kiekvieną paciento klausimą.'),
      const _P(
        'Racionalesnė mintis: Neprivalau žinoti visko, jeigu klausimas man pasirodys svarbus, '
        'galiu pacientui pasakyti, kad pasidomėsiu ir atsakysiu kito susitikimo metu.',
      ),
      const _H1('2. Padariau klaidą, tai reiškia, kad esu nekompetentingas.'),
      const _P(
        'Racionalesnė mintis: Klaidų darymas yra tiesiog žmogiško gyvenimo dalis, '
        'galiu stengtis jų daryti mažiau, bet nutikus – neplakti savęs.',
      ),
      const _H1(
        '3. Neišlaikiau egzamino, tai yra labai blogai, aš esu kvailas.',
      ),
      const _P(
        'Racionalesnė mintis: Studentams taip nutinka, galėsiu pasimokyti ir atsiskaityti perlaikymo metu. '
        'Egzamino neišlaikymas neatspindi mano visų gebėjimų.',
      ),
    ]);
  }
}

class SituacijuPratimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const SituacijuPratimasPage({super.key, this.onNext});

  @override
  State<SituacijuPratimasPage> createState() => _SituacijuPratimasPageState();
}

class _SituacijuPratimasPageState extends State<SituacijuPratimasPage> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Pratimas: Racionalesnės mintys situacijose'),
      const _P(
        'Paprašysiu dabar įsivaizduoti keletą situacijų ir sugalvoti tokių minčių, '
        'kurios tavo manymu toj situacijoj, tam žmogui padėtų nurimti. '
        'Tai nebūtinai turi būti panašios mintys, kurias aš rašiau, gali būti ir kitokio stiliaus.',
      ),
      _situation(
        '1. Įsivaizduok, kad 3 metų mergaitė netyčia numeta ir sudaužo vazelę, pradeda verkti. Ką jai pasakytum?',
        _controllers[0],
      ),
      _situation(
        '2. Įsivaizduok, kad kolega su tavimi nepasisveikino, pirma mintis – kad Tavęs nemėgsta. '
        'Kokia būtų racionalesnė mintis?',
        _controllers[1],
      ),
      _situation(
        '3. Įsivaizduok, kad tavo draugas pirmą kartą laikė vairavimo egzaminą, bet nesėkmingai. '
        'Jis sako, kad turbūt per vėlai pradėjo ir gal nebeverta stengtis, nes turbūt vis tiek neišlaikys. '
        'Ką jam pasakytum?',
        _controllers[2],
      ),
      _situation(
        '4. Tavo draugė nerimauja, nes vakar gavo prastą atsiliepimą Pincete. Draugė sako, kad yra prasta specialistė, '
        'o jei pamatys kolegos, tai galvos, kad ir visai nekompetentinga. Ką jai pasakytum?',
        _controllers[3],
      ),
    ]);
  }

  Widget _situation(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Įrašyk savo atsakymą čia...',
            border: OutlineInputBorder(),
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}

class DraugiskosMintysPabaigaPage extends StatefulWidget {
  final VoidCallback? onNext;
  const DraugiskosMintysPabaigaPage({super.key, this.onNext});

  @override
  State<DraugiskosMintysPabaigaPage> createState() =>
      _DraugiskosMintysPabaigaPageState();
}

class _DraugiskosMintysPabaigaPageState
    extends State<DraugiskosMintysPabaigaPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Draugiškų minčių paieška'),
      const _P(
        'Tikiuosi, kad pavyko surasti draugiškų minčių. Jei jauti, kad dėl kažko itin stipriai '
        'nerimauji ir vis grįžta mintys, gali pabandyti panašų pratimą pritaikyti ir sau. '
        'Apsvarstyti, kokios racionalesnės mintys būtų naudingos ar ką Tau pasakytų draugas, '
        'linkintis Tau gero.',
      ),
      const _P(
        'Tiek šį kartą, linkiu draugiškų minčių, susitiksime kitoje praktikoje!',
      ),
    ]);
  }
}

class MintysKaipDebesysPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MintysKaipDebesysPage({super.key, this.onNext});

  @override
  State<MintysKaipDebesysPage> createState() => _MintysKaipDebesysPageState();
}

class _MintysKaipDebesysPageState extends State<MintysKaipDebesysPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Mintys kaip debesys'),
      const _P(
        'Šiandien noriu parodyti Tau visai kitokį buvimo su mintimis būdą! '
        'Šis būdas labiau skatina būti minčių stebėtoju ir smalsiai stebėti mintis, '
        'nepaneriant stačia galva į minčių ir emocijų srautą.',
      ),
      const _P(
        'Noriu paprašyti įsivaizduoti Tave neseniai kamavusią nemalonią mintį. '
        'Tai gali būti bet kas – mintis apie darbą, šeimą, fizinę sveikatą ir pan. '
        'Geriau pasirinkti ne pačią nemaloniausią mintį, o vidutiniškai nemalonią.',
      ),
      const _P(
        'P.S. Jeigu minties nesugalvoji, daryk pratimą su viena iš mano siūlomų minčių:',
      ),
      const _Bullet('„Kaip nusišnekėjau per susitikimą, kokia gėda.”'),
      const _Bullet('„Bijau, kad man nepavyks.”'),
      const _Bullet('„Aš defektyvus.”'),
      const _P(
        'Dabar prašau prisimink savo sugalvotą nemalonią mintį. Pagalvok apie ją.',
      ),
      const _P(
        'O dabar pabandyk įsivaizduoti savo mintis kaip debesis danguje. '
        'Įsivaizduok, kad viena mintis pasirodo, praeina, ateina kita, '
        'galbūt kažkuri užsilieka ilgiau, bet galiausiai debesys keičia vienas kitą…',
      ),
      const _P(
        'Jei gali, užsimerk minutę ir įsivaizduok savo mintis kaip debesis, '
        'o Tu – tarsi dangus, kuriame tie debesys keičia vienas kitą.',
      ),
      const _P('Kai atliksi šį pratimą – tęskime.'),
    ]);
  }
}

class SodoTyrinejimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const SodoTyrinejimasPage({super.key, this.onNext});

  @override
  State<SodoTyrinejimasPage> createState() => _SodoTyrinejimasPageState();
}

class _SodoTyrinejimasPageState extends State<SodoTyrinejimasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Smalsus sodo tyrinėjimas'),
      const _P(
        'O dabar įsivaizduokime sodą, kuriame – įvairios Tavo mintys, emocijos, kūno pojūčiai. '
        'Įsivaizduokime, kad nueini į sodą ir smalsiai tyrinėji savo patirtis. '
        'Tarsi nueitum į nepažįstamą sodą, kuriame auga įvairiausios gėlės, medžiai, daržovės, vaisiai – '
        'ir smalsiai tyrinėtum, prieitum, apžiūrėtum, galbūt pauostytum, pačiupinėtum.',
      ),
      const _P(
        'Gal gali akimirką pabandyti ir smalsiai patyrinėti dabartinę savo būseną.',
      ),
    ]);
  }
}

class MintiesPerformulavimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MintiesPerformulavimasPage({super.key, this.onNext});

  @override
  State<MintiesPerformulavimasPage> createState() =>
      _MintiesPerformulavimasPageState();
}

class _MintiesPerformulavimasPageState
    extends State<MintiesPerformulavimasPage> {
  final TextEditingController _thoughtCtrl = TextEditingController();

  @override
  void dispose() {
    _thoughtCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Trumpas pratimas: santykis su mintimi'),
      const _P(
        'Ir paskutinis trumpas pratimas. Pateiksiu tau pavyzdį, kokiu būdu dar galime elgtis su mintimis.',
      ),
      const _P('Pavyzdžiui, mintis – „Aš nepakankamas”.'),
      const _Bullet('„Man kilo mintis, kad aš nepakankamas“.'),
      const _Bullet('„Aš pastebiu, jog man kilo mintis, kad aš nepakankamas“.'),
      const _H2('Pabandyk tu'),
      const _P('Pabandyk savo nemalonią mintį pasakyti tokiu būdu:'),
      const _Quote('Aš pastebiu, jog man kilo mintis, kad …'),
      TextField(
        controller: _thoughtCtrl,
        decoration: const InputDecoration(
          hintText:
              'Įrašyk čia savo sakinį „Aš pastebiu, jog man kilo mintis, kad…“',
          border: OutlineInputBorder(),
        ),
        maxLines: null,
        keyboardType: TextInputType.multiline,
      ),
      const _P(
        'Ar sutiktum, kad atsiduriame šiek tiek kitokiame santykyje su savo mintimi?',
      ),
    ]);
  }
}

class SantykisSuMintimisApibendrinimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const SantykisSuMintimisApibendrinimasPage({super.key, this.onNext});

  @override
  State<SantykisSuMintimisApibendrinimasPage> createState() =>
      _SantykisSuMintimisApibendrinimasPageState();
}

class _SantykisSuMintimisApibendrinimasPageState
    extends State<SantykisSuMintimisApibendrinimasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Apibendrinimas: santykis su mintimis'),
      const _P(
        'Visos šios technikos leidžia mums tarsi išlipti iš įprasto santykio su savo mintimis. '
        'Tai jokiu būdu nereiškia, kad reikia vengti savo minčių! Minčių vengimas gali tik pabloginti mūsų savijautą. ',
      ),
      const _P(
        'Šiuo pratimu norėjau Tau parodyti, kad galime turėti kitokį santykį su savo mintimis, '
        'galime smalsiai stebėti savo mintis, pernelyg intensyviai į jas neįsitraukiant, '
        'o kaip tik priimant kaip savo dalį, o tai gali padėti mums lengviau rinktis savo veiksmus '
        'ir kurti gyvenimą kokio norime.',
      ),
    ]);
  }
}

class NerimastinguMinciuIvadasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const NerimastinguMinciuIvadasPage({super.key, this.onNext});

  @override
  State<NerimastinguMinciuIvadasPage> createState() =>
      _NerimastinguMinciuIvadasPageState();
}

class _NerimastinguMinciuIvadasPageState
    extends State<NerimastinguMinciuIvadasPage> {
  @override
  Widget build(BuildContext context) {
    return _page([
      const _H2('Nerimastingos mintys'),
      const _P(
        'Noriu pasidalinti viena technika, ką galima daryti, jeigu nerimastingos mintys užsisuka kaip nesustabdoma plokštelė. '
        'Vis sukasi ir sukasi, nors ir niekur nenuveda tik verčia jausti įtampą ir nerimą. '
        'Ar Tau taip būna?',
      ),
      const _P(
        'P.S. Net jeigu tokio minčių proceso nepastebėjai – vis tiek siūlau perskaityti, ką noriu papasakoti, gal kada pravers.',
      ),
    ]);
  }
}

/// Pastabos: šie keturi puslapiai buvo su Scaffold/AppBar.
/// Vienodinimui paliekam tik turinį (be AppBar), kad gražiai įsilietų į PagedTaskScreen.

class NerimavimoTechnikaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NerimavimoTechnikaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H1('Nerimavimo technika'),
      const _P(
        'Ši technika labiausiai tinka nerimastingoms mintims. O pratimas – paprastas. '
        'Jeigu jauti, kad klimpsti į nerimastingas mintis ir nerandi sprendimo per 3 minutes – '
        'stabtelk ir atidėk nerimą.',
      ),
      const _P(
        'Gali užsirašyti nerimastingą mintį ir tuomet paskirk konkretų nerimavimo laiką. '
        'Pavyzdžiui – nuo 18:00 iki 18:30. ',
      ),
      const _P(
        'Užsistatyk žadintuvą ir atėjus laikui – nerimauk, nerimauk kiek tik gali! '
        'Nuo 18:30 – vėl užsiimk kitais dalykais, ir, jei reikia – paskirk nerimavimo laiką kitą dieną. ',
      ),
      const _P(
        'Jeigu iki nerimavimo laiko pasirodo nerimastingos mintys – gali pasakyti joms ačiū, '
        'kad rūpinasi Tavimi ir rodo Tau pavojus, bet susitiksi su jomis nuo 18:00.',
      ),
    ]);
  }
}

class NerimavimoTechnikaPage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const NerimavimoTechnikaPage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H1('Nerimavimo technika'),
      const _P(
        'Ši technika labiausiai tinka nerimastingoms mintims. O pratimas – paprastas. '
        'Jeigu jauti, kad klimpsti į nerimastingas mintis ir nerandi sprendimo per 3 minutes – '
        'stabtelk ir atidėk nerimą.',
      ),
      const _P(
        'Gali užsirašyti nerimastingą mintį ir tuomet paskirk konkretų nerimavimo laiką. '
        'Pavyzdžiui – nuo 18:00 iki 18:30. ',
      ),
      const _P(
        'Užsistatyk žadintuvą ir atėjus laikui – nerimauk, nerimauk kiek tik gali! '
        'Nuo 18:30 – vėl užsiimk kitais dalykais, ir, jei reikia – paskirk nerimavimo laiką kitą dieną. ',
      ),
      const _P(
        'Jeigu iki nerimavimo laiko pasirodo nerimastingos mintys – gali pasakyti joms ačiū, '
        'kad rūpinasi Tavimi ir rodo Tau pavojus, bet susitiksi su jomis nuo 18:00.',
      ),
      const _P(
        'Paradoksalu, bet dažnai, atėjus nerimavimo laikui – nerimas jau būna sumažėjęs '
        'ir tiek nerimauti nebesinori.',
      ),
      const _P(
        'Jei susiduri su dažnu nerimavimu – labai rekomenduoju išbandyti šį pratimą, '
        'žmonės dalinasi, kad jis padeda sumažinti nerimą!',
      ),
    ]);
  }
}

class NerimoPratimoPabaigaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NerimoPratimoPabaigaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      Text(
        'Šį kartą tiek. Labai kviečiu Tave pabandyti atlikti šį pratimą šiandien '
        'arba rytoj, jei turėsi nerimastingų minčių! Iki kito susitikimo!',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.green[800],
        ),
        textAlign: TextAlign.justify,
      ),
    ]);
  }
}

class NerimoTechnikosPastabaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NerimoTechnikosPastabaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _H1('Pastaba apie techniką'),
      const _P(
        'Paradoksalu, bet dažnai, atėjus nerimavimo laikui – nerimas jau būna sumažėjęs '
        'ir tiek nerimauti nebesinori.\n\n'
        'Jei susiduri su dažnu nerimavimu – labai rekomenduoju išbandyti šį pratimą, '
        'žmonės dalinasi, kad jis padeda sumažinti nerimą!',
      ),
    ]);
  }
}

class SkirtingiAkiniaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SkirtingiAkiniaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      Text(
        'Ar sutiktum, kad kiekvienas žmogus pasaulį mato per šiek tiek kitokių spalvų akinius?',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          height: 1.45,
        ),
        textAlign: TextAlign.justify,
      ),
    ]);
  }
}

class PasaulioAkiniaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PasaulioAkiniaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Galima sakyti, kad į pasaulį žvelgiame tarsi per akinius, '
        'suformuotus kultūros, patirties, išsilavinimo, įsitikinimų, kitų žmonių... '
        'Dauguma mūsų įsitikinimų apie save, kitus ir pasaulį susiformuoja ankstyvoje vaikystėje '
        '(iki 5–7 metų), o vėliau ne retai esame linkę ieškoti to, kas juos patvirtina, '
        'atmesdami priešingą informaciją. Taip įsitikinimai stiprėja, kartais iškraipydami '
        'realybę, kad darosi sunku. Svarbu prisiminti – mūsų nuomonė nėra absoliuti tiesa, '
        'nors dažnai taip ir atrodo.',
      ),
    ]);
  }
}

class PilnaprotaujantisZiurejimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PilnaprotaujantisZiurejimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kviečiu atlikti trumpą praktiką, kurios metu tiesiog reikės stebėti aplinką, '
        'būtų gerai, kad keletą minučių Tavęs netrigdytų kiti žmonės. '
        'Pilnaprotaujančio žiūrėjimo praktika.',
      ),
    ]);
  }
}

class AntrosSavaitesPabaigaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AntrosSavaitesPabaigaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      Text(
        'Sveikinu, įvykdei visas antros savaitės praktikas! '
        'Lauksiu tavęs trečiosios savaitės praktikose, iki susitikimo!',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.45),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}

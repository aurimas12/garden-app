// import 'package:flutter/material.dart';

// class ZydejimoPradziaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const ZydejimoPradziaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu pradėti žydėjimo savaitę nuo sėdėjimo meditacijos. '
//             'Kaip norint stebėti medžių ar gėlių žydėjimą – gali būti svarbu stabtelti, '
//             'taip ir dabar, kviesiu stabtelti ir pastebėti savo vidinio sodo žiedus - čia ir dabar. '
//             'Jei gali, rask vietą, kur galėtum atsisėsti ir kiti žmonės Tavęs netrukdytų.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SedejimoMeditacijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SedejimoMeditacijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Sėdėjimo meditacija',
//             style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SedejimoMeditacijaRefleksijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SedejimoMeditacijaRefleksijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ką pastebėjai praktikos metu?\n'
//             'Ar buvo momentų, kuomet dėmesys buvo kažkur kitur?\n'
//             'Ką jauti dabar?',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AciuUzRupestiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const AciuUzRupestiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ačiū, kad rūpiniesi savimi.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NurimimoIvadinePage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const NurimimoIvadinePage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mokėti kažkiek nurimti, gali būti labai geras įgūdis. '
//             'Kai nurimstame – lengviau pastebėti aplink mums prasiskleidusiu žiedus ir jais pasidžiaugti. '
//             'Toliau parašysiu 20 įvairių būdų, kaip galima nurimti ir sumažinti stresą.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NurimimoBudaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const NurimimoBudaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     final List<String> budai = [
//       'Paskirk 5 minutes ryte ramiam pabuvimui – gali medituoti, klausytis gamtos ar pasivaikščioti.',
//       'Sėdėdamas automobilyje ar transporte – kelias minutes stebėk kvėpavimą.',
//       'Pastebėk įtampą kūne ir sąmoningai atpalaiduok įsitempusias vietas.',
//       'Važiuodamas automobiliu – pabūk be radijo, stebėk mintis ir jausmus.',
//       'Greitkelyje važiuok 10 km/h lėčiau pirmąja juosta.',
//       'Prie raudono šviesoforo – atkreipk dėmesį į kvėpavimą ar aplinką.',
//       'Atvykęs į darbą – sąmoningai pereik į darbinį ritmą.',
//       'Sėdėdamas prie darbo stalo – leisk išnykti nereikalingai įtampai.',
//       'Per pertraukėles atsipalaiduok – pasivaikščiok ar pabūk su mintimis.',
//       'Valgant pietus – pakeisk aplinką.',
//       'Pietų metu atokioje vietoje – skirk laiko ramybei.',
//       'Kiekvieną valandą skirk 1–3 min. sąmoningam stabtelėjimui.',
//       'Maloniai pasikalbėk su kolegomis ne tik apie darbą.',
//       'Vieną kartą per savaitę pietauk tyloje, dėmesingai valgydamas.',
//       'Dienos pabaigoje pasidžiauk nuveiktais darbais ir susidaryk rytdienos planą.',
//       'Po darbo eidamas iki transporto – pastebėk orą, garsus, kūno pojūčius.',
//       'Automobilyje ar transporte po darbo – persiorientuok į namų ritmą.',
//       'Vairuodamas – pastebėk ar skubi ir kaip tai jaučiasi.',
//       'Prie namų – sąmoningai pereik į namų būseną.',
//       'Grįžęs persirenk, pasisveikink su namiškiais ar pabūk su savimi, jei gyveni vienas.',
//     ];

//     Widget bullet(String text) => Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('• ', style: TextStyle(fontSize: 20, height: 1.4)),
//           Expanded(
//             child: Text(
//               text,
//               style: theme.bodyLarge,
//               textAlign: TextAlign.justify,
//             ),
//           ),
//         ],
//       ),
//     );

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...budai.map(bullet),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class NurimimoRefleksijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const NurimimoRefleksijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kokios mintys kilo? Ar radai bent vieną būdą, '
//             'kuris tau atrodo vertas dėmesio ir pabandytum jį pritaikyti savo kasdienėje rutinoje?',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//           if (onNext != null)
//             Center(
//               child: ElevatedButton(
//                 onPressed: onNext,
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: const Text('Tęsti'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class KvieciuIsbandytiNurimimoBudaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const KvieciuIsbandytiNurimimoBudaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu jau šiandien išbandyti bent vieną iš 20 būdų sumažinti stresą!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class DarymoIrBuvimoIvadasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const DarymoIrBuvimoIvadasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šiandien noriu atkreipti dėmesį į du režimus: darymo ir buvimo. '
//             'Kviečiu iš karto ir susipažinti, ką turiu mintyje.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PedosPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PedosPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Pėdos', style: theme.bodyLarge, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class PeduRefleksijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PeduRefleksijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ką pastebėjai galvodamas apie pėdas?\n'
//             'Ką pastebėjai tiesiogiai įsijausdamas į pojūčius pėdose / įsisąmonindamas pėdas?\n\n'
//             'Santykis su pasauliu darymo režime:\n'
//             'Galvojimas apie ir atmintis/prisiminimai yra darymo režimo ypatumai. '
//             'Atstumas iki realybės čia ir dabar gali būti didelis.\n\n'
//             'Santykis su pasauliu buvimo režime:\n'
//             'Tiesioginis įsijautimas pašalina iškraipymus, kuriuos daro protas. '
//             'Jį naudodami esame pačioje patirtyje, čia ir dabar.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class GyvenimoZiedeliaiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const GyvenimoZiedeliaiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu patirti, pauostyti, ragauti, matyti gyvenimo žiedelius, '
//             'ne tik mąstyti apie juos 😊',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class BuvimoRezimuiPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const BuvimoRezimuiPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Noriu dar šiek tiek laiko skirti buvimo režimui, '
//             'pakviesti ir kasdienybėje atsigrežti į patirtis, '
//             'patirti realybę visais savo pojūčiais, ne tik mintimis.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class IzeminimoPratimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const IzeminimoPratimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu stabtelti ir atlikti pratimą, kuris puikiai įžemina:\n\n'
//             '• Surask savo aplinkoj 5 žalius daiktus.\n'
//             '• Paliesk 4 skirtingus paviršius, pajausk juos lėtai liečiant.\n'
//             '• Išgirsk 3 skirtingus garsus.\n'
//             '• Pauostyk 2 daiktus (tai gali būti ir tavo ranka!) – ką užuodi?\n'
//             '• (šis nebūtinas) Palaižyk vieną daiktą ir pajausk jo skonį.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class KasdienesPauzesPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const KasdienesPauzesPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu kasdien padaryti tokių pauzių, kur pastebėtum, kokia tavo kėdės, '
//             'ant kurios sėdi, spalva, kokia tekstūra. Kokių žmonių veidai tave dažniausiai supa. '
//             'Koks kvapas, kai eini gatve iš namų. Kokių augalų spalvų pastebi. '
//             'Ar valgant jauti maisto skonį, tekstūrą, ar tikrai būtent tą maistą nori dėti į save?\n\n'
//             'Kiek dalykų galima smalsiai tyrinėti 😊',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class JutimuTyrinejimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const JutimuTyrinejimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu pasmalsauti pasaulį šiandien savo jutimais – '
//             'patyrinėti pasaulį liečiant, žiūrint, uostant, girdint!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmasIvadasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmasIvadasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Noriu šiek tiek laiko skirti perfekcionizmui. '
//             'Kaip Tu manai, ar esi perfekcionistas, o galbūt tik kai kuriose srityse '
//             'tau itin svarbus tobulumas? Na, perfekcionizmas gali būti ir draugas, '
//             'ypač medicinos srityje, jeigu jis funkcionalus, t.y. jeigu žmogus geba '
//             'siekti aukštų standartų, bet neįkrenta į savęs kaltinimą, gėdinimą, '
//             'nerimą ar depresiškumą, jeigu tai nekiša kojos santykiams ir panašiai.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmasPratimasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmasPratimasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu atlikti pratimą, gali sugalvoti savo klausimą, kurį norėtum spręsti ir '
//             'kuris susijęs su perfekcionizmu.\n\n'
//             'Šį pratimą gali naudoti nebūtinai klausimui, susijusiam su perfekcionizmu, '
//             'bet tiesiog, jeigu abejoji, ką rinktis, arba jeigu nerimauji jis irgi gali padėti.\n\n'
//             'Jeigu nemanai, kad šis pratimas Tau neaktualus, tai gali tiesiog spausti ir keliauti tolyn.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmasKlausimuPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmasKlausimuPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Sugalvojus klausimą, įrašyk, kas nutiktų, jeigu elgtumeisi vienu ar kitu būdu.\n\n'
//             'Pavyzdžiui: jeigu dirbčiau mažiau; persikraustyčiau; pakeisčiau darbą; '
//             'mažiau tvarkyčiausi; padaryčiau klaidą ar kt.:\n\n'
//             '• Kas nutiktų DABAR BLOGO?\n'
//             '• Kas nutiktų DABAR GERO?\n'
//             '• Kas nutiktų BLOGO VĖLIAU (po 1, 5, 10 metų)?\n'
//             '• Kas nutiktų GERO VĖLIAU (po 1, 5, 10 metų)?',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmasIsvadosPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmasIsvadosPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tikiuosi kilo naudingų įžvalgų, linkėjimai!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmoTaisyklesIntroPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmoTaisyklesIntroPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šiandien noriu supažindinti tave su 2 taisyklėmis, '
//             'kurios yra vaistas nuo perfekcionistinės įtampos.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmoTaisykleVienasPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmoTaisykleVienasPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '1. Taisyklė – klysti žmogiška, būti netobulam – žmogiška.\n\n'
//             'Deja, bet kad ir kaip stengtumėmės, mes būsime netobuli. '
//             'Tiesiog, kitaip neįmanoma.\n\n'
//             'Kai kam pavyksta klaidas matyti labiau kaip pamokas ir natūralią žmogaus dalį, '
//             'bet daugumai – gan sunku priimti savo, kitų, gyvenimo netobulumą, ypač, kas susiję '
//             'su sveikata, santykiais ar kitais itin svarbiais gyvenimo aspektais.\n\n'
//             'Tad, jei padarome klaidą – tiesiog įsidėkime ją į tą neišvengiamą klaidų krepšelį, '
//             'kurį visi mes nešiojamės ir keliaukime toliau.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PerfekcionizmoTaisykleDuPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const PerfekcionizmoTaisykleDuPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '2. Taisyklė – kas padaryta – užbaigta.\n\n'
//             'Jeigu norime jausti kasdienybėje mažiau įtampos dėl neužbaigtų darbų, '
//             'verta mokytis patirti užbaigtumą, kad ir kiek to darbo buvo padaryta '
//             'ar kiek darbų belauktų.\n\n'
//             'Kartais gali padėti įsivardinimas procentais – „užbaigiau sutvarkyti 80 % kortelių ir tai yra baigta“.\n\n'
//             'Gali padėti didesnio darbo suskaidymas užduotimis ir jų įsivardinimas – '
//             '„sutvarkiau vonią ir išploviau grindis“.\n\n'
//             'Gali padėti tiesiog įsivardinti, kad „šios dienos darbus pabaigiau“ '
//             'ir susirašyti kitos dienos laukiančias užduotis.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class UzbaigimasSiandienPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const UzbaigimasSiandienPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šiandien užbaigta, iki susitikimo rytoj.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),

//         ],
//       ),
//     );
//   }
// }
// class KvietimasIAjautaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const KvietimasIAjautaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Šį kartą kviečiu atjautai, gerumui, meilei.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),

//         ],
//       ),
//     );
//   }
// }
// class MylincioGerumoMeditacijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const MylincioGerumoMeditacijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mylinčio gerumo meditacija',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),

//         ],
//       ),
//     );
//   }
// }
// class MylincioGerumoRefleksijaPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const MylincioGerumoRefleksijaPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Kviečiu skirti minutę ir pareflektuoti, ką patyrei praktikos metu.',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),

//         ],
//       ),
//     );
//   }
// }
// class SveikinimasDarVienosSavaitesPage extends StatelessWidget {
//   final VoidCallback? onNext;
//   const SveikinimasDarVienosSavaitesPage({super.key, this.onNext});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Sveikinu, dar vienos savaitės praktikas atlikai, '
//             'liko paskutinės dvi savaitės praktikų. '
//             'Tikiuosi, jose rasi naudingų patyrimų savo vidiniam Sodui!',
//             style: theme.bodyLarge,
//             textAlign: TextAlign.justify,
//           ),

//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Vienoje vietoje suvienodiname mygtukų (ir apskritai spalvų) dizainą.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = Colors.green;

    return MaterialApp(
      title: 'Sodas – Žydėjimo savaitė',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(140, 44),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: const HubPage(),
    );
  }
}

/// Patogus, vienodas „Tęsti“ mygtukas (rodosi tik jei perduotas onPressed).
class _NextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  const _NextButton(this.onPressed, {this.label = 'Tęsti', super.key});

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) return const SizedBox.shrink();
    return Center(
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}

/// Mažas „hub’as“ tik demonstracijai, kad galima pasispausti per puslapius.
class HubPage extends StatelessWidget {
  const HubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = <_Item>[
      _Item('Žydėjimo pradžia', (_) => const ZydejimoPradziaPage(onNext: null)),
      _Item('Sėdėjimo meditacija', (_) => const SedejimoMeditacijaPage()),
      _Item(
        'Sėdėjimo meditacijos refleksija',
        (_) => const SedejimoMeditacijaRefleksijaPage(),
      ),
      _Item('Ačiū už rūpestį', (_) => const AciuUzRupestiPage()),
      _Item('Nurimimo įvadinė', (_) => const NurimimoIvadinePage()),
      _Item('Nurimimo būdai (20)', (_) => const NurimimoBudaiPage()),
      _Item('Nurimimo refleksija', (_) => const NurimimoRefleksijaPage()),
      _Item(
        'Kvietimas išbandyti nurimimo būdą',
        (_) => const KvieciuIsbandytiNurimimoBudaPage(),
      ),
      _Item('Darymo ir buvimo įvadas', (_) => const DarymoIrBuvimoIvadasPage()),
      _Item('Pėdos (praktika)', (_) => const PedosPage()),
      _Item('Pėdų refleksija', (_) => const PeduRefleksijaPage()),
      _Item('Gyvenimo žiedeliai', (_) => const GyvenimoZiedeliaiPage()),
      _Item('Buvimo režimas', (_) => const BuvimoRezimuiPage()),
      _Item(
        'Įžeminimo pratimas 5-4-3-2-1',
        (_) => const IzeminimoPratimasPage(),
      ),
      _Item('Kasdienės pauzės', (_) => const KasdienesPauzesPage()),
      _Item('Jutimų tyrinėjimas', (_) => const JutimuTyrinejimasPage()),
      _Item(
        'Perfekcionizmas – įvadas',
        (_) => const PerfekcionizmasIvadasPage(),
      ),
      _Item(
        'Perfekcionizmas – pratimas',
        (_) => const PerfekcionizmasPratimasPage(),
      ),
      _Item(
        'Perfekcionizmas – klausimai',
        (_) => const PerfekcionizmasKlausimuPage(),
      ),
      _Item(
        'Perfekcionizmas – išvados',
        (_) => const PerfekcionizmasIsvadosPage(),
      ),
      _Item(
        'Perfekcionizmo taisyklės – įvadas',
        (_) => const PerfekcionizmoTaisyklesIntroPage(),
      ),
      _Item('Taisyklė #1', (_) => const PerfekcionizmoTaisykleVienasPage()),
      _Item('Taisyklė #2', (_) => const PerfekcionizmoTaisykleDuPage()),
      _Item('Užbaigimas šiandien', (_) => const UzbaigimasSiandienPage()),
      _Item('Kvietimas į atjautą', (_) => const KvietimasIAjautaPage()),
      _Item(
        'Mylinčio gerumo meditacija',
        (_) => const MylincioGerumoMeditacijaPage(),
      ),
      _Item(
        'Mylinčio gerumo refleksija',
        (_) => const MylincioGerumoRefleksijaPage(),
      ),
      _Item(
        'Sveikinimas – dar viena savaitė',
        (_) => const SveikinimasDarVienosSavaitesPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Žydėjimo savaitė (demo)')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pages.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final it = pages[i];
          return ListTile(
            title: Text(it.title),
            trailing: const Icon(Icons.chevron_right),
            onTap:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: it.builder)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          );
        },
      ),
    );
  }
}

class _Item {
  final String title;
  final WidgetBuilder builder;
  _Item(this.title, this.builder);
}

/// =======================================================
/// ===============  TAVO PUSLAPIAI (vienodi btn) =========
/// =======================================================

class ZydejimoPradziaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ZydejimoPradziaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu pradėti žydėjimo savaitę nuo sėdėjimo meditacijos. '
            'Kaip norint stebėti medžių ar gėlių žydėjimą – gali būti svarbu stabtelti, '
            'taip ir dabar, kviesiu stabtelti ir pastebėti savo vidinio sodo žiedus - čia ir dabar. '
            'Jei gali, rask vietą, kur galėtum atsisėsti ir kiti žmonės Tavęs netrukdytų.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class SedejimoMeditacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SedejimoMeditacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sėdėjimo meditacija',
            style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class SedejimoMeditacijaRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SedejimoMeditacijaRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką pastebėjai praktikos metu?\n'
            'Ar buvo momentų, kuomet dėmesys buvo kažkur kitur?\n'
            'Ką jauti dabar?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class AciuUzRupestiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AciuUzRupestiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ačiū, kad rūpiniesi savimi.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class NurimimoIvadinePage extends StatelessWidget {
  final VoidCallback? onNext;
  const NurimimoIvadinePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mokėti kažkiek nurimti, gali būti labai geras įgūdis. '
            'Kai nurimstame – lengviau pastebėti aplink mums prasiskleidusiu žiedus ir jais pasidžiaugti. '
            'Toliau parašysiu 20 įvairių būdų, kaip galima nurimti ir sumažinti stresą.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class NurimimoBudaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NurimimoBudaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final List<String> budai = [
      'Paskirk 5 minutes ryte ramiam pabuvimui – gali medituoti, klausytis gamtos ar pasivaikščioti.',
      'Sėdėdamas automobilyje ar transporte – kelias minutes stebėk kvėpavimą.',
      'Pastebėk įtampą kūne ir sąmoningai atpalaiduok įsitempusias vietas.',
      'Važiuodamas automobiliu – pabūk be radijo, stebėk mintis ir jausmus.',
      'Greitkelyje važiuok 10 km/h lėčiau pirmąja juosta.',
      'Prie raudono šviesoforo – atkreipk dėmesį į kvėpavimą ar aplinką.',
      'Atvykęs į darbą – sąmoningai pereik į darbinį ritmą.',
      'Sėdėdamas prie darbo stalo – leisk išnykti nereikalingai įtampai.',
      'Per pertraukėles atsipalaiduok – pasivaikščiok ar pabūk su mintimis.',
      'Valgant pietus – pakeisk aplinką.',
      'Pietų metu atokioje vietoje – skirk laiko ramybei.',
      'Kiekvieną valandą skirk 1–3 min. sąmoningam stabtelėjimui.',
      'Maloniai pasikalbėk su kolegomis ne tik apie darbą.',
      'Vieną kartą per savaitę pietauk tyloje, dėmesingai valgydamas.',
      'Dienos pabaigoje pasidžiauk nuveiktais darbais ir susidaryk rytdienos planą.',
      'Po darbo eidamas iki transporto – pastebėk orą, garsus, kūno pojūčius.',
      'Automobilyje ar transporte po darbo – persiorientuok į namų ritmą.',
      'Vairuodamas – pastebėk ar skubi ir kaip tai jaučiasi.',
      'Prie namų – sąmoningai pereik į namų būseną.',
      'Grįžęs persirenk, pasisveikink su namiškiais ar pabūk su savimi, jei gyveni vienas.',
    ];

    Widget bullet(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 20, height: 1.4)),
          Expanded(
            child: Text(
              text,
              style: theme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...budai.map(bullet),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class NurimimoRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NurimimoRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kokios mintys kilo? Ar radai bent vieną būdą, '
            'kuris tau atrodo vertas dėmesio ir pabandytum jį pritaikyti savo kasdienėje rutinoje?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class KvieciuIsbandytiNurimimoBudaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KvieciuIsbandytiNurimimoBudaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu jau šiandien išbandyti bent vieną iš 20 būdų sumažinti stresą!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class DarymoIrBuvimoIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DarymoIrBuvimoIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Šiandien noriu atkreipti dėmesį į du režimus: darymo ir buvimo. '
            'Kviečiu iš karto ir susipažinti, ką turiu mintyje.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PedosPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PedosPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pėdos', style: theme.bodyLarge, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PeduRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PeduRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką pastebėjai galvodamas apie pėdas?\n'
            'Ką pastebėjai tiesiogiai įsijausdamas į pojūčius pėdose / įsisąmonindamas pėdas?\n\n'
            'Santykis su pasauliu darymo režime:\n'
            'Galvojimas apie ir atmintis/prisiminimai yra darymo režimo ypatumai. '
            'Atstumas iki realybės čia ir dabar gali būti didelis.\n\n'
            'Santykis su pasauliu buvimo režime:\n'
            'Tiesioginis įsijautimas pašalina iškraipymus, kuriuos daro protas. '
            'Jį naudodami esame pačioje patirtyje, čia ir dabar.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class GyvenimoZiedeliaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const GyvenimoZiedeliaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu patirti, pauostyti, ragauti, matyti gyvenimo žiedelius, '
            'ne tik mąstyti apie juos 😊',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class BuvimoRezimuiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const BuvimoRezimuiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu dar šiek tiek laiko skirti buvimo režimui, '
            'pakviesti ir kasdienybėje atsigrežti į patirtis, '
            'patirti realybę visais savo pojūčiais, ne tik mintimis.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class IzeminimoPratimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const IzeminimoPratimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu stabtelti ir atlikti pratimą, kuris puikiai įžemina:\n\n'
            '• Surask savo aplinkoj 5 žalius daiktus.\n'
            '• Paliesk 4 skirtingus paviršius, pajausk juos lėtai liečiant.\n'
            '• Išgirsk 3 skirtingus garsus.\n'
            '• Pauostyk 2 daiktus (tai gali būti ir tavo ranka!) – ką užuodi?\n'
            '• (šis nebūtinas) Palaižyk vieną daiktą ir pajausk jo skonį.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class KasdienesPauzesPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KasdienesPauzesPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu kasdien padaryti tokių pauzių, kur pastebėtum, kokia tavo kėdės, '
            'ant kurios sėdi, spalva, kokia tekstūra. Kokių žmonių veidai tave dažniausiai supa. '
            'Koks kvapas, kai eini gatve iš namų. Kokių augalų spalvų pastebi. '
            'Ar valgant jauti maisto skonį, tekstūrą, ar tikrai būtent tą maistą nori dėti į save?\n\n'
            'Kiek dalykų galima smalsiai tyrinėti 😊',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class JutimuTyrinejimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const JutimuTyrinejimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu pasmalsauti pasaulį šiandien savo jutimais – '
            'patyrinėti pasaulį liečiant, žiūrint, uostant, girdint!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmasIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmasIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu šiek tiek laiko skirti perfekcionizmui. '
            'Kaip Tu manai, ar esi perfekcionistas, o galbūt tik kai kuriose srityse '
            'tau itin svarbus tobulumas? Na, perfekcionizmas gali būti ir draugas, '
            'ypač medicinos srityje, jeigu jis funkcionalus, t.y. jeigu žmogus geba '
            'siekti aukštų standartų, bet neįkrenta į savęs kaltinimą, gėdinimą, '
            'nerimą ar depresiškumą, jeigu tai nekiša kojos santykiams ir panašiai.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmasPratimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmasPratimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu atlikti pratimą, gali sugalvoti savo klausimą, kurį norėtum spręsti ir '
            'kuris susijęs su perfekcionizmu.\n\n'
            'Šį pratimą gali naudoti nebūtinai klausimui, susijusiam su perfekcionizmu, '
            'bet tiesiog, jeigu abejoji, ką rinktis, arba jeigu nerimauji jis irgi gali padėti.\n\n'
            'Jeigu nemanai, kad šis pratimas Tau neaktualus, tai gali tiesiog spausti ir keliauti tolyn.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmasKlausimuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmasKlausimuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sugalvojus klausimą, įrašyk, kas nutiktų, jeigu elgtumeisi vienu ar kitu būdu.\n\n'
            'Pavyzdžiui: jeigu dirbčiau mažiau; persikraustyčiau; pakeisčiau darbą; '
            'mažiau tvarkyčiausi; padaryčiau klaidą ar kt.:\n\n'
            '• Kas nutiktų DABAR BLOGO?\n'
            '• Kas nutiktų DABAR GERO?\n'
            '• Kas nutiktų BLOGO VĖLIAU (po 1, 5, 10 metų)?\n'
            '• Kas nutiktų GERO VĖLIAU (po 1, 5, 10 metų)?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmasIsvadosPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmasIsvadosPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tikiuosi kilo naudingų įžvalgų, linkėjimai!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmoTaisyklesIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmoTaisyklesIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Šiandien noriu supažindinti tave su 2 taisyklėmis, '
            'kurios yra vaistas nuo perfekcionistinės įtampos.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmoTaisykleVienasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmoTaisykleVienasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. Taisyklė – klysti žmogiška, būti netobulam – žmogiška.\n\n'
            'Deja, bet kad ir kaip stengtumėmės, mes būsime netobuli. '
            'Tiesiog, kitaip neįmanoma.\n\n'
            'Kai kam pavyksta klaidas matyti labiau kaip pamokas ir natūralią žmogaus dalį, '
            'bet daugumai – gan sunku priimti savo, kitų, gyvenimo netobulumą, ypač, kas susiję '
            'su sveikata, santykiais ar kitais itin svarbiais gyvenimo aspektais.\n\n'
            'Tad, jei padarome klaidą – tiesiog įsidėkime ją į tą neišvengiamą klaidų krepšelį, '
            'kurį visi mes nešiojamės ir keliaukime toliau.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class PerfekcionizmoTaisykleDuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PerfekcionizmoTaisykleDuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2. Taisyklė – kas padaryta – užbaigta.\n\n'
            'Jeigu norime jausti kasdienybėje mažiau įtampos dėl neužbaigtų darbų, '
            'verta mokytis patirti užbaigtumą, kad ir kiek to darbo buvo padaryta '
            'ar kiek darbų belauktų.\n\n'
            'Kartais gali padėti įsivardinimas procentais – „užbaigiau sutvarkyti 80 % kortelių ir tai yra baigta“.\n\n'
            'Gali padėti didesnio darbo suskaidymas užduotimis ir jų įsivardinimas – '
            '„sutvarkiau vonią ir išploviau grindis“.\n\n'
            'Gali padėti tiesiog įsivardinti, kad „šios dienos darbus pabaigiau“ '
            'ir susirašyti kitos dienos laukiančias užduotis.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class UzbaigimasSiandienPage extends StatelessWidget {
  final VoidCallback? onNext;
  const UzbaigimasSiandienPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Šiandien užbaigta, iki susitikimo rytoj.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class KvietimasIAjautaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KvietimasIAjautaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Šį kartą kviečiu atjautai, gerumui, meilei.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class MylincioGerumoMeditacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MylincioGerumoMeditacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mylinčio gerumo meditacija',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class MylincioGerumoRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MylincioGerumoRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu skirti minutę ir pareflektuoti, ką patyrei praktikos metu.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

class SveikinimasDarVienosSavaitesPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SveikinimasDarVienosSavaitesPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sveikinu, dar vienos savaitės praktikas atlikai, '
            'liko paskutinės dvi savaitės praktikų. '
            'Tikiuosi, jose rasi naudingų patyrimų savo vidiniam Sodui!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _NextButton(onNext),
        ],
      ),
    );
  }
}

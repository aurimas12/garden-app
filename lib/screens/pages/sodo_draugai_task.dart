import 'package:flutter/material.dart';

class SusipazinimasSuKukuciuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SusipazinimasSuKukuciuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Susipažinkime su sodo draugu – Kukučiu.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class KukucioGalybePage extends StatelessWidget {
  final VoidCallback? onNext;
  const KukucioGalybePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kukučio galybė  (Marcelijus Martinaitis)',
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Žiūri Kukutis –\n'
            'mato Kukutį.\n'
            'Klausos Kukutis –\n'
            'girdi Kukutį.\n'
            'Kalba Kukutis –\n'
            'ir supranta,\n'
            'kad kalba Kukutis.\n'
            'Sėdi ant suolo Kukutis\n'
            'ir jaučia,\n'
            'kad sėdi ant suolo Kukutis.\n'
            'Žingsniuoja Kukutis,\n'
            'ir žingsniavimas\n'
            'eina iš jo paties,\n'
            'ir matymas eina iš jo paties,\n'
            'ir galvojimas.\n'
            'Ir šitaip gyvena Kukutis\n'
            'ir žino,\n'
            'kad gyvena Kukutis,\n'
            'kad jis sau pačiam\n'
            'sveika yra.\n'
            'Ir supranta Kukutis:\n'
            'jis pilnas Kukučio.\n'
            'Ir jam gera.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class KukucioRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KukucioRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kokios mintys kilo skaitant šias eiles?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class VidinisSodoDraugasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VidinisSodoDraugasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ar sutiksi, kad pagrindinis Tavo vidinio Sodo draugas esi Tu pats?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class TesinysApieSodoDraugaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const TesinysApieSodoDraugaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tęsiant apie pagrindinį sodo draugą, t.y – Tave patį – kviečiu sekančiai praktikai, '
            'kurią rasi paspaudus – „Tęsti“. Dažnai ši praktika leidžia žmonėms įsižeminti ir '
            'pajausti vidinę stiprybę. Įdomu, kaip bus Tau.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class KalnoMeditacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KalnoMeditacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kalno meditacija',
            style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Ši meditacija kviečia Tave įsivaizduoti save kaip kalną – stabilų, tvirtą, nepajudinamą, '
            'nepaisant to, kas vyksta aplinkui. Tai praktika, kuri gali padėti sustiprinti vidinį '
            'ramybės jausmą ir įsižeminimą.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class KalnoMeditacijosRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KalnoMeditacijosRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką tu patyrei šios praktikos metu? Ar pavyko susitapatinti su kalnu?\n\n'
            'Galima sulyginti šį kalną ir su mūsų verte – aplinka keičiasi, žmogus gali keisti darbus, '
            'prarasti ar gauti pinigų, turėti ar neturėti antrą pusę – bet kalnas stovi, t.y. mūsų vertė '
            'yra nepajudinama, kol esame gyvi – tol vertingi savaime.\n\n'
            'O ar sutiktum, kad vienas kalnas yra tiek pat vertingas – kaip ir kitas? '
            'Kad lapė tiek pat vertinga, kiek stirna; kad Marsas – tiek pat, kiek Venera? '
            'Ar sutiktum, kad nėra vieno žmogaus vertingesnio už kitą? '
            'Kad mes nesame lygūs, bet visi esame tiek pat vertingi? '
            'Visi esame šio pasaulio, gamtos sutvėrimai, todėl tiek pat vertingi?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SiltiLinkejimaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SiltiLinkejimaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Šilti linkėjimai.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),

          // const Spacer(),
        ],
      ),
    );
  }
}

class KalbejimasSuSavimiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KalbejimasSuSavimiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mes, kaip žmonės, patiriame įvairių būsenų, kartais būname pikti, kartais linksmi, liūdni, '
            'piktdžiugiški, nerimastingi ir t.t. Kartais mes padedame sau savo mintimis, o kartais tik dar labiau '
            'skandiname save į kritikos, bejėgystės ar kitą būseną.\n\n'
            'Kaip tu dažniausiai kalbi su savimi? Ar esi sau geriausias draugas, geriausia mama, tėtis, partneris, psichoterapeutas?\n\n'
            'Ar kada pagalvojai, kad žmogus, su kuriuo praleidžiame daugiausiai laiko – esame mes patys? '
            'Turbūt tikrai maloniau nugyventi gyvenimą su geriausiu draugu, o ne baudžiančiais ar menkinančiais balsais.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class NuosirdusZodziaiSauPage extends StatefulWidget {
  final VoidCallback? onNext;
  const NuosirdusZodziaiSauPage({super.key, this.onNext});

  @override
  State<NuosirdusZodziaiSauPage> createState() =>
      _NuosirdusZodziaiSauPageState();
}

class _NuosirdusZodziaiSauPageState extends State<NuosirdusZodziaiSauPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu Tavęs paprašyti stabtelti minutę ir pasakyti sau nuoširdžių gražių žodžių – '
            'pagirti, apginti nuo kritikų, pasididžiuoti, palaikyti, nuraminti, prajuokinti. '
            'Kokie žodžiai šiuo metu Tau labiausiai reikalingi?\n\n'
            'Įrašyk juos čia:',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Įrašyk savo žodžius sau...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}

class BukimeSauDraugaisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const BukimeSauDraugaisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Būkime sau draugais.',
            style: theme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DraugiskuMinciuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DraugiskuMinciuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Draugiškų minčių!',
            style: theme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SodoDrauguIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SodoDrauguIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sodo draugų skiltis yra apie žmones, o labiausiai - apie svarbiausią - Tave, '
            'o taip pat ir apie kitus žmones, kurie supa Tave. Toliau daugiau kalbėsime kaip labiau tapti '
            'draugais ne tik su pačiu savimi, bet ir su kitais.\n\n'
            'Tad pirma noriu supažindinti Tave su trimis elgesio stiliais: pasyviu, asertyviu ir agresyviu. '
            'Kai skaitysi, kviečiu pareflektuoti, galbūt atpažinsi kažkur save, galbūt artimąjį ar kolegą. '
            'Dažnai mes naudojame visus tris stilius, manoma, kad asertyvus stilius gali atnešti mums daugiausia naudos '
            'ir dažniausiai, tai geriausias bendravimo variantas.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class ElgesioPalyginimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ElgesioPalyginimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasyvaus, asertyvaus ir agresyvaus elgesio palyginimas:',
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Lentelės antraštės
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Text(
                  'Pasyvus',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'Asertyvus',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'Agresyvus',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Žodinis elgesys
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Text(
                  'Vengi pasakyti, ko nori, ką galvoji arba jauti. Jeigu išsakai, tai darai nuvertindamas save. '
                  'Vartoji daug atsiprašymą reiškiančių žodžių. Dažnai dangstaisi neaiškiais žodeliais arba tyla.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(
                child: Text(
                  'Sakai, ko iš tiesų nori, ką jauti arba galvoji. Kalbi tiesiai ir efektyviai. '
                  'Bendrauji taktiškai ir su humoru. Kalbėdamas vartoji žodį „aš“.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(
                child: Text(
                  'Išsakai, ką jauti, galvoji ir ko nori, bet kitų sąskaita. '
                  'Vartoji stiprius žodžius, kaltini ir sieki būti viršesnis.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Nežodinis elgesys
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Text(
                  'Vietoje žodžių pasitelki veiksmus ir tikiesi, kad kiti atspės, ko nori. '
                  'Balsas silpnas, neužtikrintas, akys žvelgia žemyn. Atrodai susinepatoginęs, susikaustęs.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(
                child: Text(
                  'Klausaisi atidžiai, atrodai ramiai ir užtikrintai. Balsas tvirtas ir šiltas, '
                  'akis laikai tiesiai į pašnekovą, kūnas atsipalaidavęs.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(
                child: Text(
                  'Elgiesi taip, lyg būtum viršesnis. Balsas garsus, žvilgsnis žeminantis ar smingantis.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ElgesioStiliaiDetaliauPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ElgesioStiliaiDetaliauPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Toliau pateiksiu dar detalesnės informacijos apie kiekvieną stilių, '
            'kviečiu pasvarstyti, ar ši informacija galėtų būti Tau kažkuo naudinga.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          _TripleTable(
            title: 'Tikslai',
            left: 'Įtikti ir patikti',
            middle: 'Komunikuoti, būti gerbiamam',
            right: 'Dominuoti, pažeminti',
          ),

          _TripleTable(
            title: 'Jausmai',
            left:
                'Dažnai jauti nerimą, jautiesi ignoruojamas, įskaudintas, '
                'manipuliuojamas ir nusivylęs savimi. Vėliau dažnai būni piktas ir kerštingas.',
            middle:
                'Jautiesi pasitikintis savimi ir sėkmingas. Gerai jautiesi tiek bendravimo metu, tiek po to. '
                'Jautiesi, kad valdai situaciją, gerbi save, orientuojiesi į tikslus.',
            right:
                'Visada jautiesi teisus ir pranašesnis už kitus, esi linkęs kontroliuoti. '
                'Kartais vėliau jautiesi nepatogiai, manai esąs egoistas.',
          ),

          _TripleTable(
            title: 'Gaunamas rezultatas',
            left:
                'Išvengi nemalonių situacijų, konfliktų, trumpalaikės įtampos ir konfrontacijų. '
                'Netenka prisiimti atsakomybės už savo pasirinkimus.',
            middle:
                'Jautiesi gerai. Esi gerbiamas kitų. Tavo pasitikėjimas savimi stiprėja. '
                'Pats darai pasirinkimus. Tavo santykiai su kitais geri. Jauti mažai fizinio diskomforto '
                'bendravimo metu ar po to. Įsisąmonini savo jausmus.',
            right:
                'Atsikratai dalies pykčio jį išreikšdamas. Pasijunti valdąs situaciją ir esantis pranašesnis.',
          ),

          _TripleTable(
            title: 'Poveikis kitų jausmams',
            left:
                'Jie jaučiasi kalti, pranašesni, jaučia frustraciją ar net pyktį.',
            middle:
                'Jie jaučiasi gerbiami ir vertinami. Jie jaučia, kad gali išreikšti save.',
            right: 'Jie jaučiasi pažeminti, nuvertinti ar įžeisti.',
          ),

          _TripleTable(
            title: 'Jų jausmai Tavo atžvilgiu',
            left:
                'Jie jaučiasi suirzę. Jie gailisi Tavęs. Jie jaučia frustraciją ir praranda pagarbą Tau.',
            middle:
                'Paprastai jie Tave gerbia, pasitiki ir vertina. Jie žino, kokia Tavo pozicija.',
            right:
                'Jie jaučiasi įskaudinti, gynybiški, pažeminti ar pikti. Bijodami Tavęs, nepasitiki ir gali norėti kerštauti.',
          ),

          _TripleTable(
            title: 'Tikėtini kiekvieno elgesio stiliaus rezultatai',
            left:
                'Negauni to, ko nori. Jei ir gauni, pasieki netiesiogiai. Jautiesi emociškai nesąžiningas. '
                'Kiti įgyvendina savo tikslus Tavo sąskaita. Tavo teisės pažeidžiamos, todėl pyktis kaupiasi, '
                'ir tu arba jį užgniauži, arba išlieji ant kitų, silpnesnių, žmonių. Gali imti atidėlioti, '
                'pradėti tyliai kentėti, darbus daryti be entuziazmo, tapti užmaršus. '
                'Vienišumas ir izoliacija gali tapti Tavo gyvenimo dalimi.',
            middle:
                'Dažnai gauni, ko nori, jei tai realu. Dažnai pasieki savo tikslų ir nusipelni kitų pagarbos. '
                'Gerai jautiesi. Gerbi tiek savo, tiek kitų žmonių teises ir poreikius.',
            right:
                'Dažnai gauni, ko nori, bet kitų sąskaita. Žeidi kitus žmones darydamas už juos sprendimus ir taip juos menkindamas. '
                'Kiti jaučia norą „atsilyginti“ tau. Tau gali darytis vis sunkiau atsipalaiduoti.',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// Maža pagalbinė lentelė 3 stulpeliams (Pasyvus / Asertyvus / Agresyvus)
class _TripleTable extends StatelessWidget {
  final String title;
  final String left;
  final String middle;
  final String right;

  const _TripleTable({
    required this.title,
    required this.left,
    required this.middle,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Text(
          title,
          style: theme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFBFDCC3)),
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF7FBF7),
          ),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            border: const TableBorder(
              horizontalInside: BorderSide(color: Color(0xFFBFDCC3)),
              verticalInside: BorderSide(color: Color(0xFFBFDCC3)),
              // Išoriniai rėmai jau padaryti per Container.decoration
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Color(0xFFE6F3E8)),
                children: const [
                  _HeaderCell('Pasyvus'),
                  _HeaderCell('Asertyvus'),
                  _HeaderCell('Agresyvus'),
                ],
              ),
              TableRow(
                children: [
                  _BodyCell(left),
                  _BodyCell(middle),
                  _BodyCell(right),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        text,
        style: theme.labelLarge?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.green[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final String text;
  const _BodyCell(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify),
    );
  }
}

class ElgesioStiliaiApibendrinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ElgesioStiliaiApibendrinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu dar kelias minutes stabtelti ir apsvarstyti, '
            'ar yra, kur galėtum šią informaciją pritaikyti. '
            'Iki kito susitikimo!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PoreikiuIsakymoIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PoreikiuIsakymoIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu pasidalinti labai trumpa, bet kartu ir labai efektyvia technika '
            'apie poreikių išsakymą. Ši technika gali padėti gauti tai, ko nori '
            'žmogišku, nuoširdžiu būdu.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PoreikiuIsakymoTechnikaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PoreikiuIsakymoTechnikaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technika susideda iš trijų žingsnių:\n'
            '1. Įvardinimo, kaip jaučiuosi\n'
            '2. Įvardinimo, kas nepatiko kito elgesyje\n'
            '3. Prašymo\n\n'
            'Dar vienas papildomas dalykas, kuris svarbus taikant šią techniką, '
            'ypač, jeigu esame pikti – kažkiek nurimti, pakvėpuoti ir tik tada pradėti kalbėti, '
            'kad galėtume išlaikyti pagarbą sau ir kitam žmogui.\n\n'
            '1. Įvardinimas, kaip jaučiuosi:\n'
            'Aš suserzinau, supykau, pradėjau nerimauti, nuliūdau ir t.t.\n'
            'Bet ne – tu mane supykdei, tu mane verti nerimauti, tu mane liūdini.\n\n'
            '2. Įvardinimas, kas nepatiko kito elgesyje:\n'
            'Netvarkinga vonia; kai grįžęs nepasisveikinai ir neapkabinai; kai buvai darbe iki 20 val.; kai nepasveikinai manęs.\n'
            'Bet ne – tu netvarkingas, nesugebi mylėt, darboholikas, savanaudis.\n\n'
            '3. Prašymas:\n'
            'Prašau, nusausink paviršius, kai išsimaudai; prašau, kai grįžti iš darbo – apkabink mane; '
            'prašau, gal gali grįžti 19 val.?; prašau, gal gali kitą kartą užsirašyti priminimą, '
            'kad pasveikintum mane, o dabar nusivesti į restoraną?\n'
            'Bet ne – užsuksiu karštą vandenį, jei nemoki praustis; gal galėtum kada nors gyvenime apkabinti mane, '
            'kai grįžti iš darbo ar panašiai??; reikės ieškotis, kas sugeba grįžti anksčiau iš darbo; '
            'aš irgi tavęs nesveikinsiu, pažiūrėsiu, kaip jausies.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class NesmurtineKomunikacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const NesmurtineKomunikacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nesmurtinė komunikacija\n\n'
            'Pavyzdžiui: „Tu niekada neišsiplauni indų, koks tu netvarkingas, ir taip grįžtu iš darbo pavargęs, kiek galima, užknisai.”\n\n'
            'Šiame pavyzdyje galime matyti generalizavimą – „Tu niekada…” – toks teiginys dažniausiai nėra teisingas, '
            'taip pat jis tarsi apibūdina žmogų bei gali sukelti neteisybės jausmą ir kad nemato jo ir gerųjų pusių. '
            'GeriaU būtų sakyti – „Neišsiplovei indų” – toks teiginys yra faktas pažymintis elgesį.\n\n'
            '„…koks tu netvarkingas…” – vėl generalizavimas, tokiu teiginiu tik sukelsime kito žmogaus pyktį, norą priešintis, '
            'arba galiausiai tokį patį elgesį (jei ilgai vadinsi žmogų kiaule – jis galiausiai gali pradėti kriuksėti 😊). '
            'GeriaU nevadinti žmogaus negatyviais epitetais, o įvardinti konkretų elgesį – palikai nesutvarkytą kambarį/kriauklę/vonią ir t.t.\n\n'
            '„…užknisai.” – geriau būtų įvardinti jausmą, kurį jaučiame ir prisiimti už jį atsakomybę '
            '(nebūtinai visus žmones suerzins neišplauti indai, tai yra MŪSŲ reakcija). '
            'Galime sakyti – „aš supykau/susierzinau”.\n\n'
            '„...ir taip grįžtu iš darbo pavargęs...” – gali skambėti kaip kaltinimas. Taip tarsi sakome – tu kenki man, tu atsakingas už mano jausmus. '
            'GeriaU būtų tiesiog pasidalinti savo jausmu ir prašymu.\n\n'
            'Panaudojant techniką, poreikį galime išreikšti taip:\n'
            'Aš susierzinau (jausmo išsakymas), kai pamačiau kriauklėje neišplautus indus (konkretaus elgesio nusakymas), '
            'prašau, kai pavalgai – susitvarkyk (prašymas).',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PoreikiuIsakymoPriminimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PoreikiuIsakymoPriminimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aš džiaugiuosi, kai matau, kad tu skaitai apie poreikių išsakymo techniką, '
            'gal galėtum išbandyti ją šiandien su konkrečiu žmogumi? Ačiū Tau!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class KlausymosiIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KlausymosiIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu pakalbėti apie tai, o kaip bendrauti, kad su Tavimi būtų malonu, '
            'kad kiti norėtų su Tavimi susitikti, dalintis, būti draugais?\n\n'
            'Galime rinktis ir dovanoti kitiems aktyvų klausimąsį, atjautą, tyrinėjimą, ryšį, '
            'buvimą dabartyje su kitu, artumą. Gali būti, kad toks buvimas su kitu ir mums bus '
            'malonus, apdovanojantis, artimas, pilnas.\n\n'
            'Kaip klausytis, kad išgirsčiau? Toliau pateiksiu keletą atsakymų į šį klausimą.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class KasPadedaKlausytisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KasPadedaKlausytisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kas padeda?',
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _bulletPoint(
            theme,
            'Klausti. Vienas pagrindinių dalykų, ką galime padaryti, jog kitam būtų malonu – klausinėti žmogaus įvairiausių dalykų apie jį, tai, kas jam įdomu. '
            'Svarbu jausti ribas, kai kurie žmonės nemėgsta kalbėti apie asmeninius dalykus, o kitiems patinka atvirauti.',
          ),
          _bulletPoint(
            theme,
            'Parodyti, kad klausai. Karts nuo karto palinksėti galva, vartoti žodelius – hmm, taip, tęsk, įdomu, girdžiu tave, klausau tavęs.',
          ),
          _bulletPoint(
            theme,
            'Atspindėti, ką žmogus pasakė. Pavyzdžiui: „Sakai, kad tau patinka žaisti šachmatais”; „Kaip suprantu, dabar patiri sunkumų su finansais” ir pan.',
          ),
          _bulletPoint(
            theme,
            'Atspindėti žmogaus jausmus. Pavyzdžiui: „Kaip suprantu, jautiesi liūdnai”; „Girdžiu, kad pyksti” ir pan.',
          ),
          _bulletPoint(
            theme,
            'Priimti ir nevertinti. Pavyzdžiui: „Suprantama, kad tokioje situacijoje gali taip jaustis”; „Ačiū, kad daliniesi” ir pan.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _bulletPoint(TextTheme theme, String text) {
    return Padding(
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
  }
}

class KasNepadedaKlausytisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KasNepadedaKlausytisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kas nepadeda?',
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _bullet(
            theme,
            'Vertinti. „Tu per jautriai reaguoji į dalykus”; „man tai atrodo, kad…”; „aš tai daryčiau taip…”; '
            '„keisti tavo batai”; „kaip Vilma viską lėtai daro” ir pan.',
          ),
          _bullet(
            theme,
            'Kritikavimas. „Man tai nesąmonė”; „kodėl tu…”; „kvailokas sprendimas”; „kas tau negerai” ir pan.',
          ),
          _bullet(
            theme,
            'Bandymas keisti jausmus staigiai – itin juokauti, siūlyti greitus sprendimus ir pan.',
          ),
          _bullet(
            theme,
            'Savijautų lyginimas – „man tai dar blogiau, žinok” ir pan.',
          ),
          _bullet(theme, 'Kito žmogaus pertraukinėjimas.'),
          _bullet(theme, 'Skubėjimas, rodymas, kad neturi laiko.'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _bullet(TextTheme theme, String text) {
    return Padding(
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
  }
}

class LinkejimaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const LinkejimaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Linkėjimai!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class KonfliktuIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KonfliktuIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ši dalis bus skirta pakalbėti labiau apie konfliktus su pacientais ar klientais.\n\n'
            'Moksliniai tyrimai rodo, jog geresni bendravimo ir konfliktų sprendimų įgūdžiai siejami su geresne pačių medikų emocine savijauta, '
            'pacientų geresniu gydymo režimo laikymusi ir sveikata, mažesne tikimybe būti paduotu į teismą.\n\n'
            'Tad visomis prasmėmis šį įgūdį tikrai prasminga lavinti! '
            'Jau nemažai pakalbėjome apie bendravimą, šis kartas skirtas konkrečiai – konfliktų sprendimams.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class CalmModelPage extends StatelessWidget {
  final VoidCallback? onNext;
  const CalmModelPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pateiksiu trumpą schemą pagal CALM modelį, kas gali padėti, esant konfliktui.\n\n'
            'A. Rami laikysena; klaidų pripažinimas (jei buvo padaryta); pripažinimas, kad situacija sudėtinga; paaiškinimai.\n'
            'Jeigu tai nepadeda:\n'
            'B. Paciento emocijų supratimas ir įvardinimas; išlikimas ramiam – neįsitraukiant į savo stiprias emocijas ir nepradedant jomis vadovautis.\n'
            'Jeigu tai nepadeda:\n'
            'C. Patikslinti santykį ir roles; pasiūlyti planą.\n'
            'Jeigu tai nepadeda:\n'
            'D. Pasakyti savo sprendimą.\n\n'
            'Pavyzdys:\n\n'
            'Įsivaizduokime, kad gydytojas pamiršo išrašyti receptą ir nepatenkintas pacientas grįžta ir veržiasi į kabinetą, pradeda rėkti ir reikalauti, kuo greičiau išrašyti receptą. '
            'Gydytojo neranda, bet prasilenkia su slaugytoja.\n\n'
            'A. Rami laikysena; klaidų pripažinimas; situacijos pripažinimas; paaiškinimai\n'
            'Pacientas (rėkdamas): Kur gydytojas?! Vakar buvau, sakė išrašys receptą, bet nieko nėra! Man reikia vaistų DABAR! Čia kas per tvarka?!\n'
            'Slaugytoja (ramiai): Atleiskite, gydytojas jums vakar turėjo išrašyti receptą, nesu tikra, kas nutiko, kad recepto neišrašė, bet galėsiu jam perduoti, kai grįš iš susirinkimo, kad kuo greičiau išrašytų.\n\n'
            'B. Paciento emocijų supratimas ir įvardinimas; išlikimas ramiam – neįsitraukiant į savo stiprias emocijas ir nepradedant jomis vadovautis.\n'
            'Pacientas (dar pikčiau): Nemalonu?! Man reikia tų vaistų nuo vakar! Jūs čia visi atsiprašinėt mokat, bet kas iš to?!\n'
            'Slaugytoja: Matau, kad pykstate ir jūsų pyktis visiškai suprantamas.\n\n'
            'C. Rolių patikslinimas; pasiūlymas plano\n'
            'Pacientas (nenurimsta): Tai kaip man tą receptą gauti, kada jis bus e-sveikatoje??\n'
            'Slaugytoja: Aš jums recepto išrašyti negaliu. Galite jo pats palaukti, susirinkimas turėtų baigtis už 20 minučių arba galiu jam perduoti, kad reikalingas receptas, kas jums būtų labiau tinkama?\n\n'
            'D. Jeigu paciento reakcija nešvelnėja – priimamas sprendimas\n'
            'Pacientas: Nelauksiu dar pusvalandžio ir taip čia važinėjuos pirmyn-atgal!\n'
            'Slaugytoja (tvirtai, bet ramiai): Turiu eiti, perduosiu gydytojui jūsų prašymą, jeigu po valandos recepto nebus – skambinkite šiuo numeriu.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class SmaikstusPatarimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SmaikstusPatarimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prieš užbaigiant komunikavimo temą, noriu pridėti dar vieną šmaikštų patarimą.\n\n'
            'Jeigu jaučiate, kad darosi sunku išbūti paties emocijas ir tuoj sprogsite, gali įsivaizduoti kitą žmogų '
            '(vadovą, pacientą, artimąjį ar kitą) – juokingoje situacijoje ar formoje – pavyzdžiui, įsivaizduoti jį labai mažytį ir rėkaujantį ant jūsų, '
            'įsivaizduoti nuogą, tualete, krapštant nosį ir po to dedant snarglius į burną, su elfo ausytėm ir t.t.\n\n'
            'Kartais tai gali palengvinti jausmą 😊',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class ApkabinuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ApkabinuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apkabinu ir susitikime žydėti!',
            style: theme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

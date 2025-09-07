
import 'package:flutter/material.dart';

class VertybiuIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VertybiuIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu skirti laiko vertybėms. Vertybės gali būti tai, kas padės neprarasti prasmės, '
            'kelio, kai yra emociškai sunku. Vertybių neįmanoma pasiekti, bet jomis galima gyventi, '
            'eiti link jų vis.\n\n'
            'Įsisąmoninę, kad einame mums svarbių vertybių keliu – galime jausti džiaugsmą ir pilnatvę.\n\n'
            'Kai kurie sako, kad žmogus suauga tuomet, kai mažiau vadovaujasi emocijomis, o daugiau vertybėmis.\n'
            'Kiti sako, jog jeigu nori suprasti savo vertybes, pagalvok, ką darytum, net jeigu kiti to nematytų ar nepalaikytų – '
            'tai gali būti svarbiausios Tavo vertybės.\n\n'
            'Toliau pakviesiu pareflektuoti apie tai, kokios vertybės svarbios būtent Tau.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class VertybiuSarasasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VertybiuSarasasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final List<String> vertybes = [
      'Aistra',
      'Atjauta',
      'Atlaidumas',
      'Atsakomybė',
      'Atsparumas',
      'Atvirumas',
      'Augimas',
      'Auginimas',
      'Autentiškumas',
      'Bendradarbiavimas',
      'Darbštumas',
      'Darbas',
      'Darna',
      'Dėkingumas',
      'Dėmesingumas',
      'Didvyriškumas',
      'Dora',
      'Dosnumas',
      'Drąsa',
      'Draugiškumas',
      'Dvasingumas',
      'Garbė',
      'Grožis',
      'Griežtumas',
      'Gėris',
      'Gyvybė',
      'Humoras',
      'Intymumas',
      'Išmintis',
      'Ištikimybė',
      'Įvaizdis',
      'Įvairovė',
      'Jautrumas',
      'Kantrybė',
      'Kuklumas',
      'Kūrybiškumas',
      'Konkurencija',
      'Kontrolė',
      'Laimė',
      'Laisvė',
      'Lankstumas',
      'Lygybė',
      'Malonumas',
      'Mandagumas',
      'Materialumas',
      'Meilė',
      'Meistriškumas',
      'Menas',
      'Mokymas',
      'Mokymasis',
      'Narsumas',
      'Nepriklausomybė',
      'Nuotykiai',
      'Nuosaikumas',
      'Nuoširdumas',
      'Orumas',
      'Padorumas',
      'Pagalba silpnesniam',
      'Pagarba',
      'Paprastumas',
      'Pasiaukojimas',
      'Pasitikėjimas',
      'Patikimumas',
      'Patriotiškumas',
      'Priėmimas',
      'Pripažinimas',
      'Privatumas',
      'Ramybė',
      'Reputacija',
      'Rūpinimasis',
      'Ryžtas',
      'Saikas',
      'Santarvė',
      'Santykiai',
      'Saugumas',
      'Sąmoningumas',
      'Sąžiningumas',
      'Smalsumas',
      'Spontaniškumas',
      'Stabilumas',
      'Subtilumas',
      'Sveikata',
      'Šeima',
      'Šlovė',
      'Tikėjimas',
      'Taisyklės',
      'Teisingumas',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Žemiau rasi sąrašą įvairių vertybių, kviečiu įsivardinti iš sąrašo '
            '(nebūtinai, gali sugalvoti ir pats) tris pačias svarbiausias Tau vertybes.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          ...vertybes.map((v) => _bulletLine(v, theme)),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _bulletLine(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(height: 1.35)),
          Expanded(child: Text(text, style: theme.bodyMedium)),
        ],
      ),
    );
  }
}

class VertybiuRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VertybiuRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skirk 5 minutes pasvarstyti apie savo vertybes: ką tau reiškia vertybės? '
            'Kokiomis vertybėmis norėtum gyventi labiau? Kas tau svarbu? '
            'Kurias vertybes apsimoka puoselėti labiausiai, kurios ilgaamžiškiausios?\n\n'
            'Turbūt psichologiškai augti galime net gulėdami mirties patale, '
            'o išlaikyti grožį gali būti ne taip paprasta, kaip augimą?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class VertybiuApibendrinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VertybiuApibendrinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasirinkai dalyvauti šioje programoje ir nuėjai jau beveik iki pabaigos – '
            'ką tai sako apie Tavo vertybes?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Tęsti'),
              ),
            ),
        ],
      ),
    );
  }
}

class VertybiuApibendrinimasPage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const VertybiuApibendrinimasPage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasirinkai dalyvauti šioje programoje ir nuėjai jau beveik iki pabaigos, '
            'ką tai sako apie Tavo vertybes?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class GyvenimoSriciuVertinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const GyvenimoSriciuVertinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final List<String> sritys = [
      '1. Santuoka / Partnerystė',
      '2. Biologinė šeima',
      '3. Santykiai su vaikais',
      '4. Fizinė sveikata',
      '5. Darbas',
      '6. Draugai',
      '7. Mokymasis',
      '8. Laisvalaikis',
      '9. Estetika (menas, muzika, literatūra, grožis)',
      '10. Bendruomeninis gyvenimas / Visuomeniškumas',
      '11. Aplinka / Aplinkosauga',
      '12. Dvasingumas',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Toliau surašytos 12 gyvenimo sričių, kai skaitysi kiekvieną jų – '
            'pagalvok, kiek ji tau svarbi ir/arba kiek norėtum, kad būtų svarbi, '
            'ir nuo 1 iki 10 įvertink.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          ...sritys.map(
            (s) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('• $s', style: theme.bodyMedium),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class GyvenimoSriciuPlanavimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const GyvenimoSriciuPlanavimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tad kurios sritys Tau svarbiausios? '
            'Gali pasirinkti keletą sričių ir sugalvoti, ką gali padaryti dar šią savaitę, '
            'kad jas puoselėtum. Jeigu jau Tavo planuose numatytos tam tikros veiklos – puiku, '
            'gali tiesiog įrašyti jas.\n\n'
            'Pavyzdžiui:\n'
            '• Draugai – pakviesiu susitikti gerą draugą ketvirtadienį vakare pavakarieniauti.\n'
            '• Biologinė šeima – paskambinsiu šiandien vakare mamai.\n'
            '• Fizinė sveikata – rytoj ryte padarysiu trumpą mankštelę.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PuikuGalimeKeliautiToliauPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PuikuGalimeKeliautiToliauPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Puiku, galime keliauti toliau!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class PuikuGalimeKeliautiToliauPage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const PuikuGalimeKeliautiToliauPage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tęsiame kelionę'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Puiku, galime keliauti toliau!',
              style: theme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class PasirinkimoKryzkelePage extends StatelessWidget {
  final VoidCallback? onNext;
  const PasirinkimoKryzkelePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kai tik mes patiriame nemalonius jausmus, pojūčius ar mintis, mes atsistojame pasirinkimo kryžkelėje. '
            'Mūsų pasirinkimas turės pasekmes mūsų laimei tolesnėje kelionėje.\n\n'
            '1 pasirinkimas: Mes reaguojame automatiškai su aversija – poreikiu ištrūkti iš negatyvių jausmų, pojūčių, minčių. '
            'Šia reakcija mūsų protas/kūnas nukala pirmą žiedą mūsų reagavimo grandinėje, kuris laiko mus prirakintus prie nenorimos '
            'ir skausmingos emocinės būsenos.\n\n'
            '2 pasirinkimas: Geriausiu įmanomu būdu sąmoningai leidžiame negatyviems jausmams, pojūčiams ir mintims būti, nors jie ir nepatinka. '
            'Pasirinkus šį kelią, mes nukreipiame savo dėmesingumą nauja kryptimi iš „nenoro“ į „atsivėrimą“. '
            'Tai sulaužo pirmąjį mūsų įprastos automatinės reakcijos žiedą.\n\n'
            'Aversija – tai noras ar paskata išvengti, atsikratyti, pabėgti nuo, atsitraukti nuo daiktų/reiškinių, kuriuos mes priimame kaip nemalonius. '
            'Tai yra jėga, kuri įvelia mus į tokias negatyvias emocijas kaip depresija, nerimas, pyktis ar kitos stresinės reakcijos. '
            'Dažniausiai patirdami neigiamą emociją ir po to aversiškai reaguodami į ją mes pasineriame į dar gilesnę neigiamą būseną.\n\n'
            'Atsisakydami aversinio atsako ir pilnaprotaujančiu būdu priimdami emociją, mes prie jos neprisirišame ir tokiu būdu jos nestipriname, '
            'išvengiame kentėjimo, atsirandančio dėl savo reakcijos į skausmą arba diskomfortą, taupome savo resursus ir pasiliekame galimybę '
            'greitai pasijausti geriau.\n\n'
            'Kentėjimas – tai skausmas arba diskomfortas, padaugintas iš mūsų reakcijos į jį.\n'
            'Skausmo ir diskomforto išvengti neįmanoma, jie lydi mus visą gyvenimą, tačiau mes galime nepasinerti į kentėjimą.\n\n'
            'Iš esmės keičiant savo laikyseną į patirtis iš „nenoriu“ į „atsiveriu“ galima nutraukti pirmąjį automatinio reagavimo įpročio grandinės žiedą. '
            'Tai leidžia mums patyrinėti dvi meditacijos tradicijų tiesas, kurios tinka visoms sunkioms gyvenimo patirtims:\n'
            '• Visi sunkūs jausmai savaime praeina, jei mes jų nesikratome;\n'
            '• Netgi nemalonių jausmų akivaizdoje galime atrasti tam tikrą ramybę ir pasitenkinimą.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PasirinkimoKryzkeleApibendrinimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PasirinkimoKryzkeleApibendrinimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apibendrinant šį tekstuką – būti savo gyvenimo kūrėju gali padėti du dalykai:\n'
            '• Klausti savęs – kokių pasekmių noriu? Ir planuoti savo elgesį pagal norimas pasekmes.\n'
            '• Nebėgti nuo nemalonių jausmų. Supratimas, kad viskas praeina, taip pat ir jausmai – gali padėti juos išbūti.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PasirinkimoKryzkeleKlausimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PasirinkimoKryzkeleKlausimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O kaip Tu – kokių pasekmių nori Tu ir ar Tau labai sunku išbūti, kai kyla nemalonios emocijos?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class StabteltiKvietimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const StabteltiKvietimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nemažai kalbėjome apie vertybes, svarbias gyvenimo sritis bei kokių Tau gyvenimo vaisių norisi. '
            'Iš senų įpročių išsivaduoti padeda gebėjimas stabtelti, tad ir kviečiu trumpam stabtelėjimui.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Toliau'),
              ),
            ),
        ],
      ),
    );
  }
}

class TrumpaKvepavimoPauzePage extends StatelessWidget {
  final VoidCallback? onNext;
  const TrumpaKvepavimoPauzePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trumpa kvėpavimo pauzė',
            style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class StabtelejimoNaudaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const StabtelejimoNaudaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stabtelėjimas padeda išvengti skubotų, impulsyvių veiksmų.',
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Siunčiu šiltus linkėjimus, iki kitos praktikos!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class GyvenimoIstorijaIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const GyvenimoIstorijaIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu tau papasakoti istoriją apie gyvenimą.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AntAtbrailosPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AntAtbrailosPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ant atbrailos\n\n'
            'Vienas įžymus dailininkas lėkdamas Harley Davidson patyrė sunkią traumą. '
            'Kai atsipeikėjo ligoninėje, chirurgas jam pranešė blogą naujieną: teko amputuoti jo plaštaką, kaip tik tą, kuria jis tapydavo. '
            'Dailininkas labai susikrimto. Jis neteko galimybės daryti tai, ką mėgo labiausiai pasaulyje. Gyvenimas prarado prasmę.\n\n'
            'Vos išrašytas iš ligoninės dailininkas užlipo į aukštą pastato miesto centre, liftu pakilo į viršutinį aukštą, '
            'susirado tuščią kabinetą ir atsistojo ant lango atbrailos. Jis ketino nusižudyti.\n\n'
            'Žvelgdamas į gatvę apačioje, dailininkas išvydo nepaprastą vaizdą. Šaligatviu ėjo žmogus be abiejų rankų, '
            'ne šiaip sau ėjo — linksmai pasišokinėdamas!\n\n'
            '– Dieve mano! – pamanė dailininkas. – Aš praradau tik vieną plaštaką, o štai ten vyrukas be abiejų plaštakų '
            'ir netgi be rankų, ir jis šoka! Kamgi man žudytis?\n\n'
            'Dailininkas nusprendė gyventi. Jis nulipo nuo atbrailos atgal į tuščią kabinetą.\n\n'
            '– Turiu perprasti to žmogaus paslaptį, – pagalvojo jis. – Kaip jis gali būti šitoks laimingas be abiejų plaštakų?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AntAtbrailosTesinysPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AntAtbrailosTesinysPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dailininkas puolė prie lifto, skubiai nusileido į pirmą aukštą ir išbėgo į gatvę ieškoti to žmogaus. '
            'Berankį rasti nesunku.\n\n'
            '– Dėkui! Dėkui jums, pone! Jūs išgelbėjot man gyvybę. Esu dailininkas, bet per avariją praradau plaštaką, kuria tapiau. '
            'Buvau toks prislėgtas, kad užlipau į šitą pastato viršutinį aukštą ir jau ruošiausi nusižudyti. Stovėdamas ant atbrailos '
            'pažvelgiau žemyn ir pamačiau jus, žmogų be abiejų rankų, šokantį gatvėje! Prašau, pasakykite man, kaip jūs galite būti toks linksmas, '
            'praradęs abi rankas?\n\n'
            'Berankis akimirką patylėjo.\n'
            '– Tiesą sakant, aš nešokau. Aš bandžiau pasikasyti subinę.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AntAtbrailosPabaigaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const AntAtbrailosPabaigaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Palieku interpretacijas Tau.\n'
            'Istorija iš Ajahn Brahm knygos – „Dramblys, kuris pamiršo laimę”.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DekingumoIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekingumoIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O gal iš tiesų mes galime kontroliuoti žymiai mažiau dalykų, nei iš tiesų manome galintys? '
            'Kartais būna dienų, savaičių, metų, kai atrodo, jog viskas ritasi žemyn, o gal slysta iš po kojų.\n\n'
            'Vienas iš įpročių, jeigu jį suformuosime, kuris gali padėti atsilaikyti – tai dėkingumas. '
            'Jis leidžia atsigręžti ir pamatyti šviesiąją gyvenimo pusę.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class DekingumoPratimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekingumoPratimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gal galėtum įvardinti ir įrašyti 10 dalykų, už ką esi dėkingas?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class DekingumoPrimimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekingumoPrimimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu užsirašyti į savo telefone esantį kalendorių priminimą atlikti dėkingumo praktiką. '
            'Tokia praktika užima labai nedaug laiko, bet gali daryti didelį pokytį Tavo vidiniam Sodui!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class DekojimoPraktikaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DekojimoPraktikaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dėkoju, kad tęsi praktikas.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SviesiojiGyvenimoPusePage extends StatelessWidget {
  final VoidCallback? onNext;
  const SviesiojiGyvenimoPusePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tęsiant temą apie atsigręžimą į šviesią gyvenimo pusę, '
            'net ir tuomet, kai sunku ir kai kurių dalykų negalime kontroliuoti…',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Toliau'),
              ),
            ),
        ],
      ),
    );
  }
}

class HumoroIstoryjaIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const HumoroIstoryjaIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu papasakoti Tau vieną istoriją su humoro prieskoniu.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Toliau'),
              ),
            ),
        ],
      ),
    );
  }
}

class HumoroIstorijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const HumoroIstorijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Po daugelio metų netikėtai susitinka du seni draugai.\n\n'
            '– Na, kaip gyveni? – pasiteirauja vienas.\n'
            '– Negaliu skųstis, – šypteli kitas. – Su žmona vis dar kartu, vaikai laikosi neblogai, dirbu toje pačioje įmonėje, alga gera.\n'
            '– O sveikata? Atsimenu, buvai minėjęs... kad ryte prabundi – prisišlapinęs į lovą?\n'
            '– Irgi viskas gerai, lankiau psichoterapiją – susitvarkė.\n'
            '– Geras, tai nebeprisišlapini?\n'
            '– Prisišlapinu... bet dabar atsikeliu su šypsena.\n'
            '– …',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Toliau'),
              ),
            ),
        ],
      ),
    );
  }
}

class PriespaskutineSavaitePage extends StatelessWidget {
  final VoidCallback? onNext;
  const PriespaskutineSavaitePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prisisisiojus bet su šypsena? Gal ir neblogas gyvenimo moto išeina?\n\n'
            'Šia istorija baigėme priešpaskutinę Sodo programos savaitę. '
            'Sveikinu, finišo tiesioji jau visai netoli, kaip džiugu, kad Tau pavyko tiek nueiti!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          if (onNext != null)
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Toliau'),
              ),
            ),
        ],
      ),
    );
  }
}

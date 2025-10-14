
import 'package:flutter/material.dart';

class EsamojoLaikoMeditacijosIvadinisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const EsamojoLaikoMeditacijosIvadinisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu pakviesti Tave meditacinei praktikai. '
            'Tai esamojo laiko meditacija sunkiu metu. '
            'Tai vienas iš būdų, kuris gali padėti, kai užklumpa sunkumai.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class EsamojoLaikoMeditacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const EsamojoLaikoMeditacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Esamojo laiko meditacija sunkiu metu.',
            style: theme.headlineSmall?.copyWith(color: Colors.green[800]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class EsamojoLaikoRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const EsamojoLaikoRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką patyrei šios meditacijos metu?',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ApkabinimuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ApkabinimuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Siunčiu apkabinimų.',
            style: theme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PervargimoZenklaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PervargimoZenklaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dar noriu šiek tiek laiko skirti konkrečiam pasidėliojimui – '
            'kokie ženklai rodo, kad esi pervargęs ir kokie konkretūs veiksmai '
            'gali Tau padėti atgauti jėgas.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PervargimoPazymiaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PervargimoPazymiaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tai pirmiausia, prašau, įrašyk, kokie konkretūs požymiai rodo, kad esi pervargęs?\n\n'
            'Pavyzdžiai: nebenoriu susitikti su žmonėmis, negaliu užmigti, po darbo noriu tik gulėti lovoje, '
            'apetito pokyčiai, dažniau supykstu, darau daugiau klaidų, fantazuoju kad noriu išeiti iš darbo ir pan.\n\n'
            'Gali surašyti nuo požymio, kuris rodo nedidelį pavargimą iki perdegimų ženklų.\n\n'
            'Pavyzdžiui: kai pradedu valgyti daugiau saldumynų – gali būti, kad tiesiog jaučiu stresą, '
            'kai nebenoriu keltis iš lovos, fantazuoju apie negyvenamą salą ir nebesusitinku su žmonėmis – '
            'rodo, kad man emociškai labai sunku.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class JeguAtstatymoVeiksmaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const JeguAtstatymoVeiksmaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dabar prašau įrašyk, konkrečius veiksmus, kurie tau padeda atstatyti jėgas.\n\n'
            'Pavyzdžiai: pamiegoti valanda ilgiau, ilgas žygis gamtoje, susitikimas su draugais aktyviai '
            'leidžiant laiką, diena be atsakomybių ir pan.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class TikiuosiPraversPage extends StatelessWidget {
  final VoidCallback? onNext;
  const TikiuosiPraversPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tikiuosi, pravers!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SaugiVietaIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SaugiVietaIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noriu pakviesti Tave paklausyti ir įsivaizduoti saugią vietą. '
            'Dažnai tokia praktika padeda pajausti ramybės, saugumo, priėmimo jausmą. '
            'Būtų puiku, jeigu keletą minučių Tavęs netrukdytų kiti žmonės, kad galėtum įsijausti.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SaugiVietaTitlePage extends StatelessWidget {
  final VoidCallback? onNext;
  const SaugiVietaTitlePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saugi vieta',
            style: theme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SaugiVietaTitlePage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const SaugiVietaTitlePage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iki susitikimo!',
            style: theme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ZaidimoPuoselejimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ZaidimoPuoselejimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Žaidimo puoselėjimas',
            style: theme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 16),

          SingleChildScrollView(
            child: Text(
              'Kviečiu puoselėti žaidimą kasdienybėje, jis gali labai praturtinti ir nuspalvinti kasdienybę šviesesnėmis spalvomis.\n\n'
              'Žaidimo įvairovė yra beribė – iškrėsti pokštą kolegai, skirti laiko kiekvieną dieną paskaityti juokelių, '
              'galime skirti laiko siuvinėjimui, piešimui, muzikai ar kitai meno formai. '
              'Galime dėdami bulvių košę – nupiešti širdelę, ant purvinos mašinos užrašyti užrašą – „aš noriu praustis“. '
              'Vasarą galime nusiauti batus ir pasivaikščioti basomis. Žiemą – pasitikti kolegą sniego gniūžte!\n\n'
              'Galime grįžtant iš darbo nusipirkti sau didelę puokštę gėlių. Pakutenti savo artimą žmogų. '
              'Vietoj gėlių gimtadienio proga padovanoti daržovių puokštę. Pažaisti kortomis. '
              'Maivytis prieš veidrodį. Garsiai dainuoti…',
              style: theme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ZaidimoPrimReminderPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ZaidimoPrimReminderPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dar vienas priminimas – nepamiršti žaisti gyvenimą! '
            'Kai suaugame, neretai primirštame kūrybą ir žaidimą. '
            'Bet jie gali įnešti tokio nuostabaus lengvumo!',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ZaidimoPuoselejimasTekstasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ZaidimoPuoselejimasTekstasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kviečiu puoselėti žaidimą kasdienybėje, jis gali labai praturtinti ir '
            'nuspalvinti kasdienybę šviesesnėmis spalvomis.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          Text(
            'Žaidimo įvairovė yra beribė - iškrėsti pokštą kolegai, skirti laiko kiekvieną '
            'dieną paskaityti juokelių, galime skirti laiko siuvinėjimui, piešimui, muzikai ar '
            'kitai meno formai. Galime dėdami bulvių košę – nupiešti širdelę, ant purvinos mašinos '
            'užrašyti užrašą – aš noriu praustis. Vasarą galime nusiauti batus ir pasivaikščioti '
            'basomis. Žiemą – pasitikti kolegą sniego gniūžte! Galime grįžtant iš darbo nusipirkti '
            'sau didelę puokštę gėlių. Pakutenti savo artimą žmogų. Vietoj gėlių gimtadienio proga '
            'padovanoti daržovių puokštę. Pažaisti kortomis. Maivytis prieš veidrodį. Garsiai dainuoti…',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class MedicJokesPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MedicJokesPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O aš nusprendžiau parašyti keletą anekdotų. Gal kuris ir Tau sukels šypseną 😊 '
            'Kažkada juos pamačiau Medikų Facebook grupėje ir išsisaugojau.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          _joke(
            theme,
            'Mitybos specialistas pacientui:\n'
            '- Taigi, štai jūsų dieta: 300 gramų troškintų cukinijų per dieną, 400 gramų cikorijų lapų ir tiek salotų lapų, kiek norite.\n'
            '- Daktare, ar varpelį ant kaklo uždėti? Ar galima šiaip ganytis?',
          ),
          _joke(
            theme,
            '- Kolega, kokios medicinos srities specialistas Jūs esate?\n'
            '- Aš esu proktologas.\n'
            '- O aš esu ginekologas.\n'
            '- Kaimynai, tada...',
          ),
          _joke(
            theme,
            'Pirmoji greitosios medicinos pagalbos gydytojo taisyklė: kuo vėliau atvykstate, tuo tikslesnė diagnozė.\n'
            'Atminkite! Geras medicinos studentas taps geru gydytoju, o blogas – ligoninės vadovu.\n'
            'Šiuolaikinė ligoninė – tai vieta, kur įkyrūs pacientai trukdo gydytojams dirbti su dokumentais.',
          ),
          _joke(
            theme,
            '- Gydytojau, kokia situacija, kiek man liko gyventi?\n'
            '- 10.\n'
            'Ko dešimt? Metų, mėnesių?\n'
            '- 10, 9, 8, 7...',
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _joke(TextTheme theme, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF8F0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFB7E0BB)),
      ),
      child: Text(text, style: theme.bodyLarge?.copyWith(height: 1.35)),
    );
  }
}

class ZaidimoKlausimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const ZaidimoKlausimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kaip šiandien galėtum pažaisti?',
            style: theme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
        ],
      ),
    );
  }
}

class AllScalesBlock extends StatefulWidget {
  const AllScalesBlock({super.key});

  @override
  State<AllScalesBlock> createState() => _AllScalesBlockState();
}

class _AllScalesBlockState extends State<AllScalesBlock> {
  int _step = 0;
  int _phq9 = 0;
  int _who5 = 0;
  int _leis = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final total = 3;
    final progress = (_step.clamp(0, total) + (_step == 0 ? 0 : 1)) / total;

    Widget content;
    if (_step == 0) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką gi, atėjo laikas užpildyti skales ir pažiūrėti, kas įvyko tavo vidiniame Sode. '
            'Gali prireikti šiek tiek kantrybės, bet neturėtum trukti labai ilgai, skalių bus kiek mažiau nei pirmąją savaitę. '
            'Turėtų būti įdomu, nes pamatysi ir savo rezultatus.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          Text(
            'PHQ-9: Kaip dažnai per pastarąsias dvi savaites patyrei aprašytus simptomus?\n'
            '0 – „Visai ne“, 1 – „Keletą dienų“, 2 – „Daugiau nei pusę dienų“, 3 – „Beveik kasdien“.',
            style: theme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 12),
          PHQ9Block(
            onScore: (s) => _phq9 = s,
            onComplete: () => setState(() => _step = 1),
          ),
        ],
      );
    } else if (_step == 1) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WHO-5: Pažymėk, kas labiausiai atitinka Tavo jausmus per pastarąsias dvi savaites.\n'
            '5 – „Visą laiką“, 4 – „Didžiąją laiko dalį“, 3 – „Daugiau nei pusę laiko“, '
            '2 – „Mažiau nei pusę laiko“, 1 – „Kai kada“, 0 – „Niekada“.',
            style: theme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 12),
          WHO5Block(
            onScore: (s) => _who5 = s,
            onComplete: () => setState(() => _step = 2),
          ),
        ],
      );
    } else if (_step == 2) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Laisvalaikis/atsistatymas: „Kaip jautiesi ir ką veiki laisvu nuo darbo metu?“\n'
            '1 – Nesutinku, 2 – Nei sutinku/nei nesutinku, 3 – Sutinku, 4 – Visiškai sutinku.',
            style: theme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 12),
          LeisBlock(
            onScore: (s) => _leis = s,
            onComplete: () => setState(() => _step = 3),
          ),
        ],
      );
    } else {
      content = _Results(phq9: _phq9, who5: _who5, leis: _leis);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  color: Colors.green,
                  backgroundColor: Colors.green.shade100,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                _step < 3 ? '${_step + 1}/$total' : 'Baigta',
                style: theme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}



class PHQ9Block extends StatelessWidget {
  final ValueChanged<int> onScore;
  final VoidCallback onComplete;
  const PHQ9Block({super.key, required this.onScore, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SimpleQuestionnaire(
      title: 'PHQ-9',
      questions: const [
        'Mažas susidomėjimas ar malonumas atliekant dalykus',
        'Jautimasis nusiminusiam (-ai), prislėgtam (-ai) ar beviltiškam (-ai)',
        'Sunkumas užmigti ar išmiegoti, arba per ilgas miegojimas',
        'Jautimasis pavargusiam (-ai) ar energijos trūkumas',
        'Prastas apetitas arba persivalgymas',
        'Pojūtis, kad esate nevykėlis (-ė) arba nuvylėte save ar savo šeimą',
        'Sunkumas susikoncentruoti (skaitymas/TV)',
        'Labai lėtas judėjimas/kalbėjimas arba neramumas',
        'Mintys apie mirtį ar savęs žalojimą',
      ],
      scaleValues: const [0, 1, 2, 3],
      scaleLabels: const ['0', '1', '2', '3'],
      onScore: onScore,
      onNext: onComplete,
      chipColor: Colors.green,
    );
  }
}

class WHO5Block extends StatelessWidget {
  final ValueChanged<int> onScore;
  final VoidCallback onComplete;
  const WHO5Block({super.key, required this.onScore, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SimpleQuestionnaire(
      title: 'WHO-5',
      questions: const [
        'Jaučiuosi linksmas ir geros nuotaikos',
        'Jaučiuosi ramus ir atsipalaidavęs',
        'Jaučiuosi aktyvus ir energingas',
        'Atsibundu žvalus ir pailsėjęs',
        'Kasdienybė pilna mane dominančių dalykų',
      ],
      scaleValues: const [5, 4, 3, 2, 1, 0],
      scaleLabels: const ['5', '4', '3', '2', '1', '0'],
      onScore: onScore,
      onNext: onComplete,
      chipColor: Colors.teal,
    );
  }
}

class LeisBlock extends StatelessWidget {
  final ValueChanged<int> onScore;
  final VoidCallback onComplete;
  const LeisBlock({super.key, required this.onScore, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SimpleQuestionnaire(
      title: 'Laisvalaikis / atsistatymas (16)',
      questions: const [
        'Jaučiu, kad galiu pats nuspręsti, kuo užsiimti',
        'Mokausi naujų dalykų',
        'Pamirštu apie darbą',
        'Pats(-i) nusprendžiu, ką ir kada veiksiu',
        'Visai negalvoju apie darbą',
        'Ilsiuosi ir atsipalaiduoju',
        'Ieškau intelektinių iššūkių',
        'Užsiimu dalykais, kurie man kelia iššūkių',
        'Pats pasirenku, kaip praleisiu laiką',
        'Atsitraukiu nuo darbo',
        'Užsiimu tuo, kas padeda atsipalaiduoti',
        'Skiriu laiko atsipalaidavimui',
        'Darau dalykus taip, kaip man atrodo geriausia',
        'Skiriu laiko laisvalaikiui',
        'Užsiimu tuo, kas praplečia mano akiratį',
        'Atitrūkstu nuo darbo reikalų',
      ],
      scaleValues: const [1, 2, 3, 4],
      scaleLabels: const ['1', '2', '3', '4'],
      onScore: onScore,
      onNext: onComplete,
      chipColor: Colors.indigo,
    );
  }
}


class SimpleQuestionnaire extends StatefulWidget {
  final String title;
  final List<String> questions;
  final List<int> scaleValues;
  final List<String> scaleLabels;
  final ValueChanged<int>? onScore;
  final VoidCallback? onNext;
  final Color chipColor;

  const SimpleQuestionnaire({
    super.key,
    required this.title,
    required this.questions,
    required this.scaleValues,
    required this.scaleLabels,
    this.onScore,
    this.onNext,
    this.chipColor = Colors.green,
  });

  @override
  State<SimpleQuestionnaire> createState() => _SimpleQuestionnaireState();
}

class _SimpleQuestionnaireState extends State<SimpleQuestionnaire> {
  late List<int?> _answers;

  @override
  void initState() {
    super.initState();
    _answers = List<int?>.filled(widget.questions.length, null);
  }

  int get _score => _answers.whereType<int>().fold<int>(0, (sum, v) => sum + v);
  bool get _complete => !_answers.contains(null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        for (int i = 0; i < widget.questions.length; i++) ...[
          _QuestionRow(
            index: i + 1,
            text: widget.questions[i],
            scaleValues: widget.scaleValues,
            scaleLabels: widget.scaleLabels,
            value: _answers[i],
            onChanged: (v) {
              setState(() => _answers[i] = v);
              widget.onScore?.call(_score);
            },
            chipColor: widget.chipColor,
          ),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 8),
        _ScoreBar(score: _score, complete: _complete),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: _complete ? widget.onNext : null,
            child: const Text('Tęsti'),
          ),
        ),
      ],
    );
  }
}

class _QuestionRow extends StatelessWidget {
  final int index;
  final String text;
  final List<int> scaleValues;
  final List<String> scaleLabels;
  final int? value;
  final ValueChanged<int> onChanged;
  final Color chipColor;

  const _QuestionRow({
    required this.index,
    required this.text,
    required this.scaleValues,
    required this.scaleLabels,
    required this.value,
    required this.onChanged,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$index. $text', style: theme.titleMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: -6,
          children: List.generate(scaleValues.length, (i) {
            final v = scaleValues[i];
            final lbl = scaleLabels[i];
            final selected = value == v;
            return ChoiceChip(
              label: Text(lbl),
              selected: selected,
              onSelected: (_) => onChanged(v),
              selectedColor: chipColor.withOpacity(0.25),
              backgroundColor: const Color(0xFFF1F5F2),
              labelStyle: TextStyle(
                color: selected ? chipColor : Colors.black87,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _ScoreBar extends StatelessWidget {
  final int score;
  final bool complete;
  const _ScoreBar({required this.score, required this.complete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF8F0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFB7E0BB)),
      ),
      child: Row(
        children: [
          Icon(Icons.assessment, color: Colors.green.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Suma: $score  ${complete ? "(užpildyta)" : "(neišsamiai)"}',
              style: theme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _Results extends StatelessWidget {
  final int phq9;
  final int who5;
  final int leis;
  const _Results({required this.phq9, required this.who5, required this.leis});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FFF7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBEE3C5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rezultatai',
            style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text('PHQ-9 suma: $phq9', style: theme.bodyLarge),
          Text('WHO-5 suma: $who5', style: theme.bodyLarge),
          Text('Laisvalaikis-16 suma: $leis', style: theme.bodyLarge),
        ],
      ),
    );
  }
}

class SavijautosKlausimynasBlock extends StatefulWidget {
  const SavijautosKlausimynasBlock({super.key, this.onChanged});
  final ValueChanged<Map<String, dynamic>>? onChanged;

  @override
  State<SavijautosKlausimynasBlock> createState() =>
      _SavijautosKlausimynasBlockState();
}

class _SavijautosKlausimynasBlockState
    extends State<SavijautosKlausimynasBlock> {
 
  final Map<int, int> _workLikert = {}; 
  
  final Map<int, int> _studentLikert = {}; 
  bool _isStudent = false;


  final List<String> _stressEvents = const [
    'Nepatyriau',
    'Netekau artimojo',
    'Sužinojau apie savo ligą',
    'Sužinojau apie artimojo ligą',
    'Keičiau darbą',
    'Išsiskyriau',
    'Susituokiau',
    'Pradėjau lauktis',
    'Pagimdžiau',
    'Patyriau finansinius sunkumus',
    'Kita',
  ];
  final Set<String> _selectedEvents = {};
  final TextEditingController _eventOtherCtrl = TextEditingController();


  final Map<String, int> _radio5 = {
 
    'itakos_sprendimams': -1,
    'planas_laikas': -1,
    'galiu_pasakyti_ne': -1,
    
    'miego_kokybe': -1, 
    'atsibundu_pailsejes': -1,

    'fizinio_aktyvumo': -1, 
    'rukai': -1,
    'alkoholis': -1, 
    'tvarkausi_su_darbo_stresu': -1, 
    'isukiai': -1, 
    'gyvenimo_kontrole': -1, 
    'perf_tobulai': -1, 
    'perf_deleguoju': -1, 
    'perf_klaidu_baime': -1, 
    'perf_atleidziu_sau': -1, 
    'perf_atleidziu_kitiems': -1, 
    'vertingas_tik_dirbant': -1,
    'socialinis_pasit': -1, 
  };


  int _miegoValandos = -1; 
  int _uzmigimoTrukme = -1; 
  int _einuiMiegoti = -1; 

 
  double _stressDarboDiena = 0;
  double _stressSavaitgalis = 0;
  double _suicidalScale = 0;


  final Map<String, int> _studRadio5 = {
    'stud_miego_kokybe': -1,
    'stud_pailsejes': -1,
    'stud_fizinis': -1,
    'stud_rukai': -1,
    'stud_alkoholis': -1,
    'stud_isukiai': -1,
    'stud_kontrole': -1,
    'stud_perf_tobulai': -1,
    'stud_perf_deleguoju': -1,
    'stud_perf_klaidu_baime': -1,
    'stud_perf_atleidziu_sau': -1,
    'stud_perf_atleidziu_kitiems': -1,
    'stud_vertingas_tik_mokantis': -1,
    'stud_socialinis': -1,
  };
  int _studMiegoValandos = -1;
  int _studUzmigimoTrukme = -1;
  int _studEinuiMiegoti = -1;
  double _studStressDiena = 0;
  double _studStressSavaitgalis = 0;
  double _studSuicide = 0;

  @override
  void dispose() {
    _eventOtherCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    widget.onChanged?.call({
      'is_student': _isStudent,
      'work_likert': _workLikert,
      'student_likert': _studentLikert,
      'stress_events': _selectedEvents.toList(),
      'stress_event_other': _eventOtherCtrl.text.trim(),
      'radio5': _radio5,
      'sleep_hours_idx': _miegoValandos,
      'sleep_latency_idx': _uzmigimoTrukme,
      'bedtime_idx': _einuiMiegoti,
      'stress_day': _stressDarboDiena,
      'stress_weekend': _stressSavaitgalis,
      'suicide_last_month': _suicidalScale,
      'stud': {
        'radio5': _studRadio5,
        'sleep_hours_idx': _studMiegoValandos,
        'sleep_latency_idx': _studUzmigimoTrukme,
        'bedtime_idx': _studEinuiMiegoti,
        'stress_day': _studStressDiena,
        'stress_weekend': _studStressSavaitgalis,
        'suicide_last_month': _studSuicide,
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ką gi, atėjo laikas užpildyti skales ir pažiūrėti, kas įvyko tavo vidiniame Sode.\n'
            'Gali prireikti šiek tiek kantrybės, bet neturėtų trukti labai ilgai, skalių bus kiek mažiau nei pirmąją savaitę.\n'
            'Turėtų būti įdomu, nes pamatysi ir savo rezultatus.',
            style: t.bodyLarge,
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 20),
          _sectionTitle('SU DARBŲ SUSIJUSI SAVIJAUTA (0–6)'),
          _hintText(
            '0 – „Niekada“, 1 – „Kelis k./metus ar rečiau“, 2 – „~kartą/mėn.“ '
            '3 – „Kelis k./mėn.“, 4 – „~kartą/sav.“, 5 – „Kelis k./sav.“, 6 – „Kasdien“.',
          ),
          const SizedBox(height: 8),
          ..._workItems().asMap().entries.map((e) {
            final idx = e.key + 1;
            return _likertItem(idx, e.value, _workLikert, maxVal: 6);
          }),

          const SizedBox(height: 24),
          _sectionTitle(
            'AR PROGRAMOS METU PATYREI DIDESNĮ STRESĄ KELIANČIŲ ĮVYKIŲ?',
          ),
          _checkboxGroup(
            options: _stressEvents,
            selected: _selectedEvents,
            onChanged: (val) {
              setState(() {
                if (val == 'Nepatyriau') {
                  if (_selectedEvents.contains('Nepatyriau')) {
                    _selectedEvents.clear();
                  } else {
                    _selectedEvents
                      ..clear()
                      ..add('Nepatyriau');
                  }
                } else {
                  _selectedEvents.remove('Nepatyriau');
                  if (_selectedEvents.contains(val)) {
                    _selectedEvents.remove(val);
                  } else {
                    _selectedEvents.add(val);
                  }
                }
                _notify();
              });
            },
          ),
          if (_selectedEvents.contains('Kita')) ...[
            const SizedBox(height: 8),
            _textfield('Kita (įrašyk):', _eventOtherCtrl, maxLines: 2),
          ],

          const SizedBox(height: 24),
          _sectionTitle('DARBO KONTROLĖ / „NE“ GALIMYBĖ'),
          _radioRow(
            'Kiek jauti, kad turi įtakos sprendimams, susijusiems su tavo mediko darbu?',
            'itakos_sprendimams',
            [
              'Visiškai neturiu',
              'Mažai',
              'Šiek tiek',
              'Daug',
              'Visiškai turiu',
            ],
          ),
          _radioRow(
            'Ar gali planuoti savo mediko darbo laiką ir užduotis?',
            'planas_laikas',
            [
              'Visiškai negaliu',
              'Mažai',
              'Šiek tiek',
              'Galiu',
              'Visiškai galiu',
            ],
          ),
          _radioRow(
            'Ar darbe gali/galėtum pasakyti „ne“ per dideliam krūviui ar papildomoms užduotims?',
            'galiu_pasakyti_ne',
            [
              'Visiškai negaliu',
              'Mažai',
              'Šiek tiek',
              'Galiu',
              'Visiškai galiu',
            ],
          ),

          const SizedBox(height: 24),
          _sectionTitle('STRESO LYGIS (0–10)'),
          _sliderRow(
            'Kiek streso patiri įprastą darbo dieną?',
            _stressDarboDiena,
            (v) {
              setState(() => _stressDarboDiena = v);
              _notify();
            },
          ),
          _sliderRow(
            'Kiek streso patiri įprastą savaitgalio dieną?',
            _stressSavaitgalis,
            (v) {
              setState(() => _stressSavaitgalis = v);
              _notify();
            },
          ),

          const SizedBox(height: 24),
          _sectionTitle('MIEGAS'),
          _radioRow('Kaip vertini savo miego kokybę?', 'miego_kokybe', [
            'Labai gerai',
            'Gerai',
            'Vidutiniškai',
            'Blogai',
            'Labai blogai',
          ]),
          _radioRow(
            'Ar didžiąją dalį dienų atsibundi pailsėjęs?',
            'atsibundu_pailsejes',
            ['Ne', 'Taip'],
          ),
          _chipsRow(
            label: 'Kiek valandų vidutiniškai miegi?',
            opts: const [
              '<5 h',
              '~5 h',
              '~6 h',
              '~7 h',
              '~8 h',
              '~9 h',
              '~10 h',
              '>10 h',
            ],
            selectedIdx: _miegoValandos,
            onSelected:
                (i) => setState(() {
                  _miegoValandos = i;
                  _notify();
                }),
          ),
          _chipsRow(
            label: 'Kiek trunka, kol užmiegi?',
            opts: const ['<15 min', '15–30 min', '30–60 min', '>60 min'],
            selectedIdx: _uzmigimoTrukme,
            onSelected:
                (i) => setState(() {
                  _uzmigimoTrukme = i;
                  _notify();
                }),
          ),
          _chipsRow(
            label: 'Kada įprastai nueini miegoti (darbo dieną)?',
            opts: const [
              '<20:00',
              '20–21',
              '21–22',
              '22–23',
              '23–24',
              '24–01',
              '>01:00',
            ],
            selectedIdx: _einuiMiegoti,
            onSelected:
                (i) => setState(() {
                  _einuiMiegoti = i;
                  _notify();
                }),
          ),

          const SizedBox(height: 24),
          _sectionTitle('ĮPROČIAI / GEROVĖ'),
          _radioRow(
            'Ar nuosekliai skiri papildomo laiko fiziniam aktyvumui?',
            'fizinio_aktyvumo',
            [
              'Nesportuoju',
              '<1 h/sav.',
              '1–2 h/sav.',
              '2–4 h/sav.',
              '4–5 h/sav.',
              '>5 h/sav.',
              'Sunku pasakyti',
            ],
          ),
          _radioRow('Ar rūkai?', 'rukai', ['Ne', 'Taip', 'Kita']),
          _radioRow(
            'Kaip dažnai geri alkoholio turinčius gėrimus?',
            'alkoholis',
            [
              'Niekada',
              '1 k./mėn. ar rečiau',
              '2–4 k./mėn.',
              '2–3 k./sav.',
              '≥4 k./sav.',
            ],
          ),
          _radioRow(
            'Kiek jauti gebantis tvarkytis su darbu susijusiu stresu?',
            'tvarkausi_su_darbo_stresu',
            ['Nepakankamai', 'Pakankamai'],
          ),
          _radioRow(
            'Kaip vertini gebėjimą susitvarkyti su kylančiais iššūkiais?',
            'isukiai',
            ['Labai blogai', 'Blogai', 'Vidutiniškai', 'Gerai', 'Labai gerai'],
          ),
          _radioRow(
            'Kiek valdai savo kasdienį gyvenimą (rutinas, prioritetus)?',
            'gyvenimo_kontrole',
            [
              'Visiškai ne',
              'Dažn. ne',
              'Šiek tiek',
              'Dažn. valdau',
              'Visiškai valdau',
            ],
          ),
          _radioRow(
            'Ar dažnai jauti, kad viskas turi būti padaryta tobulai?',
            'perf_tobulai',
            ['Visiškai ne', 'Retai', 'Kartais', 'Dažnai', 'Visada'],
          ),
          _radioRow(
            'Ar tau sunku deleguoti užduotis kitiems?',
            'perf_deleguoju',
            ['Labai sunku', 'Sunku', 'Kartais', 'Lengva', 'Labai lengva'],
          ),
          _radioRow(
            'Ar dažnai jaudiniesi, kad kiti gali pastebėti tavo klaidas darbe?',
            'perf_klaidu_baime',
            ['Labai dažnai', 'Dažnai', 'Kartais', 'Retai', 'Labai retai'],
          ),
          _radioRow(
            'Ar tau sunku atleisti sau už padarytas klaidas?',
            'perf_atleidziu_sau',
            ['Labai sunku', 'Sunku', 'Vidutiniškai', 'Lengva', 'Labai lengva'],
          ),
          _radioRow(
            'Ar tau sunku atleisti kitiems už padarytas klaidas?',
            'perf_atleidziu_kitiems',
            ['Labai sunku', 'Sunku', 'Vidutiniškai', 'Lengva', 'Labai lengva'],
          ),
          _radioRow(
            'Ar jautiesi vertingas tik tada, kai dirbi?',
            'vertingas_tik_dirbant',
            ['Niekada', 'Beveik niekada', 'Kartais', 'Beveik visada', 'Visada'],
          ),
          _radioRow(
            'Kiek esi patenkintas savo socialiniu gyvenimu?',
            'socialinis_pasit',
            [
              'Labai nepatenkintas',
              'Nepatenkintas',
              'Vidutiniškai',
              'Patenkintas',
              'Labai patenkintas',
            ],
          ),

          const SizedBox(height: 16),
          _sectionTitle('Mintys apie savižudybę (per pastarąjį mėnesį)'),
          _sliderRow('0 – niekada, 10 – visą laiką', _suicidalScale, (v) {
            setState(() => _suicidalScale = v);
            _notify();
          }),

          const Divider(height: 32),
          Row(
            children: [
              Switch(
                value: _isStudent,
                onChanged: (v) {
                  setState(() => _isStudent = v);
                  _notify();
                },
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Esu studentas – rodyti su studijomis susijusią dalį',
                ),
              ),
            ],
          ),

          if (_isStudent) ...[
            const SizedBox(height: 12),
            _sectionTitle('SU STUDIJOMIS SUSIJUSI SAVIJAUTA (0–6)'),
            _hintText(
              '0 – „Niekada“, 1 – „Kelis k./metus ar rečiau“, 2 – „~kartą/mėn.“ '
              '3 – „Kelis k./mėn.“, 4 – „~kartą/sav.“, 5 – „Kelis k./sav.“, 6 – „Kasdien“.',
            ),
            const SizedBox(height: 8),
            ..._studentItems().asMap().entries.map((e) {
              final idx = e.key + 1;
              return _likertItem(idx, e.value, _studentLikert, maxVal: 6);
            }),

            const SizedBox(height: 16),
            _sectionTitle('STRESAS / MIEGAS (studentui)'),
            _sliderRow(
              'Kiek streso patiri įprastą darbo/studijų dieną?',
              _studStressDiena,
              (v) {
                setState(() => _studStressDiena = v);
                _notify();
              },
            ),
            _sliderRow(
              'Kiek streso patiri įprastą savaitgalio dieną?',
              _studStressSavaitgalis,
              (v) {
                setState(() => _studStressSavaitgalis = v);
                _notify();
              },
            ),
            _radioRow('Kaip vertini savo miego kokybę?', 'stud_miego_kokybe', [
              'Labai gerai',
              'Gerai',
              'Vidutiniškai',
              'Blogai',
              'Labai blogai',
            ]),
            _radioRow(
              'Ar didžiąją dalį dienų atsibundi pailsėjęs?',
              'stud_pailsejes',
              ['Ne', 'Taip'],
            ),
            _chipsRow(
              label: 'Kiek valandų vidutiniškai miegi?',
              opts: const [
                '<5 h',
                '~5 h',
                '~6 h',
                '~7 h',
                '~8 h',
                '~9 h',
                '~10 h',
                '>10 h',
              ],
              selectedIdx: _studMiegoValandos,
              onSelected:
                  (i) => setState(() {
                    _studMiegoValandos = i;
                    _notify();
                  }),
            ),
            _chipsRow(
              label: 'Kiek trunka, kol užmiegi?',
              opts: const ['<15 min', '15–30 min', '30–60 min', '>60 min'],
              selectedIdx: _studUzmigimoTrukme,
              onSelected:
                  (i) => setState(() {
                    _studUzmigimoTrukme = i;
                    _notify();
                  }),
            ),
            _chipsRow(
              label: 'Kada įprastai nueini miegoti (darbo/studijų dieną)?',
              opts: const [
                '<20:00',
                '20–21',
                '21–22',
                '22–23',
                '23–24',
                '24–01',
                '>01:00',
              ],
              selectedIdx: _studEinuiMiegoti,
              onSelected:
                  (i) => setState(() {
                    _studEinuiMiegoti = i;
                    _notify();
                  }),
            ),

            const SizedBox(height: 16),
            _sectionTitle('ĮPROČIAI / GEROVĖ (studentui)'),
            _radioRow(
              'Ar nuosekliai skiri papildomo laiko fiziniam aktyvumui?',
              'stud_fizinis',
              [
                'Nesportuoju',
                '<1 h/sav.',
                '1–2 h/sav.',
                '2–4 h/sav.',
                '4–5 h/sav.',
                '>5 h/sav.',
                'Sunku pasakyti',
              ],
            ),
            _radioRow('Ar rūkai?', 'stud_rukai', ['Ne', 'Taip', 'Kita']),
            _radioRow(
              'Kaip dažnai geri alkoholio turinčius gėrimus?',
              'stud_alkoholis',
              [
                'Niekada',
                '1 k./mėn. ar rečiau',
                '2–4 k./mėn.',
                '2–3 k./sav.',
                '≥4 k./sav.',
              ],
            ),
            _radioRow(
              'Kaip vertini gebėjimą susitvarkyti su kylančiais iššūkiais?',
              'stud_isukiai',
              [
                'Labai blogai',
                'Blogai',
                'Vidutiniškai',
                'Gerai',
                'Labai gerai',
              ],
            ),
            _radioRow('Kiek valdai savo kasdienį gyvenimą?', 'stud_kontrole', [
              'Visiškai ne',
              'Dažn. ne',
              'Šiek tiek',
              'Dažn. valdau',
              'Visiškai valdau',
            ]),
            _radioRow(
              'Ar dažnai jauti, kad viskas turi būti padaryta tobulai?',
              'stud_perf_tobulai',
              ['Visiškai ne', 'Retai', 'Kartais', 'Dažnai', 'Visada'],
            ),
            _radioRow(
              'Ar tau sunku deleguoti užduotis kitiems?',
              'stud_perf_deleguoju',
              ['Labai sunku', 'Sunku', 'Kartais', 'Lengva', 'Labai lengva'],
            ),
            _radioRow(
              'Ar dažnai jaudiniesi, kad kiti pastebės tavo klaidas?',
              'stud_perf_klaidu_baime',
              ['Labai dažnai', 'Dažnai', 'Kartais', 'Retai', 'Labai retai'],
            ),
            _radioRow(
              'Ar tau sunku atleisti sau už klaidas?',
              'stud_perf_atleidziu_sau',
              [
                'Labai sunku',
                'Sunku',
                'Vidutiniškai',
                'Lengva',
                'Labai lengva',
              ],
            ),
            _radioRow(
              'Ar tau sunku atleisti kitiems už klaidas?',
              'stud_perf_atleidziu_kitiems',
              [
                'Labai sunku',
                'Sunku',
                'Vidutiniškai',
                'Lengva',
                'Labai lengva',
              ],
            ),
            _radioRow(
              'Ar jautiesi vertingas tik tada, kai mokaisi ar dirbi?',
              'stud_vertingas_tik_mokantis',
              [
                'Niekada',
                'Beveik niekada',
                'Kartais',
                'Beveik visada',
                'Visada',
              ],
            ),
            _radioRow(
              'Kiek esi patenkintas savo socialiniu gyvenimu?',
              'stud_socialinis',
              [
                'Labai nepatenkintas',
                'Nepatenkintas',
                'Vidutiniškai',
                'Patenkintas',
                'Labai patenkintas',
              ],
            ),

            const SizedBox(height: 12),
            _sectionTitle('Mintys apie savižudybę (per pastarąjį mėnesį)'),
            _sliderRow('0 – niekada, 10 – visą laiką', _studSuicide, (v) {
              setState(() => _studSuicide = v);
              _notify();
            }),
          ],

          const SizedBox(height: 32),
        ],
      ),
    );
  }



  List<String> _workItems() => const [
    'Jaučiu, kad darbas mane emociškai išsekina.',
    'Darbo dienos pabaigoje jaučiuosi išeikvojęs jėgas.',
    'Ryte prieš naują darbo dieną jaučiuosi pavargęs.',
    'Galiu lengvai suprasti, kaip jaučiasi mano pacientai.',
    'Jaučiu, kad su kai kuriais pacientais elgiuosi kaip su daiktais.',
    'Dirbdamas su žmonėmis visą dieną tikrai jaučiu įtampą.',
    'Labai veiksmingai tvarkausi su pacientų problemomis.',
    'Jaučiuosi „perdegęs“ nuo savo darbo.',
    'Jaučiu, kad savo darbu darau teigiamą poveikį kitų gyvenimui.',
    'Nuo tada, kai pradėjau dirbti, tapau atsainesnis žmonėms.',
    'Nerimauju, kad dėl šio darbo tampu emociškai šaltesnis.',
    'Jaučiuosi labai energingas.',
    'Darbas man kelia dirglumą ir susierzinimą.',
    'Jaučiu, kad darbas reikalauja per daug pastangų.',
    'Man nelabai rūpi, kas nutinka kai kuriems pacientams.',
    'Tiesioginis darbas su žmonėmis man kelia per didelį stresą.',
    'Lengvai sukuriu beįtampę aplinką bendraudamas su pacientais.',
    'Po tiesioginio darbo su pacientais jaučiuosi pakylėtas.',
    'Šiame darbe esu įgyvendinęs daug vertingų dalykų.',
    'Jaučiuosi ties jėgų ir kantrybės riba.',
    'Emocines problemas darbe sprendžiu ramiai.',
    'Jaučiu, kad pacientai mane kaltina dėl kai kurių savo problemų.',
  ];

  List<String> _studentItems() => const [
    'Mano studijos sekina mane emociškai.',
    'Po studijų dienos jaučiuosi išsisėmęs (-usi).',
    'Ryte prieš naują dieną jaučiuosi nuvargęs (-usi).',
    'Man sunku visą dieną studijuoti ar lankyti paskaitas.',
    'Galiu efektyviai spręsti studijų metu iškylančias problemas.',
    'Jaučiuosi pervargęs (-usi) nuo studijų.',
    'Jaučiu, jog efektyviai prisidedu paskaitų metu.',
    'Dabar mažiau domiuosi studijomis nei pradžioje.',
    'Studijuodamas (-a) jaučiu vis mažiau entuziazmo.',
    'Laikau save geru (-a) studentu (-e).',
    'Pasiekęs (-usi) studijų tikslus, jaučiuosi pakiliai.',
    'Studijuodamas (-a) išmokau daug vertingų dalykų.',
    'Noriu tik mokytis ir būti paliktas (-a) ramybėje.',
    'Vis labiau nusiviliu – studijos atrodo nenaudingos.',
    'Abejoju savo studijų reikšmingumu.',
    'Paskaitų metu jaučiuosi užtikrintai ir efektyviai atlieku užduotis.',
  ];

  Widget _sectionTitle(String s) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      s,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    ),
  );

  Widget _hintText(String s) =>
      Text(s, style: const TextStyle(color: Colors.black54));

  Widget _likertItem(
    int idx,
    String text,
    Map<int, int> store, {
    int maxVal = 6,
  }) {
    final val = store[idx] ?? -1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$idx. $text'),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: -6,
            children: List.generate(maxVal + 1, (i) {
              return ChoiceChip(
                label: Text('$i'),
                selected: val == i,
                onSelected: (_) {
                  setState(() {
                    store[idx] = i;
                    _notify();
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _checkboxGroup({
    required List<String> options,
    required Set<String> selected,
    required ValueChanged<String> onChanged,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: -6,
      children:
          options.map((o) {
            final isSel = selected.contains(o);
            return FilterChip(
              label: Text(o),
              selected: isSel,
              onSelected: (_) => onChanged(o),
            );
          }).toList(),
    );
  }

  Widget _textfield(String label, TextEditingController c, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: c,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: 'Įrašyk čia...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(12),
          ),
          onChanged: (_) => _notify(),
        ),
      ],
    );
  }

  Widget _radioRow(String label, String key, List<String> options) {
    final t = Theme.of(context).textTheme;
    final sel = _radio5[key] ?? -1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: t.bodyLarge),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: -6,
            children: List.generate(options.length, (i) {
              return ChoiceChip(
                label: Text(options[i]),
                selected: sel == i,
                onSelected: (_) {
                  setState(() {
                    _radio5[key] = i;
                    _notify();
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _chipsRow({
    required String label,
    required List<String> opts,
    required int selectedIdx,
    required ValueChanged<int> onSelected,
  }) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: t.bodyLarge),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: -6,
            children: List.generate(opts.length, (i) {
              return ChoiceChip(
                label: Text(opts[i]),
                selected: selectedIdx == i,
                onSelected: (_) => onSelected(i),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _sliderRow(
    String label,
    double value,
    ValueChanged<double> onChanged,
  ) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label  (${value.toStringAsFixed(0)}/10)', style: t.bodyLarge),
          Slider(
            value: value,
            min: 0,
            max: 10,
            divisions: 10,
            label: value.toStringAsFixed(0),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class EmociniuPokyciuRezultataiBlock extends StatelessWidget {
  const EmociniuPokyciuRezultataiBlock({
    super.key,
    required this.depresijaBuvo,
    required this.depresijaDabar,
    required this.nerimasBuvo,
    required this.nerimasDabar,
    required this.savijautaBuvo,
    required this.savijautaDabar,
    required this.atsistatymasBuvo,
    required this.atsistatymasDabar,
    required this.perdegimoPokytisText, /
  });

  final int depresijaBuvo; 
  final int depresijaDabar; 
  final int nerimasBuvo; 
  final int nerimasDabar; 
  final int savijautaBuvo; 
  final int savijautaDabar;
  final int atsistatymasBuvo; 
  final int atsistatymasDabar; 
  final String perdegimoPokytisText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    Widget line(String title, String body) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: theme.bodyLarge,
          children: [
            TextSpan(
              text: title,
              style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const TextSpan(text: ' '),
            TextSpan(text: body),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Štai tavo emocinių pokyčių rezultatai:',
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),

     
          line(
            'Depresijos skalėje tavo rezultatas buvo $depresijaBuvo, o dabar – $depresijaDabar (min 0, max 27).',
            'Mažesnis balas rodo mažesnį depresiškumą.',
          ),

         
          line(
            'Nerimo skalėje tavo rezultatas buvo $nerimasBuvo, o dabar – $nerimasDabar (min 0, max 21).',
            'Mažesnis balas rodo mažesnį nerimastingumą.',
          ),

        
          line(
            'Savijautos skalėje tavo rezultatas buvo $savijautaBuvo, o dabar – $savijautaDabar (min 0, max 25).',
            'Didesnis balas rodo geresnę savijautą.',
          ),

         
          line(
            'Atsistatymo nuo streso skalėje tavo rezultatas buvo $atsistatymasBuvo, o dabar – $atsistatymasDabar (min 16, max 64).',
            'Didesnis balas rodo geresnį atsistatymą nuo streso.',
          ),

          
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Tavo perdegimo lygis $perdegimoPokytisText.',
              style: theme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class UzpildytosSkalesBlock extends StatelessWidget {
  final VoidCallback? onNext; 
  const UzpildytosSkalesBlock({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Užpildei visas visas skales, ačiū Tau. '
            'Lauksiu paskutinėje užduotyje.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          if (onNext != null) ...[
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Tęsti'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SodoBalsoUzduotisBlock extends StatefulWidget {
  final VoidCallback? onTestiBeIrasymo;
  final VoidCallback? onTestiPoIrasymo;

  const SodoBalsoUzduotisBlock({
    super.key,
    this.onTestiBeIrasymo,
    this.onTestiPoIrasymo,
  });

  @override
  State<SodoBalsoUzduotisBlock> createState() => _SodoBalsoUzduotisBlockState();
}

class _SodoBalsoUzduotisBlockState extends State<SodoBalsoUzduotisBlock> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pameni, pačioje pradžioje prašiau įsivaizduoti sodą ir nupasakoti jį balsu?\n'
            'Tad noriu paprašyti šiandien padaryti Tavęs tą patį.\n\n'
            'Įsivaizduok sodą, kuriame Tau būtų malonu ir gera.\n\n'
            'Paprašysiu paspausti balso įrašymo mygtuką ir kelias minutes pakalbėti apie Sodą, '
            'ką jame matai, kas vyksta. Kai jausi, kad kalbėti jau nebesinori – sustabdyk įrašymą. '
            'Tavo balso įrašas labai svarbus moksliniais tikslais - reikalingas mokytis iš balso nustatyti '
            'nuotaikos, charakterio ir kitus aspektus. O Tau ši praktika gali padėti įkūnyti ramybės pojūtį savyje.\n\n'
            'Jeigu nenori įrašinėti savo balso – gali paspausti mygtuką – „Tęsti be įrašymo”.',
            style: theme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

       
          Row(
            children: [
              Icon(Icons.mic, color: _isRecording ? Colors.red : Colors.grey),
              const SizedBox(width: 8),
              Text(
                _isRecording
                    ? 'Įrašymas vyksta (maketas)'
                    : 'Įrašymas nestartavęs',
                style: theme.bodyMedium?.copyWith(
                  color: _isRecording ? Colors.red[700] : Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

         
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() => _isRecording = !_isRecording);
                },
                icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                label: Text(
                  _isRecording ? 'Sustabdyti įrašymą' : 'Pradėti įrašymą',
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: widget.onTestiBeIrasymo,
                child: const Text('Tęsti be įrašymo'),
              ),
              const Spacer(),
              if (_isRecording)
                ElevatedButton(
                  onPressed: widget.onTestiPoIrasymo,
                  child: const Text('Tęsti →'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}


class CharakterioSkalePage extends StatefulWidget {
  final VoidCallback? onNext;
  const CharakterioSkalePage({super.key, this.onNext});

  @override
  State<CharakterioSkalePage> createState() => _CharakterioSkalePageState();
}

class _CharakterioSkalePageState extends State<CharakterioSkalePage> {
  final Map<int, int?> atsakymai = {};

  final List<String> klausimai = [
    "Aš esu draugiškas/a, socialus/i",
    "Aš esu užjaučiantis/i, geraširdis/ė",
    "Aš esu kažkiek dezorganizuotas/a",
    "Aš esu atsipalaidavęs/usi, lengvai susidorojantis/i su stresu",
    "Aš esu mažai besidomintis/i menu",
    "Aš esu atkakliai siekiantis/i savo tikslo",
    "Aš esu pagarbus/i, pagarbiai besielgiantis/i su kitais",
    "Aš esu linkęs/usi tingėti",
    "Aš esu išliekantis/i optimistu/e po susidūrimo su kliūtimis",
    "Aš esu besidomintis/i daugeliu skirtingų dalykų",
    "Aš retai jaučiuosi susijaudinęs/usi ar nekantrus/i",
    "Aš esu linkęs/usi kritikuoti kitus",
    "Aš esu patikimas/a, pastovus/i",
    "Aš esu nepastovios nuotaikos, patiriantis/i nuotaikų svyravimus",
    "Aš esu išradingas/a, atrandantis/i protingus būdus darbui atlikti",
    "Aš esu linkęs/usi tylėti",
    "Aš jaučiu mažai užuojautos kitiems",
    "Aš esu sistemingas/a, mėgstantis/i tvarką",
    "Aš kartais įsitempiu",
    "Aš esu susižavėjęs/usi menu, muzika ar literatūra",
    "Aš esu dominuojantis/i, besielgiantis/i kaip lyderis",
    "Aš esu tas/a, kuris/i pradeda ginčytis su kitais",
    "Aš esu tas/a, kuriam/iai sunku pradėti vykdyti užduotį",
    "Aš dažniausiai jaučiuosi saugiai, pasitikiu savimi",
    "Aš vengiu intelektualių, filosofinių diskusijų",
    "Aš esu mažiau aktyvus/i nei kiti žmonės",
    "Aš esu iš prigimties atlaidus/i",
    "Aš kartais esu kažkiek nerūpestingas/a",
    "Aš esu emociškai stabilus/i, ne itin lengvai nuliūstu",
    "Aš nesu itin kūrybingas/a",
    "Aš kartais esu drovus/i, intravertiškas/a",
    "Aš padedu kitiems ir nesu savanaudiškas/a",
    "Mano daiktai dažniausiai yra švarūs ir tvarkingi",
    "Aš daug nerimauju",
    "Aš vertinu meną ir grožį",
    "Aš jaučiu, kad man sunku daryti įtaką kitiems žmonėms",
    "Aš kartais esu šiurkštus/i su kitais",
    "Aš esu produktyvus/i, padarau darbus",
    "Aš dažnai jaučiuosi liūdnai",
    "Aš esu sudėtingas/a, giliai mąstantis/i",
    "Aš esu kupinas/a energijos",
    "Aš esu įtarus/i dėl kitų žmonių ketinimų",
    "Aš esu patikimas/a, manimi galima pasikliauti",
    "Aš kontroliuoju savo emocijas",
    "Man sunku ką nors įsivaizduoti",
    "Aš esu kalbus/i",
    "Aš kartais būnu šaltas/a ir beširdis/ė",
    "Aš dažnai palieku netvarką, nesitvarkau",
    "Aš retai jaučiu nerimą ar baimę",
    "Man poezija ir spektakliai atrodo nuobodūs",
    "Aš noriu, kad atsakomybę prisiimtų kiti",
    "Aš esu mandagus/i, paslaugus/i kitiems",
    "Aš esu atkalus/i – dirbu, kol baigiu užduotį",
    "Aš esu linkęs/usi į liūdesį",
    "Aš nesidomiu abstrakčiomis idėjomis",
    "Aš esu labai entuziastingas/a",
    "Aš apie kitus žmones mąstau teigiamai",
    "Aš kartais pasielgiu neatsakingai",
    "Aš esu temperamentingas/a, lengvai sujaudinamas/a",
    "Aš esu originalus/i, kupinas/a naujų idėjų",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Na, ir dar liko paskutinė skalė, kurios nenorėjau Tau pateikti praėjusį kartą, nes ir taip daug vargelio buvo tiek klausimų atsakyt. "
            "Tad kviečiu dabar užpildyti skalę apie Tavo charakterio savybes, kurią pildei ir Sodo programos pradžioje.\n\n"
            "Įdomu, ką šį kartą parodys ši skalė.\n\n"
            "Pažymėk skaičių prie kiekvieno teiginio:\n"
            "1 – Visiškai nesutinku  •  2 – Iš dalies nesutinku  •  3 – Nei sutinku, nei nesutinku  •  4 – Iš dalies sutinku  •  5 – Visiškai sutinku",
            style: theme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),

          SingleChildScrollView(
            child: Column(
              children: List.generate(klausimai.length, (index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ${klausimai[index]}",
                          style: theme.bodyLarge,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: List.generate(5, (i) {
                            final value = i + 1;
                            final selected = atsakymai[index] == value;
                            return ChoiceChip(
                              label: Text("$value"),
                              selected: selected,
                              onSelected: (_) {
                                setState(() => atsakymai[index] = value);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}


class CharakterioRezultataiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const CharakterioRezultataiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Štai tavo charakterio savybių pokyčių rezultatai:",
            style: t.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Ekstraversija, Tavo balas dabar – 34, o buvo - . "
                  "Kuo aukštesnis balas, tuo žmogus labiau ryžtingas, kalbus ir energingas socialinėse situacijose.\n",
                ),
                Text(
                  "Sutarumas, Tavo balas dabar – 45, o buvo - . "
                  "Kuo balas aukštesnis, tuo labiau linkęs eiti į kompromisus, padedantis, empatiškas.\n",
                ),
                Text(
                  "Sąmoningumas, Tavo balas dabar – 37, o buvo - . "
                  "Kuo balas aukštesnis, tuo labiau planuoja, organizuoja ir laikosi įsipareigojimų.\n",
                ),
                Text(
                  "Neurotiškumas, Tavo balas dabar – 37, o buvo - . "
                  "Kuo balas aukštesnis, tuo jautresnė reakcija į neigiamus stimulus, daugiau nerimo/dirglumo.\n",
                ),
                Text(
                  "Atvirumas patirčiai, Tavo balas dabar – 45, o buvo - . "
                  "Kuo balas aukštesnis, tuo daugiau kūrybiškumo, domėjimosi naujomis idėjomis ir estetika.\n",
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}


class SkalemsAciuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SkalemsAciuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Užpildei visas visas skales, ačiū Tau. Lauksiu paskutinėje užduotyje.",
            style: t.bodyLarge,
          ),
          const Spacer(),
          if (onNext != null)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text("Tęsti"),
              ),
            ),
        ],
      ),
    );
  }
}

class PaskutineUzduotisPage extends StatefulWidget {
  final VoidCallback? onNext;
  const PaskutineUzduotisPage({super.key, this.onNext});

  @override
  State<PaskutineUzduotisPage> createState() => _PaskutineUzduotisPageState();
}

class _PaskutineUzduotisPageState extends State<PaskutineUzduotisPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Štai ir atėjo paskutinė šios programos užduotis. "
            "Nors Sodo programa baigiasi, bet tikiuosi, kad rūpinimasis savimi – ne.\n\n"
            "Tad kviesiu Tave parašyti laišką sau. "
            "Parašyti laišką sau po vienerių metų. "
            "Tarsi rašytum sau į ateitį – ką norėtum sau pasakyti, palinkėti, pasiūlyti, patarti, ar gal tiesiog pasidalinti.",
            style: t.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          TextField(
            controller: _controller,
            maxLines: null,
            expands: true,
            decoration: const InputDecoration(
              hintText: "Čia parašyk savo laišką sau...",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class LaiskoInstrukcijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const LaiskoInstrukcijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ". Kviečiu šį laišką rašyti ant popieriaus, įdėti į voką ir nusistayti priminimą, kad po metų pažiūrėti. "
            "Arba gali rašyti elektroniškai ir nustatyti, kad išsiųstų po metų. "
            "Būna labai įdomu perskaityti tokisu laiškus, jau iš praeities!\n\n"
            "Skirk sau laiko, jei negali to padaryti dabar – nusistatyk priminimą ir padaryk kiek vėliau ar rytoj, "
            "bet labai rekomenduoju parašyti tokį laišką 😊",
            style: t.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class PabaigosTekstasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const PabaigosTekstasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Na tai ką, baigėsi… Kaip tau ši Sodo programa? "
            "Kas labiausiai įsiminė, patiko? Kas nepatiko?\n\n"
            "Jeigu turi pasiūlymų, komentarų, ar tiesiog nori kuo pasidalinti, gali parašyti: "
            "kamile.pociute@mf.vu.lt.\n\n"
            "Linkiu tau viso ko geriausio!",
            style: t.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class PabaigosTekstasPage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const PabaigosTekstasPage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gero gyvenimo! Iki!",
            style: t.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

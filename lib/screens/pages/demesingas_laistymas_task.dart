import 'package:flutter/material.dart';

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
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  );
}

class MotyvacijosIvedimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MotyvacijosIvedimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Noriu dar šiek tiek pratęsti apie motyvaciją, toliau pateiksiu medžiagą, '
        'kurioje matysi kliūtis, su kuriomis gali susidurti atliekant Sodo praktikas '
        '(ar kitur) ir ką su tuo daryti.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KliutysIrSprendimaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KliutysIrSprendimaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final items = <_KliutisItem>[
      _KliutisItem(
        pavadinimas: 'Neturiu motyvacijos',
        aprasymas:
            'Motyvacija→Veiksmas→Rezultatas→Motyvacija yra tik vienas iš būdų įsivažiuoti. '
            'Kuo ilgiau nieko nedarome, tuo labiau ji mažėja, o nusivylimas auga. '
            'Jei tiesiog imames veiksmų, dažnai pamatome, kad aktyvumui augant – auga ir motyvacija. '
            'Todėl gali veikti schema: Veiksmas → Rezultatas → Motyvacija → Veiksmas …',
        kaipElgtis: 'Atlikti tai, ką esi suplanavęs šiai dienai ar savaitei.',
      ),
      _KliutisItem(
        pavadinimas: 'Šie pratimai man nepatinka',
        aprasymas:
            'Vis dėlto gyvenime būna situacijų, kai norisi geriau valdyti stresą ir jaustis tvirčiau. '
            'Kai kuriems sportiniai pratimai patinka, kitiems – ne, tačiau reguliariai atliekami naudingi visiems.',
        kaipElgtis:
            'Susidaryti sau priimtiną pratybų planą ir tam tikrą laiką nuosekliau jo laikytis.\n'
            'Kartą per mėnesį įsivertinti pokyčius.',
      ),
      _KliutisItem(
        pavadinimas: 'Esu per daug pavargęs',
        aprasymas:
            'Taip dabar atrodo, bet aš nežinau, ar su šiandienos nuovargiu galiu atlikti pratimus. '
            'Pamėginsiu ir sužinosiu.',
        kaipElgtis: 'Padaryti pratimą su mažesniu įsitraukimu.',
      ),
      _KliutisItem(
        pavadinimas: 'Niekas nesikeičia',
        aprasymas:
            'Ar šis apibendrinimas tiksliai atspindi visą patirtį? '
            'Ar tikrai nepastebėjau jokių pasikeitimų? '
            'Gal trukdo labai dideli lūkesčiai?',
        kaipElgtis:
            'Sąmoningai stebėti savo patirtį.\n'
            'Užsirašyti pastebėtus, net ir mažus, pokyčius.',
      ),
      _KliutisItem(
        pavadinimas: 'Neturiu valios',
        aprasymas:
            'Kasdieniniai dalykai (keltis, rengtis, dirbti) jau rodo, kad valios turiu. '
            'Ar žinau, kas ją stiprina/silpnina? Ar tuo remiuosi save pastiprindamas?',
        kaipElgtis:
            'Vesti trumpas pastabas apie praktikas.\n'
            'Susirasti palaikantį žmogų ir dalintis įžvalgomis.\n'
            'Galbūt kartu atlikti pratimus.',
      ),
      _KliutisItem(
        pavadinimas: 'Tai ne man',
        aprasymas:
            'Galbūt naudinga, galbūt ne. Vienintelis būdas sužinoti – išmėginti.',
        kaipElgtis:
            'Atlikti praktikas iki galo ir pasižiūrėti, ar įvyko pokytis.',
      ),
      _KliutisItem(
        pavadinimas: 'Kyla diskomfortas',
        aprasymas:
            'Pirmiausia kuo aiškiau įsisąmoninti, kur ir ką jaučiu, tada pasirinkti kryptį.',
        kaipElgtis:
            '1) Sutelkti dėmesį į diskomfortą ir keletą minučių ramiai juo pakvėpuoti.\n'
            '2) Nukreipti dėmesį į kitą objektą ir po kelių minučių pastebėti pokytį.\n'
            '3) Dėmesingai užsiimti kita veikla – praktiką praleisti ir eiti prie kitos.',
      ),
      _KliutisItem(
        pavadinimas: 'Jau praleidau kelias dienas',
        aprasymas:
            'Visiems pasitaiko nukrypti nuo plano. Praeities nepakeisiu, bet galiu keisti dabartį ir ateitį.',
        kaipElgtis: 'Leisti sau grįžti prie netobulų pratybų 😊',
      ),
    ];

    return _page([
      ...items.map((it) => _KliutisCard(item: it, theme: theme)),
      _NextButton(onNext),
    ]);
  }
}

class _KliutisCard extends StatelessWidget {
  final _KliutisItem item;
  final TextTheme theme;
  const _KliutisCard({required this.item, required this.theme});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final labelStyle = theme.labelLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: scheme.primary,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withOpacity(0.18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: scheme.primary.withOpacity(0.28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _kvRow('Kliūtis', Text(item.pavadinimas, style: theme.titleMedium)),
          const SizedBox(height: 8),
          _kvRow(
            'Aprašymas',
            Text(
              item.aprasymas,
              style: theme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            labelStyle: labelStyle,
          ),
          const SizedBox(height: 8),
          _kvRow(
            'Kaip elgtis',
            _bulletsFrom(item.kaipElgtis, theme),
            labelStyle: labelStyle,
          ),
        ],
      ),
    );
  }

  Widget _kvRow(String label, Widget value, {TextStyle? labelStyle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(label, style: labelStyle ?? theme.labelLarge),
        ),
        const SizedBox(width: 8),
        Expanded(child: value),
      ],
    );
  }

  Widget _bulletsFrom(String text, TextTheme theme) {
    final lines =
        text
            .split('\n')
            .map((l) => l.trim())
            .where((l) => l.isNotEmpty)
            .toList();

    if (lines.length <= 1) {
      return Text(text, style: theme.bodyLarge, textAlign: TextAlign.justify);
    }

    final numeruota = RegExp(r'^\d+\)');
    final isNumbered = lines.every((l) => numeruota.hasMatch(l));

    if (isNumbered) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...lines.map((l) {
            final match = RegExp(r'^(\d+)\)\s*(.*)$').firstMatch(l);
            final nr = match?.group(1) ?? '';
            final body = match?.group(2) ?? l;
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    child: Text('$nr)', style: theme.bodyLarge),
                  ),
                  const SizedBox(width: 6),
                  Expanded(child: Text(body, style: theme.bodyLarge)),
                ],
              ),
            );
          }),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...lines.map(
          (l) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(child: Text(l, style: theme.bodyLarge)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _KliutisItem {
  final String pavadinimas;
  final String aprasymas;
  final String kaipElgtis;
  _KliutisItem({
    required this.pavadinimas,
    required this.aprasymas,
    required this.kaipElgtis,
  });
}

class MotyvacijosEsmePage extends StatelessWidget {
  final VoidCallback? onNext;
  const MotyvacijosEsmePage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Pagrindinis dalykas, ką noriu perduoti apie motyvaciją – jog sunkiausia pradėti. '
        'Tad svarbiausia – pradėti, o motyvacija ateis iš paskos.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class SavimasazoKvietimasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SavimasazoKvietimasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dar vienas būdas save motyvuoti – apdovanoti. Tad kviečiu tave savimasažui! '
        'Taip taip! Kviečiu skirti 5 minutes ir pamasažuoti save – tai gali būti kaklo sritis, '
        'ten daugiausiai kaupiasi įtampa ar bet kuri kita vieta.\n\n'
        'Tad gali pabaigti šią užduotį ir skirti laiko masažui, o gal net norėtum skirti laiko '
        'ir užsiregistruoti į masažą!\n\n'
        'Iki!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class MiegoHigienaIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MiegoHigienaIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Šiandien noriu priminti Tau miego higienos principus, '
        'turbūt nepasakysiu nieko naujo, bet, jeigu turi sunkumų dėl miego – '
        'bus gera proga stabtelti ir prisiminti, o gal net įsipareigoti kažką dėl to daryti. '
        'Jeigu neturi sunkumų dėl miego – daug dėmesio šiai užduočiai neverta skirti, '
        'bet gal vis tiek įžvelgsi kokios naudos.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class MiegoHigienosPrincipaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const MiegoHigienosPrincipaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final taisykles = const [
      'Stenkis kasdien keltis tuo pačiu metu, net jei naktį prastai miegojai – taip organizmas pripras prie pastovaus ritmo.',
      'Užmik iki vidurnakčio.',
      'Miegamasis turėtų būti skirtas tik miegui. Lovoje reikėtų vengti kitokios veiklos – neskaityti, nežiūrėti TV, nedirbti, nenaudoti telefono.',
      'Jeigu neužmiegi per maždaug 20 minučių, atsikelk ir grįžk tik tada, kai vėl pasijunti apsnūdęs.',
      'Jei sunku užmigti dėl minčių srauto, naudok vaizdinius arba užrašyk mintis iš anksto.',
      'Nevyk kovos su mintimis ir nemėgink pernelyg kontroliuoti miego.',
      'Venk pogulių dieną.',
      'Ribok kofeiną, venk alkoholio, saldumynų, rūkymo ir ryškios šviesos vakare.',
      'Vakarienei venk riebaus, sunkiai virškinamo maisto, bet ir neik miegoti alkanas.',
      'Reguliari fizinė veikla gerina miego kokybę, bet 4 val. prieš miegą rinkis ramesnius užsiėmimus.',
      'Kambarys miegui turėtų būti vėsus, tamsus ir tylus.',
      'Valandą prieš miegą venk žiūrėti į ekranus.',
      'Sukurk ritualą prieš miegą ir kartok jį kas vakarą.',
      'Prabudęs naktį – netikrink laikrodžio.',
      'Gali rašyti miego dienoraštį ir pasidalinti su specialistu.',
    ];
    return _page([
      const _H2('Tad primenu svarbiausius dalykus:'),
      ...taisykles.map((t) => _Bullet(t)),
      _NextButton(onNext),
    ]);
  }
}

class MiegoIpareigojimasPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MiegoIpareigojimasPage({super.key, this.onNext});

  @override
  State<MiegoIpareigojimasPage> createState() => _MiegoIpareigojimasPageState();
}

class _MiegoIpareigojimasPageState extends State<MiegoIpareigojimasPage> {
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
        'O dabar kviečiu įsipareigoti ir žemiau esančiame langelyje parašyti, '
        'ką gali padaryti/pradėti jau šiandien, kad tavo miegas būtų kokybiškesnis. '
        'Parašyk kuo konkrečiau.\n\n'
        'Pavyzdys:\n'
        'Šiandien eisiu miegoti iki 23:00 ir nenaršysiu telefone, kai atsigulsiu.',
      ),
      TextField(
        controller: _controller,
        maxLines: 4,
        decoration: _inputDecoration(hint: 'Įrašyk savo įsipareigojimą...'),
      ),
      _NextButton(widget.onNext),
    ]);
  }
}

class LinkiuGeroMiegoPage extends StatelessWidget {
  final VoidCallback? onNext;
  const LinkiuGeroMiegoPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P('Linkiu tau šiąnakt gero miego ir iki kito susitikimo.'),
      _NextButton(onNext),
    ]);
  }
}

class LinkiuGeroMiegoPage1 extends StatelessWidget {
  final VoidCallback? onNext;
  const LinkiuGeroMiegoPage1({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P('Linkiu tau šiąnakt gero miego ir iki kito susitikimo.'),
      _NextButton(onNext),
    ]);
  }
}

class KlausimaiApieMitybaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KlausimaiApieMitybaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kviečiu perskaityti ir sau atsakyti į klausimus apie mitybą.\n\n'
        'Kokia tavo mityba?\n'
        'Ar maitiniesi pakankamai gerai?\n'
        'Kaip manai, ko dar trūksta tavo mitybos įpročiuose?\n'
        'Ar yra, ką norėtum pakeisti?\n'
        'Ką sau rekomenduotum mitybos klausimais?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class MitybosPokyciaiPage extends StatefulWidget {
  final VoidCallback? onNext;
  const MitybosPokyciaiPage({super.key, this.onNext});

  @override
  State<MitybosPokyciaiPage> createState() => _MitybosPokyciaiPageState();
}

class _MitybosPokyciaiPageState extends State<MitybosPokyciaiPage> {
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
        'Prašau, įrašyk du svarbiausius dalykus, kaip norėtum keisti savo mitybos įpročius, '
        'kad tavo sveikata būtų geresnė?\n'
        'Gali dar pagalvoti ir parašyti, kas tau padėtų įgyvendinti pokyčius.\n\n'
        'Pavyzdžiui: „Norėčiau valgyti daugiau įvairių daržovių. '
        'Kai valgau ne namuose, visuomet galiu užsisakyti patiekalą, kuriame bus daržovių; '
        'galėčiu pabandyti prisiminti ir visuomet, kai einu į parduotuvę maisto, '
        'nusipirkti bent trijų spalvų daržovių.”',
      ),
      TextField(
        controller: _controller,
        maxLines: 6,
        decoration: _inputDecoration(hint: 'Įrašyk savo mitybos pokyčius...'),
      ),
      _NextButton(widget.onNext),
    ]);
  }
}

class DemesingasValgymasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const DemesingasValgymasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dėmesingų ir puoselėjančių valgymo patirčių!',
        align: TextAlign.center,
      ),
      _NextButton(onNext),
    ]);
  }
}

class VandensSvarbaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VandensSvarbaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Tiesiog noriu priminti ir paskatinti nepamiršti dar vienos svarbios temos – vandens. '
        'Ar žinojai, kad bėgant metams, žmogus jaučia mažiau troškulio? '
        'Tad formuoti įprotį gerti vandenį – net ir nesant troškulio, gali būti nepaprastai svarbus. '
        'Įdomu, kiek išgėrei vandens šiandien? O gal pameni, kiek vakar?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KiekVandensReikiaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KiekVandensReikiaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'O kiek vandens reikia išgerti? Tikslaus atsakymo negaliu duoti, tai gan individualu, '
        'priklauso nuo žmogaus sudėjimo, veiklos (daug judančiam reikės daugiau), aplinkos temperatūros, '
        'kūno temperatūros ir kitų veiksnių.\n\n'
        'Dažniausiai įvairiuose šaltiniuose galima rasti, kad reikia išgerti apie 10 ml vienam ūgio centimetrui '
        '(jei ūgis – 160 cm, tai 1,6 l) arba 30 ml vienam kilogramui (jei svoris – 70 kg, tai 2,1 l). '
        'Kaip ir trūkumas, vandens perteklius taip pat gali būti žalingas kūnui, tad svarbiausia – balansas. '
        'Vis dėlto, dažnas žmogus skysčių gauna mažiau, nei jam reikia, tad didesnė problema – nepakankamas vandens gėrimas.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class VandensUzdotisPage extends StatelessWidget {
  final VoidCallback? onNext;
  const VandensUzdotisPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'O dabar noriu pakviesti Tave trumpai užduočiai – jeigu turi galimybę – '
        'įsipilk stiklinę vandens, dėmesingai patyrinėk keletą sekundžių ir išgerk. '
        'Jeigu nori – galima dar ir padėkoti pasauliui, žemei, Dievui ar tiesiog – kad galime gerti švarų vandenį.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class SiltuLinkejimuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SiltuLinkejimuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P('Siunčiu Tau šiltus linkėjimus!', align: TextAlign.center),
      _NextButton(onNext),
    ]);
  }
}

class FizinisAktyvumasIvadasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const FizinisAktyvumasIvadasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dar liko stabtelti ties fiziniu aktyvumu. Kaip ir su miegu ir mityba, manau, čia kaip ir viskas aišku – žmogui reikia pajudėti, kad būtų sveikas.\n\n'
        'Yra tokių mokslinių tyrimų, kurie net randa, jog esant tam tikriems diagnozuotiems psichikos sutrikimams – sportas gali būti tiek pat efektyvus ar net efektyvesnis nei vaistai!\n\n'
        'Na, judėjimo svarba tikrai nenuginčijama, bet daugelis sutiks, kad taip sunku kartais prisiversti…',
      ),
      _NextButton(onNext),
    ]);
  }
}

class FizinisAktyvumasKlausimaiPage extends StatelessWidget {
  final VoidCallback? onNext;
  const FizinisAktyvumasKlausimaiPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'O koks tavo fizinis aktyvumas? Ar yra, ką norėtum pakeisti? '
        'Jeigu taip, gal gali tai pradėti daryti šiandien ar rytoj?\n\n'
        'Tik, kaip ir visame – svarbu balansas. Kai kūnas pervargęs ir nualintas – '
        'intensyvi fizinė veikla nėra tinkama. Svarbu būti pastabiam sau, bet nepamiršti pajudėti!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class RaumenuRelaksacijaIntroPage extends StatelessWidget {
  final VoidCallback? onNext;
  const RaumenuRelaksacijaIntroPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'O dabar noriu pakviesti Tave raumenų relaksacijos pratimui. Būtų gerai, jei galėtum sėdėti.\n\n'
        'Šios relaksacijos metu girdėsi balso įrašą, kuris kvies palaipsniui įtempti ir atpalaiduoti tam tikras raumenų grupes.\n\n'
        'Jeigu kažkurių kūno dalių įtempti negali – viskas gerai, tiesiog gali įtempinėti savo pasirinktas raumenų grupes, '
        'pavyzdžiui, tik rankas ar spausti ir atleisti kumščius.\n\n'
        'Jeigu esi viešoje vietoje ir nenori, kad kiti matytų, kad šiuo metu darai relaksaciją – gali visos relaksacijos metu '
        'įtempinėti tik sėdmenų raumenis ir likti nepastebėtu!',
      ),
      _NextButton(onNext),
    ]);
  }
}

class SportoMotyvacijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SportoMotyvacijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Galbūt dabar yra puikus metas užsiregistruoti, pavyzdžiui, naujam sporto užsiėmimui? '
        'Masažui? O gal tiesiog pasukioti kaklą bei pečius, pamankštinti žandikaulį – '
        'visos šios vietos neretai būna gana įsitempusios.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class IsbuvimoPraktikaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const IsbuvimoPraktikaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Dar šiek tiek apie kūną, o taip pat ir emocijas, iš kitos perspektyvos – išbuvimo.\n\n'
        'Minėjau, kad karts nuo karto pakviesiu Tave Mindfulness praktikoms. Šios praktikos metu '
        'kviesiu Tave nukreipti dėmesį į tam tikras kūno dalis. Tokios praktikos lavina smegenis '
        'valdyti dėmesį, įsisąmoninti emocijas, išbūti su diskomfortu ir apskritai, ilgainiui, '
        'pasidaro lengviau reguliuoti emocijas, jausti mažiau įtampos.\n\n'
        'Tad kviečiu trumpam stabtelti, nebūtina būti labai ramioje vietoje, gali būti ir triukšme, '
        'bet būtų gerai, kad keletą minučių Tavęs netrukdytų kiti žmonės.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KunoSkenavimoPraktikaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KunoSkenavimoPraktikaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final body = Theme.of(context).textTheme.bodyLarge;
    return _page([
      Text(
        'Kūno skenavimo praktika.',
        style: body,
        textAlign: TextAlign.center,
      ),
      _NextButton(onNext),
    ]);
  }
}

class KunoSkenavimoRefleksijaPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KunoSkenavimoRefleksijaPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Kviečiu trumpam pareflektuoti praktiką. Ši praktika nebūtinai turi sukelti atsipalaidavimo pojūčius, '
        'ne retam, tai būna ir diskomfortiška patirtis, kitiems sukelia mieguistumą, bet būna ir taip, '
        'kad žmonės praktikos metu ar po jos – pajunta atsipalaidavimo būseną. Tad kviečiu trumpai stabtelti ir atsakyti į šiuos klausimus:',
      ),
      const _Bullet('Ką patyriau praktikos metu?'),
      const _Bullet('Kiek pavyko sekti vedančiosios balsą?'),
      const _Bullet('Kokių minčių kilo praktikos metu?'),
      const _Bullet('Ką jaučiu dabar?'),
      const _Bullet('Ką dar pastebėjau?'),
      _NextButton(onNext),
    ]);
  }
}

class IsbutiSuDiskomfortuPage extends StatelessWidget {
  final VoidCallback? onNext;
  const IsbutiSuDiskomfortuPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Tokių praktikų metu galime patirti diskomfortą, pavyzdžiui, pradeda darytis nemalonu sėdėti ir mes pakeičiame poziciją, '
        'arba jaučiame niežėjimą – ir pasikasome, arba pradeda kilti nerimas – ir mes nutraukiame praktiką. '
        'Tokių situacijų metu – labai svarbu rinktis, galime sąmoningai apsispręsti ir nutraukti kentėjimą, jeigu pavyksta, '
        'arba tiesiog pabūti su tuo nemaloniu pojūčiu, kol jis praeina.\n\n'
        'Ne retai – nevengiant skausmo, o į jį atsigręžiant ir pabūnant – ilgainiui skausmas sumažėja žymiai greičiau, '
        'nei vis bandant jo išvengti – toks skausmas gali tapti lėtiniu.\n\n'
        'Mokytis būti su diskomfortu ir vis tiek jausti gyvenimo pilnatvę – gali būti itin prasminga. '
        'O išbūti su skausmu ir diskomfortu neįsitraukiant į papildomą kentėjimą dėl skausmo – jau aukštasis pilotažas.',
      ),
      const _Quote(
        'Kai pasirodys nemalonūs jausmai –\n'
        'pyktis, nerimas ar liūdesys –\n'
        'kviesk juos arbatos.\n'
        'Nekovok su jais.\n'
        'Neversk jų išeiti.\n'
        'Tiesiog klausykis.\n'
        'Kas žino – gal tas skausmas\n'
        'ir yra būdas pasiekti sielos sodą.',
      ),
      _NextButton(onNext),
    ]);
  }
}

class RefleksijaApieKunoPoreikiusPage extends StatelessWidget {
  final VoidCallback? onNext;
  const RefleksijaApieKunoPoreikiusPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Įdomu, kaip Tau sekasi rūpintis savo kūno poreikiais. '
        'Kuo pasirūpinti lengviausia, kuo sunkiausia? '
        'Kaip sekasi būti su skausmu? '
        'Ar pavyksta patirti džiaugsmo akimirkų?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KunoPoreikiaiPapildymasPage extends StatelessWidget {
  final VoidCallback? onNext;
  const KunoPoreikiaiPapildymasPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Galbūt kilo minčių, ką dar norėtum padaryti dėl savęs, savo kūno? '
        'Galbūt turi žalingų įpročių, kurių norėtum atsisakyti? '
        'Kas padėtų Tau tai padaryti?',
      ),
      _NextButton(onNext),
    ]);
  }
}

class KunoIprociaiPage extends StatefulWidget {
  final VoidCallback? onNext;
  const KunoIprociaiPage({super.key, this.onNext});

  @override
  State<KunoIprociaiPage> createState() => _KunoIprociaiPageState();
}

class _KunoIprociaiPageState extends State<KunoIprociaiPage> {
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
        'Įrašyk, kokius įpročiu norėtum pradėti kurti ar tęsti dėl savo kūno, '
        'kad Tavo kūnas Tau padėkotų? Kokius įpročius norėtum keisti arba išlaikyti?',
      ),
      TextField(
        controller: _controller,
        maxLines: 5,
        decoration: _inputDecoration(hint: 'Įrašyk savo įpročius...'),
      ),
      const _P(
        'Tikiuosi, kad tau ši Sodo programa pradės asocijuotis su rūpinimusi savimi. '
        'Galbūt vis dažniau kils klausimas – kaip dabar galiu savimi pasirūpinti? '
        'Noriu tikėti, kad galiausiai šis klausimas ateis vis dažniau ir be sodo programos.',
      ),
      _NextButton(widget.onNext),
    ]);
  }
}

class SveikinimasPuseKelioPage extends StatelessWidget {
  final VoidCallback? onNext;
  const SveikinimasPuseKelioPage({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return _page([
      const _P(
        'Ką gi, įveikei pusę kelio, dideli sveikinimai! '
        'Lauksiu Tavęs penktos savaitės praktikose, '
        'tęsime rūpinimosi savimi įpročių kūrimą!',
      ),
      _NextButton(onNext),
    ]);
  }
}

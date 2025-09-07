import 'package:flutter/material.dart';

class SavybesMoodEmojiPage extends StatefulWidget {
  const SavybesMoodEmojiPage({super.key});

  @override
  State<SavybesMoodEmojiPage> createState() => _SavybesMoodEmojiPageState();
}

class _SavybesMoodEmojiPageState extends State<SavybesMoodEmojiPage> {
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


class SavybesIntroPage extends StatelessWidget {
  const SavybesIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Šiandien kviečiu užpildyti klausimyną apie Tavo būdo bruožus.',
          style: style?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Text(
          'Žemiau pateikiu pagrindines 5 savybes, kurias tiria šis klausimynas ir trumpus paaiškinimus.',
          style: style,
        ),
        const SizedBox(height: 12),
        _bullet(
          'Ekstraversija – kiek esi bendraujantis, energingas, mėgsti būti tarp žmonių.',
        ),
        _bullet(
          'Neurotiškumas – kaip dažnai jauti nerimą, stresą ar emocinį nepastovumą.',
        ),
        _bullet(
          'Sąmoningumas – atsakingumas, organizuotumas, tvarkingumas, įsipareigojimų laikymasis.',
        ),
        _bullet(
          'Sutarumas – draugiškumas, empatija, bendradarbiavimas, konfliktų vengimas.',
        ),
        _bullet(
          'Atvirumas patirčiai – smalsumas, kūrybingumas, domėjimasis naujovėmis ir idėjomis.',
        ),
        const SizedBox(height: 16),
        Text(
          'Nėra teisingų ar neteisingų atsakymų. Atsakinėk remdamasis savo įprasta elgsena.',
          style: style,
        ),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Text('•  '), Expanded(child: Text(text))],
      ),
    );
  }
}


class BigFiveScalePage extends StatefulWidget {
  const BigFiveScalePage({super.key});

  @override
  State<BigFiveScalePage> createState() => _BigFiveScalePageState();
}

class _BigFiveScalePageState extends State<BigFiveScalePage> {
 
  final List<int> _answers = List<int>.filled(60, -1);

  static const List<String> _labels = [
    '1\nVisiškai\nnesutinku',
    '2\nIš dalies\nnesutinku',
    '3\nNei sutinku,\nnei nesutinku',
    '4\nIš dalies\nsutinku',
    '5\nVisiškai\nsutinku',
  ];

  String _q(int n, String t) => '$n. $t';

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;


    const qs = <String>[
      'Aš esu draugiškas/a, socialus/i',
      'Aš esu užjaučiantis/i, geraširdis/ė',
      'Aš esu kažkiek dezorganizuotas/a',
      'Aš esu atsipalaidavęs/usi, lengvai susidorojantis/i su stresu',
      'Aš esu mažai besidomintis/i menu',
      'Aš esu atkakliai siekiantis/i savo tikslo',
      'Aš esu pagarbus/i, pagarbiai besielgiantis/i su kitais',
      'Aš esu linkęs/usi tingėti',
      'Aš esu išliekantis/i optimistu/e po susidūrimo su kliūtimis',
      'Aš esu besidomintis/i daugeliu skirtingų dalykų',
      'Aš retai jaučiuosi susijaudinęs/usi ar nekantrus/i',
      'Aš esu linkęs/usi kritikuoti kitus',
      'Aš esu patikimas/a, pastovus/i',
      'Aš esu nepastovios nuotaikos, patiriantis/i nuotaikų svyravimus',
      'Aš esu išradingas/a, atrandantis/i protingus būdus darbui atlikti',
      'Aš esu linkęs/usi tylėti',
      'Aš jaučiu mažai užuojautos kitiems',
      'Aš esu sistemingas/a, mėgstantis/i tvarką',
      'Aš kartais įsitempiu',
      'Aš esu susižavėjęs/usi menu, muzika ar literatūra',
      'Aš esu dominuojantis/i, besielgiantis/i kaip lyderis',
      'Aš esu tas/a, kuris/i pradeda ginčytis su kitais',
      'Aš esu tas/a, kuriam/iai sunku pradėti vykdyti užduotį',
      'Aš dažniausiai jaučiuosi saugiai, pasitikiu savimi',
      'Aš vengiu intelektualių, filosofinių diskusijų',
      'Aš esu mažiau aktyvus/i nei kiti žmonės',
      'Aš esu iš prigimties atlaidus/i',
      'Aš kartais esu kažkiek nerūpestingas/a',
      'Aš esu emociškai stabilus/i, ne itin lengvai nuliūstu',
      'Aš nesu itin kūrybingas/a',
      'Aš kartais esu drovus/i, intravertiškas/a',
      'Aš padedu kitiems ir nesu savanaudiškas/a',
      'Mano daiktai dažniausiai yra švarūs ir tvarkingi',
      'Aš daug nerimauju',
      'Aš vertinu meną ir grožį',
      'Aš jaučiu, kad man sunku daryti įtaką kitiems žmonėms',
      'Aš kartais esu šiurkštus/i su kitais',
      'Aš esu produktyvus/i, padarau darbus',
      'Aš dažnai jaučiuosi liūdnai',
      'Aš esu sudėtingas/a, giliai mąstantis/i',
      'Aš esu kupinas/a energijos',
      'Aš esu įtarus/i dėl kitų žmonių ketinimų',
      'Aš esu patikimas/a, manimi galima pasikliauti',
      'Aš kontroliuoju savo emocijas',
      'Man sunku ką nors įsivaizduoti',
      'Aš esu kalbus/i',
      'Aš kartais būnu šaltas/a ir beširdis/ė',
      'Aš dažnai palieku netvarką, nesitvarkau',
      'Aš retai jaučiu nerimą ar baimę',
      'Man poezija ir spektakliai atrodo nuobodūs',
      'Aš noriu, kad atsakomybę prisiimtų kiti',
      'Aš esu mandagus/i, paslaugus/i kitiems',
      'Aš esu atkalus/i – dirbu, kol baigiu užduotį',
      'Aš esu linkęs/usi į liūdesį',
      'Aš nesidomiu abstrakčiomis idėjomis',
      'Aš esu labai entuziastingas/a',
      'Aš apie kitus žmones mąstau teigiamai',
      'Aš kartais pasielgiu neatsakingai',
      'Aš esu temperamentingas/a, lengvai sujaudinamas/a',
      'Aš esu originalus/i, kupinas/a naujų idėjų',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instrukcija:',
          style: style?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          'Prie kiekvieno teiginio pažymėk skaičių (1–5), kuris nurodo kaip stipriai sutinki ar nesutinki:\n'
          '1 – „Visiškai nesutinku“, 2 – „Iš dalies nesutinku“, 3 – „Nei sutinku, nei nesutinku“, '
          '4 – „Iš dalies sutinku“, 5 – „Visiškai sutinku“.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),

     
        ...List.generate(qs.length, (i) {
          final qNum = i + 1;
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
                Text(_q(qNum, qs[i]), style: style),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: List.generate(5, (val) {
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

        const SizedBox(height: 8),
        Text(
          'Pastaba: dabar „Toliau“ neblokuojamas, net jei neatsakei į viską. Jei norėsi – pridėsim „privaloma užpildyti“ vėliau.',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}


class SavybesResultsInfoPage extends StatelessWidget {
  const SavybesResultsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rezultatų paaiškinimas',
          style: style?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Ši skalė nėra standartizuota Lietuvos populiacijoje – ji skirta savirefleksijai. '
          'Balai kiekvienai skalei gali varijuoti nuo 12 iki 60; vidurkis dažniausiai ~39–43.',
          style: style,
        ),
        const SizedBox(height: 12),
        _bullet(
          'Ekstraversija – kuo aukštesnis balas, tuo daugiau energijos socialinėse situacijose.',
        ),
        _bullet(
          'Sutarumas – aukštesnis balas: daugiau empatijos, bendradarbiavimo, konfliktų vengimo.',
        ),
        _bullet(
          'Sąmoningumas – planavimas, organizuotumas, atsakomybės prisiėmimas.',
        ),
        _bullet(
          'Neurotiškumas – jautrumas neigiamiems stimulams, nerimastingumas, dirglumas.',
        ),
        _bullet(
          'Atvirumas patirčiai – kūrybiškumas, smalsumas, domėjimasis naujovėmis ir idėjomis.',
        ),
        const SizedBox(height: 12),
        Text(
          'Pateikti skaičiai pavyzdiniai – individualus interpretavimas svarbus.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Text('•  '), Expanded(child: Text(text))],
      ),
    );
  }
}


class SavybesEndPage extends StatelessWidget {
  const SavybesEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Kažkiek paanalizavome Tavo savybes. Savęs pažinimas padeda geriau tvarkytis su stresais,\n'
      'lavinti priešingas savybes (pvz., ribų brėžimas aukšto sutarumo atveju),\n'
      'geriau pasirinkti poilsio būdus (intraversija vs. ekstraversija),\n'
      'ir priimti save (kai kurios savybės dalinai paveldimos).\n\n'
      'Šiandien tiek. Iki rytojaus!',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

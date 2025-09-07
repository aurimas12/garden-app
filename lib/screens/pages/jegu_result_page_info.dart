import 'package:flutter/material.dart';

class JeguResultsInfoPage1 extends StatelessWidget {
  final int savijautaScore;
  final int recoveryScore;

  const JeguResultsInfoPage1({
    super.key,
    required this.savijautaScore,
    required this.recoveryScore,
  });

  Widget _buildScale({
    required String title,
    required int min,
    required int max,
    required List<int> intervals,
    required List<Color> colors,
    required int value,
  }) {
    final totalWidth = 300.0;
    final sectionWidths = <double>[];

    for (var i = 0; i < intervals.length; i++) {
      final start = i == 0 ? min : intervals[i - 1] + 1;
      final end = intervals[i];
      final width = ((end - start + 1) / (max - min + 1)) * totalWidth;
      sectionWidths.add(width);
    }

    final markerPos = ((value - min) / (max - min)) * totalWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(sectionWidths.length, (i) {
                return Container(
                  width: sectionWidths[i],
                  height: 20,
                  color: colors[i],
                );
              }),
            ),
            Positioned(
              left: markerPos.clamp(0, totalWidth) - 8,
              top: -6,
              child: Column(
                children: [
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                    color: Colors.black,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '$value',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('$min'), ...intervals.map((e) => Text('$e'))],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = Theme.of(context).textTheme.bodyMedium;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildScale(
            title: 'Savijautos klausimynas',
            min: 0,
            max: 25,
            intervals: [7, 12, 19, 25],
            colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green],
            value: savijautaScore,
          ),
          const SizedBox(height: 24),
          _buildScale(
            title: 'Atsistatymas nuo streso',
            min: 16,
            max: 64,
            intervals: [31, 39, 47, 55, 64],
            colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.lightGreen,
              Colors.green,
            ],
            value: recoveryScore,
          ),
          const SizedBox(height: 24),

      
          Text(
            'Tavo savijautos klausimyno rezultatas – $savijautaScore. '
            'Kuo didesnis balas – tuo geresnė savijauta. Jeigu balas žemesnis nei 13 – rodo prastą savijautą, '
            'o 7 ir mažiau – dažniausiai jau rodo klinikinę depresiją.',
            style: body,
          ),
          const SizedBox(height: 12),
       
          const SizedBox(height: 16),
          Text(
            'Atsistatymo nuo streso skalėje surinkai – $recoveryScore. '
            'Kuo didesnis balas – tuo didesnis gebėjimas atsistatyti nuo streso. '
            'Įgūdis atgauti jėgas – labai svarbus, padeda neperdegti. '
            'Tarp medicinos darbuotojų skalės vidurkis yra apie 51 '
            '(Kazlauskas, E., Dumarkaite, A., Gelezelyte, O., Nomeikaite, A., Zelviene, P. (2023). '
            'Validation of the Recovery Experience Questionnaire in a Lithuanian Healthcare Personnel).',
            style: body,
          ),
    
          const SizedBox(height: 16),
          Text(
            'Jeigu jauti, kad savijauta ar stresas apsunkina kasdienę veiklą, santykius, kelia nuolatinę kančią – verta ieškoti pagalbos: '
            'peržiūrėti miegą, mitybą, fizinį aktyvumą, pasikalbėti su artimaisiais ar specialistu.',
            style: body,
          ),
        ],
      ),
    );
  }
}

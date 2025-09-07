import 'package:flutter/material.dart';

class JeguResultsInfoPage extends StatelessWidget {
  final int savijautaScore;
  final int recoveryScore;

  const JeguResultsInfoPage({
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
              left: markerPos - 8,
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
    return Column(
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
          'Kuo didesnis balas – tuo geresnė savijauta ir didesnis gebėjimas atsistatyti nuo streso. '
          'Ši vizualizacija padeda matyti, kurioje vietoje esi skalėje.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

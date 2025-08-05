// results_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/task.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, List<Task>> sections;

  const ResultsScreen({super.key, required this.sections});

  List<Task> getAllTasks() => sections.values.expand((list) => list).toList();

  List<FlSpot> _generateMoodSpots(List<Task> tasks) {
    final moodValues = {'😊': 3.0, '😐': 2.0, '😢': 1.0};
    final List<FlSpot> spots = [];
    int index = 0;
    for (final task in tasks.where((t) => t.done && t.mood != null)) {
      final value = moodValues[task.mood] ?? 0;
      spots.add(FlSpot(index.toDouble(), value));
      index++;
    }
    return spots;
  }

  Widget _buildMoodChart(List<Task> tasks) {
    final spots = _generateMoodSpots(tasks);
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 4,
            color: Colors.green,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.2),
            ),
          ),
        ],
        minY: 0.5,
        maxY: 3.5,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text('Diena'),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) => Text('D${value.toInt() + 1}'),
            ),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Text('Nuotaika'),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                switch (value.toInt()) {
                  case 1:
                    return const Text('😢');
                  case 2:
                    return const Text('😐');
                  case 3:
                    return const Text('😊');
                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true, drawVerticalLine: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = getAllTasks();
    final completedTasks = tasks.where((t) => t.done).toList();
    final moods =
        completedTasks.map((t) => t.mood).whereType<String>().toList();
    final moodFrequency = {
      for (var mood in moods) mood: moods.where((m) => m == mood).length,
    };
    final mostCommonMood =
        (moodFrequency.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .firstOrNull
            ?.key;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FCF9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Tavo progresas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nuotaikų pokyčiai per laiką',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 220,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: _buildMoodChart(tasks),
            ),
            const SizedBox(height: 24),
            Text(
              'Dažniausia nuotaika: ${mostCommonMood ?? '–'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Text(
              'Atlikta užduočių: ${completedTasks.length}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Paskutinės užduotys:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...completedTasks
                .take(3)
                .map(
                  (task) => ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(task.text),
                    trailing: Text(task.mood ?? ''),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    dense: true,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

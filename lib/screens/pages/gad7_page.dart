import 'package:flutter/material.dart';
import '../paged_task_screen.dart' show RegisterOnNextNotification;

typedef Gad7Submit = Future<void> Function(List<int> answers, int? total);

class Gad7Page extends StatefulWidget {
  /// Kviečiamas kaskart keičiant atsakymus (nebūtina).
  final ValueChanged<List<int>>? onChanged;

  /// Kviečiamas, kai spaudžiam „Toliau“ (registruojama per RegisterOnNextNotification).
  final Gad7Submit? onSubmitted;

  const Gad7Page({super.key, this.onChanged, this.onSubmitted});

  @override
  State<Gad7Page> createState() => _Gad7PageState();
}

class _Gad7PageState extends State<Gad7Page> {
  final List<int> _answers = List<int>.filled(7, -1);

  final List<String> _questions = const [
    '1. Jaučiausi nervingas, nerimastingas ar įsitempęs',
    '2. Negalėjau sustabdyti ar kontroliuoti nerimavimo',
    '3. Pernelyg daug nerimavau dėl įvairių dalykų',
    '4. Man sunku atsipalaiduoti',
    '5. Buvau toks neramus, kad sunku nusėdėti vietoje',
    '6. Lengvai susierzinau ar tapau dirglus',
    '7. Jaučiau baimę, lyg kažkas baisaus įvyks',
  ];

  final List<String> _labels = const [
    '0\nVisai ne',
    '1\nKeletą dienų',
    '2\n>½ dienų',
    '3\nBeveik kasdien',
  ];

  int? get _totalNullable =>
      _answers.contains(-1) ? null : _answers.fold<int>(0, (s, v) => s + v);

  int get _partialTotal =>
      _answers.where((v) => v >= 0).fold<int>(0, (s, v) => s + v);

  void _setAnswer(int qIndex, int value) {
    setState(() => _answers[qIndex] = value);
    widget.onChanged?.call(List<int>.from(_answers));
  }

  @override
  Widget build(BuildContext context) {
    // Kaip ir PHQ-9: registruojam „onNext“ po frame’o
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      RegisterOnNextNotification(() async {
        try {
          await widget.onSubmitted?.call(
            List<int>.from(_answers),
            _totalNullable,
          );
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Siuntimas nepavyko: $e')));
          }
          // Jei nori sulaikyti perėjimą į kitą puslapį klaidos atveju:
          // return false;
        }
        return true; // leisti „Toliau/Užbaigti“
      }).dispatch(context);
    });

    final theme = Theme.of(context);
    final total = _totalNullable;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.monitor_heart, color: Colors.green[700]),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'GAD-7 (nerimo skalė, 0–3)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Kaip dažnai per pastarąsias dvi savaites patyrei šiuos simptomus?',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),

        ...List.generate(_questions.length, (i) {
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
                Text(_questions[i], style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: List.generate(4, (val) {
                    final selected = _answers[i] == val;
                    return ChoiceChip(
                      label: Text(_labels[val], textAlign: TextAlign.center),
                      selected: selected,
                      onSelected: (_) => _setAnswer(i, val),
                    );
                  }),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 8),
        Text(
          total == null
              ? 'Tarpinė suma: $_partialTotal (nebaigta)'
              : 'Suma: $total',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

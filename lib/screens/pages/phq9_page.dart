import 'package:flutter/material.dart';
import '../paged_task_screen.dart' show RegisterOnNextNotification;

typedef Phq9Submit = Future<void> Function(List<int> answers, int? total);

class Phq9Page extends StatefulWidget {
  final ValueChanged<List<int>>? onChanged;
  final Phq9Submit? onSubmitted;
  const Phq9Page({super.key, this.onChanged, this.onSubmitted});

  @override
  State<Phq9Page> createState() => _Phq9PageState();
}

class _Phq9PageState extends State<Phq9Page> {
  final List<int> _answers = List<int>.filled(9, -1);

  final List<String> _questions = const [
    '1. Mažas susidomėjimas ar malonumas atliekant dalykus',
    '2. Jautimasis nusiminusiam (-ai), prislėgtam (-ai) ar beviltiškam (-ai)',
    '3. Sunkumas užmigti ar išmiegoti, arba per ilgas miegojimas',
    '4. Jautimasis pavargusiam (-ai) ar energijos trūkumas',
    '5. Prastas apetitas arba persivalgymas',
    '6. Prasta savijauta – pojūtis, kad esate nevykėlis (-ė) arba kad nuvylėte save ar savo šeimą',
    '7. Sunkumas susikoncentruoti ties tokiais dalykais, kaip laikraščio skaitymas arba TV žiūrėjimas',
    '8. Lėtas judėjimas / kalbėjimas (ar neramumas)',
    '9. Mintys, kad būtų geriau būti mirusiam (-ai) arba apie savęs žalojimą',
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
          
        }
        return true; 
      }).dispatch(context);
    });

    final theme = Theme.of(context);
    final total = _totalNullable;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.psychology_alt, color: Colors.green[700]),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'PHQ-9 (0–3)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Kaip dažnai per pastarąsias dvi savaites patyrei aprašytus simptomus?',
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

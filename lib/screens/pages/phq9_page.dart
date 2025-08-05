import 'package:flutter/material.dart';

class Phq9Page extends StatefulWidget {
  final ValueChanged<List<int>>? onChanged;
  const Phq9Page({super.key, this.onChanged});

  @override
  State<Phq9Page> createState() => _Phq9PageState();
}

class _Phq9PageState extends State<Phq9Page> {
  final List<int> _answers = List.filled(9, -1);

  final List<String> _questions = const [
    '1. Mažas susidomėjimas ar malonumas atliekant dalykus',
    '2. Jautimasis nusiminusiam (-ai), prislėgtam (-ai) ar beviltiškam (-ai)',
    '3. Sunkumas užmigti ar išmiegoti, arba per ilgas miegojimas',
    '4. Jautimasis pavargusiam (-ai) ar energijos trūkumas',
    '5. Prastas apetitas arba persivalgymas',
    '6. Prasta savijauta – pojūtis, kad esate nevykėlis (-ė) arba kad nuvylėte save ar savo šeimą',
    '7. Sunkumas susikoncentruoti ties tokiais dalykais, kaip laikraščio skaitymas arba TV žiūrėjimas',
    '8. Lėtas judėjimas / kalbėjimas (arba atvirkščiai – neramumas)',
    '9. Mintys, kad būtų geriau būti mirusiam (-ai) arba apie savęs žalojimą',
  ];

  final List<String> _labels = const [
    '0\nVisai ne',
    '1\nKeletą dienų',
    '2\n>½ dienų',
    '3\nBeveik kasdien',
  ];

  void _setAnswer(int qIndex, int value) {
    setState(() => _answers[qIndex] = value);
    widget.onChanged?.call(List<int>.from(_answers));
  }

  Widget _answerChips(int qIndex) {
    return Wrap(
      spacing: 8,
      children: List.generate(4, (val) {
        final selected = _answers[qIndex] == val;
        return ChoiceChip(
          label: Text(_labels[val], textAlign: TextAlign.center),
          selected: selected,
          onSelected: (_) => _setAnswer(qIndex, val),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = _answers.where((v) => v >= 0).fold<int>(0, (s, v) => s + v);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.psychology_alt, color: Colors.green[700]),
            const SizedBox(width: 8),
            Text(
              'PHQ-9 (nuotaikos skalė, 0–3)',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Kaip dažnai per pastarąsias dvi savaites patyrei aprašytus simptomus?\n'
          '0 – „Visai ne“, 1 – „Keletą dienų“, 2 – „Daugiau nei pusę dienų“, 3 – „Beveik kasdien“.',
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
                _answerChips(i),
              ],
            ),
          );
        }),
        const SizedBox(height: 8),
        Text('Tarpinė suma: $total', style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

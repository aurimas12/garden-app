import 'package:flutter/material.dart';

class MoodEmojiPage extends StatefulWidget {
  final ValueChanged<String>? onChanged; // grąžina pasirinktą emoji

  const MoodEmojiPage({super.key, this.onChanged});

  @override
  State<MoodEmojiPage> createState() => _MoodEmojiPageState();
}

class _MoodEmojiPageState extends State<MoodEmojiPage> {
  final _emojis = const ['😊', '😐', '😢'];
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.emoji_emotions, color: Colors.green[700], size: 36),
        const SizedBox(height: 8),
        Text(
          'Kokia šiandien Tavo nuotaika?',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          children:
              _emojis.map((m) {
                final selected = _selected == m;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selected = m);
                    widget.onChanged?.call(m);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.green[200] : Colors.grey[200],
                      boxShadow:
                          selected
                              ? [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                              : const [],
                    ),
                    child: Text(m, style: const TextStyle(fontSize: 28)),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          _selected == null ? 'Pasirink nuotaiką' : 'Pasirinkta: $_selected',
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

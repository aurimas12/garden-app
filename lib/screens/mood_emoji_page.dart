
import 'package:flutter/material.dart';
import '../../data/mood_prefs.dart';

class MoodEmojiPage extends StatefulWidget {
  final ValueChanged<String>?
  onChanged;
  final String? taskId;

  const MoodEmojiPage({super.key, this.onChanged, this.taskId});

  @override
  State<MoodEmojiPage> createState() => _MoodEmojiPageState();
}

class _MoodEmojiPageState extends State<MoodEmojiPage> {

  final List<_MoodItem> _items = const [
    _MoodItem(id: 'm1', asset: 'assets/moods/1.png', label: 'Labai gera'),
    _MoodItem(id: 'm2', asset: 'assets/moods/2.png', label: 'Gera'),
    _MoodItem(id: 'm3', asset: 'assets/moods/3.png', label: 'Neutrali'),
    _MoodItem(id: 'm4', asset: 'assets/moods/4.png', label: 'Prasta'),
    _MoodItem(id: 'm5', asset: 'assets/moods/5.png', label: 'Labai prasta'),
  ];

  String? _selectedId; 
  bool _saving = false;

  Future<void> _pick(_MoodItem it) async {
    if (_saving) return;
    setState(() {
      _selectedId = it.id;
      _saving = true;
    });


    widget.onChanged?.call(it.id);

 
    try {
      await MoodPrefs.record(it.id, taskId: widget.taskId);
    } catch (_) {
  
    }

    if (!mounted) return;
    setState(() => _saving = false);
  }

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
          spacing: 14,
          runSpacing: 14,
          alignment: WrapAlignment.center,
          children:
              _items.map((it) {
                final selected = _selectedId == it.id;
                return _MoodTile(
                  item: it,
                  selected: selected,
                  onTap: _saving ? null : () => _pick(it),
                );
              }).toList(),
        ),

        const SizedBox(height: 8),
        if (_saving)
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
      ],
    );
  }
}

class _MoodItem {
  final String id; 
  final String asset; 
  final String label; 

  const _MoodItem({required this.id, required this.asset, required this.label});
}

class _MoodTile extends StatelessWidget {
  final _MoodItem item;
  final bool selected;
  final VoidCallback? onTap;

  const _MoodTile({required this.item, required this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? Colors.green : Colors.grey.shade300;
    final shadow =
        selected
            ? [
              BoxShadow(
                color: Colors.green.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
            : const <BoxShadow>[];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 2),
              boxShadow: shadow,
            ),
            child: ClipOval(
              child: Image.asset(
                item.asset,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 86,
          child: Text(
            item.label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

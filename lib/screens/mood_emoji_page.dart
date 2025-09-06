// import 'package:flutter/material.dart';
// import '../../data/mood_prefs.dart'; // pritaikyk kelią, jei pas tave kitoks

// class MoodEmojiPage extends StatefulWidget {
//   final ValueChanged<String>?
//   onChanged; // pranešimas tėvui (pvz. siųsti į backend)
//   final String? taskId; // nebūtina – istorijai/analitikai

//   const MoodEmojiPage({super.key, this.onChanged, this.taskId});

//   @override
//   State<MoodEmojiPage> createState() => _MoodEmojiPageState();
// }

// class _MoodEmojiPageState extends State<MoodEmojiPage> {
//   // 5 nuotaikos – saugom stabilų ID (m1..m5), rodom atitinkamą asset
//   final List<_MoodItem> _items = const [
//     _MoodItem(id: 'm1', asset: 'assets/moods/1.png', label: 'Labai prasta'),
//     _MoodItem(id: 'm2', asset: 'assets/moods/2.png', label: 'Prasta'),
//     _MoodItem(
//       id: 'm3',
//       asset: 'assets/moods/3.png',
//       label: 'Nei šilta, nei šalta',
//     ),
//     _MoodItem(id: 'm4', asset: 'assets/moods/4.png', label: 'Gera'),
//     _MoodItem(id: 'm5', asset: 'assets/moods/5.png', label: 'Labai gera'),
//   ];

//   String? _selectedId; // ką parinko dabar UI
//   String? _storedLastId; // kas paskutinį kartą įrašyta prefs’e
//   Map<String, int> _counts = {}; // dažniai (key = id)
//   bool _saving = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadFromPrefs();
//   }

//   Future<void> _loadFromPrefs() async {
//     final last = await MoodPrefs.lastMood(); // String? (pvz. 'm3')
//     final counts = await MoodPrefs.counts(); // Map<String, int>
//     if (!mounted) return;
//     setState(() {
//       _storedLastId = last;
//       _counts = {for (final it in _items) it.id: counts[it.id] ?? 0};
//     });
//   }

//   Future<void> _pick(_MoodItem it) async {
//     if (_saving) return;
//     setState(() {
//       _selectedId = it.id;
//       _saving = true;
//     });

//     // 1) pranešam tėvui (pvz. makeTaskWithMood -> EmojiApi.save(...) išsiųs į backend)
//     widget.onChanged?.call(it.id);

//     // 2) įrašom į SharedPreferences (last + counts + history), be popup
//     await MoodPrefs.record(it.id, taskId: widget.taskId);

//     // 3) perskaitom atgal patikrinimui ir atnaujinam UI
//     await _loadFromPrefs();

//     if (!mounted) return;
//     setState(() => _saving = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.emoji_emotions, color: Colors.green[700], size: 36),
//         const SizedBox(height: 8),
//         Text(
//           'Kokia šiandien Tavo nuotaika?',
//           style: theme.textTheme.titleMedium?.copyWith(
//             fontWeight: FontWeight.w600,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),

//         // Pasirinkimo mygtukai (paveikslėliai iš assets)
//         Wrap(
//           spacing: 14,
//           runSpacing: 14,
//           alignment: WrapAlignment.center,
//           children:
//               _items.map((it) {
//                 final selected = _selectedId == it.id;
//                 return _MoodTile(
//                   item: it,
//                   selected: selected,
//                   onTap: _saving ? null : () => _pick(it),
//                 );
//               }).toList(),
//         ),

//         const SizedBox(height: 10),

//         // if (_selectedId != null)
//         //   Text(
//         //     'Pasirinkta: ${_labelFor(_selectedId!)}',
//         //     style: theme.textTheme.bodySmall,
//         //   ),
//         // if (_storedLastId != null)
//         //   Text(
//         //     'Išsaugota paskiausiai: ${_labelFor(_storedLastId!)}',
//         //     style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
//         //   ),
//         const SizedBox(height: 10),

//         // Dažnių suvestinė
//         _CountsRow(items: _items, counts: _counts),

//         const SizedBox(height: 8),
//         // if (_saving)
//         //   const SizedBox(
//         //     height: 18,
//         //     width: 18,
//         //     child: CircularProgressIndicator(strokeWidth: 2),
//         //   ),

//         // TextButton.icon(
//         //   onPressed: _saving ? null : _loadFromPrefs,
//         //   icon: const Icon(Icons.refresh, size: 18),
//         //   label: const Text('Atnaujinti iš prefs'),
//         // ),
//       ],
//     );
//   }

//   // String _labelFor(String id) {
//   //   final it = _items.firstWhere(
//   //     (e) => e.id == id,
//   //     orElse: () => _MoodItem(id: id, asset: '', label: id),
//   //   );
//   //   return it.label;
//   // }
// }

// class _MoodItem {
//   final String id; // stabilus ID saugojimui/backendui
//   final String asset; // assets kelias
//   final String label; // rodoma etiketė

//   const _MoodItem({required this.id, required this.asset, required this.label});
// }

// class _MoodTile extends StatelessWidget {
//   final _MoodItem item;
//   final bool selected;
//   final VoidCallback? onTap;

//   const _MoodTile({required this.item, required this.selected, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final borderColor = selected ? Colors.green : Colors.grey.shade300;
//     final shadow =
//         selected
//             ? [
//               BoxShadow(
//                 color: Colors.green.withOpacity(0.25),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ]
//             : const <BoxShadow>[];

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 150),
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: borderColor, width: 2),
//               boxShadow: shadow,
//             ),
//             child: ClipOval(
//               child: Image.asset(
//                 item.asset,
//                 width: 56,
//                 height: 56,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 6),
//         SizedBox(
//           width: 86,
//           child: Text(
//             item.label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 12),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _CountsRow extends StatelessWidget {
//   final List<_MoodItem> items;
//   final Map<String, int> counts;

//   const _CountsRow({required this.items, required this.counts});

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 10,
//       runSpacing: 8,
//       alignment: WrapAlignment.center,
//       children:
//           items.map((it) {
//             final c = counts[it.id] ?? 0;
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ClipOval(
//                   child: Image.asset(
//                     it.asset,
//                     width: 22,
//                     height: 22,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Text('$c', style: const TextStyle(fontWeight: FontWeight.w600)),
//               ],
//             );
//           }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../data/mood_prefs.dart'; // pakoreguok kelią, jei pas tave kitoks

class MoodEmojiPage extends StatefulWidget {
  final ValueChanged<String>?
  onChanged; // praneša tėvui (pvz. siųsti į backend)
  final String? taskId; // nebūtina – istorijai/analitikai

  const MoodEmojiPage({super.key, this.onChanged, this.taskId});

  @override
  State<MoodEmojiPage> createState() => _MoodEmojiPageState();
}

class _MoodEmojiPageState extends State<MoodEmojiPage> {
  // 5 nuotaikos – stabilūs ID saugojimui/backendui, o UI rodom asset'us
  final List<_MoodItem> _items = const [
    _MoodItem(id: 'm1', asset: 'assets/moods/1.png', label: 'Labai gera'),
    _MoodItem(id: 'm2', asset: 'assets/moods/2.png', label: 'Gera'),
    _MoodItem(id: 'm3', asset: 'assets/moods/3.png', label: 'Neutrali'),
    _MoodItem(id: 'm4', asset: 'assets/moods/4.png', label: 'Prasta'),
    _MoodItem(id: 'm5', asset: 'assets/moods/5.png', label: 'Labai prasta'),
  ];

  String? _selectedId; // ką pasirinko dabar (tik UI)
  bool _saving = false;

  Future<void> _pick(_MoodItem it) async {
    if (_saving) return;
    setState(() {
      _selectedId = it.id;
      _saving = true;
    });

    // 1) pranešam tėvui (pvz. makeTaskWithMood -> EmojiApi.save(...) išsiųs į backend)
    widget.onChanged?.call(it.id);

    // 2) tyliai įrašom į SharedPreferences (last/history). Jokio popup / jokio skaitiklių rodymo.
    try {
      await MoodPrefs.record(it.id, taskId: widget.taskId);
    } catch (_) {
      // paliekam tyliai (jei nori – gali įsirašyti debugPrint)
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

        // Emoji iš assets
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
  final String id; // stabilus ID saugojimui/backendui
  final String asset; // asset kelias
  final String label; // rodoma etiketė (nebūtina rodyti, bet paliekam)

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

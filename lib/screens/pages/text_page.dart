import 'package:flutter/material.dart';

class TextPage1 extends StatelessWidget {
  final String text;
  final String? title;
  final IconData? leadingIcon;

  const TextPage1(this.text, {super.key, this.title, this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null || leadingIcon != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null)
                Icon(leadingIcon, color: Colors.green[700]),
              if (leadingIcon != null) const SizedBox(width: 8),
              if (title != null)
                Text(
                  title!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
        ],
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            text,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.35),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

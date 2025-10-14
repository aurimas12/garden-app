import 'package:flutter/material.dart';

class TextTemplate extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imageAsset;
  final List<Widget> children;


  final bool standalone;

  final double maxContentWidth;
  final EdgeInsets contentPadding;

  const TextTemplate({
    super.key,
    this.title,
    this.subtitle,
    this.imageAsset,
    required this.children,
    this.standalone = false,
    this.maxContentWidth = 720,
    this.contentPadding = const EdgeInsets.fromLTRB(20, 16, 20, 16),
  });

  @override
  Widget build(BuildContext context) {
    final inner = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxContentWidth),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageAsset != null) _HeaderImage(imageAsset!),
            Padding(
              padding: contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.green[800],
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  if (subtitle != null) ...[
                    Text(
                      subtitle!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 12),
                  ],
                  ..._separated(children),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (!standalone) return inner;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: inner,
      ),
    );
  }

  List<Widget> _separated(List<Widget> kids) {
    final out = <Widget>[];
    for (var i = 0; i < kids.length; i++) {
      out.add(kids[i]);
      if (i != kids.length - 1) out.add(const SizedBox(height: 12));
    }
    return out;
  }
}

class _HeaderImage extends StatelessWidget {
  final String asset;
  const _HeaderImage(this.asset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          errorBuilder:
              (_, __, ___) => Container(
                color: const Color(0xFFE9F5EC),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              ),
        ),
      ),
    );
  }
}


class P extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const P(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: (style ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
        height: 1.45,
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  final String text;
  const Bullet(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•  '),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ),
      ],
    );
  }
}

class Callout extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const Callout(
    this.text, {
    super.key,
    this.icon = Icons.tips_and_updates,
    this.color = const Color(0xFF2E7D32),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.45,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

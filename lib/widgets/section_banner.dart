import 'package:flutter/material.dart';

class SectionBanner extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String? subtitle;
  final VoidCallback? onTap;

  const SectionBanner({
    super.key,
    required this.title,
    required this.imageAsset,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20);

    return InkWell(
      borderRadius: radius,
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: radius),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Paveikslėlis
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                // fallback, jei asset nerastas
                errorBuilder:
                    (_, __, ___) => Container(
                      color: const Color(0xFFE9F5EC),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.photo,
                        size: 42,
                        color: Colors.grey,
                      ),
                    ),
              ),
            ),

            // Gradientas apačioje geram kontrastui
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.4, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.55),
                    ],
                  ),
                ),
              ),
            ),

            // Tekstai
            Positioned(
              left: 16,
              right: 16,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtitle != null) ...[
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: .3,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.1,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

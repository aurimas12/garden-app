import 'package:flutter/material.dart';



class SodoTemplate extends StatelessWidget {
  final String? headerImageAsset;
  final double headerAspectRatio;
  final String? title;
  final String? lead;
  final List<String>? paragraphs;
  final List<Widget>? children;

  final String? ctaText;
  final Future<void> Function()? onCta;
  final bool ctaAdvances;

  const SodoTemplate({
    super.key,
    this.headerImageAsset,
    this.headerAspectRatio = 16 / 9,
    this.title,
    this.lead,
    this.paragraphs,
    this.children,
    this.ctaText,
    this.onCta,
    this.ctaAdvances = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
         
              if (headerImageAsset != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: headerAspectRatio,
                    child: Image.asset(
                      headerImageAsset!,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(
                            color: const Color(0xFFE9F5EC),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.photo,
                              color: Colors.grey,
                              size: 42,
                            ),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Container(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FFF4),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title!,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.green[800],
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    if (lead != null) ...[
                      Text(
                        lead!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],

               
                    if (paragraphs != null)
                      ...paragraphs!.map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            p,
                            textAlign: TextAlign.justify,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              height: 1.35,
                            ),
                          ),
                        ),
                      ),

           
                    if (children != null) ...children!,

                 
                    if (ctaText != null) ...[
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (onCta != null) {
                              await onCta!();
                            }
                           
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          icon: const Icon(Icons.arrow_forward),
                          label: Text(ctaText!),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SodoBullet extends StatelessWidget {
  final String text;
  const SodoBullet(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  '),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}

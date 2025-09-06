import 'package:flutter/widgets.dart';

/// Apgaubk puslapį NoTemplate(child), jei nenori, kad jis būtų aplipdytas TextTemplate.
class NoTemplate extends StatelessWidget {
  final Widget child;
  const NoTemplate(this.child, {super.key});

  @override
  Widget build(BuildContext context) => child;
}

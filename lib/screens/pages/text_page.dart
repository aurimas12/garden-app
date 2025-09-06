import 'package:flutter/material.dart';
import 'package:garden_app/widgets/text_template.dart';

class TextPage1 extends StatelessWidget {
  final String text;
  final String? imageAsset;
  final String? title;
  final String? subtitle;

  const TextPage1(
    this.text, {
    super.key,
    this.imageAsset,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextTemplate(
      standalone: false, // nes PagedTaskScreen turi savo scroll
      imageAsset: imageAsset,
      title: title,
      subtitle: subtitle,
      children: [P(text)],
    );
  }
}

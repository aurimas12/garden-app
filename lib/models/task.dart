import 'package:flutter/material.dart';

class Task {
  final String text;

  /// Jei naudosite bendrą "TaskDetailScreen", galite palikti descriptions.
  final List<String> descriptions;

  /// Jei turime specialų 5 puslapių ekraną, jį sukuriam per šitą builderį.
  final Widget Function(VoidCallback onFinish)? screenBuilder;

  bool done;
  String? mood;

  Task({
    required this.text,
    this.descriptions = const [],
    this.screenBuilder,
    this.done = false,
    this.mood,
  });
}

import 'package:flutter/material.dart';

class Task {
  final String text;


  final List<String> descriptions;


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

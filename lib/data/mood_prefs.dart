import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MoodPrefs {
  static const _kLastMood = 'last_mood';
  static const _kCounts = 'mood_counts_json';
  static const _kHistory = 'mood_history_json';


  static Future<void> record(
    String emoji, {
    String? taskId,
    DateTime? at,
  }) async {
    final prefs = await SharedPreferences.getInstance();


    await prefs.setString(_kLastMood, emoji);


    final countsRaw = prefs.getString(_kCounts);
    final Map<String, int> counts =
        countsRaw != null
            ? (jsonDecode(countsRaw) as Map<String, dynamic>).map(
              (k, v) => MapEntry(k, (v as num).toInt()),
            )
            : {'😊': 0, '😐': 0, '😢': 0};
    counts[emoji] = (counts[emoji] ?? 0) + 1;
    await prefs.setString(_kCounts, jsonEncode(counts));


    final historyRaw = prefs.getString(_kHistory);
    final List<dynamic> history =
        historyRaw != null
            ? (jsonDecode(historyRaw) as List<dynamic>)
            : <dynamic>[];
    history.add({
      'emoji': emoji,
      'taskId': taskId,
      'at': (at ?? DateTime.now()).toIso8601String(),
    });
    if (history.length > 500) history.removeAt(0);
    await prefs.setString(_kHistory, jsonEncode(history));
  }

  static Future<String?> lastMood() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLastMood);
  }

  static Future<Map<String, int>> counts() async {
    final prefs = await SharedPreferences.getInstance();
    final countsRaw = prefs.getString(_kCounts);
    if (countsRaw == null) return {'😊': 0, '😐': 0, '😢': 0};
    final map = (jsonDecode(countsRaw) as Map<String, dynamic>);
    return map.map((k, v) => MapEntry(k, (v as num).toInt()));
  }

  static Future<List<Map<String, dynamic>>> history() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kHistory);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list.whereType<Map<String, dynamic>>().toList();
  }

  // (nebūtina) – valymas, naudinga testams
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kLastMood);
    await prefs.remove(_kCounts);
    await prefs.remove(_kHistory);
  }
}

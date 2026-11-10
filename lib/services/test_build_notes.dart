import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/fork_errors.dart';
import '../utils/test_build.dart';

/// Patch notes of the Absorb Plus Test app (owner, 2026-11-04).
///
/// `tool/dev.ps1 apk -Local` turns the commits since the previous test build
/// into short lines (`tool/test_build_notes.py`) and bundles them as
/// [TestBuildNotesStore.assetPath], an asset only the dev flavor ships. They
/// work offline: the first launch of each build shows them once and adds
/// them to a history on this phone (Developer > Patch notes).

/// One test build's notes.
class TestBuildNotes {
  const TestBuildNotes({
    required this.version,
    required this.build,
    this.date = '',
    this.notes = const [],
  });

  /// `1.12.1`
  final String version;

  /// `356`
  final int build;

  /// `2026-11-04`, the day it was built.
  final String date;
  final List<String> notes;

  String get fullVersion => '$version+$build';

  /// The notes in [json], or null when it isn't a test build's notes (the
  /// JSON the build tool writes: `{version, build, date, notes: [...]}`).
  static TestBuildNotes? fromJson(Object? json) {
    if (json is! Map) return null;
    final build = json['build'];
    if (build is! int || build <= 0) return null;
    final rawNotes = json['notes'];
    return TestBuildNotes(
      version: json['version'] is String ? json['version'] as String : '',
      build: build,
      date: json['date'] is String ? json['date'] as String : '',
      notes: [
        if (rawNotes is List)
          for (final n in rawNotes)
            if (n is String && n.trim().isNotEmpty) n.trim(),
      ],
    );
  }

  /// [fromJson] on a JSON string; null when it doesn't parse.
  static TestBuildNotes? parse(String raw) {
    try {
      return fromJson(jsonDecode(raw));
    } on FormatException catch (e) {
      swallow('TestBuildNotes', e);
      return null;
    }
  }

  Map<String, Object> toJson() => {
    'version': version,
    'build': build,
    'date': date,
    'notes': notes,
  };
}

/// A release body split into its bullet lines (`- `, `* ` or `• `) and the
/// other non-empty lines. The test channel shows the bullets as a list.
({List<String> intro, List<String> bullets}) splitReleaseNotes(String body) {
  final intro = <String>[];
  final bullets = <String>[];
  for (final raw in const LineSplitter().convert(body)) {
    final line = raw.trim();
    if (line.isEmpty) continue;
    final bullet = RegExp(r'^[-*•]\s+(.+)$').firstMatch(line);
    if (bullet != null) {
      bullets.add(bullet.group(1)!.trim());
    } else {
      intro.add(line);
    }
  }
  return (intro: intro, bullets: bullets);
}

/// The bundled notes, which build last showed them, and the history.
abstract final class TestBuildNotesStore {
  static const assetPath = 'assets/test_build/notes.json';
  static const seenBuildKey = 'fork_test_build_notes_seen_build';
  static const historyKey = 'fork_test_build_notes_history';
  static const maxHistory = 30;

  /// Tests pretend to be (or not be) the test app.
  @visibleForTesting
  static bool? debugTestBuildOverride;

  /// Tests replace the bundled asset.
  @visibleForTesting
  static Future<String> Function() loadAsset = () =>
      rootBundle.loadString(assetPath, cache: false);

  static bool get isEnabled => debugTestBuildOverride ?? kTestBuild;

  /// This build's notes, or null outside the test app or when it was built
  /// without them.
  static Future<TestBuildNotes?> bundled() async {
    if (!isEnabled) return null;
    try {
      return TestBuildNotes.parse(await loadAsset());
    } catch (e) {
      // Built without dev.ps1 (no notes file): nothing to show.
      swallow('TestBuildNotes', e);
      return null;
    }
  }

  /// Call on every launch. On the first launch of a build, adds its notes
  /// to the history and returns them to show once; otherwise null. Builds
  /// without notes (or with none listed) return null.
  static Future<TestBuildNotes?> recordLaunch() async {
    final notes = await bundled();
    if (notes == null) return null;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(seenBuildKey) == notes.build) return null;
    await prefs.setInt(seenBuildKey, notes.build);
    if (notes.notes.isEmpty) return null;
    final updated = appendHistory(_read(prefs), notes);
    await prefs.setString(
      historyKey,
      jsonEncode([for (final n in updated) n.toJson()]),
    );
    return notes;
  }

  /// Every test build's notes this phone has seen, newest first. Empty
  /// outside the test app.
  static Future<List<TestBuildNotes>> history() async {
    if (!isEnabled) return const [];
    return _read(await SharedPreferences.getInstance());
  }

  /// [history] with [notes] added: one entry per build, newest build
  /// first, at most [max].
  static List<TestBuildNotes> appendHistory(
    List<TestBuildNotes> history,
    TestBuildNotes notes, {
    int max = maxHistory,
  }) {
    final all = [
      notes,
      for (final n in history)
        if (n.build != notes.build) n,
    ]..sort((a, b) => b.build.compareTo(a.build));
    return all.take(max).toList();
  }

  static List<TestBuildNotes> _read(SharedPreferences prefs) {
    final raw = prefs.getString(historyKey);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return [];
      return list
          .map(TestBuildNotes.fromJson)
          .whereType<TestBuildNotes>()
          .toList();
    } on FormatException catch (e) {
      swallow('TestBuildNotes', e);
      return [];
    }
  }
}

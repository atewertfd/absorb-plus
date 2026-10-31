import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pending_writes.dart';

/// Holds back frequent, diagnostic-only playback history lines (Absorb Plus).
///
/// A "synced with server" line was logged every 20 s while streaming, and
/// each one rewrote the book's whole history list (up to 1000 lines) in the
/// preferences, which on Windows means rewriting the whole preferences file
/// on the UI thread. Those lines now wait here and are written together with
/// the next ordinary history line, after [delay] at the latest, or on exit
/// ([PendingWrites]). Readers see them straight away through [peek]. At most
/// [delay] of these advanced-only lines can be lost if the app is killed.
class HistoryWriteBuffer {
  HistoryWriteBuffer({
    this.delay = const Duration(seconds: 60),
    required this.maxLines,
    Future<SharedPreferences> Function()? prefs,
    bool flushOnExit = true,
  }) : _prefs = prefs ?? SharedPreferences.getInstance {
    if (flushOnExit) PendingWrites.register(this, flush);
  }

  final Duration delay;
  final int maxLines;
  final Future<SharedPreferences> Function() _prefs;
  // Full (scoped) preference key -> encoded lines, oldest first.
  final Map<String, List<String>> _lines = {};
  Timer? _timer;
  Future<void> _chain = Future<void>.value();

  /// Runs [job] after every history write already queued, so two
  /// read-modify-writes of one list never interleave.
  Future<T> serial<T>(Future<T> Function() job) {
    final run = _chain.then((_) => job());
    _chain = run.then((_) {}, onError: (Object _) {});
    return run;
  }

  void add(String fullKey, String line) {
    (_lines[fullKey] ??= []).add(line);
    _timer ??= Timer(delay, () => unawaited(flush()));
  }

  /// The held-back lines for [fullKey], removed from the buffer (the caller
  /// writes them with its own line).
  List<String> take(String fullKey) => _lines.remove(fullKey) ?? const [];

  List<String> peek(String fullKey) => _lines[fullKey] ?? const [];

  void drop(String fullKey) => _lines.remove(fullKey);

  /// Writes every held-back line.
  Future<void> flush() {
    _timer?.cancel();
    _timer = null;
    return serial(_writeHeld);
  }

  Future<void> _writeHeld() async {
    if (_lines.isEmpty) return;
    final batch = Map.of(_lines);
    _lines.clear();
    final prefs = await _prefs();
    for (final entry in batch.entries) {
      try {
        final list = List<String>.from(
          prefs.getStringList(entry.key) ?? const [],
        )..addAll(entry.value);
        if (list.length > maxLines) list.removeRange(0, list.length - maxLines);
        await prefs.setStringList(entry.key, list);
      } catch (e) {
        debugPrint('[History] writing held-back lines failed: $e');
      }
    }
  }

  @visibleForTesting
  void dispose() {
    _timer?.cancel();
    _timer = null;
    PendingWrites.unregister(this);
  }
}

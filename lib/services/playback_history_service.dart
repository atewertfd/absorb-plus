import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'history_write_buffer.dart';
import 'scoped_prefs.dart';
import 'user_account_service.dart';

/// Types of playback events we track.
enum PlaybackEventType {
  play,
  pause,
  seek,
  syncLocal,
  syncServer,
  autoRewind,
  skipForward,
  skipBackward,
  speedChange,
  bookFinished,
  sessionStart,
  sessionEnd,
  clickDebounce,
}

/// Events that only show in the sheet when the user enables advanced mode.
const Set<PlaybackEventType> kAdvancedHistoryEvents = {
  PlaybackEventType.syncLocal,
  PlaybackEventType.syncServer,
  PlaybackEventType.sessionStart,
  PlaybackEventType.sessionEnd,
  PlaybackEventType.clickDebounce,
};

/// A single playback event entry.
class PlaybackEvent {
  final PlaybackEventType type;
  final double positionSeconds;
  final DateTime timestamp;
  final String? detail;

  PlaybackEvent({
    required this.type,
    required this.positionSeconds,
    required this.timestamp,
    this.detail,
  });

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'pos': positionSeconds,
        'ts': timestamp.millisecondsSinceEpoch,
        if (detail != null) 'detail': detail,
      };

  factory PlaybackEvent.fromJson(Map<String, dynamic> json) {
    return PlaybackEvent(
      type: PlaybackEventType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PlaybackEventType.play,
      ),
      positionSeconds: (json['pos'] as num).toDouble(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['ts'] as int),
      detail: json['detail'] as String?,
    );
  }

  String get label {
    switch (type) {
      case PlaybackEventType.play:
        if (detail != null && detail!.isNotEmpty) return detail!;
        return 'Resumed playback';
      case PlaybackEventType.pause:
        if (detail != null && detail!.isNotEmpty) return detail!;
        return 'Paused';
      case PlaybackEventType.seek:
        if (detail != null && detail!.isNotEmpty) return 'Seeked $detail';
        return 'Seeked';
      case PlaybackEventType.syncLocal:
        return 'Saved locally';
      case PlaybackEventType.syncServer:
        return 'Synced to server';
      case PlaybackEventType.autoRewind:
        if (detail != null && detail!.isNotEmpty) return 'Auto-rewound $detail';
        return 'Auto-rewound';
      case PlaybackEventType.skipForward:
        if (detail != null && detail!.isNotEmpty) return 'Skipped forward (${detail!})';
        return 'Skipped forward';
      case PlaybackEventType.skipBackward:
        if (detail != null && detail!.isNotEmpty) return 'Skipped back (${detail!})';
        return 'Skipped back';
      case PlaybackEventType.speedChange:
        if (detail != null && detail!.isNotEmpty) return 'Speed set to ${detail!}';
        return 'Speed changed';
      case PlaybackEventType.bookFinished:
        return 'Book finished';
      case PlaybackEventType.sessionStart:
        if (detail != null && detail!.isNotEmpty) return 'Session started ($detail)';
        return 'Session started';
      case PlaybackEventType.sessionEnd:
        if (detail != null && detail!.isNotEmpty) return 'Session ended ($detail)';
        return 'Session ended';
      case PlaybackEventType.clickDebounce:
        if (detail != null && detail!.isNotEmpty) return 'Media button: $detail';
        return 'Media button';
    }
  }

  String get icon {
    switch (type) {
      case PlaybackEventType.play:
        return '▶';
      case PlaybackEventType.pause:
        return '⏸';
      case PlaybackEventType.seek:
        return '⏩';
      case PlaybackEventType.syncLocal:
        return '💾';
      case PlaybackEventType.syncServer:
        return '☁';
      case PlaybackEventType.autoRewind:
        return '⏪';
      case PlaybackEventType.skipForward:
        return '⏭';
      case PlaybackEventType.skipBackward:
        return '⏮';
      case PlaybackEventType.speedChange:
        return '⚡';
      case PlaybackEventType.bookFinished:
        return '🏁';
      case PlaybackEventType.sessionStart:
        return '🟢';
      case PlaybackEventType.sessionEnd:
        return '🔴';
      case PlaybackEventType.clickDebounce:
        return '🖲';
    }
  }
}

/// Stores per-book playback history in SharedPreferences.
class PlaybackHistoryService {
  static final PlaybackHistoryService _instance = PlaybackHistoryService._();
  factory PlaybackHistoryService() => _instance;
  PlaybackHistoryService._();

  static const int _maxEventsPerBook = 1000;

  /// Absorb Plus: sync lines (every 20 s while streaming) are held back and
  /// written with the next ordinary line instead of one write each.
  final HistoryWriteBuffer _held = HistoryWriteBuffer(maxLines: _maxEventsPerBook);

  static String _fullKey(String key) =>
      ScopedPrefs.keyForScope(UserAccountService().activeScopeKey, key);

  /// Log an event for a book.
  Future<void> log({
    required String itemId,
    required PlaybackEventType type,
    required double positionSeconds,
    String? detail,
  }) async {
    final event = PlaybackEvent(
      type: type,
      positionSeconds: positionSeconds,
      timestamp: DateTime.now(),
      detail: detail,
    );

    final key = 'playback_history_$itemId';
    final line = jsonEncode(event.toJson());
    if (type == PlaybackEventType.syncServer ||
        type == PlaybackEventType.syncLocal) {
      _held.add(_fullKey(key), line);
      return;
    }
    final fullKey = _fullKey(key);
    // One write at a time per service (body kept at its upstream indent).
    await _held.serial(() async {
    final held = _held.take(fullKey);
    final existing = await ScopedPrefs.getStringList(key);

    existing.addAll(held);
    existing.add(line);

    // Trim to max size (keep most recent)
    if (existing.length > _maxEventsPerBook) {
      existing.removeRange(0, existing.length - _maxEventsPerBook);
    }

    await ScopedPrefs.setStringList(key, existing);
    });
  }

  /// Get all events for a book, newest first.
  Future<List<PlaybackEvent>> getHistory(String itemId) async {
    final key = 'playback_history_$itemId';
    final stored = [
      ...await ScopedPrefs.getStringList(key),
      ..._held.peek(_fullKey(key)),
    ];

    final events = <PlaybackEvent>[];
    for (final json in stored) {
      try {
        events.add(PlaybackEvent.fromJson(jsonDecode(json)));
      } catch (e) {
        debugPrint('[History] Failed to parse event: $e');
      }
    }

    return events.reversed.toList(); // newest first
  }

  /// Clear history for a book.
  Future<void> clearHistory(String itemId) async {
    _held.drop(_fullKey('playback_history_$itemId'));
    await ScopedPrefs.remove('playback_history_$itemId');
  }
}

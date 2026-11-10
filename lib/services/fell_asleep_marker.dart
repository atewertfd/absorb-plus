import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../utils/episode_key.dart';
import 'audio_player_service.dart';
import 'chromecast_service.dart';
import 'scoped_prefs.dart';
import 'sleep_timer_service.dart';

/// Absorb Plus: "Fell asleep around 1:23:45 · Jump back".
///
/// When the sleep timer stops playback, the spot where the listener was last
/// known to be awake (the timer being set, extended, shaken or reset by
/// pressing play) is remembered on this device, per account and per book or
/// episode. Nothing is written to the server. The player shows a small chip
/// for it for up to [FellAsleepStore.maxAge]; it goes away when dismissed,
/// when used, or once playback has run [FellAsleepMarker.listenedPast]
/// beyond where the timer stopped.
@immutable
class FellAsleepMarker {
  const FellAsleepMarker({
    required this.at,
    required this.stoppedAt,
    required this.recordedAt,
  });

  /// Where the listener was last known to be awake; "Jump back" goes here.
  final Duration at;

  /// Where the sleep timer paused playback.
  final Duration stoppedAt;

  final DateTime recordedAt;

  /// Listening this far beyond [stoppedAt] means the gap no longer matters.
  static const listenedPast = Duration(minutes: 10);

  /// Whether the chip still has something to offer at [position].
  bool usefulAt(Duration position) =>
      position > at + const Duration(seconds: 5) &&
      position < stoppedAt + listenedPast;

  Map<String, dynamic> toJson() => {
    'a': at.inMilliseconds,
    's': stoppedAt.inMilliseconds,
    't': recordedAt.millisecondsSinceEpoch,
  };

  static FellAsleepMarker? fromJson(Object? json) {
    if (json is! Map) return null;
    final a = json['a'], s = json['s'], t = json['t'];
    if (a is! int || s is! int || t is! int) return null;
    return FellAsleepMarker(
      at: Duration(milliseconds: a),
      stoppedAt: Duration(milliseconds: s),
      recordedAt: DateTime.fromMillisecondsSinceEpoch(t),
    );
  }
}

/// The markers of the signed-in account, in [ScopedPrefs] (one small JSON
/// map). Notifies when one is saved or cleared so an open player updates.
class FellAsleepStore extends ChangeNotifier {
  FellAsleepStore({
    Future<String?> Function(String key)? read,
    Future<void> Function(String key, String value)? write,
    DateTime Function()? clock,
  }) : _read = read ?? ScopedPrefs.getString,
       _write = write ?? ScopedPrefs.setString,
       _clock = clock ?? DateTime.now;

  static FellAsleepStore instance = FellAsleepStore();

  static const prefKey = 'fork_fell_asleep_markers';

  /// Markers older than this are dropped.
  static const maxAge = Duration(days: 7);

  /// Only the newest few are kept, so the pref never grows.
  static const maxEntries = 20;

  final Future<String?> Function(String key) _read;
  final Future<void> Function(String key, String value) _write;
  final DateTime Function() _clock;

  Future<Map<String, FellAsleepMarker>> _load() async {
    try {
      final raw = await _read(prefKey);
      if (raw == null || raw.isEmpty) return {};
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return {};
      final now = _clock();
      final result = <String, FellAsleepMarker>{};
      decoded.forEach((key, value) {
        final marker = FellAsleepMarker.fromJson(value);
        if (key is String &&
            marker != null &&
            now.difference(marker.recordedAt) <= maxAge) {
          result[key] = marker;
        }
      });
      return result;
    } catch (_) {
      return {};
    }
  }

  Future<void> _save(Map<String, FellAsleepMarker> markers) async {
    final entries = markers.entries.toList()
      ..sort((a, b) => b.value.recordedAt.compareTo(a.value.recordedAt));
    await _write(
      prefKey,
      jsonEncode({
        for (final e in entries.take(maxEntries)) e.key: e.value.toJson(),
      }),
    );
  }

  /// The live marker for [key] ("itemId" or "itemId-episodeId"), if any.
  Future<FellAsleepMarker?> markerFor(String key) async => (await _load())[key];

  /// The key the last [put] or [clear] changed, so a chip for another book
  /// can skip reloading.
  String? get lastChangedKey => _lastChangedKey;
  String? _lastChangedKey;

  // Read-modify-write steps run one at a time, so a save from the sleep
  // timer and a clear from the chip never undo each other.
  // Null when idle, so a step never waits on a future from an earlier zone.
  Future<void>? _queue;

  Future<void> _serialized(Future<void> Function() step) {
    final previous = _queue;
    final next = previous == null ? step() : previous.then((_) => step());
    late final Future<void> tail;
    tail = next.catchError((_) {
      // The caller gets this error from `next`; the queue only has to move on.
    }).whenComplete(() {
      if (identical(_queue, tail)) _queue = null;
    });
    _queue = tail;
    return next;
  }

  Future<void> put(String key, FellAsleepMarker marker) =>
      _serialized(() async {
        final markers = await _load();
        markers[key] = marker;
        await _save(markers);
        _lastChangedKey = key;
        notifyListeners();
      });

  Future<void> clear(String key) => _serialized(() async {
    final markers = await _load();
    if (markers.remove(key) == null) return;
    await _save(markers);
    _lastChangedKey = key;
    notifyListeners();
  });
}

/// Watches the sleep timer for signs the listener is awake and saves a
/// [FellAsleepMarker] when the timer stops playback.
class FellAsleepTracker {
  FellAsleepTracker({
    FellAsleepStore? store,
    ({String? key, Duration position}) Function()? probe,
    DateTime Function()? clock,
  }) : _store = store,
       _probe = probe ?? _playerProbe,
       _clock = clock ?? DateTime.now;

  static FellAsleepTracker instance = FellAsleepTracker();

  /// A timer that stops within this long of the last awake sign leaves
  /// nothing worth jumping back for (the sleep rewind already covers it).
  static const minGap = Duration(minutes: 2);

  final FellAsleepStore? _store;
  final ({String? key, Duration position}) Function() _probe;
  final DateTime Function() _clock;

  FellAsleepStore get store => _store ?? FellAsleepStore.instance;

  bool _wasActive = false;
  Duration _lastRemaining = Duration.zero;
  int _lastChapters = 0;
  ({String key, Duration position})? _awake;

  @visibleForTesting
  ({String key, Duration position})? get lastAwake => _awake;

  /// Hooked into [SleepTimerService]'s constructor.
  static void attach(SleepTimerService timer) {
    timer.addListener(
      () => instance.onTimerChanged(
        active: timer.isActive,
        remaining: timer.timeRemaining,
        chapters: timer.chaptersRemaining,
      ),
    );
  }

  /// Every timer notification: setting it, extending it (shake, +time,
  /// +chapter) and resetting it on play all count as being awake. The
  /// countdown itself only ever goes down, so it never does.
  void onTimerChanged({
    required bool active,
    required Duration remaining,
    required int chapters,
  }) {
    final started = active && !_wasActive;
    final extended =
        active &&
        _wasActive &&
        (remaining > _lastRemaining + const Duration(seconds: 2) ||
            chapters > _lastChapters);
    _wasActive = active;
    _lastRemaining = remaining;
    _lastChapters = chapters;
    if (started || extended) {
      final now = _probe();
      final key = now.key;
      _awake = key == null ? null : (key: key, position: now.position);
    } else if (!active) {
      // Cancelled or fired: the next timer starts over. A firing timer
      // reports to [onSleepStopped] before it cancels.
      _awake = null;
    }
  }

  /// Called by the sleep timer just before it pauses for sleep.
  Future<void> onSleepStopped(String? key, double positionSeconds) async {
    final awake = _awake;
    _awake = null;
    if (key == null || awake == null || awake.key != key) return;
    final stoppedAt = Duration(milliseconds: (positionSeconds * 1000).round());
    if (stoppedAt - awake.position < minGap) return;
    debugPrint(
      '[FellAsleep] Marker at ${awake.position.inSeconds}s '
      '(timer stopped at ${stoppedAt.inSeconds}s)',
    );
    try {
      await store.put(
        key,
        FellAsleepMarker(
          at: awake.position,
          stoppedAt: stoppedAt,
          recordedAt: _clock(),
        ),
      );
    } catch (e) {
      debugPrint('[FellAsleep] Could not save the marker: $e');
    }
  }

  static ({String? key, Duration position}) _playerProbe() {
    final cast = ChromecastService();
    if (cast.isCasting) {
      final item = cast.castingItemId;
      return (
        key: item == null ? null : episodeKeyFor(item, cast.castingEpisodeId),
        position: cast.castPosition,
      );
    }
    final player = AudioPlayerService();
    final item = player.currentItemId;
    return (
      key: item == null ? null : episodeKeyFor(item, player.currentEpisodeId),
      position: player.position,
    );
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'scoped_prefs.dart';

/// Seconds to skip at the start (intro) and end (outro) of a book.
@immutable
class BookSkip {
  final int intro;
  final int outro;
  const BookSkip({this.intro = 0, this.outro = 0});

  static const none = BookSkip();

  bool get isEmpty => intro <= 0 && outro <= 0;

  BookSkip copyWith({int? intro, int? outro}) =>
      BookSkip(intro: intro ?? this.intro, outro: outro ?? this.outro);

  String encode() => '$intro,$outro';

  static BookSkip? decode(String? raw) {
    if (raw == null) return null;
    final parts = raw.split(',');
    if (parts.length != 2) return null;
    final intro = int.tryParse(parts[0].trim());
    final outro = int.tryParse(parts[1].trim());
    if (intro == null || outro == null) return null;
    return BookSkip(
      intro: intro.clamp(0, BookSettingsService.maxSkipSeconds),
      outro: outro.clamp(0, BookSettingsService.maxSkipSeconds),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is BookSkip && other.intro == intro && other.outro == outro;

  @override
  int get hashCode => Object.hash(intro, outro);

  @override
  String toString() => 'BookSkip(intro: $intro, outro: $outro)';
}

/// The first series a library item belongs to.
typedef BookSeries = ({String id, String name});

/// Absorb Plus: per-book and per-series playback settings, reached from the
/// book page's "Book settings" sheet. Everything is per account (ScopedPrefs).
///
/// - **Series speed memory.** Every per-book speed save also remembers the
///   speed for the book's series. A book with no speed of its own starts at
///   its series' remembered speed (see [PlayerSettings.getBookSpeed]), then
///   the default speed.
/// - **Intro / outro skip**, per book, or for a whole series. A book's own
///   value wins over its series' value.
///
/// A book's series comes from the book page or a playback session (both carry
/// `media.metadata.series`); it is remembered per item so playback can look it
/// up without the network.
class BookSettingsService {
  BookSettingsService._();

  static const maxSkipSeconds = 120;

  static String _bookSpeedKey(String itemId) => 'bookSpeed_$itemId';
  static String _seriesOfKey(String itemId) => 'bookSeries_$itemId';
  static String _seriesNameKey(String seriesId) => 'seriesName_$seriesId';
  static String _seriesSpeedKey(String seriesId) => 'seriesSpeed_$seriesId';
  static String _bookSkipKey(String itemId) => 'bookSkip_$itemId';
  static String _seriesSkipKey(String seriesId) => 'seriesSkip_$seriesId';

  // Writes run one after another, so a reset queued after a speed save can't
  // be overtaken by it (AudioPlayerService.setSpeed saves without awaiting).
  static Future<void>? _queue;

  static Future<void> _enqueue(Future<void> Function() write) {
    final prev = _queue;
    final next = (prev == null ? Future.sync(write) : prev.then((_) => write()))
        .catchError((Object e) {
          debugPrint('[BookSettings] write failed: $e');
        });
    _queue = next;
    return next;
  }

  /// Reads wait for queued writes, but never long: playback starts read
  /// through here and must not hang on a stuck prefs write.
  static Future<void> _writesLanded() async {
    final pending = _queue;
    if (pending == null) return;
    await pending.timeout(const Duration(seconds: 2), onTimeout: () {});
  }

  /// For tests: wait until queued writes have landed.
  @visibleForTesting
  static Future<void> settle() => _queue ?? Future<void>.value();

  /// For tests: forget a queue left by an earlier test's (fake) zone.
  @visibleForTesting
  static void resetQueueForTest() => _queue = null;

  // ── Series lookup ──

  /// The first series in a library item (full or session metadata shape).
  static BookSeries? seriesOf(Map<String, dynamic>? item) {
    if (item == null) return null;
    final media = item['media'];
    final meta = media is Map ? media['metadata'] : item['mediaMetadata'];
    return seriesFromMetadata(meta is Map ? meta : item);
  }

  /// The first series in a metadata map (`series` as a list or a single map).
  static BookSeries? seriesFromMetadata(Map<dynamic, dynamic>? meta) {
    if (meta == null) return null;
    final raw = meta['series'];
    Map? first;
    if (raw is List) {
      for (final s in raw) {
        if (s is Map && (s['id']?.toString().trim() ?? '').isNotEmpty) {
          first = s;
          break;
        }
      }
    } else if (raw is Map) {
      first = raw;
    }
    if (first == null) return null;
    final id = first['id']?.toString().trim() ?? '';
    if (id.isEmpty) return null;
    final name = first['name']?.toString().trim() ?? '';
    return (id: id, name: name);
  }

  /// Remember which series [itemId] belongs to. Writes only on a change.
  static Future<void> rememberSeries(String itemId, BookSeries? series) {
    if (itemId.isEmpty || series == null) return Future.value();
    return _enqueue(() async {
      final key = _seriesOfKey(itemId);
      if (await ScopedPrefs.getString(key) != series.id) {
        await ScopedPrefs.setString(key, series.id);
      }
      if (series.name.isNotEmpty) {
        final nameKey = _seriesNameKey(series.id);
        if (await ScopedPrefs.getString(nameKey) != series.name) {
          await ScopedPrefs.setString(nameKey, series.name);
        }
      }
    });
  }

  static Future<void> rememberSeriesFromItem(
    String itemId,
    Map<String, dynamic>? item,
  ) => rememberSeries(itemId, seriesOf(item));

  static Future<void> rememberSeriesFromMetadata(
    String? itemId,
    Map<dynamic, dynamic>? meta,
  ) => itemId == null
      ? Future.value()
      : rememberSeries(itemId, seriesFromMetadata(meta));

  static Future<String?> seriesIdFor(String itemId) =>
      ScopedPrefs.getString(_seriesOfKey(itemId));

  static Future<String?> seriesNameFor(String seriesId) =>
      ScopedPrefs.getString(_seriesNameKey(seriesId));

  // ── Speed ──

  /// The speed saved for this book itself, if any.
  static Future<double?> ownSpeed(String itemId) async {
    await _writesLanded();
    return ScopedPrefs.getDouble(_bookSpeedKey(itemId));
  }

  /// The speed last used in this book's series, if the series is known.
  static Future<double?> seriesSpeedFor(String itemId) async {
    final seriesId = await seriesIdFor(itemId);
    if (seriesId == null || seriesId.isEmpty) return null;
    return ScopedPrefs.getDouble(_seriesSpeedKey(seriesId));
  }

  /// The book's own speed, else its series' remembered speed.
  static Future<double?> bookSpeedOrSeries(String itemId) async {
    final own = await ownSpeed(itemId);
    if (own != null) return own;
    return seriesSpeedFor(itemId);
  }

  /// Save a book's speed and remember it for the book's series.
  static Future<void> saveBookSpeed(String itemId, double speed) {
    return _enqueue(() async {
      await ScopedPrefs.setDouble(_bookSpeedKey(itemId), speed);
      final seriesId = await seriesIdFor(itemId);
      if (seriesId != null && seriesId.isNotEmpty) {
        await ScopedPrefs.setDouble(_seriesSpeedKey(seriesId), speed);
      }
    });
  }

  // ── Intro / outro ──

  static Future<BookSkip?> ownSkip(String itemId) async {
    await _writesLanded();
    return BookSkip.decode(await ScopedPrefs.getString(_bookSkipKey(itemId)));
  }

  static Future<BookSkip?> seriesSkip(String seriesId) async {
    await _writesLanded();
    return BookSkip.decode(
      await ScopedPrefs.getString(_seriesSkipKey(seriesId)),
    );
  }

  /// The skip that applies to [itemId]: its own, else its series', else none.
  static Future<BookSkip> skipFor(String itemId) async {
    final own = await ownSkip(itemId);
    if (own != null) return own;
    final seriesId = await seriesIdFor(itemId);
    if (seriesId != null && seriesId.isNotEmpty) {
      final s = await seriesSkip(seriesId);
      if (s != null) return s;
    }
    return BookSkip.none;
  }

  /// Use [skip] for this book only. Stops applying a series value to the
  /// series when [seriesId] is given (the "whole series" switch turned off).
  static Future<void> setBookSkip(
    String itemId,
    BookSkip skip, {
    String? clearSeriesId,
  }) {
    return _enqueue(() async {
      if (skip.isEmpty) {
        await ScopedPrefs.remove(_bookSkipKey(itemId));
      } else {
        await ScopedPrefs.setString(_bookSkipKey(itemId), skip.encode());
      }
      if (clearSeriesId != null && clearSeriesId.isNotEmpty) {
        await ScopedPrefs.remove(_seriesSkipKey(clearSeriesId));
      }
    });
  }

  /// Use [skip] for every book in [seriesId]. [itemId]'s own value is dropped
  /// so it follows the series too.
  static Future<void> setSeriesSkip(
    String seriesId,
    String itemId,
    BookSkip skip,
  ) {
    return _enqueue(() async {
      await ScopedPrefs.remove(_bookSkipKey(itemId));
      if (skip.isEmpty) {
        await ScopedPrefs.remove(_seriesSkipKey(seriesId));
      } else {
        await ScopedPrefs.setString(_seriesSkipKey(seriesId), skip.encode());
      }
    });
  }

  /// Back to defaults: the book's own speed and skip, its series' remembered
  /// speed (otherwise the book would just inherit its old speed back), and,
  /// with [includeSeriesSkip], the series' intro/outro.
  static Future<void> reset(String itemId, {bool includeSeriesSkip = false}) {
    return _enqueue(() async {
      await ScopedPrefs.remove(_bookSpeedKey(itemId));
      await ScopedPrefs.remove(_bookSkipKey(itemId));
      final seriesId = await seriesIdFor(itemId);
      if (seriesId != null && seriesId.isNotEmpty) {
        await ScopedPrefs.remove(_seriesSpeedKey(seriesId));
        if (includeSeriesSkip) {
          await ScopedPrefs.remove(_seriesSkipKey(seriesId));
        }
      }
    });
  }

  // ── Pure playback rules ──

  /// Where a book starts once the intro skip is applied. Only a start from
  /// the very beginning moves; a resumed position never does. An intro that
  /// would cover half the book or more is ignored.
  static double introStart(
    double resolvedStart,
    int introSeconds,
    double totalDuration,
  ) {
    if (introSeconds <= 0) return resolvedStart;
    if (resolvedStart >= 1.0) return resolvedStart;
    if (totalDuration > 0 && introSeconds >= totalDuration / 2) {
      return resolvedStart;
    }
    return introSeconds.toDouble();
  }
}

/// Ends a book [outro] seconds early, once, when playback runs naturally
/// across that point. A start or a seek inside the outro never ends the book;
/// the natural end does then.
class OutroGuard {
  String? _key;
  int _outro = 0;
  double? _prev;
  bool _fired = false;

  /// Longest jump between two position ticks still counted as playing on
  /// (ticks are ~200 ms; slower in the background, and up to 5x speed).
  static const maxTickJumpSeconds = 8.0;

  /// Shortest book the outro applies to, beyond the outro itself.
  static const minBookBeyondOutroSeconds = 60.0;

  /// Arm for a new start. [key] identifies the item (null or 0 disarms).
  void arm(String? key, int outroSeconds) {
    _key = key;
    _outro = outroSeconds;
    _prev = null;
    _fired = false;
  }

  String? get armedKey => _key;
  int get outroSeconds => _outro;

  /// Feed one position tick. Returns true exactly once, when the book should
  /// finish now.
  bool shouldFinish({
    required String? key,
    required double positionSec,
    required double totalDuration,
    required bool playing,
    bool seekedRecently = false,
  }) {
    if (_fired || _outro <= 0 || key == null || key != _key) {
      _prev = null;
      return false;
    }
    final prev = _prev;
    _prev = positionSec;
    // A skip or scrub into the outro is the listener's choice, not playing on.
    if (!playing || prev == null || seekedRecently) return false;
    if (totalDuration < _outro + minBookBeyondOutroSeconds) return false;
    final threshold = totalDuration - _outro;
    final step = positionSec - prev;
    if (prev < threshold &&
        positionSec >= threshold &&
        step > 0 &&
        step <= maxTickJumpSeconds) {
      _fired = true;
      return true;
    }
    return false;
  }
}

/// Playback-side state for one start: the intro target (so session-start
/// rewind doesn't pull it back) and the outro guard.
class BookPlaybackRules {
  BookPlaybackRules();

  /// The player's instance, so the Book settings sheet can update the outro
  /// of the book that is playing now.
  static final BookPlaybackRules instance = BookPlaybackRules();

  final OutroGuard outro = OutroGuard();
  double? _introTarget;
  String? _itemId;
  int _intro = 0;

  /// The settings sheet changed [itemId]'s skip: re-arm the outro now if that
  /// book is the one loaded (the intro waits for its next start from 0).
  void updateLive(String itemId, BookSkip skip) {
    if (itemId != _itemId) return;
    outro.arm(skip.outro > 0 ? itemId : null, skip.outro);
  }

  /// [seriesId]'s skip changed (from another book's sheet): re-arm the outro
  /// of the loaded book if it belongs to that series, using whatever now
  /// applies to it (its own value still wins over the series one).
  Future<void> updateLiveSeries(String seriesId) async {
    final itemId = _itemId;
    if (itemId == null) return;
    try {
      if (await BookSettingsService.seriesIdFor(itemId) != seriesId) return;
      final skip = await BookSettingsService.skipFor(itemId);
      if (itemId != _itemId) return;
      outro.arm(skip.outro > 0 ? itemId : null, skip.outro);
    } catch (e) {
      debugPrint('[BookSettings] Could not update the playing book: $e');
    }
  }

  /// Read the skip that applies to this start (books only). Has no side
  /// effects, so a superseded start can drop the result; pass it to [commit].
  /// Never throws: a failure means no skip.
  static Future<BookSkip> skipForStart(String itemId, String? episodeId) async {
    if (episodeId != null) return BookSkip.none;
    try {
      return await BookSettingsService.skipFor(itemId);
    } catch (e) {
      debugPrint('[BookSettings] Could not read the skip settings: $e');
      return BookSkip.none;
    }
  }

  /// Remember [skip] for this start of [itemId] and arm the outro guard. The
  /// intro waits for [introStart], once the start position is final.
  void commit({
    required String itemId,
    required BookSkip skip,
    bool allowIntro = true,
  }) {
    _introTarget = null;
    _itemId = itemId;
    _intro = allowIntro ? skip.intro : 0;
    outro.arm(skip.outro > 0 ? itemId : null, skip.outro);
  }

  /// Where this start begins once the intro is skipped. Called with the final
  /// start position (after the server/local reconcile), so a resumed position
  /// is never moved; only a start from the very beginning is.
  double introStart(double startTime, double totalDuration) {
    if (_intro <= 0) return startTime;
    final start = BookSettingsService.introStart(
      startTime,
      _intro,
      totalDuration,
    );
    if (start != startTime) {
      _introTarget = start;
      debugPrint('[BookSettings] Skipping the intro: starting at ${start}s');
    }
    return start;
  }

  /// True while [startTime] is the intro target set for this start.
  bool isIntroStart(double startTime) {
    final t = _introTarget;
    return t != null && (startTime - t).abs() < 0.5;
  }
}

import 'package:audio_service_platform_interface/audio_service_platform_interface.dart';

/// One timeline update for the Windows media flyout (SMTC).
class SmtcTimelineUpdate {
  const SmtcTimelineUpdate({
    required this.position,
    required this.duration,
    required this.rate,
    required this.seekable,
  });

  final Duration position;
  final Duration duration;
  final double rate;
  final bool seekable;

  Map<String, Object> toArguments() => {
        'positionMs': position.inMilliseconds,
        'durationMs': duration.inMilliseconds,
        'rate': rate,
        'seekable': seekable,
      };

  @override
  String toString() =>
      'SmtcTimelineUpdate(${position.inMilliseconds}/${duration.inMilliseconds} ms, '
      'rate $rate, seekable $seekable)';
}

/// Decides when the flyout's timeline needs a new position.
///
/// The position and length are the ones the app hands audio_service for the
/// system media controls (the same values Android's notification shows):
/// [PlaybackStateMessage.updatePosition] and [MediaItemMessage.duration].
///
/// Windows moves the bar on its own while playing, so an update goes out only
/// when something changed (play/pause, speed, item, length, a seek or any
/// other jump) and otherwise at most every [minInterval] while playing. The
/// app emits playback states far more often than that on desktop, so most are
/// skipped here.
class SmtcTimeline {
  SmtcTimeline({
    DateTime Function()? clock,
    this.minInterval = const Duration(milliseconds: 4500),
    this.jumpTolerance = const Duration(milliseconds: 1500),
  }) : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;

  /// Shortest gap between two updates while nothing but time moved. Just
  /// under the app's 5 s playback-state cadence, so that cadence is kept.
  final Duration minInterval;

  /// A position this far from where the last update predicts counts as a
  /// jump (seek, chapter change) and is sent at once.
  final Duration jumpTolerance;

  String? _itemId;
  Duration? _duration;
  PlaybackStateMessage? _lastState;
  bool _forceNext = false;

  DateTime? _sentAt;
  Duration _sentPosition = Duration.zero;
  Duration? _sentDuration;
  bool _sentPlaying = false;
  double _sentRate = 1.0;
  bool _sentSeekable = true;

  /// Whether the flyout may seek (the app drops the seek action when the
  /// user locked the seek bar).
  bool get seekable =>
      _lastState?.systemActions.contains(MediaActionMessage.seek) ?? true;

  /// A new media item. Returns an update when the item or its length changed
  /// (a chapter change in chapter mode, a speed change) and a playback state
  /// is known. The app may send the state before the item; loading the new
  /// item emits fresh states right after, which correct any stale position.
  SmtcTimelineUpdate? onMediaItem(MediaItemMessage item) {
    final itemChanged = item.id != _itemId;
    final durationChanged = item.duration != _duration;
    _itemId = item.id;
    _duration = item.duration;
    if (!itemChanged && !durationChanged) return null;
    if (itemChanged) _sentAt = null;
    final state = _lastState;
    return state == null ? null : onState(state);
  }

  /// A new playback state. Returns the update to send, or null to skip it.
  SmtcTimelineUpdate? onState(PlaybackStateMessage state) {
    _lastState = state;
    final duration = _duration;
    if (duration == null || duration <= Duration.zero) return null;

    final now = _clock();
    final playing = _isAdvancing(state);
    final rate = state.speed > 0 ? state.speed : 1.0;
    final position = _clamp(_positionOf(state, now), duration);
    final canSeek = seekable;

    final sentAt = _sentAt;
    bool send;
    if (sentAt == null || _forceNext) {
      send = true;
    } else if (playing != _sentPlaying ||
        rate != _sentRate ||
        duration != _sentDuration ||
        canSeek != _sentSeekable) {
      send = true;
    } else {
      final expected = _sentPlaying
          ? _sentPosition + _scale(now.difference(sentAt), _sentRate)
          : _sentPosition;
      final drift = (position - _clamp(expected, duration)).abs();
      if (drift > jumpTolerance) {
        send = true;
      } else {
        send = playing && now.difference(sentAt) >= minInterval;
      }
    }
    if (!send) return null;

    _forceNext = false;
    _sentAt = now;
    _sentPosition = position;
    _sentDuration = duration;
    _sentPlaying = playing;
    _sentRate = rate;
    _sentSeekable = canSeek;
    return SmtcTimelineUpdate(
      position: position,
      duration: duration,
      rate: rate,
      seekable: canSeek,
    );
  }

  /// Send the next state even if nothing seems to have changed (after the
  /// flyout asked for a seek).
  void forceNext() => _forceNext = true;

  /// Playback stopped: the next item starts from scratch.
  void reset() {
    _itemId = null;
    _duration = null;
    _lastState = null;
    _sentAt = null;
    _forceNext = false;
  }

  static bool _isAdvancing(PlaybackStateMessage state) =>
      state.playing &&
      state.processingState == AudioProcessingStateMessage.ready;

  /// Where playback is now, as audio_service's PlaybackState.position works
  /// it out: the reported position plus the time since, while advancing.
  static Duration _positionOf(PlaybackStateMessage state, DateTime now) {
    if (!_isAdvancing(state)) return state.updatePosition;
    final elapsed = now.difference(state.updateTime);
    if (elapsed.isNegative) return state.updatePosition;
    return state.updatePosition + _scale(elapsed, state.speed);
  }

  static Duration _scale(Duration d, double rate) => rate == 1.0
      ? d
      : Duration(microseconds: (d.inMicroseconds * rate).round());

  static Duration _clamp(Duration position, Duration duration) {
    if (position.isNegative) return Duration.zero;
    return position > duration ? duration : position;
  }
}

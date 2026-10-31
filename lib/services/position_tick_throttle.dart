import 'dart:async';

/// Absorb Plus: thins out the player's position ticks on desktop.
///
/// just_audio emits a position for every playback event, and on Windows and
/// Linux media_kit sends one for every libmpv `time-pos` change: tens a
/// second. Every listener (progress saving, chapter tracking, the cards)
/// then ran that often. Android's ExoPlayer ticks at most every 0.5-1 s and
/// stays unthrottled.
///
/// A tick passes when any of these holds, otherwise it is held back:
/// - it is the first one;
/// - the play/pause or processing state changed since the last passed tick;
/// - the position jumped more than [jump] since the previous tick (a seek,
///   a track change, an engine reset to 0);
/// - [interval] has passed since the last passed tick;
/// - the position moved [maxMediaGap] since the last passed tick. At high
///   speed (up to 5x) 250 ms is more than a second of audio; this keeps at
///   least one tick in every second of the book, so the "every 5 seconds"
///   save and the sync that rides on it still fire on time.
///
/// A held-back tick is not lost: if nothing else passes, the latest one is
/// sent when [interval] runs out (pausing or seeking while paused stops the
/// ticks, and listeners must still see where it ended).
class PositionTickThrottle {
  PositionTickThrottle({
    this.interval = const Duration(milliseconds: 250),
    this.jump = const Duration(milliseconds: 1500),
    this.maxMediaGap = const Duration(milliseconds: 500),
  });

  final Duration interval;
  final Duration jump;
  final Duration maxMediaGap;

  Duration? _lastRaw;
  Duration? _lastPassed;
  Duration? _lastPassedAt;
  Object? _lastState;

  /// Whether the tick at [position] (engine [state]) seen at clock time
  /// [now] goes through. A passing tick becomes the new reference.
  bool shouldPass(Duration position, Object? state, Duration now) {
    final lastRaw = _lastRaw;
    _lastRaw = position;
    final lastPassed = _lastPassed;
    final lastPassedAt = _lastPassedAt;
    final pass = lastPassed == null ||
        lastPassedAt == null ||
        state != _lastState ||
        (lastRaw != null && (position - lastRaw).abs() > jump) ||
        now - lastPassedAt >= interval ||
        (position - lastPassed).abs() >= maxMediaGap;
    if (pass) markPassed(position, state, now);
    return pass;
  }

  /// Records a tick sent without [shouldPass] (the trailing one).
  void markPassed(Duration position, Object? state, Duration now) {
    _lastPassed = position;
    _lastPassedAt = now;
    _lastState = state;
  }

  /// How long until the trailing tick is due.
  Duration remaining(Duration now) {
    final at = _lastPassedAt;
    if (at == null) return Duration.zero;
    final left = interval - (now - at);
    return left.isNegative ? Duration.zero : left;
  }
}

/// [source] with [PositionTickThrottle] applied, one throttle per listener
/// (so a late listener still gets the replayed current position at once).
/// [state] reports the engine's play/pause and processing state at each
/// tick; [clock] is a monotonic time, injectable for tests.
Stream<Duration> throttlePositionTicks(
  Stream<Duration> source, {
  required Object? Function() state,
  Duration Function()? clock,
}) {
  final now = clock ?? _monotonicClock;
  return Stream<Duration>.multi((controller) {
    final throttle = PositionTickThrottle();
    Timer? trailing;
    Duration? held;

    void flush() {
      trailing = null;
      final position = held;
      held = null;
      if (position == null) return;
      throttle.markPassed(position, state(), now());
      controller.addSync(position);
    }

    final sub = source.listen(
      (position) {
        final t = now();
        if (throttle.shouldPass(position, state(), t)) {
          trailing?.cancel();
          trailing = null;
          held = null;
          controller.addSync(position);
        } else {
          held = position;
          trailing ??= Timer(throttle.remaining(t), flush);
        }
      },
      onError: controller.addErrorSync,
      onDone: () {
        trailing?.cancel();
        trailing = null;
        controller.closeSync();
      },
    );
    controller
      ..onPause = sub.pause
      ..onResume = sub.resume
      ..onCancel = () {
        trailing?.cancel();
        trailing = null;
        return sub.cancel();
      };
  }, isBroadcast: true);
}

final Stopwatch _stopwatch = Stopwatch()..start();
Duration _monotonicClock() => _stopwatch.elapsed;

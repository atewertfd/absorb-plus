import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart' show PlatformException;

/// What a recovery is doing, for the quiet status the player shows.
enum PlaybackRecoveryStatus {
  /// Nothing to recover, or the stream came back.
  idle,

  /// The stream dropped and a reload is waiting or running.
  reconnecting,

  /// Every retry failed; playback stops as it did before recovery existed.
  gaveUp,
}

/// The answer to "is this stream still stuck?" after a long buffering spell.
enum StallVerdict {
  /// Not buffering any more, paused, not a stream: stop watching.
  notStalled,

  /// Still buffering, but not (yet) a network failure: look again later.
  keepWaiting,

  /// Treat it as a dropped connection and start a recovery.
  failed,
}

/// Recorded as the failure when a stream stalled instead of erroring.
class PlaybackStallError implements Exception {
  final Duration stalledFor;
  const PlaybackStallError(this.stalledFor);

  @override
  String toString() => 'Stream stalled for ${stalledFor.inSeconds}s';
}

/// Recorded as the failure when a desktop stream reported its end well
/// before the end of the book: libmpv can take a dropped connection for the
/// end of the file and report no error at all.
class PlaybackEndedEarlyError implements Exception {
  final double atSec;
  final double totalSec;
  const PlaybackEndedEarlyError(this.atSec, this.totalSec);

  /// How far before the end a reported end counts as early. Generous, so a
  /// book whose listed length is a little off still finishes normally.
  static const slackSec = 10.0;

  /// True when an end reported at [atSec] of a [totalSec] book can't be the
  /// real end. An unknown position or length never counts.
  static bool isEarly(double atSec, double totalSec) =>
      totalSec > 0 && atSec > 0 && atSec < totalSec - slackSec;

  @override
  String toString() => 'Stream ended early at ${atSec.toStringAsFixed(1)}s '
      'of ${totalSec.toStringAsFixed(1)}s';
}

/// Brings a streamed book back after the connection drops (Wi-Fi blip,
/// Tailscale reconnect, server restart) instead of leaving it stopped.
///
/// The policy only: when to reload, where, and when to give up. The player
/// service supplies the actual reload, the reachability probe and the stall
/// check, and tells it about failures, buffering, user actions and the
/// network coming back. Nothing here touches the player directly, so the
/// rules can be tested with a fake clock.
///
/// Rules:
/// - Retries wait [schedule] (2 s, 5 s, 10 s, 20 s), then [repeatDelay]
///   (30 s) each, and give up once [giveUpAfter] (5 min) has passed without
///   a successful reload.
/// - Each attempt asks [isReachable] first, so a phone that is still offline
///   doesn't tear down the player for a reload that can't work.
/// - Every reload goes to the position recorded when the stream first failed,
///   minus [rewind]. Positions seen while waiting are ignored; only a failure
///   after a reload had worked moves the target, and only forward. Retries
///   never step further back than that.
/// - [retarget] (the user sought or skipped while it waits) moves the target
///   to exactly where the user asked, and the recovery carries on.
/// - [retryNow] (the network came back) skips the rest of the current wait.
/// - [cancel] (pause, stop, another book) ends everything at once, and
///   a reload that was in flight is ignored when it returns.
/// - After a reload works the attempt count is kept for [healthyAfter], so a
///   connection that keeps flapping keeps backing off instead of reloading
///   every 2 s. The give-up clock keeps running through that window too: only
///   a stream that stays healthy for [healthyAfter] starts a fresh budget.
/// - A stream that fails again at the spot a reload just went to, before it
///   played on, is the file and not the network (Android reports a damaged
///   frame as the same "source error" as a dropped connection). After
///   [sameSpotLimit] such failures it gives up instead of replaying the same
///   seconds forever.
class PlaybackRecovery {
  PlaybackRecovery({
    required this.reload,
    required this.lastPosition,
    this.isReachable,
    this.checkStall,
    this.onStart,
    this.onStatus,
    this.onReloadTimedOut,
    this.log,
    this.schedule = defaultSchedule,
    this.repeatDelay = const Duration(seconds: 30),
    this.giveUpAfter = const Duration(minutes: 5),
    this.stallThreshold = const Duration(seconds: 15),
    this.healthyAfter = const Duration(seconds: 30),
    this.rewind = const Duration(seconds: 2),
    this.reloadTimeout = const Duration(minutes: 2),
    this.sameSpotLimit = 2,
  });

  static const defaultSchedule = <Duration>[
    Duration(seconds: 2),
    Duration(seconds: 5),
    Duration(seconds: 10),
    Duration(seconds: 20),
  ];

  /// Reloads the current item at [resumeAtSec] and starts it playing.
  /// True when the source loaded. [lastError] is the newest failure.
  final Future<bool> Function(double resumeAtSec, Object? lastError) reload;

  /// The newest trustworthy book position in seconds (0 when unknown).
  final double Function() lastPosition;

  /// Whether the server answers right now. Null skips the probe.
  final Future<bool> Function()? isReachable;

  /// Asked after every [stallThreshold] of uninterrupted buffering.
  /// Null treats any such stall as a failure.
  final Future<StallVerdict> Function(Duration stalledFor)? checkStall;

  /// Called once when a recovery begins, before anything is scheduled.
  final void Function()? onStart;

  final void Function(PlaybackRecoveryStatus status, Object? lastError)?
      onStatus;

  /// A reload outlived [reloadTimeout] and counts as failed. The service
  /// must make sure it can't start audio if it finishes later anyway.
  final void Function()? onReloadTimedOut;
  final void Function(String message)? log;

  final List<Duration> schedule;
  final Duration repeatDelay;
  final Duration giveUpAfter;
  final Duration stallThreshold;
  final Duration healthyAfter;
  final Duration rewind;

  /// A reload still loading after this counts as a failed attempt, so one
  /// stuck load can't hold the recovery forever.
  final Duration reloadTimeout;

  /// Failures right where a reload went (see the class rules) before it
  /// gives up.
  final int sameSpotLimit;

  /// How far past the reload target a failure still counts as the same spot.
  static const sameSpotSlackSec = 5.0;

  _Phase _phase = _Phase.idle;
  // Where the last reload went, and how many reloads in a row failed again
  // right there.
  double _lastReloadAt = 0;
  int _sameSpotFailures = 0;
  int _attempt = 0;
  double _resumeAtSec = 0;
  // The target is one the user picked (see [retarget]): reload exactly there.
  bool _exactTarget = false;
  bool _healable = false;
  Object? _lastError;
  // Bumped by cancel/give-up/reset: an attempt that comes back under an old
  // value belongs to a recovery that no longer exists.
  int _generation = 0;
  Timer? _retryTimer;
  Timer? _deadlineTimer;
  bool _deadlinePassed = false;
  Timer? _healthyTimer;

  Timer? _stallTimer;
  int _stallGeneration = 0;
  Duration _stalledFor = Duration.zero;

  /// A recovery is running or has just reloaded and is being watched.
  bool get isActive => _phase != _Phase.idle;

  /// Waiting for a retry, checking the server or reloading right now.
  bool get isRecovering =>
      _phase == _Phase.waiting ||
      _phase == _Phase.probing ||
      _phase == _Phase.reloading;

  bool get isReloading => _phase == _Phase.reloading;

  /// Changes whenever a recovery ends or is cancelled, so a reload can tell
  /// whether it still belongs to the recovery that started it.
  int get generation => _generation;

  /// Attempts made in the current recovery.
  int get attempt => _attempt;

  /// Where the next reload goes, in seconds.
  double get resumeAtSec => _exactTarget
      ? _resumeAtSec
      : math.max(0, _resumeAtSec - _seconds(rewind));

  /// Where the stream was when it failed, in seconds: what the player should
  /// report as its position while it waits for a retry.
  double get failedAtSec => _resumeAtSec;

  /// Recovering with no reload of ours loading: waiting for the next
  /// attempt or checking the server. The player's own state is stale then.
  bool get isWaiting => _phase == _Phase.waiting || _phase == _Phase.probing;

  /// The recovery began with (and so far only saw) a stall: the player kept
  /// its own position, and it may come back without a reload.
  bool get isStallOnly => _healable;

  /// Errors that mean the network (not the file or the decoder) failed.
  /// The source errors ExoPlayer raises for dropped HTTP connections, plus
  /// the wording other engines use for the same thing.
  static bool isNetworkError(Object error) {
    if (error is PlaybackStallError) return true;
    if (error is PlaybackEndedEarlyError) return true;
    if (error is TimeoutException) return true;
    var text = error.toString().toLowerCase();
    if (error is PlatformException) {
      text = '$text ${error.message?.toLowerCase() ?? ''}';
    }
    // An HTTP status that retrying can't fix (bad request, unsupported
    // media) is not a dropped connection. Expired sign-ins (401/403), a
    // session the server forgot (404), a stale cached range (416), rate
    // limits and server errors are: a reload opens a fresh session.
    final status = RegExp(r'response code: (\d{3})').firstMatch(text);
    if (status != null) {
      final code = int.parse(status.group(1)!);
      const retryable4xx = {401, 403, 404, 408, 416, 429};
      return code >= 500 || code < 400 || retryable4xx.contains(code);
    }
    const signs = [
      'source error',
      'type_source',
      'httpdatasource',
      'http_data_source',
      'unable to connect',
      'connection',
      'network',
      'socket',
      'timed out',
      'timeout',
      'failed to open',
      'host lookup',
      'unreachable',
    ];
    return signs.any(text.contains);
  }

  /// Listening-time clocks (stats accrual, the session's timeListened) are
  /// wall clocks stamped at the last tick. A reconnect wait is wall time with
  /// nothing playing, so a clock stamped at [clock] skips the span from
  /// [stoppedAt] to [resumedAt]: the time listened before the drop still
  /// counts, the wait doesn't. A clock stamped after [stoppedAt] (a reload
  /// restarted it) is already past the wait and stays as it is.
  static DateTime skipSilentSpan(
    DateTime clock,
    DateTime stoppedAt,
    DateTime resumedAt,
  ) {
    if (!clock.isBefore(stoppedAt) || !resumedAt.isAfter(stoppedAt)) {
      return clock;
    }
    return clock.add(resumedAt.difference(stoppedAt));
  }

  /// The error says outright that the connection failed (just_audio passes
  /// ExoPlayer's cause along), or is one of our own stall or timeout
  /// verdicts. Those never count toward [sameSpotLimit]: a flapping Wi-Fi
  /// can fail right after a reload too. A bare "source error", or one whose
  /// cause is a parser or format problem, can.
  static bool _namesAConnectionFault(Object error) {
    if (error is PlaybackStallError ||
        error is PlaybackEndedEarlyError ||
        error is TimeoutException) {
      return true;
    }
    var text = error.toString().toLowerCase();
    if (error is PlatformException) {
      text = '$text ${error.message?.toLowerCase() ?? ''}';
    }
    const signs = [
      'httpdatasource',
      'http_data_source',
      'response code',
      'unable to connect',
      'connection',
      'socket',
      'timed out',
      'timeout',
      'host lookup',
      'unreachable',
      'network',
    ];
    return signs.any(text.contains);
  }

  /// The stream failed with a network error while the user meant it to play.
  void onFailure(Object error) {
    _lastError = error;
    final pos = lastPosition();
    switch (_phase) {
      case _Phase.reloading:
        // The reload in flight reports for itself; a late error from the
        // source it is replacing must not schedule a second one.
        _log('failure during reload ignored: $error');
        return;
      case _Phase.waiting:
      case _Phase.probing:
        // Positions read now aren't trusted: on Android just_audio answers a
        // source error by jumping to the next file of the book, so the spot
        // recorded at the first failure stays the target.
        if (error is! PlaybackStallError) _healable = false;
        return;
      case _Phase.verifying:
        _healthyTimer?.cancel();
        _healthyTimer = null;
        final sameSpot = !_namesAConnectionFault(error) &&
            pos <= _lastReloadAt + sameSpotSlackSec;
        _sameSpotFailures = sameSpot ? _sameSpotFailures + 1 : 0;
        if (_sameSpotFailures >= sameSpotLimit) {
          _log('failed again at ${pos.toStringAsFixed(1)}s, where the last '
              '$_sameSpotFailures reloads went - the file, not the network');
          _giveUp();
          return;
        }
        if (pos > _resumeAtSec) {
          _resumeAtSec = pos;
          _exactTarget = false;
        }
        _healable = error is PlaybackStallError;
        _log('stream failed again after a reload ($error)');
        _armDeadline();
        // Waiting from here on, so whoever reacts to the status already
        // sees a recovery in progress.
        _phase = _Phase.waiting;
        onStatus?.call(PlaybackRecoveryStatus.reconnecting, error);
        _scheduleNext();
        return;
      case _Phase.idle:
        _attempt = 0;
        _sameSpotFailures = 0;
        _resumeAtSec = pos;
        _exactTarget = false;
        _healable = error is PlaybackStallError;
        _log('stream failed at ${pos.toStringAsFixed(1)}s: $error');
        onStart?.call();
        _armDeadline();
        _phase = _Phase.waiting; // see the verifying case
        onStatus?.call(PlaybackRecoveryStatus.reconnecting, error);
        _scheduleNext();
        return;
    }
  }

  /// Processing state changed: [buffering] is true while the player wants
  /// to play but is waiting for data.
  void onBuffering(bool buffering) {
    if (!buffering) {
      _stopStallWatch();
      return;
    }
    if (_stallTimer != null) return;
    _stalledFor = Duration.zero;
    _armStallTimer();
  }

  /// The player is ready again. While waiting on a stall, the stream healed
  /// by itself. After an error it doesn't count: the player may be ready on
  /// the wrong file (see [onFailure]), so the reload still runs.
  void onReady() {
    _stopStallWatch();
    if (!isWaiting || !_healable) return;
    _retryTimer?.cancel();
    _retryTimer = null;
    _log('stream recovered by itself');
    _enterVerifying();
  }

  /// The user sought or skipped to [sec] while a recovery waits or reloads.
  /// The next reload goes exactly there (no rewind: the user chose the spot),
  /// and the waiting, the attempt count and the deadline carry on as they
  /// were. A reload already in flight still lands where it was going; the
  /// caller moves it on afterwards.
  void retarget(double sec) {
    if (!isRecovering) return;
    _resumeAtSec = math.max(0, sec);
    _exactTarget = true;
    _log('target moved to ${_resumeAtSec.toStringAsFixed(1)}s by the user');
  }

  /// The network came back: skip the rest of the current wait.
  void retryNow() {
    if (_phase != _Phase.waiting) return;
    _log('network is back - retrying now');
    _retryTimer?.cancel();
    _retryTimer = null;
    unawaited(_runAttempt());
  }

  /// The user did something (pause, seek, stop, another book): drop the
  /// recovery. A stall being watched starts its window over, since the
  /// action restarted whatever the player was waiting for.
  void cancel(String reason) {
    if (_stallTimer != null) {
      _stopStallWatch();
      _armStallTimer();
    }
    if (_phase == _Phase.idle) return;
    final wasRecovering = isRecovering;
    _log('cancelled ($reason)');
    _reset();
    if (wasRecovering) onStatus?.call(PlaybackRecoveryStatus.idle, null);
  }

  void dispose() {
    _stopStallWatch();
    _reset();
  }

  void _scheduleNext() {
    if (_deadlinePassed) {
      _giveUp();
      return;
    }
    final delay =
        _attempt < schedule.length ? schedule[_attempt] : repeatDelay;
    _phase = _Phase.waiting;
    _retryTimer?.cancel();
    _log('retry ${_attempt + 1} in ${delay.inSeconds}s');
    _retryTimer = Timer(delay, () {
      _retryTimer = null;
      unawaited(_runAttempt());
    });
  }

  Future<void> _runAttempt() async {
    final gen = _generation;
    _attempt++;
    _phase = _Phase.probing;
    final probe = isReachable;
    if (probe != null) {
      bool reachable;
      try {
        reachable = await probe();
      } catch (e) {
        _log('attempt $_attempt: reachability check failed: $e');
        reachable = false;
      }
      // Cancelled, or the stream came back by itself, while asking.
      if (gen != _generation || _phase != _Phase.probing) return;
      if (!reachable) {
        _log('attempt $_attempt: server not reachable yet');
        _afterFailedAttempt();
        return;
      }
    }
    if (gen != _generation || _phase != _Phase.probing) return;
    _phase = _Phase.reloading;
    final at = resumeAtSec;
    _lastReloadAt = at;
    _log('attempt $_attempt: reloading at ${at.toStringAsFixed(1)}s');
    bool ok;
    try {
      ok = await reload(at, _lastError).timeout(reloadTimeout);
    } on TimeoutException catch (e) {
      // A newer attempt's load supersedes this one if it ever finishes.
      _log('attempt $_attempt: reload still loading after '
          '${reloadTimeout.inSeconds}s - counting it as failed');
      _lastError = e;
      ok = false;
      if (gen == _generation) onReloadTimedOut?.call();
    } catch (e) {
      _lastError = e;
      ok = false;
    }
    if (gen != _generation) return;
    if (ok) {
      _log('attempt $_attempt: reloaded');
      _enterVerifying();
    } else {
      _afterFailedAttempt();
    }
  }

  void _afterFailedAttempt() {
    if (_deadlinePassed) {
      _giveUp();
    } else {
      _scheduleNext();
    }
  }

  void _enterVerifying() {
    _phase = _Phase.verifying;
    // The give-up clock keeps running until the stream has stayed healthy:
    // a reload that fails again right away mustn't buy another 5 minutes.
    _healthyTimer?.cancel();
    _healthyTimer = Timer(healthyAfter, () {
      _healthyTimer = null;
      if (_phase != _Phase.verifying) return;
      _log('stream healthy again');
      _reset();
    });
    onStatus?.call(PlaybackRecoveryStatus.idle, null);
  }

  void _giveUp() {
    final error = _lastError;
    _log('giving up after $_attempt attempts');
    _reset();
    onStatus?.call(PlaybackRecoveryStatus.gaveUp, error);
  }

  void _armDeadline() {
    if (_deadlineTimer != null || _deadlinePassed) return;
    _deadlineTimer = Timer(giveUpAfter, () {
      _deadlineTimer = null;
      _deadlinePassed = true;
    });
  }

  void _reset() {
    _generation++;
    _phase = _Phase.idle;
    _attempt = 0;
    // _healable and _resumeAtSec stay: they describe the recovery that just
    // ended until the next one starts, for whoever acts on its end.
    _lastError = null;
    _retryTimer?.cancel();
    _retryTimer = null;
    _deadlineTimer?.cancel();
    _deadlineTimer = null;
    _deadlinePassed = false;
    _healthyTimer?.cancel();
    _healthyTimer = null;
  }

  void _armStallTimer() {
    final gen = ++_stallGeneration;
    _stallTimer = Timer(stallThreshold, () async {
      if (gen != _stallGeneration) return;
      _stalledFor += stallThreshold;
      if (_phase == _Phase.reloading || _phase == _Phase.probing) {
        // A reload is loading its own source and has its own timeouts.
        _armStallTimer();
        return;
      }
      final check = checkStall;
      StallVerdict verdict;
      try {
        verdict = check == null ? StallVerdict.failed : await check(_stalledFor);
      } catch (e) {
        _log('stall check failed: $e');
        verdict = StallVerdict.keepWaiting;
      }
      if (gen != _stallGeneration) return;
      switch (verdict) {
        case StallVerdict.notStalled:
          _stopStallWatch();
        case StallVerdict.keepWaiting:
          _armStallTimer();
        case StallVerdict.failed:
          final stalledFor = _stalledFor;
          _stopStallWatch();
          _log('buffering for ${stalledFor.inSeconds}s');
          onFailure(PlaybackStallError(stalledFor));
      }
    });
  }

  void _stopStallWatch() {
    _stallGeneration++;
    _stallTimer?.cancel();
    _stallTimer = null;
    _stalledFor = Duration.zero;
  }

  void _log(String message) => log?.call(message);

  static double _seconds(Duration d) => d.inMilliseconds / 1000.0;
}

enum _Phase { idle, waiting, probing, reloading, verifying }

import 'dart:async';

import 'package:absorb/services/playback_recovery.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fake player side of the recovery: records reloads and statuses, answers
/// reachability and stall checks from fields the tests set.
class _Harness {
  double position = 0;
  bool reachable = true;
  bool reloadSucceeds = true;
  Duration reloadTakes = Duration.zero;
  StallVerdict stallVerdict = StallVerdict.failed;

  final reloads = <({double at, Duration when})>[];
  final statuses = <PlaybackRecoveryStatus>[];
  final stallChecks = <Duration>[];
  int probes = 0;
  int starts = 0;
  int inFlight = 0;
  int maxInFlight = 0;

  late final FakeAsync clock;
  late final PlaybackRecovery recovery;

  _Harness(FakeAsync async, {bool probe = true, bool stall = true}) {
    clock = async;
    recovery = PlaybackRecovery(
      lastPosition: () => position,
      reload: (at, _) async {
        reloads.add((at: at, when: clock.elapsed));
        inFlight++;
        if (inFlight > maxInFlight) maxInFlight = inFlight;
        if (reloadTakes > Duration.zero) await Future<void>.delayed(reloadTakes);
        inFlight--;
        return reloadSucceeds;
      },
      isReachable: probe
          ? () async {
              probes++;
              return reachable;
            }
          : null,
      checkStall: stall
          ? (stalledFor) async {
              stallChecks.add(stalledFor);
              return stallVerdict;
            }
          : null,
      onStart: () => starts++,
      onStatus: (s, _) => statuses.add(s),
    );
  }

  List<int> get reloadSeconds => [for (final r in reloads) r.when.inSeconds];
}

void main() {
  group('PlaybackRecovery backoff', () {
    test('retries at 2, 5, 10, 20 s then every 30 s and gives up after 5 min', () {
      fakeAsync((async) {
        final h = _Harness(async)..reachable = false;
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        expect(h.statuses, [PlaybackRecoveryStatus.reconnecting]);
        expect(h.starts, 1);

        async.elapse(const Duration(seconds: 1));
        expect(h.probes, 0);
        async.elapse(const Duration(seconds: 1));
        expect(h.probes, 1, reason: 'first attempt at 2 s');
        async.elapse(const Duration(seconds: 5));
        expect(h.probes, 2, reason: 'second at 7 s');
        async.elapse(const Duration(seconds: 10));
        expect(h.probes, 3, reason: 'third at 17 s');
        async.elapse(const Duration(seconds: 20));
        expect(h.probes, 4, reason: 'fourth at 37 s');
        async.elapse(const Duration(seconds: 30));
        expect(h.probes, 5, reason: 'then every 30 s');
        expect(h.recovery.isRecovering, isTrue);

        // Unreachable server: nothing was torn down for a reload.
        async.elapse(const Duration(minutes: 5));
        expect(h.reloads, isEmpty);
        expect(h.recovery.isActive, isFalse);
        expect(h.statuses.last, PlaybackRecoveryStatus.gaveUp);
        expect(
          h.statuses.where((s) => s == PlaybackRecoveryStatus.gaveUp),
          hasLength(1),
        );
        // 2+5+10+20 = 37 s, then 30 s steps; the first attempt after the
        // 5 minute mark (307 s) is the last.
        expect(h.probes, 13);

        // Nothing keeps running after giving up.
        async.elapse(const Duration(minutes: 10));
        expect(h.probes, 13);
      });
    });

    test('reloads 2 s before where it failed and never further back', () {
      fakeAsync((async) {
        final h = _Harness(async)..reloadSucceeds = false;
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        // A failed reload leaves the service with no known position.
        h.position = 0;
        async.elapse(const Duration(seconds: 2));
        async.elapse(const Duration(seconds: 5));
        expect(h.reloads.map((r) => r.at), [98, 98]);

        // While waiting, positions aren't trusted (Android jumps to the next
        // file on a source error): the target stays where it failed.
        h.position = 1500;
        h.recovery.onFailure(Exception('Source error'));
        h.position = 40;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 10));
        expect(h.reloads.last.at, 98);
      });
    });

    test('after a reload worked, a later failure moves the target forward only', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2)); // reload at 98 works
        h.position = 40; // a bogus early position
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 5));
        expect(h.reloads.last.at, 98);
        h.position = 130;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 10));
        expect(h.reloads.last.at, 128);
      });
    });

    test('no position at all reloads at 0, not below', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 1;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads.single.at, 0);
      });
    });

    test('a working reload ends the recovery quietly', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 60;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads, hasLength(1));
        expect(h.statuses, [
          PlaybackRecoveryStatus.reconnecting,
          PlaybackRecoveryStatus.idle,
        ]);
        expect(h.recovery.isRecovering, isFalse);
        expect(h.recovery.isActive, isTrue, reason: 'watched for a while');
        async.elapse(const Duration(seconds: 30));
        expect(h.recovery.isActive, isFalse);
        async.elapse(const Duration(minutes: 10));
        expect(h.reloads, hasLength(1));
      });
    });

    test('a connection that flaps keeps backing off instead of restarting at 2 s', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 60;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2)); // reload 1 works
        async.elapse(const Duration(seconds: 10));
        h.position = 70;
        h.recovery.onFailure(Exception('Source error')); // fails again
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads, hasLength(1), reason: 'second wait is 5 s');
        async.elapse(const Duration(seconds: 3));
        expect(h.reloads, hasLength(2));
        expect(h.reloads.last.at, 68);
        expect(h.starts, 1, reason: 'still the same recovery');

        // Healthy for 30 s: the next failure starts over from 2 s.
        async.elapse(const Duration(seconds: 30));
        expect(h.recovery.isActive, isFalse);
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads, hasLength(3));
        expect(h.starts, 2);
      });
    });

    test('a reload that never finishes counts as failed after 2 minutes', () {
      fakeAsync((async) {
        final never = Completer<bool>();
        var calls = 0;
        final r = PlaybackRecovery(
          lastPosition: () => 10,
          reload: (_, _) {
            calls++;
            return calls == 1 ? never.future : Future.value(true);
          },
        );
        r.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(r.isReloading, isTrue);
        async.elapse(const Duration(minutes: 2));
        expect(r.isReloading, isFalse);
        expect(r.isWaiting, isTrue);
        async.elapse(const Duration(seconds: 5));
        expect(calls, 2);
        expect(r.isRecovering, isFalse);
      });
    });

    test('while the server is being checked the player counts as waiting', () {
      fakeAsync((async) {
        final answer = Completer<bool>();
        var reloads = 0;
        final r = PlaybackRecovery(
          lastPosition: () => 10,
          isReachable: () => answer.future,
          reload: (_, _) async {
            reloads++;
            return true;
          },
        );
        r.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(r.isWaiting, isTrue, reason: 'position stays held');
        expect(r.isReloading, isFalse);
        r.cancel('pause');
        answer.complete(true);
        async.elapse(const Duration(minutes: 1));
        expect(reloads, 0, reason: 'cancelled while checking');
      });
    });

    test('a stall that heals while the server is being checked is not reloaded', () {
      fakeAsync((async) {
        final answer = Completer<bool>();
        var reloads = 0;
        final r = PlaybackRecovery(
          lastPosition: () => 10,
          isReachable: () => answer.future,
          reload: (_, _) async {
            reloads++;
            return true;
          },
        );
        r.onFailure(const PlaybackStallError(Duration(seconds: 15)));
        async.elapse(const Duration(seconds: 2));
        r.onReady();
        answer.complete(true);
        async.elapse(const Duration(minutes: 1));
        expect(reloads, 0);
        expect(r.isActive, isFalse);
      });
    });

    test('a reload that throws counts as a failed attempt', () {
      fakeAsync((async) {
        var calls = 0;
        final statuses = <PlaybackRecoveryStatus>[];
        final r = PlaybackRecovery(
          lastPosition: () => 10,
          reload: (_, _) async {
            calls++;
            throw StateError('boom');
          },
          onStatus: (s, _) => statuses.add(s),
        );
        r.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2));
        expect(calls, 1);
        expect(r.isRecovering, isTrue);
        async.elapse(const Duration(seconds: 5));
        expect(calls, 2);
        expect(statuses, [PlaybackRecoveryStatus.reconnecting]);
      });
    });
  });

  group('PlaybackRecovery gives up on what a reload cannot fix', () {
    test('failing again where each reload went is the file: it gives up', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 100;
        h.recovery.onFailure(Exception('Source error: ParserException'));
        async.elapse(const Duration(seconds: 2)); // reload at 98 works
        h.recovery.onFailure(Exception('Source error: ParserException'));
        expect(h.recovery.isRecovering, isTrue, reason: 'once may be chance');
        async.elapse(const Duration(seconds: 5)); // reload at 98 works again
        expect(h.reloads, hasLength(2));
        h.recovery.onFailure(Exception('Source error: ParserException'));
        expect(h.statuses.last, PlaybackRecoveryStatus.gaveUp);
        expect(h.recovery.isActive, isFalse);
        async.elapse(const Duration(minutes: 10));
        expect(h.reloads, hasLength(2), reason: 'no endless replay of 2 s');
      });
    });

    test('a reload that played on before failing is not the same spot', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        for (var i = 1; i <= 4; i++) {
          async.elapse(const Duration(seconds: 20)); // reload worked
          h.position = 100.0 + 10 * i; // played on, then dropped again
          h.recovery.onFailure(Exception('Source error'));
          expect(h.recovery.isRecovering, isTrue, reason: 'failure $i');
        }
        expect(h.statuses, isNot(contains(PlaybackRecoveryStatus.gaveUp)));
      });
    });

    test('reloads that keep failing soon after do not reset the 5 minutes', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        var gaveUpAt = Duration.zero;
        for (var i = 1; i <= 40 && h.recovery.isActive; i++) {
          async.elapse(const Duration(seconds: 25)); // reload worked
          if (!h.recovery.isActive) break;
          h.position += 20; // plays on a little, then drops again
          h.recovery.onFailure(Exception('Source error'));
          if (!h.recovery.isActive) gaveUpAt = async.elapsed;
        }
        expect(h.statuses.last, PlaybackRecoveryStatus.gaveUp);
        expect(gaveUpAt, greaterThanOrEqualTo(const Duration(minutes: 5)));
        expect(gaveUpAt, lessThan(const Duration(minutes: 6)));
      });
    });
  });

  group('PlaybackRecovery never fights the user', () {
    test('cancel while waiting stops every retry', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 30;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 1));
        h.recovery.cancel('pause');
        expect(h.statuses.last, PlaybackRecoveryStatus.idle);
        async.elapse(const Duration(minutes: 10));
        expect(h.reloads, isEmpty);
        expect(h.probes, 0);
        expect(h.recovery.isActive, isFalse);
      });
    });

    test('a reload in flight when the user acts is ignored when it returns', () {
      fakeAsync((async) {
        final h = _Harness(async)
          ..reloadTakes = const Duration(seconds: 3)
          ..reloadSucceeds = false;
        h.position = 30;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 3)); // reload started at 2 s
        expect(h.reloads, hasLength(1));
        h.recovery.cancel('new play');
        async.elapse(const Duration(minutes: 10));
        // The failed reload did not schedule another one.
        expect(h.reloads, hasLength(1));
        expect(h.recovery.isActive, isFalse);
      });
    });

    test('errors while a reload is loading do not start a second one', () {
      fakeAsync((async) {
        final h = _Harness(async)..reloadTakes = const Duration(seconds: 4);
        h.position = 30;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 3));
        // The old source reports late; the processing state errors too.
        h.recovery.onFailure(Exception('Source error'));
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 10));
        expect(h.reloads, hasLength(1));
        expect(h.maxInFlight, 1);
        expect(h.recovery.isRecovering, isFalse);
      });
    });

    test('the network coming back retries at once, once', () {
      fakeAsync((async) {
        final h = _Harness(async)..reachable = false;
        h.position = 30;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2)); // probe 1 fails
        async.elapse(const Duration(seconds: 7)); // probe 2 fails at 7 s
        expect(h.probes, 2);
        h.reachable = true;
        h.recovery.retryNow();
        h.recovery.retryNow(); // a second signal while reloading is a no-op
        async.flushMicrotasks();
        expect(h.reloads, hasLength(1));
        expect(h.reloads.single.when.inSeconds, 9);
        async.elapse(const Duration(minutes: 1));
        expect(h.reloads, hasLength(1));
      });
    });

    test('retryNow with nothing to recover does nothing', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.recovery.retryNow();
        h.recovery.cancel('pause');
        async.elapse(const Duration(minutes: 1));
        expect(h.reloads, isEmpty);
        expect(h.statuses, isEmpty);
      });
    });

    test('a stream that comes back by itself is not reloaded', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 30;
        h.recovery.onFailure(const PlaybackStallError(Duration(seconds: 15)));
        async.elapse(const Duration(seconds: 1));
        h.recovery.onReady();
        async.elapse(const Duration(minutes: 1));
        expect(h.reloads, isEmpty);
        expect(h.statuses.last, PlaybackRecoveryStatus.idle);
      });
    });

    test('after an error, a ready player is not trusted: the reload still runs', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 30;
        h.recovery.onFailure(const PlaybackStallError(Duration(seconds: 15)));
        // The fatal error arrives while waiting on the stall.
        h.recovery.onFailure(Exception('Source error'));
        expect(h.recovery.isStallOnly, isFalse);
        expect(h.recovery.failedAtSec, 30);
        h.recovery.onReady(); // Android re-prepared the next file
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads.single.at, 28);
      });
    });
  });

  group('PlaybackRecovery follows seeks made while it runs', () {
    test('a seek while waiting moves the reload there, exactly', () {
      fakeAsync((async) {
        final h = _Harness(async)..reachable = false;
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 2)); // probe 1 fails
        h.recovery.retarget(400);
        expect(h.recovery.isRecovering, isTrue, reason: 'not cancelled');
        expect(h.recovery.failedAtSec, 400, reason: 'the player shows it');
        expect(h.recovery.resumeAtSec, 400, reason: 'no rewind on a chosen spot');
        h.reachable = true;
        async.elapse(const Duration(seconds: 5)); // attempt 2 at 7 s
        expect(h.reloads.single.at, 400);
        expect(h.reloads.single.when.inSeconds, 7, reason: 'backoff unchanged');
        expect(h.starts, 1);
      });
    });

    test('a seek during a failing reload sends the next attempt there', () {
      fakeAsync((async) {
        final h = _Harness(async)
          ..reloadSucceeds = false
          ..reloadTakes = const Duration(seconds: 3);
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 3)); // reload 1 loading
        expect(h.recovery.isReloading, isTrue);
        h.recovery.retarget(50);
        async.elapse(const Duration(seconds: 2)); // reload 1 fails at 5 s
        async.elapse(const Duration(seconds: 5));
        expect(h.reloads.map((r) => r.at), [98, 50]);
      });
    });

    test('after a retargeted reload worked, a later failure ahead rewinds again', () {
      fakeAsync((async) {
        final h = _Harness(async)..reachable = false;
        h.position = 100;
        h.recovery.onFailure(Exception('Source error'));
        h.recovery.retarget(300);
        h.reachable = true;
        async.elapse(const Duration(seconds: 2)); // reload at 300 works
        expect(h.reloads.single.at, 300);
        h.position = 340;
        h.recovery.onFailure(Exception('Source error'));
        async.elapse(const Duration(seconds: 5));
        expect(h.reloads.last.at, 338);
      });
    });

    test('a seek with nothing to recover does nothing', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.recovery.retarget(500);
        async.elapse(const Duration(minutes: 1));
        expect(h.reloads, isEmpty);
        expect(h.recovery.isActive, isFalse);
      });
    });
  });

  group('PlaybackRecovery stall detection', () {
    test('buffering for 15 s asks, and a failed verdict starts a recovery', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 200;
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 14));
        expect(h.stallChecks, isEmpty);
        async.elapse(const Duration(seconds: 1));
        expect(h.stallChecks, [const Duration(seconds: 15)]);
        expect(h.recovery.isRecovering, isTrue);
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads.single.at, 198);
      });
    });

    test('a slow but reachable server is watched again, not reloaded', () {
      fakeAsync((async) {
        final h = _Harness(async)..stallVerdict = StallVerdict.keepWaiting;
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 45));
        expect(h.stallChecks, [
          const Duration(seconds: 15),
          const Duration(seconds: 30),
          const Duration(seconds: 45),
        ]);
        expect(h.recovery.isActive, isFalse);
        h.stallVerdict = StallVerdict.failed;
        async.elapse(const Duration(seconds: 15));
        expect(h.recovery.isRecovering, isTrue);
      });
    });

    test('buffering that ends in time never triggers anything', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 10));
        h.recovery.onBuffering(false);
        async.elapse(const Duration(minutes: 1));
        expect(h.stallChecks, isEmpty);
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 10));
        h.recovery.onReady();
        async.elapse(const Duration(minutes: 1));
        expect(h.stallChecks, isEmpty);
        expect(h.recovery.isActive, isFalse);
      });
    });

    test('notStalled stops watching until buffering starts again', () {
      fakeAsync((async) {
        final h = _Harness(async)..stallVerdict = StallVerdict.notStalled;
        h.recovery.onBuffering(true);
        async.elapse(const Duration(minutes: 2));
        expect(h.stallChecks, hasLength(1));
      });
    });

    test('a user action restarts the stall window', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 10));
        h.recovery.cancel('seek');
        async.elapse(const Duration(seconds: 10));
        expect(h.stallChecks, isEmpty);
        async.elapse(const Duration(seconds: 5));
        expect(h.stallChecks, hasLength(1));
      });
    });

    test('repeated buffering events keep one stall timer', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 5));
        h.recovery.onBuffering(true);
        async.elapse(const Duration(seconds: 10));
        expect(h.stallChecks, [const Duration(seconds: 15)]);
      });
    });
  });

  group('PlaybackEndedEarlyError.isEarly', () {
    test('an end well before the length is early', () {
      expect(PlaybackEndedEarlyError.isEarly(33000, 36000), isTrue);
      expect(PlaybackEndedEarlyError.isEarly(35980, 36000), isTrue);
      expect(PlaybackEndedEarlyError.isEarly(5, 36000), isTrue);
    });

    test('an end within 10 s of the length is the real end', () {
      expect(PlaybackEndedEarlyError.isEarly(35990, 36000), isFalse);
      expect(PlaybackEndedEarlyError.isEarly(35999.5, 36000), isFalse);
      expect(PlaybackEndedEarlyError.isEarly(36004, 36000), isFalse);
    });

    test('an unknown position or length is never early', () {
      expect(PlaybackEndedEarlyError.isEarly(0, 36000), isFalse);
      expect(PlaybackEndedEarlyError.isEarly(1200, 0), isFalse);
    });

    test('an early end is reloaded like any dropped connection', () {
      fakeAsync((async) {
        final h = _Harness(async);
        h.position = 33000;
        h.recovery.onFailure(const PlaybackEndedEarlyError(33000, 36000));
        expect(h.recovery.isStallOnly, isFalse, reason: 'needs a reload');
        async.elapse(const Duration(seconds: 2));
        expect(h.reloads.single.at, 32998);
      });
    });
  });

  group('PlaybackRecovery.skipSilentSpan', () {
    final t0 = DateTime(2026, 11, 1, 12);
    DateTime at(int s) => t0.add(Duration(seconds: s));

    test('a clock from before the drop skips the whole wait', () {
      // Last tick at 0 s, dropped at 4 s, back at 304 s: 4 s listened.
      final clock = PlaybackRecovery.skipSilentSpan(at(0), at(4), at(304));
      expect(clock, at(300));
      expect(at(304).difference(clock), const Duration(seconds: 4));
    });

    test('a clock restarted during the wait is left alone', () {
      expect(PlaybackRecovery.skipSilentSpan(at(30), at(4), at(304)), at(30));
    });

    test('no span to skip leaves the clock alone', () {
      expect(PlaybackRecovery.skipSilentSpan(at(0), at(4), at(4)), at(0));
      expect(PlaybackRecovery.skipSilentSpan(at(0), at(4), at(2)), at(0));
    });
  });

  group('PlaybackRecovery.isNetworkError', () {
    test('network failures', () {
      for (final e in <Object>[
        PlatformException(code: '0', message: 'Source error'),
        Exception('(0) Source error'),
        Exception('HttpDataSourceException: Unable to connect to host'),
        Exception('Connection reset by peer'),
        Exception('SocketException: Network is unreachable'),
        TimeoutException('load'),
        const PlaybackStallError(Duration(seconds: 15)),
        const PlaybackEndedEarlyError(3600, 36000),
        Exception('Failed to open https://abs.example/api/items/x/file/1.'),
      ]) {
        expect(PlaybackRecovery.isNetworkError(e), isTrue, reason: '$e');
      }
    });

    test('HTTP statuses a fresh session can fix count, others do not', () {
      String src(int code) =>
          'Source error: InvalidResponseCodeException: Response code: $code';
      for (final code in [401, 403, 404, 408, 416, 429, 500, 502, 503]) {
        expect(
          PlaybackRecovery.isNetworkError(PlatformException(code: '0', message: src(code))),
          isTrue,
          reason: '$code',
        );
      }
      for (final code in [400, 410, 415]) {
        expect(
          PlaybackRecovery.isNetworkError(PlatformException(code: '0', message: src(code))),
          isFalse,
          reason: '$code',
        );
      }
    });

    test('decoder and format failures are not network failures', () {
      for (final e in <Object>[
        Exception('MediaCodecAudioRenderer error, format_supported=NO'),
        Exception('AudioTrack init failed'),
        StateError('Bad state'),
      ]) {
        expect(PlaybackRecovery.isNetworkError(e), isFalse, reason: '$e');
      }
    });
  });
}

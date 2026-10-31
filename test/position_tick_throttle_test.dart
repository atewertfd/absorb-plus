import 'dart:async';

import 'package:absorb/services/position_tick_throttle.dart';
import 'package:flutter_test/flutter_test.dart';

Duration _ms(int ms) => Duration(milliseconds: ms);

void main() {
  group('PositionTickThrottle rules', () {
    test('the first tick passes, ticks inside 250 ms are held back', () {
      final t = PositionTickThrottle();
      expect(t.shouldPass(_ms(10000), 'playing', _ms(0)), isTrue);
      expect(t.shouldPass(_ms(10040), 'playing', _ms(40)), isFalse);
      expect(t.shouldPass(_ms(10200), 'playing', _ms(200)), isFalse);
      expect(t.shouldPass(_ms(10250), 'playing', _ms(250)), isTrue);
      expect(t.shouldPass(_ms(10290), 'playing', _ms(290)), isFalse);
    });

    test('libmpv rate at 1x passes about four ticks a second', () {
      final t = PositionTickThrottle();
      var passed = 0;
      // 50 ticks a second for 10 s.
      for (var ms = 0; ms < 10000; ms += 20) {
        if (t.shouldPass(_ms(ms), 'playing', _ms(ms))) passed++;
      }
      expect(passed, inInclusiveRange(39, 41));
    });

    test('a jump of more than 1.5 s passes at once (seek, reset to 0)', () {
      final t = PositionTickThrottle();
      t.shouldPass(_ms(60000), 'playing', _ms(0));
      expect(t.shouldPass(_ms(60020), 'playing', _ms(20)), isFalse);
      expect(t.shouldPass(_ms(90000), 'playing', _ms(40)), isTrue,
          reason: 'forward seek');
      expect(t.shouldPass(_ms(500), 'playing', _ms(60)), isTrue,
          reason: 'engine back at 0 near the end');
    });

    test('a play/pause or processing state change passes at once', () {
      final t = PositionTickThrottle();
      t.shouldPass(_ms(5000), (true, 'ready'), _ms(0));
      expect(t.shouldPass(_ms(5020), (true, 'ready'), _ms(20)), isFalse);
      expect(t.shouldPass(_ms(5030), (false, 'ready'), _ms(30)), isTrue);
      expect(t.shouldPass(_ms(5030), (false, 'buffering'), _ms(40)), isTrue);
      expect(t.shouldPass(_ms(5030), (false, 'buffering'), _ms(50)), isFalse);
    });

    test('every whole second gets a tick even at 5x speed', () {
      final t = PositionTickThrottle();
      final seconds = <int>{};
      // 5x speed, 50 raw ticks a second: 100 ms of audio per tick.
      for (var wall = 0; wall < 20000; wall += 20) {
        final pos = _ms(wall * 5 + 300); // offset: not on a second boundary
        if (t.shouldPass(pos, 'playing', _ms(wall))) {
          seconds.add(pos.inSeconds);
        }
      }
      for (var s = 1; s < 100; s++) {
        expect(seconds, contains(s), reason: 'second $s had no tick');
      }
    });

    test('remaining time until the trailing tick', () {
      final t = PositionTickThrottle();
      t.shouldPass(_ms(0), null, _ms(1000));
      expect(t.remaining(_ms(1100)), _ms(150));
      expect(t.remaining(_ms(1400)), Duration.zero);
    });
  });

  group('throttlePositionTicks stream', () {
    testWidgets('holds back fast ticks and sends the last one when they stop',
        (tester) async {
      var now = Duration.zero;
      final source = StreamController<Duration>.broadcast();
      final got = <Duration>[];
      final sub = throttlePositionTicks(
        source.stream,
        state: () => 'paused',
        clock: () => now,
      ).listen(got.add);

      source.add(_ms(1000));
      await tester.pump();
      expect(got, [_ms(1000)]);

      // A small scrub while paused: held back...
      now = _ms(50);
      source.add(_ms(1300));
      now = _ms(80);
      source.add(_ms(1400));
      await tester.pump();
      expect(got, [_ms(1000)]);

      // ...then the latest one arrives when the 250 ms run out.
      now = _ms(250);
      await tester.pump(_ms(200));
      expect(got, [_ms(1000), _ms(1400)]);

      // Nothing more is sent after that.
      await tester.pump(_ms(1000));
      expect(got, hasLength(2));
      unawaited(sub.cancel());
      unawaited(source.close());
      await tester.pump();
    });

    testWidgets('every listener gets its own throttle', (tester) async {
      final source = StreamController<Duration>.broadcast();
      final stream = throttlePositionTicks(source.stream,
          state: () => 'playing', clock: () => Duration.zero);
      final a = <Duration>[];
      final b = <Duration>[];
      final subA = stream.listen(a.add);
      source.add(_ms(1000));
      await tester.pump();
      final subB = stream.listen(b.add);
      source.add(_ms(1020));
      await tester.pump();
      expect(a, [_ms(1000)]);
      expect(b, [_ms(1020)], reason: "a new listener's first tick passes");
      unawaited(subA.cancel());
      unawaited(subB.cancel());
      await tester.pump(_ms(500)); // cancelled: no trailing timer left behind
      unawaited(source.close());
      await tester.pump();
    });
  });
}

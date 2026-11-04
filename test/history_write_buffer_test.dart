import 'dart:async';

import 'package:absorb/services/history_write_buffer.dart';
import 'package:absorb/services/pending_writes.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Diagnostic-only history lines wait in [HistoryWriteBuffer] and are written
/// in one go: after the delay, on an explicit flush, or on exit.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<HistoryWriteBuffer> buffers;
  late int prefsCalls;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    buffers = [];
    prefsCalls = 0;
  });
  tearDown(() {
    for (final b in buffers) {
      b.dispose();
    }
  });

  HistoryWriteBuffer make({
    int maxLines = 1000,
    Duration delay = const Duration(seconds: 60),
    bool flushOnExit = false,
    Future<SharedPreferences> Function()? prefs,
  }) {
    final b = HistoryWriteBuffer(
      delay: delay,
      maxLines: maxLines,
      flushOnExit: flushOnExit,
      prefs:
          prefs ??
          () {
            prefsCalls++;
            return SharedPreferences.getInstance();
          },
    );
    buffers.add(b);
    return b;
  }

  Future<List<String>?> stored(String key) async =>
      (await SharedPreferences.getInstance()).getStringList(key);

  group('add / peek / take / drop', () {
    test('peek sees held lines straight away, oldest first', () {
      final b = make();
      b.add('k', 'one');
      b.add('k', 'two');
      expect(b.peek('k'), ['one', 'two']);
      expect(b.peek('other'), isEmpty);
    });

    test('take returns the held lines and removes them', () async {
      final b = make();
      b.add('k', 'one');
      b.add('k', 'two');
      expect(b.take('k'), ['one', 'two']);
      expect(b.peek('k'), isEmpty);
      expect(b.take('k'), isEmpty);

      await b.flush();
      expect(await stored('k'), isNull);
    });

    test('drop discards the held lines of one key only', () async {
      final b = make();
      b.add('a', 'a1');
      b.add('b', 'b1');
      b.drop('a');
      expect(b.peek('a'), isEmpty);

      await b.flush();
      expect(await stored('a'), isNull);
      expect(await stored('b'), ['b1']);
    });
  });

  group('flush', () {
    test('appends held lines after the stored ones, per key', () async {
      SharedPreferences.setMockInitialValues({
        'a': ['old'],
      });
      final b = make();
      b.add('a', 'new1');
      b.add('b', 'b1');
      b.add('a', 'new2');

      await b.flush();

      expect(await stored('a'), ['old', 'new1', 'new2']);
      expect(await stored('b'), ['b1']);
      expect(b.peek('a'), isEmpty);
      expect(b.peek('b'), isEmpty);
    });

    test('keeps only the newest maxLines lines', () async {
      SharedPreferences.setMockInitialValues({
        'k': ['1', '2', '3'],
      });
      final b = make(maxLines: 4);
      b.add('k', '4');
      b.add('k', '5');
      b.add('k', '6');

      await b.flush();

      expect(await stored('k'), ['3', '4', '5', '6']);
    });

    test('with nothing held, does not even open the preferences', () async {
      final b = make();
      await b.flush();
      expect(prefsCalls, 0);

      b.add('k', 'x');
      b.take('k');
      await b.flush();
      expect(prefsCalls, 0);
    });

    test('a key that fails to write does not stop the others', () async {
      // A non-list value under the key makes getStringList throw.
      SharedPreferences.setMockInitialValues({'bad': 'not a list'});
      final b = make();
      b.add('bad', 'lost');
      b.add('good', 'kept');

      await b.flush();

      expect(await stored('good'), ['kept']);
      expect((await SharedPreferences.getInstance()).get('bad'), 'not a list');
      // Current behavior: the failed key's lines are not put back.
      expect(b.peek('bad'), isEmpty);
    });

    test('a preferences failure rejects flush and drops the batch', () async {
      final b = make(prefs: () => Future.error(StateError('no prefs')));
      b.add('k', 'line');

      await expectLater(b.flush(), throwsStateError);
      // Current behavior: the lines were taken out before the prefs opened.
      expect(b.peek('k'), isEmpty);
    });
  });

  group('delayed write', () {
    test('nothing is written before the delay, everything after it', () {
      fakeAsync((async) {
        final b = make(delay: const Duration(seconds: 60));
        b.add('k', 'one');
        async.elapse(const Duration(seconds: 59));
        expect(prefsCalls, 0);

        async.elapse(const Duration(seconds: 1));
        async.flushMicrotasks();
        expect(prefsCalls, 1);
        expect(b.peek('k'), isEmpty);
      });
    });

    test('later adds do not push the deadline back', () {
      fakeAsync((async) {
        final b = make(delay: const Duration(seconds: 60));
        b.add('k', 'one');
        async.elapse(const Duration(seconds: 40));
        b.add('k', 'two');
        async.elapse(const Duration(seconds: 20));
        async.flushMicrotasks();

        expect(prefsCalls, 1);
        expect(b.peek('k'), isEmpty);
        List<String>? lines;
        stored('k').then((v) => lines = v);
        async.flushMicrotasks();
        expect(lines, ['one', 'two']);
      });
    });

    test('an explicit flush cancels the pending timer', () {
      fakeAsync((async) {
        final b = make(delay: const Duration(seconds: 60));
        b.add('k', 'one');
        b.flush();
        async.flushMicrotasks();
        expect(prefsCalls, 1);

        async.elapse(const Duration(minutes: 5));
        expect(prefsCalls, 1);
        expect(async.pendingTimers, isEmpty);
      });
    });

    test('a new add after a flush starts a new timer', () {
      fakeAsync((async) {
        final b = make(delay: const Duration(seconds: 10));
        b.add('k', 'one');
        async.elapse(const Duration(seconds: 10));
        async.flushMicrotasks();
        expect(prefsCalls, 1);

        b.add('k', 'two');
        async.elapse(const Duration(seconds: 10));
        async.flushMicrotasks();
        expect(prefsCalls, 2);
      });
    });

    test('dispose cancels the pending write', () {
      fakeAsync((async) {
        final b = make(delay: const Duration(seconds: 10));
        b.add('k', 'one');
        b.dispose();
        async.elapse(const Duration(minutes: 1));
        expect(prefsCalls, 0);
        expect(b.peek('k'), ['one']);
      });
    });
  });

  group('serial', () {
    test('jobs run one after another in call order', () async {
      final b = make();
      final order = <String>[];
      final gate = Completer<void>();

      final first = b.serial(() async {
        order.add('first start');
        await gate.future;
        order.add('first end');
        return 1;
      });
      final second = b.serial(() async {
        order.add('second');
        return 2;
      });

      await Future<void>.delayed(Duration.zero);
      expect(order, ['first start']);
      gate.complete();

      expect(await first, 1);
      expect(await second, 2);
      expect(order, ['first start', 'first end', 'second']);
    });

    test(
      'a failing job reaches its caller but does not block the next',
      () async {
        final b = make();
        final failing = b.serial<int>(() async => throw StateError('boom'));
        final next = b.serial(() async => 'ran');

        await expectLater(failing, throwsStateError);
        expect(await next, 'ran');
      },
    );

    test('flush waits for a history write already queued', () async {
      final b = make();
      final gate = Completer<void>();
      var writeDone = false;
      unawaited(
        b.serial(() async {
          await gate.future;
          writeDone = true;
        }),
      );
      b.add('k', 'held');
      var flushed = false;
      unawaited(b.flush().then((_) => flushed = true));

      await Future<void>.delayed(Duration.zero);
      expect(flushed, isFalse);
      expect(prefsCalls, 0);

      gate.complete();
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      expect(writeDone, isTrue);
      await pumpEventQueueUntil(() => flushed);
      expect(await stored('k'), ['held']);
    });
  });

  group('exit flush', () {
    test(
      'registers with PendingWrites by default and writes on flushAll',
      () async {
        final before = PendingWrites.registeredCount;
        final b = make(flushOnExit: true);
        expect(PendingWrites.registeredCount, before + 1);

        b.add('k', 'on exit');
        await PendingWrites.flushAll();
        expect(await stored('k'), ['on exit']);

        b.dispose();
        expect(PendingWrites.registeredCount, before);
      },
    );

    test('flushOnExit: false does not register', () {
      final before = PendingWrites.registeredCount;
      make(flushOnExit: false);
      expect(PendingWrites.registeredCount, before);
    });
  });
}

Future<void> pumpEventQueueUntil(bool Function() done) async {
  for (var i = 0; i < 50 && !done(); i++) {
    await Future<void>.delayed(Duration.zero);
  }
  expect(done(), isTrue);
}

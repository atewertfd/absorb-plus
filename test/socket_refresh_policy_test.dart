import 'package:absorb/services/socket_refresh_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SocketRefreshCoalescer', () {
    // testWidgets runs in a fake-time zone, so pump() moves the timers.
    testWidgets('a burst of events becomes one refresh after the quiet gap',
        (tester) async {
      final flushes = <PendingRefresh>[];
      final c = SocketRefreshCoalescer(onFlush: flushes.add);
      for (var i = 0; i < 20; i++) {
        c.request(home: true);
        await tester.pump(const Duration(milliseconds: 500));
      }
      expect(flushes, isEmpty, reason: 'still inside the burst');
      await tester.pump(const Duration(seconds: 3));
      expect(flushes, hasLength(1));
      expect(flushes.single.home, isTrue);
      expect(c.isPending, isFalse);
    });

    testWidgets('a long burst still refreshes at the max wait', (tester) async {
      final flushes = <PendingRefresh>[];
      final c = SocketRefreshCoalescer(onFlush: flushes.add);
      // One event every second for 20 s never leaves a 3 s gap.
      for (var i = 0; i < 20; i++) {
        c.request(home: true);
        await tester.pump(const Duration(seconds: 1));
      }
      expect(flushes, hasLength(1), reason: 'flushed once at 15 s');
      await tester.pump(const Duration(seconds: 3));
      expect(flushes, hasLength(2), reason: 'and once after the burst');
    });

    testWidgets('kinds requested in one burst are merged', (tester) async {
      final flushes = <PendingRefresh>[];
      final c = SocketRefreshCoalescer(onFlush: flushes.add);
      c.request(home: true);
      c.request(series: true);
      c.request(collections: true);
      await tester.pump(const Duration(seconds: 3));
      expect(flushes, hasLength(1));
      final p = flushes.single;
      expect([p.home, p.series, p.collections], [true, true, true]);
    });

    testWidgets('cancel drops what is pending', (tester) async {
      final flushes = <PendingRefresh>[];
      final c = SocketRefreshCoalescer(onFlush: flushes.add);
      c.request(home: true);
      c.cancel();
      await tester.pump(const Duration(seconds: 20));
      expect(flushes, isEmpty);
    });

    testWidgets('an empty request schedules nothing', (tester) async {
      final flushes = <PendingRefresh>[];
      final c = SocketRefreshCoalescer(onFlush: flushes.add);
      c.request();
      expect(c.isPending, isFalse);
      await tester.pump(const Duration(seconds: 20));
      expect(flushes, isEmpty);
    });
  });

  group('itemEventIsForLibrary', () {
    test('matches the library on screen', () {
      expect(itemEventIsForLibrary({'libraryId': 'lib1'}, 'lib1'), isTrue);
      expect(itemEventIsForLibrary({'libraryId': 'lib2'}, 'lib1'), isFalse);
    });

    test('an event without a library id is assumed to concern it', () {
      expect(itemEventIsForLibrary({'id': 'li_1'}, 'lib1'), isTrue);
      expect(itemEventIsForLibrary({'libraryId': ''}, 'lib1'), isTrue);
    });
  });

  group('ListFetchCooldown', () {
    var now = DateTime(2026, 10, 31, 12);
    ListFetchCooldown make() =>
        ListFetchCooldown(const Duration(minutes: 5), now: () => now);

    setUp(() => now = DateTime(2026, 10, 31, 12));

    test('fresh within the cooldown for the same library and list', () {
      final c = make();
      final list = <dynamic>[1];
      expect(c.isFresh('lib1', list), isFalse, reason: 'never fetched');
      c.markFetched('lib1', list);
      expect(c.isFresh('lib1', list), isTrue);
      now = now.add(const Duration(minutes: 4));
      expect(c.isFresh('lib1', list), isTrue);
      now = now.add(const Duration(minutes: 2));
      expect(c.isFresh('lib1', list), isFalse, reason: 'cooldown over');
    });

    test('another library or a replaced list is never fresh', () {
      final c = make();
      final list = <dynamic>[1];
      c.markFetched('lib1', list);
      expect(c.isFresh('lib2', list), isFalse);
      // A library switch clears the list; a local edit copies it.
      expect(c.isFresh('lib1', <dynamic>[]), isFalse);
      expect(c.isFresh('lib1', [...list]), isFalse);
    });

    test('clear forgets the fetch (sign-out, account switch)', () {
      final c = make();
      final list = <dynamic>[1];
      c.markFetched('lib1', list);
      c.clear();
      expect(c.isFresh('lib1', list), isFalse);
    });
  });
}

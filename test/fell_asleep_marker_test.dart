import 'dart:async';
import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/fell_asleep_marker.dart';
import 'package:absorb/widgets/fell_asleep_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _book = 'li_00000000-0000-0000-0000-000000000001';
const _other = 'li_00000000-0000-0000-0000-000000000002';

Duration _m(int minutes) => Duration(minutes: minutes);

/// An in-memory pref for the store, with a movable clock.
class _Prefs {
  final values = <String, String>{};
  DateTime now = DateTime(2026, 11, 3, 23);

  FellAsleepStore store() => FellAsleepStore(
    read: (k) async => values[k],
    write: (k, v) async => values[k] = v,
    clock: () => now,
  );
}

class _FakePlayer extends ChangeNotifier implements FellAsleepPlayer {
  @override
  String? loadedKey = _book;

  @override
  Duration position = Duration.zero;

  @override
  bool isPlaying = false;

  final _positions = StreamController<Duration>.broadcast();
  final seeks = <Duration>[];

  @override
  Stream<Duration> get positions => _positions.stream;

  void moveTo(Duration p) {
    position = p;
    _positions.add(p);
  }

  @override
  Future<void> seekTo(Duration p) async {
    seeks.add(p);
    position = p;
    notifyListeners();
  }

  @override
  void dispose() {
    _positions.close();
    super.dispose();
  }
}

void main() {
  group('FellAsleepTracker', () {
    late _Prefs prefs;
    late FellAsleepStore store;
    late ({String? key, Duration position}) now;
    late FellAsleepTracker tracker;

    setUp(() {
      prefs = _Prefs();
      store = prefs.store();
      now = (key: _book, position: _m(10));
      tracker = FellAsleepTracker(
        store: store,
        probe: () => now,
        clock: () => prefs.now,
      );
    });

    void timer(bool active, Duration remaining, [int chapters = 0]) =>
        tracker.onTimerChanged(
          active: active,
          remaining: remaining,
          chapters: chapters,
        );

    test('remembers where the timer was set, not where it stopped', () async {
      timer(false, Duration.zero); // setTimeSleep cancels first
      timer(true, _m(30));
      // The countdown only goes down: never a sign of being awake.
      now = (key: _book, position: _m(20));
      timer(true, _m(20));
      now = (key: _book, position: _m(39));
      timer(true, const Duration(seconds: 30));

      await tracker.onSleepStopped(_book, 40 * 60.0);
      final marker = await store.markerFor(_book);
      expect(marker!.at, _m(10));
      expect(marker.stoppedAt, _m(40));
      expect(marker.recordedAt, prefs.now);
    });

    test(
      'extending, shaking or resetting on play moves the awake spot',
      () async {
        timer(true, _m(30));
        now = (key: _book, position: _m(25));
        timer(true, _m(15));
        timer(true, _m(30)); // reset / +time
        await tracker.onSleepStopped(_book, 55 * 60.0);
        expect((await store.markerFor(_book))!.at, _m(25));
      },
    );

    test('adding a chapter counts as awake too', () async {
      timer(true, Duration.zero, 1);
      now = (key: _book, position: _m(50));
      timer(true, Duration.zero, 2);
      await tracker.onSleepStopped(_book, 80 * 60.0);
      expect((await store.markerFor(_book))!.at, _m(50));
    });

    test(
      'no marker when the timer stopped right after a sign of life',
      () async {
        timer(true, _m(1));
        await tracker.onSleepStopped(_book, 11 * 60.0);
        expect(await store.markerFor(_book), isNull);
      },
    );

    test(
      'no marker for another book, or after the timer was cancelled',
      () async {
        timer(true, _m(30));
        await tracker.onSleepStopped(_other, 40 * 60.0);
        expect(await store.markerFor(_other), isNull);

        timer(true, _m(30));
        timer(false, Duration.zero); // cancelled by hand
        await tracker.onSleepStopped(_book, 40 * 60.0);
        expect(await store.markerFor(_book), isNull);
      },
    );

    test('nothing loaded when the timer started: no marker', () async {
      now = (key: null, position: Duration.zero);
      timer(true, _m(30));
      await tracker.onSleepStopped(_book, 40 * 60.0);
      expect(await store.markerFor(_book), isNull);
    });
  });

  group('FellAsleepStore', () {
    FellAsleepMarker marker(DateTime at) =>
        FellAsleepMarker(at: _m(5), stoppedAt: _m(30), recordedAt: at);

    test('markers last 7 days and clear on request', () async {
      final prefs = _Prefs();
      final store = prefs.store();
      var notified = 0;
      store.addListener(() => notified++);

      await store.put(_book, marker(prefs.now));
      expect(notified, 1);
      prefs.now = prefs.now.add(const Duration(days: 6, hours: 23));
      expect(await store.markerFor(_book), isNotNull);
      prefs.now = prefs.now.add(const Duration(hours: 2));
      expect(await store.markerFor(_book), isNull);

      prefs.now = DateTime(2026, 11, 3);
      await store.put(_book, marker(prefs.now));
      await store.clear(_book);
      expect(await store.markerFor(_book), isNull);
      expect(notified, 3);
      await store.clear(_book); // already gone: no notification
      expect(notified, 3);
    });

    test('keeps only the newest few and survives a broken pref', () async {
      final prefs = _Prefs();
      final store = prefs.store();
      for (var i = 0; i < FellAsleepStore.maxEntries + 5; i++) {
        await store.put('item$i', marker(prefs.now.add(Duration(minutes: i))));
      }
      final saved = jsonDecode(prefs.values[FellAsleepStore.prefKey]!) as Map;
      expect(saved.length, FellAsleepStore.maxEntries);
      expect(saved.containsKey('item0'), isFalse);
      expect(saved.containsKey('item24'), isTrue);

      prefs.values[FellAsleepStore.prefKey] = '{not json';
      expect(await store.markerFor('item24'), isNull);
    });

    test('a marker is useful between itself and 10 min past the stop', () {
      final m = marker(DateTime(2026));
      expect(m.usefulAt(_m(5)), isFalse);
      expect(m.usefulAt(_m(6)), isTrue);
      expect(m.usefulAt(_m(29)), isTrue);
      expect(m.usefulAt(_m(39)), isTrue);
      expect(m.usefulAt(_m(40)), isFalse);
    });
  });

  group('FellAsleepChip', () {
    final l = lookupAppLocalizations(const Locale('en'));
    late _Prefs prefs;
    late FellAsleepStore store;
    late _FakePlayer player;

    setUp(() {
      prefs = _Prefs();
      store = prefs.store();
      player = _FakePlayer()..position = _m(29);
    });
    tearDown(() => player.dispose());

    Future<void> pumpChip(WidgetTester tester, {String itemId = _book}) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                const SizedBox(),
                FellAsleepChip(itemId: itemId, player: player, store: store),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    Future<void> saveMarker() => store.put(
      _book,
      FellAsleepMarker(
        at: const Duration(hours: 1, minutes: 23, seconds: 45),
        stoppedAt: const Duration(hours: 1, minutes: 50),
        recordedAt: prefs.now,
      ),
    );

    final text = l.fellAsleepJumpBack('1:23:45');

    testWidgets('nothing without a marker', (tester) async {
      await pumpChip(tester);
      expect(find.text(text), findsNothing);
      expect(player.hasListeners, isFalse);
    });

    testWidgets('jump back seeks to the marker and clears it', (tester) async {
      await saveMarker();
      player.position = const Duration(hours: 1, minutes: 49);
      await pumpChip(tester);
      expect(find.text(text), findsOneWidget);

      await tester.tap(find.text(text));
      await tester.pumpAndSettle();
      expect(player.seeks, [
        const Duration(hours: 1, minutes: 23, seconds: 45),
      ]);
      expect(find.text(text), findsNothing);
      expect(await store.markerFor(_book), isNull);
    });

    testWidgets('dismiss clears it without seeking', (tester) async {
      await saveMarker();
      player.position = const Duration(hours: 1, minutes: 49);
      await pumpChip(tester);
      await tester.tap(find.byTooltip(l.dismiss));
      await tester.pumpAndSettle();
      expect(player.seeks, isEmpty);
      expect(find.text(text), findsNothing);
      expect(await store.markerFor(_book), isNull);
    });

    testWidgets('only on the loaded book', (tester) async {
      await saveMarker();
      player.position = const Duration(hours: 1, minutes: 49);
      player.loadedKey = _other;
      await pumpChip(tester);
      expect(find.text(text), findsNothing);

      player.loadedKey = _book;
      player.notifyListeners();
      await tester.pump();
      expect(find.text(text), findsOneWidget);
    });

    testWidgets('shows up when the timer saves a marker on an open player', (
      tester,
    ) async {
      player.position = const Duration(hours: 1, minutes: 49);
      await pumpChip(tester);
      expect(find.text(text), findsNothing);
      await saveMarker();
      await tester.pumpAndSettle();
      expect(find.text(text), findsOneWidget);
    });

    testWidgets('listening 10+ min past the stop retires it', (tester) async {
      await saveMarker();
      player.position = const Duration(hours: 1, minutes: 49);
      await pumpChip(tester);
      expect(find.text(text), findsOneWidget);

      player.isPlaying = true;
      player.moveTo(const Duration(hours: 1, minutes: 59));
      await tester.pumpAndSettle();
      expect(find.text(text), findsOneWidget);

      player.moveTo(const Duration(hours: 2, minutes: 0, seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text(text), findsNothing);
      expect(await store.markerFor(_book), isNull);
    });

    testWidgets('a stray position while paused never deletes it', (
      tester,
    ) async {
      await saveMarker();
      player.position = const Duration(hours: 3);
      await pumpChip(tester);
      expect(find.text(text), findsNothing);
      expect(await store.markerFor(_book), isNotNull);
    });
  });
}

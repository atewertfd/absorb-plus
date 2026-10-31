import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/json_file_store.dart';
import 'package:absorb/services/pending_writes.dart';
import 'package:absorb/services/playback_history_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:absorb/services/session_cache.dart';
import 'package:absorb/services/session_cache_prune.dart';
import 'package:absorb/services/stats_cache_store.dart';
import 'package:absorb/services/streaming_pending_ledger.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Audit B1: fewer and smaller SharedPreferences writes while playing, without
// losing what they protected.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('streaming listening buffer', () {
    late StreamingPendingLedger ledger;

    setUp(() {
      ledger = StreamingPendingLedger(
        scope: () => '',
        fallbackDelay: const Duration(hours: 1),
        flushOnExit: false,
      );
      addTearDown(ledger.dispose);
    });

    Future<Map<String, dynamic>?> record(String id) async {
      final raw = (await SharedPreferences.getInstance()).getString(
        'progress_$id',
      );
      return raw == null ? null : jsonDecode(raw) as Map<String, dynamic>;
    }

    Future<void> saveProgress(String id, double t) async {
      final prefs = await SharedPreferences.getInstance();
      final existing = await record(id);
      final data = <String, dynamic>{'itemId': id, 'currentTime': t};
      ledger.attach(id, data, existing);
      await prefs.setString('progress_$id', jsonEncode(data));
    }

    test(
      'a tick counts in memory and rides along with the progress save',
      () async {
        await saveProgress('b', 10);
        await ledger.add('b', 5);
        final prefs = await SharedPreferences.getInstance();
        expect(
          prefs.containsKey('streaming_pending_b'),
          isFalse,
          reason: 'no write of its own',
        );
        expect(
          (await record('b'))!.containsKey(StreamingPendingLedger.field),
          isFalse,
        );
        expect(await ledger.current('b'), 5);

        await saveProgress('b', 15);
        expect((await record('b'))![StreamingPendingLedger.field], 5);
        expect(ledger.hasUnwritten, isFalse);
      },
    );

    test(
      'without a progress save the count is written by the fallback/exit',
      () async {
        await saveProgress('b', 10);
        await ledger.add('b', 4);
        expect(ledger.hasUnwritten, isTrue);
        await ledger.flush();
        expect((await record('b'))![StreamingPendingLedger.field], 4);
        expect(ledger.hasUnwritten, isFalse);
      },
    );

    test('a confirmed sync is written at once', () async {
      await saveProgress('b', 10);
      await ledger.add('b', 20);
      await saveProgress('b', 30);
      await ledger.reduce('b', 20);
      expect(
        (await record('b'))!.containsKey(StreamingPendingLedger.field),
        isFalse,
      );
      expect(await ledger.current('b'), 0);
    });

    test('a server snapshot keeps an unsynced count', () async {
      await saveProgress('b', 10);
      await ledger.add('b', 7);
      await saveProgress('b', 15);
      // A cache write that knows nothing of the buffer (fresh memory).
      final fresh = StreamingPendingLedger(scope: () => '', flushOnExit: false);
      addTearDown(fresh.dispose);
      final data = <String, dynamic>{'itemId': 'b', 'currentTime': 99.0};
      fresh.attach('b', data, await record('b'));
      expect(data[StreamingPendingLedger.field], 7);
    });

    test(
      'at launch an orphaned count (old key and field) is taken once',
      () async {
        SharedPreferences.setMockInitialValues({
          'streaming_pending_old': 12, // left by an older build
          'progress_new': jsonEncode({
            'currentTime': 1.0,
            StreamingPendingLedger.field: 8,
          }),
        });
        expect(await ledger.takeOrphan('old'), 12);
        expect(await ledger.takeOrphan('new'), 8);
        expect(await ledger.takeOrphan('new'), 0);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.containsKey('streaming_pending_old'), isFalse);
        expect((await record('new'))!['currentTime'], 1.0);
      },
    );

    test(
      'an item with no progress record yet keeps the separate key',
      () async {
        await ledger.add('fresh', 3);
        await ledger.flush();
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('streaming_pending_fresh'), 3);
        // The first real save moves it into the record and drops the key.
        await saveProgress('fresh', 2);
        await ledger.add('fresh', 2);
        await ledger.flush();
        expect((await record('fresh'))![StreamingPendingLedger.field], 5);
        expect(prefs.containsKey('streaming_pending_fresh'), isFalse);
        expect(await ledger.takeOrphan('fresh'), 5);
      },
    );

    test(
      'an unpicked count waits the full delay, so ticks never double-write',
      () async {
        final quick = StreamingPendingLedger(
          scope: () => '',
          fallbackDelay: const Duration(milliseconds: 120),
          flushOnExit: false,
        );
        addTearDown(quick.dispose);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('progress_t', jsonEncode({'currentTime': 0.0}));
        Future<void> save() async {
          final data = <String, dynamic>{'currentTime': 1.0};
          quick.attach('t', data, await record('t'));
          await prefs.setString('progress_t', jsonEncode(data));
        }

        // Ticks that lag one save behind: each count rides the next save.
        await quick.add('t', 5);
        await Future<void>.delayed(const Duration(milliseconds: 80));
        await save();
        await quick.add('t', 5);
        await Future<void>.delayed(const Duration(milliseconds: 80));
        // The first timer found nothing overdue and wrote nothing extra.
        expect((await record('t'))![StreamingPendingLedger.field], 5);
        // No more saves (paused): the fallback writes it.
        await Future<void>.delayed(const Duration(milliseconds: 200));
        expect((await record('t'))![StreamingPendingLedger.field], 10);
      },
    );

    test(
      'ProgressSyncService: a real tick saves the count with the position',
      () async {
        final sync = ProgressSyncService();
        await sync.saveLocal(
          itemId: 'tick',
          currentTime: 5,
          duration: 100,
          speed: 1,
        );
        await sync.addStreamingPendingTime(
          'tick',
          5,
        ); // first tick reads storage
        // The player starts the save, then banks listening (audio_player_service).
        final saving = sync.saveLocal(
          itemId: 'tick',
          currentTime: 10,
          duration: 100,
          speed: 1,
        );
        final banking = sync.addStreamingPendingTime('tick', 5);
        await saving;
        await banking;
        expect(
          (await record('tick'))![StreamingPendingLedger.field],
          10,
          reason: 'the save of the same tick carries its count',
        );
        expect((await record('tick'))!['currentTime'], 10);
        await sync.reduceStreamingPendingTime('tick', 10);
        await sync.migrateOrphanStreamingTime();
      },
    );

    test(
      'ProgressSyncService: deleting progress keeps the count, once',
      () async {
        final sync = ProgressSyncService();
        await sync.saveLocal(
          itemId: 'del',
          currentTime: 5,
          duration: 100,
          speed: 1,
        );
        await sync.addStreamingPendingTime('del', 6);
        await sync.deleteLocal('del');
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('streaming_pending_del'), 6);
        await sync.saveLocal(
          itemId: 'del',
          currentTime: 1,
          duration: 100,
          speed: 1,
        );
        expect(await sync.getStreamingPendingTime('del'), 6);
        await sync.reduceStreamingPendingTime('del', 6);
        await sync.migrateOrphanStreamingTime();
        expect(
          prefs.getInt('offline_listening_del'),
          isNull,
          reason: 'already reported: nothing ships twice',
        );
      },
    );

    test(
      'ProgressSyncService: crash recovery still ships the buffer',
      () async {
        final sync = ProgressSyncService();
        await sync.saveLocal(
          itemId: 'x',
          currentTime: 5,
          duration: 100,
          speed: 1,
        );
        await sync.addStreamingPendingTime('x', 5);
        await sync.saveLocal(
          itemId: 'x',
          currentTime: 10,
          duration: 100,
          speed: 1,
        );
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.containsKey('streaming_pending_x'), isFalse);
        expect(await sync.getStreamingPendingTime('x'), 5);

        await sync.migrateOrphanStreamingTime(); // what the next launch runs
        expect(prefs.getInt('offline_listening_x'), 5);
        expect(await sync.getStreamingPendingTime('x'), 0);
        expect(await sync.getSavedPosition('x'), 10);
      },
    );
  });

  group('playback history', () {
    test('sync lines wait and go out with the next ordinary line', () async {
      final history = PlaybackHistoryService();
      await history.clearHistory('book');
      await history.log(
        itemId: 'book',
        type: PlaybackEventType.syncServer,
        positionSeconds: 1,
      );
      await history.log(
        itemId: 'book',
        type: PlaybackEventType.syncServer,
        positionSeconds: 2,
      );
      final prefs = await SharedPreferences.getInstance();
      expect(
        prefs.getStringList('playback_history_book'),
        isNull,
        reason: 'no write per sync',
      );
      expect(
        (await history.getHistory('book')).length,
        2,
        reason: 'the sheet still shows them',
      );

      await history.log(
        itemId: 'book',
        type: PlaybackEventType.pause,
        positionSeconds: 3,
      );
      final stored = prefs.getStringList('playback_history_book')!;
      expect(stored, hasLength(3));
      expect((await history.getHistory('book')).map((e) => e.type), [
        PlaybackEventType.pause,
        PlaybackEventType.syncServer,
        PlaybackEventType.syncServer,
      ]);
    });

    test('held lines are written on exit', () async {
      final history = PlaybackHistoryService();
      await history.clearHistory('book2');
      await history.log(
        itemId: 'book2',
        type: PlaybackEventType.syncServer,
        positionSeconds: 1,
      );
      await PendingWrites.flushAll();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList('playback_history_book2'), hasLength(1));
    });

    test('clearing drops held lines too', () async {
      final history = PlaybackHistoryService();
      await history.log(
        itemId: 'book3',
        type: PlaybackEventType.syncServer,
        positionSeconds: 1,
      );
      await history.clearHistory('book3');
      await PendingWrites.flushAll();
      expect(await history.getHistory('book3'), isEmpty);
    });
  });

  group('session cache', () {
    String entry(int savedAt) =>
        jsonEncode({'chapters': [], 'savedAt': savedAt});

    test('keeps the newest ten; unreadable ones and other accounts', () async {
      SharedPreferences.setMockInitialValues({
        for (var i = 0; i < 12; i++) 'session_cache_item$i': entry(1000 + i),
        'session_cache_bad': '{not json',
        'other:session_cache_item0': entry(1),
        'unrelated': 'x',
      });
      final prefs = await SharedPreferences.getInstance();
      expect(await pruneSessionCaches(prefs, ''), 3);
      final left = prefs
          .getKeys()
          .where((k) => k.startsWith('session_cache_'))
          .toSet();
      expect(left, {for (var i = 2; i < 12; i++) 'session_cache_item$i'});
      expect(prefs.containsKey('other:session_cache_item0'), isTrue);
      expect(prefs.getString('unrelated'), 'x');
    });

    test('saving prunes, and the book just saved always stays', () async {
      SharedPreferences.setMockInitialValues({
        for (var i = 0; i < 10; i++)
          'session_cache_old$i': entry(
            DateTime(2100).millisecondsSinceEpoch + i,
          ),
      });
      await SessionCache.save(
        itemId: 'now',
        audioTracks: const [],
        chapters: const [],
        totalDuration: 60,
      );
      final prefs = await SharedPreferences.getInstance();
      final left = prefs.getKeys().where((k) => k.startsWith('session_cache_'));
      expect(left, hasLength(kSessionCacheKeep));
      expect(await SessionCache.load(itemId: 'now'), isNotNull);
    });
  });

  group('stats cache', () {
    late Directory tmp;
    late JsonFileStore file;

    setUp(() {
      tmp = Directory.systemTemp.createTempSync('absorb_stats_cache_');
      file = JsonFileStore(
        StatsCacheStore.fileName,
        directory: () async => tmp,
        debounce: const Duration(hours: 1),
      );
      addTearDown(file.dispose);
    });

    tearDown(() {
      try {
        tmp.deleteSync(recursive: true);
      } catch (_) {}
    });

    test('an account\'s preference copy moves into the file', () async {
      SharedPreferences.setMockInitialValues({
        'acc:cached_stats': jsonEncode({'totalTime': 42}),
        'acc:cached_sessions': jsonEncode([
          {'id': 's1'},
        ]),
        'other:cached_stats': jsonEncode({'totalTime': 1}),
      });
      final store = StatsCacheStore.forTesting(file);

      final read = await store.read('acc');

      expect(read.stats, {'totalTime': 42});
      expect(read.sessions, [
        {'id': 's1'},
      ]);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('acc:cached_stats'), isFalse);
      expect(prefs.containsKey('acc:cached_sessions'), isFalse);
      expect(
        prefs.containsKey('other:cached_stats'),
        isTrue,
        reason: 'other accounts move when they are read',
      );
      final again = await StatsCacheStore.forTesting(file).read('acc');
      expect(again.stats, {'totalTime': 42});
    });

    test('new values are written by the file store, flushed on exit', () async {
      final store = StatsCacheStore.forTesting(file);
      expect((await store.read('acc')).stats, isNull);
      await store.writeStats('acc', {'totalTime': 7});
      await store.writeSessions('acc', [1, 2]);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getKeys(), isEmpty);
      await PendingWrites.flushAll();
      final fresh = StatsCacheStore.forTesting(
        JsonFileStore(
          StatsCacheStore.fileName,
          directory: () async => tmp,
          flushOnExit: false,
        ),
      );
      final read = await fresh.read('acc');
      expect(read.stats, {'totalTime': 7});
      expect(read.sessions, [1, 2]);
    });
  });
}

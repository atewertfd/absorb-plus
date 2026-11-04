import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/download_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

// A download record this build can't read (a newer or damaged entry) is kept
// as stored and written back, so the book's files don't lose their record.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;
  late List<String> logs;
  final originalDebugPrint = debugPrint;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    tmp = Directory.systemTemp.createTempSync('absorb_dl_unreadable_');
    fakePathProvider(tmp.path);
    logs = [];
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) logs.add(message);
    };
  });

  tearDown(() {
    debugPrint = originalDebugPrint;
    clearFakePathProvider();
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  DownloadService newService() {
    final s = DownloadService.forTesting(
      initialize: () async {},
      cancelTasks: (_) async {},
      deleteTaskRecord: (_) async {},
    );
    addTearDown(s.dispose);
    return s;
  }

  Map<String, dynamic> good(String id) => DownloadInfo(
    itemId: id,
    status: DownloadStatus.downloaded,
    progress: 1,
    localPaths: ['${tmp.path}/$id/01.mp3'],
    title: 'Book $id',
  ).toJson();

  // No itemId: DownloadInfo.fromJson throws on it.
  final badDownload = {
    'status': 2,
    'localPaths': ['/books/bad/01.mp3'],
    'futureField': {'nested': true},
  };

  Future<Map<String, dynamic>> storedMap(String key) async {
    final raw = (await SharedPreferences.getInstance()).getString(key);
    return raw == null ? {} : jsonDecode(raw) as Map<String, dynamic>;
  }

  int logsAbout(String key) => logs.where((l) => l.contains(key)).length;

  group('download index', () {
    test('unreadable entries are written back unchanged', () async {
      SharedPreferences.setMockInitialValues({
        'downloads': jsonEncode({
          'good-1': good('good-1'),
          'bad-1': badDownload,
          'bad-2': 'not a map',
        }),
        'kept_ebooks': jsonEncode({
          'ebook-ok': good('ebook-ok'),
          'ebook-bad': {'title': 'no id'},
        }),
        'download_origins': jsonEncode({}),
      });
      final s = newService();
      await s.debugLoadIndex();
      expect(s.downloadedItems.map((d) => d.itemId), ['good-1']);
      expect(logsAbout('bad-1'), 1);
      expect(logsAbout('bad-2'), 1);
      expect(logsAbout('ebook-bad'), 1);

      // Any later save (here: a new download) keeps them.
      s.debugPutDownload(DownloadInfo.fromJson(good('good-2')));
      s.debugPutKeptEbook(DownloadInfo.fromJson(good('ebook-2')));
      await s.debugSaveIndex();
      await s.debugSaveIndex();

      final downloads = await storedMap('downloads');
      expect(downloads.keys, unorderedEquals(['good-1', 'good-2', 'bad-1', 'bad-2']));
      expect(downloads['bad-1'], badDownload);
      expect(downloads['bad-2'], 'not a map');
      expect(downloads['good-1'], jsonDecode(jsonEncode(good('good-1'))));
      final kept = await storedMap('kept_ebooks');
      expect(kept.keys, unorderedEquals(['ebook-ok', 'ebook-2', 'ebook-bad']));
      expect(kept['ebook-bad'], {'title': 'no id'});
      // Logged once each, not on every save.
      expect(logsAbout('bad-1'), 1);
    });

    test('a readable entry for the same book replaces the kept one', () async {
      SharedPreferences.setMockInitialValues({
        'downloads': jsonEncode({'book': badDownload}),
      });
      final s = newService();
      await s.debugLoadIndex();

      s.debugPutDownload(DownloadInfo.fromJson(good('book')));
      await s.debugSaveIndex();
      expect((await storedMap('downloads'))['book'],
          jsonDecode(jsonEncode(good('book'))));

      // Deleting it later must not bring the old entry back.
      s.debugRemoveDownload('book');
      await s.debugSaveIndex();
      expect(await storedMap('downloads'), isEmpty);
    });
  });

  group('pending downloads', () {
    Map<String, dynamic> pending(String id) => {
      'itemId': id,
      'apiItemId': id,
      'title': id,
      'bookDir': '${tmp.path}/$id',
      'trackCount': 1,
      'expectedPaths': ['${tmp.path}/$id/0.mp3'],
    };
    // No bookDir: _PendingBook.fromJson throws on it.
    final badPending = {'itemId': 'bad', 'apiItemId': 'bad', 'title': 'Bad'};

    test('one unreadable entry neither stops the rest nor is dropped', () async {
      SharedPreferences.setMockInitialValues({
        'pending_downloads': jsonEncode({
          'a': pending('a'),
          'bad': badPending,
          'b': pending('b'),
        }),
      });
      final s = newService();
      await s.debugLoadPending();
      expect(s.activeDownloads.map((d) => d.itemId), unorderedEquals(['a', 'b']));
      expect(logsAbout('bad'), 1);

      await s.debugPersistPending();
      final stored = await storedMap('pending_downloads');
      expect(stored.keys, unorderedEquals(['a', 'bad', 'b']));
      expect(stored['bad'], badPending);
    });

    test('an unreadable entry the background job wrote is kept', () async {
      final s = newService();
      await s.debugLoadPending();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'pending_downloads', jsonEncode({'bad': badPending}));

      await s.debugPersistPending();
      await s.debugPersistPending();

      expect((await storedMap('pending_downloads'))['bad'], badPending);
      expect(logsAbout('bad'), 1);
    });
  });
}

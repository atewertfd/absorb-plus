import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/download_resume.dart';
import 'package:absorb/services/download_service.dart';
import 'package:absorb/services/download_track_names.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Regression tests for the 2026-11-01 downloads audit (D1-D10, U4).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const pathChannel = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Directory tmp;
  late Directory docs;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    tmp = Directory.systemTemp.createTempSync('absorb_dl_audit_');
    docs = Directory('${tmp.path}${Platform.pathSeparator}docs')..createSync();
    messenger.setMockMethodCallHandler(pathChannel, (call) async {
      if (call.method == 'getApplicationDocumentsDirectory') return docs.path;
      return null;
    });
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(pathChannel, null);
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

  ApiService offlineApi() => ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'test-token',
        httpClient: MockClient(
          (_) async => throw StateError('Unexpected request'),
        ),
      );

  group('D3 enrichMetadata', () {
    test('keeps the folder path and sizes when it picks up a cover', () async {
      final s = newService();
      final bookDir = Directory('${tmp.path}/Books/Author/Title')
        ..createSync(recursive: true);
      final track = File('${bookDir.path}/01.mp3')..writeAsBytesSync([1, 2]);
      final coverDir = Directory('${docs.path}/downloads/book-1')
        ..createSync(recursive: true);
      File('${coverDir.path}/cover.jpg').writeAsBytesSync([0xFF, 0xD8]);
      s.debugPutDownload(DownloadInfo(
        itemId: 'book-1',
        status: DownloadStatus.downloaded,
        progress: 1,
        trackCount: 1,
        bytesDone: 2,
        bytesTotal: 2,
        localPaths: [track.path],
        title: 'Title',
        author: 'Author',
        localDirPath: bookDir.path,
      ));

      await s.enrichMetadata(offlineApi());

      final info = s.getInfo('book-1');
      expect(info.localCoverPath, endsWith('cover.jpg'));
      expect(info.localDirPath, bookDir.path);
      expect(info.trackCount, 1);
      expect(info.bytesTotal, 2);
      expect(info.progress, 1);
    });
  });

  group('D1 custom (SAF) folder on Android', () {
    const storage = MethodChannel('com.absorb.storage');
    late List<MethodCall> calls;

    setUp(() {
      calls = [];
      messenger.setMockMethodCallHandler(storage, (call) async {
        calls.add(call);
        if (call.method == 'moveBookToSaf') {
          final names = (call.arguments['filenames'] as List).cast<String>();
          return {
            'dirUri': 'content://tree/doc/Author%2FTitle',
            'fileUris': [for (final n in names) 'content://tree/doc/$n'],
          };
        }
        return true;
      });
    });
    tearDown(() => messenger.setMockMethodCallHandler(storage, null));

    test('delete asks for the folder to go only when it is empty', () async {
      final s = newService();
      s.debugPutDownload(DownloadInfo(
        itemId: 'saf-book',
        status: DownloadStatus.downloaded,
        title: 'Title',
        localDirPath: 'content://tree/doc/Author%2FTitle',
      ));

      await s.deleteDownload('saf-book', skipStopCheck: true);

      expect(calls.map((c) => c.method), ['deleteSafDirIfEmpty']);
      expect(calls.single.arguments['dirUri'],
          'content://tree/doc/Author%2FTitle');
      expect(s.downloadedItems, isEmpty);
    });

    test('the move passes the book id so a used folder is never reused',
        () async {
      final s = newService();
      await s.debugSeedPendingDownload(
        itemId: 'saf-move-book',
        trackCount: 1,
        safTreeUri: 'content://tree',
        safSubfolder: 'Author/Title',
      );
      final file = File('${Directory.systemTemp.path}/'
          'absorb_download_service_test/saf-move-book/0.mp3')
        ..createSync(recursive: true)
        ..writeAsBytesSync([1]);
      addTearDown(() {
        try {
          file.parent.deleteSync(recursive: true);
        } catch (_) {}
      });

      await s.debugHandleTaskStatus(
        itemId: 'saf-move-book',
        trackIndex: 0,
        status: TaskStatus.complete,
      );

      final move = calls.firstWhere((c) => c.method == 'moveBookToSaf');
      expect(move.arguments['subfolder'], 'Author/Title');
      expect(move.arguments['idSuffix'], folderIdSuffix('saf-move-book'));
      expect(s.getInfo('saf-move-book').status, DownloadStatus.downloaded);
      expect(s.getInfo('saf-move-book').localDirPath,
          'content://tree/doc/Author%2FTitle');
    });
  });

  group('D2 interrupted desktop download', () {
    final seedDir = '${Directory.systemTemp.path}/absorb_download_service_test';

    DownloadService recordsService() {
      final s = DownloadService.forTesting(
        initialize: () async {},
        cancelTasks: (_) async {},
        deleteTaskRecord: (_) async {},
        taskRecords: () async => const [],
      );
      addTearDown(s.dispose);
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      return s;
    }

    test('fails at once on restart and keeps the finished tracks', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      final s = recordsService();
      await s.debugSeedPendingDownload(itemId: 'resume-book', trackCount: 2);
      final done = File('$seedDir/resume-book/0.mp3')
        ..createSync(recursive: true)
        ..writeAsBytesSync([1, 2, 3]);
      addTearDown(() {
        try {
          done.parent.deleteSync(recursive: true);
        } catch (_) {}
      });

      await s.debugRehydratePending();

      expect(s.activeDownloads, isEmpty);
      final failed = s.failedDownloads.single;
      expect(failed.localDirPath, '$seedDir/resume-book');
      expect(done.existsSync(), isTrue);

      s.debugKnownDesktopRoots = [seedDir];
      await s.dismissFailedDownload('resume-book');
      expect(done.existsSync(), isFalse);
    });

    test('the reconciler does not take a sleep for a stall', () async {
      final s = recordsService();
      await s.debugSeedPendingDownload(itemId: 'sleepy-book', trackCount: 1);
      final start = DateTime.now();

      // Woke after 20 minutes asleep: not failed, the clock starts again.
      await s.debugReconcile(
          now: start.add(const Duration(minutes: 20)), lastTick: start);
      expect(s.activeDownloads, isNotEmpty);

      // Awake and silent for 5 more minutes with no progress: failed.
      await s.debugReconcile(
          now: start.add(const Duration(minutes: 25)),
          lastTick: start.add(const Duration(minutes: 23)));
      expect(s.activeDownloads, isEmpty);
      expect(s.failedDownloads.single.itemId, 'sleepy-book');
    });

    test('a retry counts only tracks of the right size as finished', () {
      final dir = Directory('${tmp.path}/book')..createSync();
      File('${dir.path}/0.mp3').writeAsBytesSync([1, 2, 3]);
      File('${dir.path}/1.mp3').writeAsBytesSync([1]); // cut short
      File('${dir.path}/2.mp3').writeAsBytesSync([1, 2]); // size unknown
      final sizes = expectedTrackSizes([
        {'metadata': {'size': 3}},
        {'metadata': {'size': 3}},
        {'metadata': <String, dynamic>{}},
        {'metadata': {'size': 3}},
      ]);
      expect(sizes, [3, 3, null, 3]);
      final paths = [for (var i = 0; i < 4; i++) '${dir.path}/$i.mp3'];
      expect(finishedTracks(paths, sizes), {0});
    });

    test('sleep is a gap well past the timer period', () {
      final t = DateTime(2026, 11, 1, 12);
      expect(sleptBetweenTicks(null, t), isFalse);
      expect(sleptBetweenTicks(t, t.add(const Duration(minutes: 2))), isFalse);
      expect(sleptBetweenTicks(t, t.add(const Duration(minutes: 15))), isTrue);
    });
  });
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/download_resume.dart';
import 'package:absorb/services/download_service.dart';
import 'package:absorb/services/download_track_names.dart';
import 'package:absorb/services/user_account_service.dart';
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

    test('D7 delete while the book is moving in waits, then deletes',
        () async {
      final moving = Completer<void>();
      messenger.setMockMethodCallHandler(storage, (call) async {
        calls.add(call);
        if (call.method == 'moveBookToSaf') {
          await moving.future;
          return {
            'dirUri': 'content://tree/doc/Author%2FTitle',
            'fileUris': ['content://tree/doc/0.mp3'],
          };
        }
        return true;
      });
      final s = newService();
      await s.debugSeedPendingDownload(
        itemId: 'finishing-book',
        trackCount: 1,
        safTreeUri: 'content://tree',
        safSubfolder: 'Author/Title',
      );
      final file = File('${Directory.systemTemp.path}/'
          'absorb_download_service_test/finishing-book/0.mp3')
        ..createSync(recursive: true)
        ..writeAsBytesSync([1]);
      addTearDown(() {
        try {
          file.parent.deleteSync(recursive: true);
        } catch (_) {}
      });

      final finishing = s.debugHandleTaskStatus(
          itemId: 'finishing-book', trackIndex: 0, status: TaskStatus.complete);
      await Future<void>.delayed(Duration.zero);
      await s.deleteDownload('finishing-book', byUser: true);
      // Still finishing: nothing is dropped early.
      expect(s.activeDownloads.single.itemId, 'finishing-book');

      moving.complete();
      await finishing;

      expect(s.isDownloaded('finishing-book'), isFalse);
      expect(s.activeDownloads, isEmpty);
      expect(calls.map((c) => c.method), contains('deleteSafDirIfEmpty'));
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

  group('D4 same-named books started together', () {
    test('the second one gets its own folder while the first is starting',
        () async {
      final s = newService();
      expect(s.debugClaimFolderName('Author/Title', 'book-a'), 'Author/Title');
      expect(s.debugClaimFolderName('Author/Title', 'book-b'),
          'Author/Title (${folderIdSuffix('book-b')})');
      // Its own claim never pushes a book aside.
      expect(s.debugClaimFolderName('Author/Title', 'book-a'), 'Author/Title');

      // A claim stops counting once its download is no longer active.
      s.cancelDownload('book-a');
      await Future<void>.delayed(Duration.zero);
      expect(s.debugClaimFolderName('Author/Title', 'book-c'), 'Author/Title');
    });
  });

  group('D5 app and background job share the pending list', () {
    Map<String, dynamic> entry(String id) => {
          'itemId': id,
          'apiItemId': id,
          'title': id,
          'bookDir': '${tmp.path}/$id',
          'trackCount': 1,
          'expectedPaths': ['${tmp.path}/$id/0.mp3'],
        };

    Future<Map<String, dynamic>> stored() async {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString('pending_downloads');
      return json == null ? {} : jsonDecode(json) as Map<String, dynamic>;
    }

    Future<void> store(List<String> ids) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'pending_downloads', jsonEncode({for (final id in ids) id: entry(id)}));
    }

    tearDown(() => DownloadService.backgroundIsolateMode = false);

    test('the app keeps and takes over what the job added', () async {
      await store(['app-book']);
      final s = newService();
      await s.debugLoadPending();
      await store(['app-book', 'job-episode']); // the job enqueued one

      await s.debugSeedPendingDownload(itemId: 'app-book-2', trackCount: 1);

      expect((await stored()).keys,
          unorderedEquals(['app-book', 'job-episode', 'app-book-2']));
      expect(s.activeDownloads.map((d) => d.itemId), contains('job-episode'));

      // What the app finishes or drops itself still goes.
      await s.debugHandleTaskStatus(
          itemId: 'app-book', trackIndex: 0, status: TaskStatus.notFound);
      expect((await stored()).keys,
          unorderedEquals(['job-episode', 'app-book-2']));
    });

    test('an update for an unknown book takes over the job\'s entry', () async {
      final s = newService();
      await s.debugLoadPending();
      await store(['job-episode']);

      await s.debugAdoptForeignPending('job-episode');

      expect(s.activeDownloads.single.itemId, 'job-episode');
    });

    test('the job leaves the app\'s books alone', () async {
      await store(['app-book']);
      DownloadService.backgroundIsolateMode = true;
      final job = newService();
      await job.debugLoadPending();
      expect(job.activeDownloads, isEmpty);

      await job.debugSeedPendingDownload(itemId: 'job-episode', trackCount: 1);
      expect((await stored()).keys,
          unorderedEquals(['app-book', 'job-episode']));

      // The app finished its book meanwhile; the job doesn't write it back.
      await store(['job-episode']);
      await job.debugHandleTaskStatus(
          itemId: 'job-episode', trackIndex: 0, status: TaskStatus.notFound);
      expect(await stored(), isEmpty);
    });
  });

  group('D6 startup file check', () {
    test('a drive that does not answer keeps the download', () async {
      final s = newService();
      s.debugPutDownload(DownloadInfo(
        itemId: 'nas-book',
        status: DownloadStatus.downloaded,
        // On a drive that is there (not the unplugged-drive case).
        localPaths: ['${tmp.path}/nas/Author/Title/01.mp3'],
        title: 'Title',
      ));

      await IOOverrides.runZoned(
        () => s.debugValidateDownloads(),
        createFile: (path) => _UnansweringFile(path),
      );

      expect(s.isDownloaded('nas-book'), isTrue);
    });

    test('a file that is really gone drops the record and its folder',
        () async {
      final s = newService();
      final root = Directory('${tmp.path}/Books')..createSync();
      final dir = Directory('${root.path}/Author/Title')
        ..createSync(recursive: true);
      File('${dir.path}/02.mp3').writeAsBytesSync([1]);
      s.debugKnownDesktopRoots = [root.path];
      s.debugPutDownload(DownloadInfo(
        itemId: 'gone-book',
        status: DownloadStatus.downloaded,
        localPaths: ['${dir.path}/01.mp3', '${dir.path}/02.mp3'],
        localDirPath: dir.path,
        title: 'Title',
      ));

      await s.debugValidateDownloads();

      expect(s.isDownloaded('gone-book'), isFalse);
      expect(dir.existsSync(), isFalse);
      expect(root.existsSync(), isTrue);
    });
  });
  group('D9 downloads from another account', () {
    test('asking for an id already downloaded keeps its account', () async {
      SharedPreferences.setMockInitialValues({
        'saved_accounts': jsonEncode([
          {'serverUrl': 'https://one.example', 'username': 'alice', 'token': 'a'},
          {'serverUrl': 'https://two.example', 'username': 'bob', 'token': 'b'},
        ]),
        'active_account_scope': 'two.example_bob',
      });
      await UserAccountService().init();
      final s = newService();
      s.debugSetOrigin('12', 'one.example_alice');
      s.debugPutDownload(DownloadInfo(
        itemId: '12',
        status: DownloadStatus.downloaded,
        localPaths: ['${tmp.path}/12/01.mp3'],
        title: "Alice's book",
      ));
      expect(s.isFromOtherAccount('12'), isTrue);

      final result = await s.downloadItem(
          api: offlineApi(), itemId: '12', title: "Bob's book");

      expect(result, isNull);
      expect(s.isFromOtherAccount('12'), isTrue);
    });
  });
}

/// A file on a network drive that is still waking up: every check fails.
class _UnansweringFile implements File {
  _UnansweringFile(this.path);

  @override
  final String path;

  @override
  Future<bool> exists() async =>
      throw FileSystemException('The device is not ready', path);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

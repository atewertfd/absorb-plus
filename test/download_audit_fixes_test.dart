import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/download_service.dart';
import 'package:absorb/services/download_track_names.dart';
import 'package:background_downloader/background_downloader.dart';
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
}

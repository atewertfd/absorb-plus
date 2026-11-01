import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/download_service.dart';
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
}

import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/download_key.dart';
import 'package:absorb/services/download_service.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Round-2 download fixes: D11 (cancel racing the enqueue), D16 (cover
// folder left behind), D17 (episode ids kept with the record).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const pathChannel = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Directory tmp;
  late Directory docs;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    tmp = Directory.systemTemp.createTempSync('absorb_dl_round2_');
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

  Directory coverDir(String id) => Directory('${docs.path}/downloads/$id');

  void seedCover(String id) {
    final dir = coverDir(id)..createSync(recursive: true);
    File('${dir.path}/cover.jpg').writeAsBytesSync([0xFF, 0xD8]);
  }

  group('D17 download keys', () {
    test('a stored episode id splits any show id shape', () {
      final parts = downloadKeyParts('li_show42-ep_7', episodeId: 'ep_7');
      expect(parts.itemId, 'li_show42');
      expect(parts.episodeId, 'ep_7');
    });

    test('older records without one still split a UUID show id', () {
      const show = '0123abcd-0123-4567-89ab-0123456789ab';
      final parts = downloadKeyParts('$show-episode-1');
      expect(parts.itemId, show);
      expect(parts.episodeId, 'episode-1');
    });

    test('a book id is left whole', () {
      expect(downloadKeyParts('li_8gch9ve09orgn4fdz8').episodeId, isNull);
      expect(
        downloadKeyParts('0123abcd-0123-4567-89ab-0123456789ab').episodeId,
        isNull,
      );
    });

    test('the record keeps the episode id and reads old JSON without it', () {
      final info = DownloadInfo(
        itemId: 'li_show42-ep_7',
        status: DownloadStatus.error,
        episodeId: 'ep_7',
      );
      final back = DownloadInfo.fromJson(
        jsonDecode(jsonEncode(info.toJson())) as Map<String, dynamic>,
      );
      expect(back.episodeId, 'ep_7');

      final old = DownloadInfo.fromJson({
        'itemId': 'book-1',
        'status': DownloadStatus.downloaded.index,
        'localPaths': <String>[],
      });
      expect(old.episodeId, isNull);
      expect(old.toJson().containsKey('episodeId'), isFalse);
    });

    test(
      'a retry of a failed episode asks for the right show and episode',
      () async {
        final requested = <String>[];
        final api = ApiService(
          baseUrl: 'https://audiobookshelf.example',
          token: 'test-token',
          httpClient: MockClient((request) async {
            requested.add(request.url.path);
            return http.Response('{}', 404);
          }),
        );
        final s = DownloadService.forTesting(
          initialize: () async {},
          cancelTasks: (_) async {},
          deleteTaskRecord: (_) async {},
          enqueue: (_) async => true,
        );
        addTearDown(s.dispose);
        s.debugPutDownload(
          DownloadInfo(
            itemId: 'li_show42-ep_7',
            status: DownloadStatus.error,
            title: 'Episode 7',
            episodeId: 'ep_7',
          ),
        );

        await s.retryDownload(api: api, itemId: 'li_show42-ep_7');
        for (var i = 0; i < 20 && requested.isEmpty; i++) {
          await pumpEventQueue();
        }

        expect(requested, isNotEmpty);
        expect(requested.first, startsWith('/api/items/li_show42'));
      },
    );
  });

  group('D13 loading the list', () {
    test('a session already trimmed is kept as stored', () {
      const session =
          '{"libraryItem": {"media": {"metadata": {"title": "T"}}}}';
      final info = DownloadInfo.fromJson({
        'itemId': 'b',
        'status': DownloadStatus.downloaded.index,
        'sessionData': session,
      });
      expect(identical(info.sessionData, session), isTrue);
    });

    test('an untrimmed one still loses its file lists', () {
      final info = DownloadInfo.fromJson({
        'itemId': 'b',
        'status': DownloadStatus.downloaded.index,
        'sessionData': jsonEncode({
          'libraryItem': {
            'media': {
              'metadata': {'title': 'T'},
              'audioFiles': [1, 2],
            },
          },
        }),
      });
      expect(info.sessionData, isNot(contains('audioFiles')));
      expect(info.sessionData, contains('"title":"T"'));
    });
  });

  group('D16 cover folder', () {
    test('a failed download leaves no cover folder behind', () async {
      final s = DownloadService.forTesting(
        initialize: () async {},
        cancelTasks: (_) async {},
        deleteTaskRecord: (_) async {},
        taskRecords: () async => const [],
      );
      addTearDown(s.dispose);
      await s.debugSeedPendingDownload(itemId: 'fail-book', trackCount: 1);
      seedCover('fail-book');

      await s.debugHandleTaskStatus(
        itemId: 'fail-book',
        trackIndex: 0,
        status: TaskStatus.failed,
      );

      expect(s.failedDownloads.single.itemId, 'fail-book');
      expect(coverDir('fail-book').existsSync(), isFalse);
    });

    test('a cancelled download leaves no cover folder behind', () async {
      final s = DownloadService.forTesting(
        initialize: () async {},
        cancelTasks: (_) async {},
        deleteTaskRecord: (_) async {},
      );
      addTearDown(s.dispose);
      await s.debugSeedPendingDownload(itemId: 'cancel-book', trackCount: 1);
      seedCover('cancel-book');

      s.cancelDownload('cancel-book');
      for (var i = 0; i < 10 && coverDir('cancel-book').existsSync(); i++) {
        await pumpEventQueue();
      }

      expect(coverDir('cancel-book').existsSync(), isFalse);
    });

    test(
      'a dismissed failure removes its cover, a finished book keeps it',
      () async {
        final s = DownloadService.forTesting(
          initialize: () async {},
          cancelTasks: (_) async {},
          deleteTaskRecord: (_) async {},
        );
        addTearDown(s.dispose);
        seedCover('failed');
        seedCover('done');
        s.debugPutDownload(
          DownloadInfo(itemId: 'failed', status: DownloadStatus.error),
        );
        s.debugPutDownload(
          DownloadInfo(itemId: 'done', status: DownloadStatus.downloaded),
        );

        await s.dismissFailedDownload('failed');
        await s.dismissFailedDownload('done'); // not a failure: ignored

        expect(coverDir('failed').existsSync(), isFalse);
        expect(coverDir('done').existsSync(), isTrue);
      },
    );
  });

  group('D11 cancel while the tracks are enqueued', () {
    test('stops enqueueing and takes back what was handed over', () async {
      const id = 'many-tracks';
      final item = {
        'id': id,
        'mediaType': 'book',
        'media': {
          'metadata': {'title': 'Many Tracks', 'authorName': 'Writer'},
          'duration': 30,
          'chapters': <dynamic>[],
          'tracks': [
            for (var i = 0; i < 3; i++)
              {
                'index': i + 1,
                'startOffset': i * 10,
                'duration': 10,
                'contentUrl': '/api/items/$id/file/${100 + i}',
                'metadata': {'filename': '0$i.mp3'},
              },
          ],
        },
      };
      final api = ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'test-token',
        httpClient: MockClient((request) async {
          if (request.url.path == '/api/items/$id') {
            return http.Response(jsonEncode(item), 200);
          }
          return http.Response('{}', 404);
        }),
      );
      final cancelled = <String>[];
      final enqueued = <String>[];
      late DownloadService s;
      s = DownloadService.forTesting(
        initialize: () async {},
        cancelTasks: (ids) async => cancelled.addAll(ids),
        deleteTaskRecord: (_) async {},
        enqueue: (task) async {
          enqueued.add(task.taskId);
          // The user cancels while the first track is being handed over.
          if (enqueued.length == 1) s.cancelDownload(id);
          return true;
        },
      );
      addTearDown(s.dispose);

      await s.downloadItem(api: api, itemId: id, title: 'Many Tracks');
      for (var i = 0; i < 50 && cancelled.length < 2; i++) {
        await pumpEventQueue();
      }

      expect(enqueued, hasLength(1));
      expect(cancelled, contains(enqueued.single));
      expect(s.failedDownloads, isEmpty);
      expect(s.activeDownloads, isEmpty);
    });
  });
}

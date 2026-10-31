import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/download_index_store.dart';
import 'package:absorb/services/download_service.dart';
import 'package:absorb/services/json_file_store.dart';
import 'package:absorb/services/pending_writes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The download list moves out of SharedPreferences into downloads.json
// (audit B1). The move must never lose an entry: not on a corrupt file, not
// when it is interrupted, not when an older build wrote the preferences
// again in between.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;

  File indexFile() => File(
    '${tmp.path}${Platform.pathSeparator}${DownloadIndexStore.fileName}',
  );

  Map<String, dynamic> entry(String id, {String? title}) => DownloadInfo(
    itemId: id,
    status: DownloadStatus.downloaded,
    progress: 1,
    localPaths: ['/books/$id/01.mp3', '/books/$id/02.mp3'],
    sessionData: jsonEncode({
      'id': 'session-$id',
      'chapters': [
        for (var c = 0; c < 20; c++)
          {'id': c, 'start': c * 60.0, 'title': 'Chapter $c'},
      ],
      'audioTracks': [
        {'index': 1, 'contentUrl': '/s/$id/1'},
      ],
    }),
    title: title ?? 'Book $id',
    author: 'Author',
    localDirPath: '/books/$id',
    libraryId: 'lib',
  ).toJson();

  Map<String, Object> legacyPrefs(
    Map<String, dynamic> downloads, {
    Map<String, dynamic>? kept,
    Map<String, dynamic>? origins,
  }) => {
    'downloads': jsonEncode(downloads),
    'kept_ebooks': jsonEncode(kept ?? {}),
    'download_origins': jsonEncode(origins ?? {}),
    'unrelated': 'stays',
  };

  JsonFileStore newFile({Future<Directory> Function()? dir}) {
    final f = JsonFileStore(
      DownloadIndexStore.fileName,
      directory: dir ?? () async => tmp,
      debounce: const Duration(milliseconds: 10),
    );
    addTearDown(f.dispose);
    return f;
  }

  DownloadService newService(JsonFileStore file) {
    final s = DownloadService.forTesting(
      initialize: () async {},
      cancelTasks: (_) async {},
      deleteTaskRecord: (_) async {},
      indexStore: FileDownloadIndexStore(file),
    );
    addTearDown(s.dispose);
    return s;
  }

  Map<String, dynamic> fileDownloads() =>
      (jsonDecode(indexFile().readAsStringSync()) as Map)['downloads']
          as Map<String, dynamic>;

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('absorb_dl_index_');
  });

  tearDown(() {
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  test(
    'moves the preferences list into the file, then removes the keys',
    () async {
      final downloads = {
        for (final id in ['a', 'b', 'c']) id: entry(id),
      };
      SharedPreferences.setMockInitialValues(
        legacyPrefs(
          downloads,
          kept: {'k': entry('k')},
          origins: {'a': 'scope-1'},
        ),
      );
      final service = newService(newFile());

      await service.debugLoadIndex();

      expect(service.downloadedItems.map((d) => d.itemId).toSet(), {
        'a',
        'b',
        'c',
      });
      final onDisk = jsonDecode(indexFile().readAsStringSync()) as Map;
      expect(onDisk['downloads'], downloads);
      expect((onDisk['keptEbooks'] as Map).keys, ['k']);
      expect(onDisk['origins'], {'a': 'scope-1'});
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('downloads'), isFalse);
      expect(prefs.containsKey('kept_ebooks'), isFalse);
      expect(prefs.containsKey('download_origins'), isFalse);
      expect(prefs.getString('unrelated'), 'stays');
    },
  );

  test(
    'no entry is lost: every download survives the move byte for byte',
    () async {
      final downloads = {
        for (var i = 0; i < 60; i++) 'item-$i': entry('item-$i'),
      };
      SharedPreferences.setMockInitialValues(legacyPrefs(downloads));
      final service = newService(newFile());

      await service.debugLoadIndex();

      expect(service.downloadedItems, hasLength(60));
      expect(fileDownloads(), downloads);

      // A second launch reads the file alone and still has all of them.
      final next = newService(newFile());
      await next.debugLoadIndex();
      expect(next.downloadedItems, hasLength(60));
    },
  );

  test(
    'a corrupt file with the preferences still there uses the preferences',
    () async {
      indexFile().writeAsStringSync('{"downloads": {"a": ');
      SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
      final service = newService(newFile());

      await service.debugLoadIndex();

      expect(service.downloadedItems.single.itemId, 'a');
      expect(fileDownloads().keys, ['a']);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('downloads'), isFalse);
    },
  );

  test('a corrupt file after the move falls back to the backup', () async {
    SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
    final file = newFile();
    final first = newService(file);
    await first.debugLoadIndex();
    first.debugPutDownload(DownloadInfo.fromJson(entry('b')));
    await first.debugSaveIndex();
    await first.flushIndex(); // backup now holds {a}, main {a, b}
    indexFile().writeAsStringSync('garbage');

    final next = newService(newFile());
    await next.debugLoadIndex();

    expect(next.downloadedItems.map((d) => d.itemId), ['a']);
  });

  test(
    'an interrupted move (file written, keys not yet removed) finishes',
    () async {
      final downloads = {'a': entry('a'), 'b': entry('b')};
      indexFile().writeAsStringSync(
        jsonEncode(DownloadIndex(downloads: downloads).toJson()),
      );
      SharedPreferences.setMockInitialValues(legacyPrefs(downloads));
      final service = newService(newFile());

      await service.debugLoadIndex();

      expect(service.downloadedItems, hasLength(2));
      expect(fileDownloads(), downloads);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('downloads'), isFalse);
    },
  );

  test(
    'a move killed before the file landed (only a temp file) starts over',
    () async {
      File('${indexFile().path}.999-0.tmp').writeAsStringSync('{"downl');
      SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
      final service = newService(newFile());

      await service.debugLoadIndex();

      expect(service.downloadedItems.single.itemId, 'a');
      expect(fileDownloads().keys, ['a']);
    },
  );

  test(
    'entries an older build added to the preferences are merged in',
    () async {
      indexFile().writeAsStringSync(
        jsonEncode(
          DownloadIndex(
            downloads: {'a': entry('a', title: 'File copy')},
          ).toJson(),
        ),
      );
      SharedPreferences.setMockInitialValues(
        legacyPrefs({
          'a': entry('a', title: 'Older copy'),
          'new': entry('new'),
        }),
      );
      final service = newService(newFile());

      await service.debugLoadIndex();

      final titles = {
        for (final d in service.downloadedItems) d.itemId: d.title,
      };
      expect(titles, {'a': 'File copy', 'new': 'Book new'});
      expect(fileDownloads().keys.toSet(), {'a', 'new'});
    },
  );

  test(
    'when the file cannot be confirmed the preferences stay as fallback',
    () async {
      SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
      final service = newService(
        newFile(dir: () async => throw const FileSystemException('read-only')),
      );

      await service.debugLoadIndex();

      expect(service.downloadedItems.single.itemId, 'a');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('downloads'), isTrue);
    },
  );

  test(
    'an unconfirmed move drops the preferences after a later write lands',
    () async {
      var diskOk = false;
      SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
      final service = newService(
        newFile(
          dir: () async =>
              diskOk ? tmp : throw const FileSystemException('locked'),
        ),
      );
      await service.debugLoadIndex();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('downloads'), isTrue);

      diskOk = true;
      service.debugPutDownload(DownloadInfo.fromJson(entry('b')));
      await service.debugSaveIndex();
      await service.flushIndex();
      await pumpEventQueue();

      expect(fileDownloads().keys.toSet(), {'a', 'b'});
      expect(
        prefs.containsKey('downloads'),
        isFalse,
        reason: 'a later launch must not merge back what was deleted since',
      );
    },
  );

  test('a download list of the wrong shape falls back to its backup', () async {
    SharedPreferences.setMockInitialValues({});
    File('${indexFile().path}.bak').writeAsStringSync(
      jsonEncode(DownloadIndex(downloads: {'a': entry('a')}).toJson()),
    );
    indexFile().writeAsStringSync(jsonEncode({'something': 'else'}));
    final file = JsonFileStore(
      DownloadIndexStore.fileName,
      directory: () async => tmp,
      validate: (v) => DownloadIndex.fromJson(v) != null,
    );
    addTearDown(file.dispose);
    final service = newService(file);

    await service.debugLoadIndex();

    expect(service.downloadedItems.single.itemId, 'a');
  });

  test('launch does not rewrite an unchanged list', () async {
    SharedPreferences.setMockInitialValues(legacyPrefs({'a': entry('a')}));
    final first = newService(newFile());
    await first.debugLoadIndex();

    final file = newFile();
    final next = newService(file);
    await next.debugLoadIndex();
    await next.debugSaveIndex(); // what init does after loading
    await next.flushIndex();
    expect(file.writeCount, 0);

    next.debugPutDownload(DownloadInfo.fromJson(entry('b')));
    await next.debugSaveIndex();
    await next.flushIndex();
    expect(file.writeCount, 1);
  });

  test('a save is held back briefly and flushed on exit', () async {
    SharedPreferences.setMockInitialValues({});
    final file = JsonFileStore(
      DownloadIndexStore.fileName,
      directory: () async => tmp,
      debounce: const Duration(hours: 1),
    );
    addTearDown(file.dispose);
    final service = newService(file);
    await service.debugLoadIndex();

    service.debugPutDownload(DownloadInfo.fromJson(entry('a')));
    await service.debugSaveIndex();
    expect(indexFile().existsSync(), isFalse);

    await PendingWrites.flushAll();
    expect(fileDownloads().keys, ['a']);
  });

  test('web and tests keep the preferences store', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PrefsDownloadIndexStore();
    await store.save(() => DownloadIndex(downloads: {'a': entry('a')}));
    final prefs = await SharedPreferences.getInstance();
    expect((jsonDecode(prefs.getString('downloads')!) as Map).keys, ['a']);
    expect((await store.load()).downloads.keys, ['a']);
  });
}

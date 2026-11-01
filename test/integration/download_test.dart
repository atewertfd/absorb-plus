// Downloads of seeded files against the throwaway server: the links the
// download service resolves (from the item, and from a play session), fetched
// with the headers it hands the background downloader, plus the desktop
// "Save a copy" of a whole book. Never a real server.
// Run with .\tool\dev.ps1 itest (see abs_test_server.dart).
@Tags(['abs-server'])
library;

import 'dart:io';
import 'dart:typed_data';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/book_copy_download.dart';
import 'package:absorb/services/download_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'abs_test_server.dart';

/// True for an MP3 that starts with an ID3 tag or an MPEG frame sync.
bool _looksLikeMp3(Uint8List b) =>
    b.length > 4 &&
    ((b[0] == 0x49 && b[1] == 0x44 && b[2] == 0x33) || (b[0] == 0xFF && (b[1] & 0xE0) == 0xE0));

/// True for an MP4/M4B container (an `ftyp` box near the start).
bool _looksLikeMp4(Uint8List b) => b.length > 12 && String.fromCharCodes(b.sublist(4, 8)) == 'ftyp';

/// The URL with its token hidden, for failure messages.
String _redact(String url) => url.replaceAll(RegExp(r'token=[^&]+'), 'token=***');

void main() {
  late Directory dir;
  late DownloadService service;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('absorb-itest-dl-');
    service = DownloadService.forTesting(initialize: () async {});
  });

  tearDown(() async {
    service.dispose();
    if (await dir.exists()) await dir.delete(recursive: true);
  });

  /// Fetches every resolved file the way the downloader does and saves it
  /// under its resolved name. Returns the saved files in track order.
  Future<List<File>> fetchAll(ApiService api, List<({String url, String filename})> files) async {
    final saved = <File>[];
    for (final f in files) {
      final r = await http.get(Uri.parse(f.url), headers: api.downloadHeadersFor(f.url));
      expect(r.statusCode, 200, reason: _redact(f.url));
      final file = File('${dir.path}${Platform.pathSeparator}${f.filename}');
      await file.writeAsBytes(r.bodyBytes, flush: true);
      saved.add(file);
    }
    return saved;
  }

  test('book download: every track of the multi-file book, from its permanent file links', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final itemId = (await server.book(api, multiFileBookTitle))['id'] as String;
    final item = await api.getLibraryItem(itemId);
    expect(item, isNotNull);
    final tracks = item!['media']['tracks'] as List;
    final audioFiles = (item['media']['audioFiles'] as List).cast<Map<String, dynamic>>();
    expect(tracks, hasLength(3));

    // The same resolution the download service uses before queueing tasks.
    final files = service.debugResolveDurableFiles(api: api, itemId: itemId, audioTracks: tracks);
    expect(files, hasLength(3));
    for (final f in files) {
      expect(Uri.parse(f.url).path, startsWith('/api/items/$itemId/file/'), reason: 'a durable link, not a session one');
      expect(f.filename, endsWith('.mp3'));
    }
    expect(files.map((f) => f.filename).toSet(), hasLength(3), reason: 'unique file names');

    final saved = await fetchAll(api, files);
    for (var i = 0; i < saved.length; i++) {
      final bytes = await saved[i].readAsBytes();
      expect(_looksLikeMp3(bytes), isTrue, reason: '${files[i].filename} is an MP3');
      final size = audioFiles[i]['metadata']?['size'] as num?;
      if (size != null) expect(bytes.length, size.toInt(), reason: 'complete file ${files[i].filename}');
    }
  });

  test('a download link without the token is refused', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final itemId = (await server.book(api, multiFileBookTitle))['id'] as String;
    final item = await api.getLibraryItem(itemId);
    final files = service.debugResolveDurableFiles(api: api, itemId: itemId, audioTracks: item!['media']['tracks'] as List);
    final bare = Uri.parse(files.first.url).replace(queryParameters: const {});
    final r = await http.get(bare);
    expect(r.statusCode, anyOf(401, 403));
  });

  test('download from a play session: the M4B resolves to its file link and downloads whole', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final itemId = (await server.book(api, chapteredBookTitle))['id'] as String;

    final session = await api.startPlaybackSession(itemId);
    expect(session, isNotNull, reason: 'POST /api/items/:id/play');
    final sessionId = session!['id'] as String;
    try {
      final files = service.debugResolveDurableFiles(
        api: api,
        itemId: itemId,
        audioTracks: session['audioTracks'] as List,
        sessionId: sessionId,
      );
      expect(files, hasLength(1));
      expect(files.single.filename, endsWith('.m4b'));
      final saved = await fetchAll(api, files);
      final bytes = await saved.single.readAsBytes();
      expect(_looksLikeMp4(bytes), isTrue, reason: 'an M4B container');
      expect(bytes.length, greaterThan(10000));
    } finally {
      await api.closePlaybackSession(sessionId);
    }
  });

  test('save a copy: the whole book as one file through BookCopyDownload', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final book = await server.book(api, multiFileBookTitle);
    final itemId = book['id'] as String;
    expect((await api.getMe())?['permissions']?['download'], isTrue);

    final dest = '${dir.path}${Platform.pathSeparator}${BookCopyDownload.suggestedFileName(multiFileBookTitle, book)}';
    expect(dest, endsWith('.zip'), reason: 'a folder book comes as a zip');
    var lastReceived = 0;
    final file = await BookCopyDownload().run(
      Uri.parse(api.buildItemDownloadUrl(itemId)),
      api.mediaHeaders,
      dest,
      (received, _) => lastReceived = received,
    );
    final bytes = await file.readAsBytes();
    expect(String.fromCharCodes(bytes.sublist(0, 2)), 'PK', reason: 'a zip archive');
    expect(lastReceived, bytes.length);
    expect(File('$dest.part').existsSync(), isFalse, reason: 'the partial file is renamed away');
  });
}

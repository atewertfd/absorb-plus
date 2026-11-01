import 'dart:async';
import 'dart:io';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/book_copy_download.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

/// Streams [chunks] and records the requests it got.
class _FakeClient extends http.BaseClient {
  _FakeClient(this.handler);
  final Future<http.StreamedResponse> Function(http.BaseRequest) handler;
  final requests = <http.BaseRequest>[];
  bool closed = false;
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    requests.add(request);
    return handler(request);
  }

  @override
  void close() => closed = true;
}

http.StreamedResponse _ok(Stream<List<int>> body, {int? length}) =>
    http.StreamedResponse(body, 200,
        contentLength: length, headers: {'content-type': 'application/zip'});

void main() {
  late Directory dir;
  setUp(() => dir = Directory.systemTemp.createTempSync('book_copy_test'));
  tearDown(() {
    dir.deleteSync(recursive: true);
    debugDefaultTargetPlatformOverride = null;
    ForkPlatform.debugIsWebOverride = null;
  });

  test('streams to a .part file and renames it after completion', () async {
    final client = _FakeClient((_) async => _ok(
        Stream.fromIterable([
          [1, 2],
          [3]
        ]),
        length: 3));
    final dest = '${dir.path}/Book.zip';
    final progress = <int>[];
    final file = await BookCopyDownload(client).run(
        Uri.parse('https://abs.example/api/items/i1/download?token=t'),
        {'Authorization': 'Bearer t', 'X-Proxy': 'p'},
        dest,
        (r, _) => progress.add(r));
    expect(file.path, dest);
    expect(File(dest).readAsBytesSync(), [1, 2, 3]);
    expect(File('$dest.part').existsSync(), isFalse);
    expect(progress, [2, 3]);
    expect(client.requests.single.headers['X-Proxy'], 'p');
    expect(client.closed, isTrue);
  });

  test('follows redirects with the sign-in headers', () async {
    final client = _FakeClient((r) async => r.url.path == '/old'
        ? http.StreamedResponse(const Stream.empty(), 302,
            headers: {'location': '/new'})
        : _ok(Stream.value([9])));
    await BookCopyDownload(client).run(Uri.parse('https://abs.example/old'),
        {'Authorization': 'Bearer t'}, '${dir.path}/b.zip', (_, __) {});
    expect(client.requests.last.url.path, '/new');
    expect(client.requests.last.headers['Authorization'], 'Bearer t');
  });

  test('a server error deletes nothing existing and leaves no partial file',
      () async {
    final dest = File('${dir.path}/b.zip')..writeAsStringSync('old');
    final client = _FakeClient(
        (_) async => http.StreamedResponse(const Stream.empty(), 403));
    await expectLater(
        BookCopyDownload(client).run(
            Uri.parse('https://abs.example/x?token=secret'), {}, dest.path,
            (_, __) {}),
        throwsA(isA<BookCopyFailed>()));
    expect(dest.readAsStringSync(), 'old');
    expect(File('${dest.path}.part').existsSync(), isFalse);
  });

  test('a stream error is a failure without the URL and removes the part',
      () async {
    final controller = StreamController<List<int>>();
    final client = _FakeClient((_) async => _ok(controller.stream));
    final dest = '${dir.path}/b.zip';
    final future = BookCopyDownload(client).run(
        Uri.parse('https://abs.example/x?token=secret'), {}, dest, (_, __) {});
    controller.add([1]);
    await Future<void>.delayed(Duration.zero);
    controller.addError(
        http.ClientException('reset', Uri.parse('https://abs.example/x?token=secret')));
    await controller.close();
    final error = await future.then<Object?>((_) => null, onError: (Object e) => e);
    expect(error, isA<BookCopyFailed>());
    expect(error.toString(), isNot(contains('secret')));
    expect(File('$dest.part').existsSync(), isFalse);
    expect(File(dest).existsSync(), isFalse);
  });

  test('a short download (fewer bytes than announced) is a failure', () async {
    final client =
        _FakeClient((_) async => _ok(Stream.value([1]), length: 10));
    final dest = '${dir.path}/b.zip';
    await expectLater(
        BookCopyDownload(client)
            .run(Uri.parse('https://abs.example/x'), {}, dest, (_, __) {}),
        throwsA(isA<BookCopyFailed>()));
    expect(File(dest).existsSync(), isFalse);
  });

  test('cancel mid-stream deletes the partial file', () async {
    final controller = StreamController<List<int>>();
    final client = _FakeClient((_) async => _ok(controller.stream));
    final download = BookCopyDownload(client);
    final dest = '${dir.path}/b.zip';
    final future = download.run(
        Uri.parse('https://abs.example/x'), {}, dest, (_, __) {});
    controller.add([1]);
    await Future<void>.delayed(Duration.zero);
    download.cancel();
    controller.add([2]);
    await controller.close();
    await expectLater(future, throwsA(isA<BookCopyCancelled>()));
    expect(File('$dest.part').existsSync(), isFalse);
    expect(File(dest).existsSync(), isFalse);
  });

  test('only offered on desktop Audiobookshelf with download permission', () {
    ForkPlatform.debugIsWebOverride = false;
    final allowed = {
      'permissions': {'download': true}
    };
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    expect(
        BookCopyDownload.available(
            userJson: allowed, isBookOrbit: false, offline: false),
        isTrue);
    expect(
        BookCopyDownload.available(
            userJson: {'permissions': {'download': false}},
            isBookOrbit: false,
            offline: false),
        isFalse);
    expect(
        BookCopyDownload.available(
            userJson: null, isBookOrbit: false, offline: false),
        isFalse);
    expect(
        BookCopyDownload.available(
            userJson: allowed, isBookOrbit: true, offline: false),
        isFalse);
    expect(
        BookCopyDownload.available(
            userJson: allowed, isBookOrbit: false, offline: true),
        isFalse);
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(
        BookCopyDownload.available(
            userJson: allowed, isBookOrbit: false, offline: false),
        isFalse);
  });

  test('suggested name is a zip unless the item is a single file', () {
    expect(BookCopyDownload.suggestedFileName('Dune: Part 1', null),
        'Dune Part 1.zip');
    expect(
        BookCopyDownload.suggestedFileName(
            'Dune', {'isFile': true, 'relPath': 'Dune.m4b'}),
        'Dune.m4b');
  });

  test('item download URL carries the token on the download endpoint', () {
    final api = ApiService(
        baseUrl: 'https://abs.example/',
        token: 'fixture-token',
        httpClient: MockClient((_) async => http.Response('', 404)));
    expect(api.buildItemDownloadUrl('li_1'),
        'https://abs.example/api/items/li_1/download?token=fixture-token');
  });
}

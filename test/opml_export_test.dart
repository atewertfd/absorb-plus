import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/opml_export.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:share_plus/share_plus.dart';

const _opml = '<?xml version="1.0"?><opml version="1.0"></opml>';

ApiService _api(List<http.Request> seen, {int status = 200}) => ApiService(
      baseUrl: 'https://abs.example',
      token: 'fixture-token',
      httpClient: MockClient((r) async {
        seen.add(r);
        return http.Response(status == 200 ? _opml : 'no', status);
      }),
      networkRetryDelay: Duration.zero,
    );

void main() {
  late List<(String, String)> written;
  late List<String> picked;
  late List<XFile> shared;
  late List<String> webFiles;

  setUp(() {
    written = [];
    picked = [];
    shared = [];
    webFiles = [];
    OpmlExport.writeFile = (p, c) async => written.add((p, c));
    OpmlExport.pickSavePath = (title, name) async {
      picked.add(name);
      return 'C:/out/$name';
    };
    OpmlExport.share = (f, _) async => shared.add(f);
    OpmlExport.webDownload = (n, _) async => webFiles.add(n);
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    ForkPlatform.debugIsWebOverride = null;
  });

  test('desktop asks for a path, fetches the OPML and saves it', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = false;
    final seen = <http.Request>[];
    final r = await OpmlExport.export(_api(seen),
        libraryId: 'lib1', libraryName: 'My Pods!', dialogTitle: 't');
    expect(r.status, OpmlExportStatus.saved);
    expect(picked, ['My Pods.opml']);
    expect(seen.single.url.path, '/api/libraries/lib1/opml');
    expect(seen.single.headers['Authorization'], 'Bearer fixture-token');
    expect(written.single, ('C:/out/My Pods.opml', _opml));
  });

  test('desktop cancel sends no request', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    ForkPlatform.debugIsWebOverride = false;
    OpmlExport.pickSavePath = (_, __) async => null;
    final seen = <http.Request>[];
    final r = await OpmlExport.export(_api(seen),
        libraryId: 'lib1', libraryName: 'x', dialogTitle: 't');
    expect(r.status, OpmlExportStatus.cancelled);
    expect(seen, isEmpty);
  });

  test('server error is a failure and nothing is written', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = false;
    final r = await OpmlExport.export(_api([], status: 403),
        libraryId: 'lib1', libraryName: 'x', dialogTitle: 't');
    expect(r.status, OpmlExportStatus.failed);
    expect(written, isEmpty);
  });

  test('Android shares the file', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    ForkPlatform.debugIsWebOverride = false;
    final r = await OpmlExport.export(_api([]),
        libraryId: 'lib1', libraryName: 'Pods', dialogTitle: 't');
    expect(r.status, OpmlExportStatus.shared);
    expect(await shared.single.readAsString(), _opml);
    expect(picked, isEmpty);
  });

  test('web downloads through the browser', () async {
    ForkPlatform.debugIsWebOverride = true;
    final r = await OpmlExport.export(_api([]),
        libraryId: 'lib1', libraryName: '', dialogTitle: 't');
    expect(r.status, OpmlExportStatus.downloaded);
    expect(webFiles, ['podcasts.opml']);
  });
}

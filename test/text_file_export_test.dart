import 'dart:convert';

import 'package:absorb/services/text_file_export.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  late List<(String, String)> written;
  late List<(String, String)> picked;
  late List<XFile> shared;
  late List<(String, String)> webFiles;

  setUp(() {
    written = [];
    picked = [];
    shared = [];
    webFiles = [];
    TextFileExport.writeFile = (p, c) async => written.add((p, c));
    TextFileExport.pickSavePath = (title, name, ext) async {
      picked.add((name, ext));
      return 'C:/out/$name';
    };
    TextFileExport.share = (f, _) async => shared.add(f);
    TextFileExport.webDownload = (n, c) async => webFiles.add((n, c));
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    ForkPlatform.debugIsWebOverride = null;
  });

  Future<({TextFileExportStatus status, String? path})> run() =>
      TextFileExport.export(
        fileName: 'Book bookmarks.md',
        content: '## Book\n- [00:00:01] hi\n',
        dialogTitle: 't',
        mimeType: 'text/markdown',
      );

  test('desktop asks for a path with the file extension and saves', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = false;
    final r = await run();
    expect(r.status, TextFileExportStatus.saved);
    expect(r.path, 'C:/out/Book bookmarks.md');
    expect(picked, [('Book bookmarks.md', 'md')]);
    expect(written.single, (
      'C:/out/Book bookmarks.md',
      '## Book\n- [00:00:01] hi\n',
    ));
    expect(shared, isEmpty);
  });

  test('desktop cancel writes nothing', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    ForkPlatform.debugIsWebOverride = false;
    TextFileExport.pickSavePath = (_, __, ___) async => null;
    final r = await run();
    expect(r.status, TextFileExportStatus.cancelled);
    expect(written, isEmpty);
  });

  test('Android shares the file as UTF-8', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    ForkPlatform.debugIsWebOverride = false;
    final r = await run();
    expect(r.status, TextFileExportStatus.shared);
    expect(picked, isEmpty);
    final f = shared.single;
    expect(f.mimeType, 'text/markdown');
    expect(utf8.decode(await f.readAsBytes()), '## Book\n- [00:00:01] hi\n');
  });

  test('web downloads the file', () async {
    ForkPlatform.debugIsWebOverride = true;
    final r = await run();
    expect(r.status, TextFileExportStatus.downloaded);
    expect(webFiles.single.$1, 'Book bookmarks.md');
    expect(picked, isEmpty);
  });

  test('a write error is reported as a failure', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = false;
    TextFileExport.writeFile = (_, __) async => throw Exception('disk full');
    final r = await run();
    expect(r.status, TextFileExportStatus.failed);
  });
}

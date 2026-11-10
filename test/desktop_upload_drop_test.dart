import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/admin_upload_screen.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/dropped_upload_files.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:absorb/widgets/desktop_upload_drop_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

MediaUploadFile _file(String name) =>
    MediaUploadFile(name: name, size: 3, path: 'C:/fixture/$name');

void main() {
  group('expandDroppedPaths', () {
    late Directory root;

    setUp(() => root = Directory.systemTemp.createTempSync('absorb_drop_'));
    tearDown(() {
      if (root.existsSync()) root.deleteSync(recursive: true);
    });

    File write(String rel, int bytes) {
      final f = File('${root.path}${Platform.pathSeparator}$rel');
      f.parent.createSync(recursive: true);
      f.writeAsBytesSync(List.filled(bytes, 1));
      return f;
    }

    test('walks a folder, sorted, skipping hidden and system files', () async {
      write('Book/02 - Two.mp3', 5);
      write('Book/01 - One.mp3', 4);
      write('Book/CD2/03 - Three.mp3', 6);
      write('Book/desktop.ini', 1);
      write('Book/Thumbs.db', 1);
      write('Book/.DS_Store', 1);
      final single = write('cover.jpg', 2);

      final files = await expandDroppedPaths([
        '${root.path}${Platform.pathSeparator}Book',
        single.path,
        '${root.path}${Platform.pathSeparator}missing.mp3',
      ]);

      expect(files.map((f) => f.name), [
        '01 - One.mp3',
        '02 - Two.mp3',
        '03 - Three.mp3',
        'cover.jpg',
      ]);
      expect(files.map((f) => f.size), [4, 5, 6, 2]);
      expect(files.every((f) => f.path != null && f.bytes == null), isTrue);
    });

    test('isIgnoredDropFile', () {
      expect(isIgnoredDropFile('.hidden'), isTrue);
      expect(isIgnoredDropFile('Desktop.ini'), isTrue);
      expect(isIgnoredDropFile('thumbs.DB'), isTrue);
      expect(isIgnoredDropFile('book.m4b'), isFalse);
    });
  });

  test('desktop file drop is Windows and Linux only', () {
    addTearDown(() {
      debugDefaultTargetPlatformOverride = null;
      ForkPlatform.debugIsWebOverride = null;
    });
    for (final (platform, expected) in [
      (TargetPlatform.windows, true),
      (TargetPlatform.linux, true),
      (TargetPlatform.android, false),
    ]) {
      debugDefaultTargetPlatformOverride = platform;
      expect(
        ForkPlatform.supportsDesktopFileDrop,
        expected,
        reason: '$platform',
      );
    }
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = true;
    expect(ForkPlatform.supportsDesktopFileDrop, isFalse);
  });

  testWidgets('initial files are listed but nothing uploads by itself', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1100, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final requests = <MediaUploadRequest>[];
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: AdminUploadScreen(
          libraries: const [
            {
              'id': 'books',
              'name': 'Audiobooks',
              'mediaType': 'book',
              'folders': [
                {'id': 'folder', 'fullPath': '/fixture-audiobooks'},
              ],
            },
          ],
          initialFiles: [_file('A Book.m4b')],
          uploader: (request, {onProgress}) async {
            requests.add(request);
            return const MediaUploadResult(success: true);
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('A Book.m4b'), findsOneWidget);
    // Single file: the title is filled from its name, as with the picker.
    expect(
      tester
          .widget<TextFormField>(find.byKey(AdminUploadScreen.titleFieldKey))
          .controller!
          .text,
      'A Book',
    );
    expect(requests, isEmpty);
  });

  group('DesktopUploadDropScope', () {
    late GlobalKey<NavigatorState> navKey;
    late GlobalKey<DesktopUploadDropScopeState> scopeKey;

    Future<void> pump(
      WidgetTester tester, {
      required DropUploadAccess access,
      List<MediaUploadFile> expanded = const [],
      List<List<String>>? expandCalls,
    }) async {
      await tester.binding.setSurfaceSize(const Size(1100, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      navKey = GlobalKey<NavigatorState>();
      scopeKey = GlobalKey<DesktopUploadDropScopeState>();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navKey,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          builder: (context, child) => DesktopUploadDropScope(
            key: scopeKey,
            enabled: true,
            navigatorKey: navKey,
            access: (_) => access,
            expandPaths: (paths) async {
              expandCalls?.add(paths);
              return expanded;
            },
            child: child!,
          ),
          home: const Scaffold(body: Text('home')),
        ),
      );
    }

    Future<void> clearToast(WidgetTester tester) async {
      await tester.pump(const Duration(seconds: 4));
      await tester.pumpAndSettle();
    }

    testWidgets('opens the upload screen with the dropped files listed', (
      tester,
    ) async {
      await pump(
        tester,
        access: (signedIn: true, canUpload: true, api: null, libraryId: null),
        expanded: [_file('01.mp3'), _file('notes.docx'), _file('02.mp3')],
      );

      // handleDrop completes when the upload screen closes, so don't await.
      final opened = scopeKey.currentState!.handleDrop(['C:/fixture']);
      await tester.pumpAndSettle();

      expect(find.byType(AdminUploadScreen), findsOneWidget);
      // Unsupported files never reach the screen. (Listing them is covered
      // by 'initial files are listed...'; with no API here the screen has
      // no libraries, so it shows no file list.)
      final screen = tester.widget<AdminUploadScreen>(
        find.byType(AdminUploadScreen),
      );
      expect(screen.initialFiles!.map((f) => f.name), ['01.mp3', '02.mp3']);

      // A second drop while the screen is open doesn't stack another one.
      await scopeKey.currentState!.handleDrop(['C:/fixture']);
      await tester.pump();
      expect(
        find.text('Finish or close the open upload first'),
        findsOneWidget,
      );
      expect(find.byType(AdminUploadScreen), findsOneWidget);
      await clearToast(tester);

      navKey.currentState!.pop();
      await tester.pumpAndSettle();
      await opened;
      expect(find.byType(AdminUploadScreen), findsNothing);
    });

    testWidgets('users without upload permission get a toast only', (
      tester,
    ) async {
      final calls = <List<String>>[];
      await pump(
        tester,
        access: (signedIn: true, canUpload: false, api: null, libraryId: null),
        expanded: [_file('01.mp3')],
        expandCalls: calls,
      );

      await scopeKey.currentState!.handleDrop(['C:/fixture/01.mp3']);
      await tester.pump();

      expect(
        find.text("Your account can't upload to this server"),
        findsOneWidget,
      );
      expect(find.byType(AdminUploadScreen), findsNothing);
      expect(calls, isEmpty, reason: 'nothing is read from disk');
      await clearToast(tester);
    });

    testWidgets('a drop with nothing uploadable shows a toast', (tester) async {
      await pump(
        tester,
        access: (signedIn: true, canUpload: true, api: null, libraryId: null),
        expanded: [_file('notes.docx')],
      );

      await scopeKey.currentState!.handleDrop(['C:/fixture/notes.docx']);
      await tester.pump();

      expect(
        find.text('None of the dropped files can be uploaded'),
        findsOneWidget,
      );
      expect(find.byType(AdminUploadScreen), findsNothing);
      await clearToast(tester);
    });

    testWidgets('signed-out drops are ignored', (tester) async {
      final calls = <List<String>>[];
      await pump(
        tester,
        access: (signedIn: false, canUpload: true, api: null, libraryId: null),
        expanded: [_file('01.mp3')],
        expandCalls: calls,
      );

      await scopeKey.currentState!.handleDrop(['C:/fixture/01.mp3']);
      await tester.pumpAndSettle();

      expect(find.byType(AdminUploadScreen), findsNothing);
      expect(calls, isEmpty);
    });
  });
}

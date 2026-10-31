import 'dart:io';

import 'package:absorb/services/desktop_download_folder.dart';
import 'package:absorb/services/download_folder_guard.dart';
import 'package:absorb/services/download_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Audit A9: deleting a download never removes a folder outside the app's
// download folders (in particular a folder picked earlier), and on Windows
// folder names compare without regard to case.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const pathChannel = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  final sep = Platform.pathSeparator;
  late Directory tmp;
  late Directory docs;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    tmp = Directory.systemTemp.createTempSync('absorb_a9_');
    docs = Directory('${tmp.path}${sep}docs')..createSync();
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

  group('DownloadFolderGuard', () {
    test('a book folder inside a known root may go, the root never', () {
      const roots = ['C:/Books', 'D:/Old picks'];
      bool may(String d) =>
          DownloadFolderGuard.mayDeleteTree(d, roots, windows: true);
      expect(may('C:/Books/Author/Title'), isTrue);
      expect(may(r'D:\Old picks\Title'), isTrue);
      expect(may('C:/Books'), isFalse);
      expect(may('C:/Books/'), isFalse);
      expect(may('C:/'), isFalse, reason: 'holds a root');
      expect(may('C:/Elsewhere/Title'), isFalse);
      expect(may('C:/Books/../Elsewhere'), isFalse);
      expect(may('C:/BooksAndMore/Title'), isFalse);
    });

    test('Windows compares without case, Linux with it', () {
      expect(
        DownloadFolderGuard.mayDeleteTree('c:/books/author/title', [
          'C:/Books',
        ], windows: true),
        isTrue,
      );
      expect(
        DownloadFolderGuard.mayDeleteTree('C:/BOOKS', [
          'C:/Books',
        ], windows: true),
        isFalse,
      );
      expect(
        DownloadFolderGuard.mayDeleteTree('/home/u/books/x', [
          '/home/u/Books',
        ], windows: false),
        isFalse,
      );
      expect(
        DownloadFolderGuard.samePath(
          r'C:\Books\Title\',
          'c:/books/title',
          windows: true,
        ),
        isTrue,
      );
      expect(
        DownloadFolderGuard.samePath('/a/Title', '/a/title', windows: false),
        isFalse,
      );
    });

    test(
      'endsWithFolder matches a differently cased folder on Windows only',
      () {
        expect(
          DownloadFolderGuard.endsWithFolder(
            r'C:\Books\author\title',
            'Author/Title',
            windows: true,
          ),
          isTrue,
        );
        expect(
          DownloadFolderGuard.endsWithFolder(
            '/b/author/title',
            'Author/Title',
            windows: false,
          ),
          isFalse,
        );
        expect(
          DownloadFolderGuard.endsWithFolder(
            '/b/Author/Title (x)',
            'Author/Title',
            windows: true,
          ),
          isFalse,
        );
      },
    );

    test('an empty Author folder goes, an empty root stays', () {
      final root = Directory('${tmp.path}${sep}root')..createSync();
      final book = Directory('${root.path}${sep}Author${sep}Title')
        ..createSync(recursive: true);
      File('${book.path}${sep}01.mp3').writeAsStringSync('x');
      expect(
        DownloadFolderGuard.removeBookFolder(book.path, [
          root.path,
        ], windows: Platform.isWindows),
        isTrue,
      );
      expect(book.existsSync(), isFalse);
      expect(Directory('${root.path}${sep}Author').existsSync(), isFalse);
      expect(root.existsSync(), isTrue);
    });
  });

  group('deleteDownload', () {
    DownloadService newService() {
      final s = DownloadService.forTesting(
        initialize: () async {},
        cancelTasks: (_) async {},
        deleteTaskRecord: (_) async {},
      );
      addTearDown(s.dispose);
      return s;
    }

    Directory makeBook(String root, String nested) {
      final dir = Directory('$root$sep$nested')..createSync(recursive: true);
      File('${dir.path}${sep}01.mp3').writeAsStringSync('audio');
      return dir;
    }

    DownloadInfo info(String id, Directory dir) => DownloadInfo(
      itemId: id,
      status: DownloadStatus.downloaded,
      localPaths: ['${dir.path}${sep}01.mp3'],
      localDirPath: dir.path,
      title: id,
    );

    test(
      'a book in a previously picked folder goes, the folder stays',
      () async {
        final oldPick = Directory('${tmp.path}${sep}old pick')..createSync();
        final current = Directory('${tmp.path}${sep}current')..createSync();
        final prefs = await SharedPreferences.getInstance();
        await DesktopDownloadFolder.recordUsedRoot(prefs, oldPick.path);
        final s = newService();
        await s.setDesktopDownloadDir(current.path);
        s.debugKnownDesktopRoots = DesktopDownloadFolder.usedRoots(prefs);
        // No author: the book sits directly in the picked folder.
        final book = makeBook(oldPick.path, 'Lonely Title');
        s.debugPutDownload(info('book', book));

        await s.deleteDownload('book', skipStopCheck: true);

        expect(book.existsSync(), isFalse);
        expect(
          oldPick.existsSync(),
          isTrue,
          reason: 'the emptied picked folder is not the app\'s to delete',
        );
        expect(s.downloadedItems, isEmpty);
      },
    );

    test('a folder outside every download folder is left in place', () async {
      final outside = Directory('${tmp.path}${sep}user stuff')..createSync();
      final book = makeBook(outside.path, 'Author${sep}Title');
      File('${book.path}${sep}notes.txt').writeAsStringSync('the user\'s own');
      final s = newService();
      s.debugPutDownload(info('book', book));

      await s.deleteDownload('book', skipStopCheck: true);

      expect(
        File('${book.path}${sep}01.mp3').existsSync(),
        isFalse,
        reason: 'the download\'s own files still go',
      );
      expect(File('${book.path}${sep}notes.txt').existsSync(), isTrue);
      expect(outside.existsSync(), isTrue);
    });

    test(
      'a book in the default folder is removed with its empty Author folder',
      () async {
        final root = '${docs.path}${sep}downloads';
        final book = makeBook(root, 'Author${sep}Title');
        final s = newService();
        s.debugPutDownload(info('book', book));

        await s.deleteDownload('book', skipStopCheck: true);

        expect(book.existsSync(), isFalse);
        expect(Directory('$root${sep}Author').existsSync(), isFalse);
        expect(Directory(root).existsSync(), isTrue);
      },
    );

    test('on Windows a folder shared under another casing is kept', () async {
      final root = '${docs.path}${sep}downloads';
      final book = makeBook(root, 'Author${sep}Title');
      File('${book.path}${sep}02.mp3').writeAsStringSync('other book');
      final s = newService();
      s.debugPutDownload(info('a', book));
      s.debugPutDownload(
        DownloadInfo(
          itemId: 'b',
          status: DownloadStatus.downloaded,
          localPaths: [
            '${root.toLowerCase()}${sep}author${sep}title${sep}02.mp3',
          ],
          localDirPath: '${root.toLowerCase()}${sep}author${sep}title',
          title: 'b',
        ),
      );

      await s.deleteDownload('a', skipStopCheck: true);

      expect(File('${book.path}${sep}02.mp3').existsSync(), isTrue);
      expect(File('${book.path}${sep}01.mp3').existsSync(), isFalse);
    }, skip: !Platform.isWindows);
  });
}

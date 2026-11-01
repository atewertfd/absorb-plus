import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/bookmark_service.dart';
import 'package:absorb/services/text_file_export.dart';
import 'package:absorb/utils/bookmark_list_tools.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:absorb/widgets/bookmark_list_controls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _app(Widget child) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: Center(child: child)),
);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    ForkPlatform.debugIsWebOverride = null;
  });

  test('view prefs round-trip and honour the old sort when unset', () async {
    expect(await BookmarkViewPrefs.load(), BookmarkView.byBook);
    expect(
      await BookmarkViewPrefs.load(legacySort: 'position'),
      BookmarkView.position,
    );
    await BookmarkViewPrefs.save(BookmarkView.newest);
    expect(
      await BookmarkViewPrefs.load(legacySort: 'position'),
      BookmarkView.newest,
    );
  });

  testWidgets('menu shows the current view and reports a pick', (tester) async {
    BookmarkView? picked;
    await tester.pumpWidget(
      _app(
        BookmarkViewMenu(
          view: BookmarkView.byBook,
          onChanged: (v) => picked = v,
        ),
      ),
    );
    expect(find.text('By book'), findsOneWidget);
    await tester.tap(find.byType(BookmarkViewMenu));
    await tester.pumpAndSettle();
    expect(find.text('Newest first'), findsOneWidget);
    expect(find.text('By position'), findsOneWidget);
    await tester.tap(
      find.widgetWithText(CheckedPopupMenuItem<BookmarkView>, 'Newest first'),
    );
    await tester.pumpAndSettle();
    expect(picked, BookmarkView.newest);
  });

  testWidgets('export button saves Markdown for the given bookmarks', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    ForkPlatform.debugIsWebOverride = false;
    String? savedName;
    String? savedContent;
    TextFileExport.pickSavePath = (_, name, __) async {
      savedName = name;
      return 'C:/out/$name';
    };
    TextFileExport.writeFile = (_, c) async => savedContent = c;
    await tester.pumpWidget(
      _app(
        BookmarkExportButton(
          bookTitle: 'Dune',
          groups: () => {
            'i': [
              Bookmark(
                id: '1',
                positionSeconds: 3725,
                created: DateTime(2026),
                title: 'Spice',
                note: 'must flow',
              ),
            ],
          },
          bookInfo: (_) =>
              (title: 'Dune', author: 'Frank Herbert', subtitle: null),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.ios_share_rounded));
    await tester.pumpAndSettle();
    expect(savedName, 'Dune bookmarks.md');
    expect(
      savedContent,
      '## Dune\n*Frank Herbert*\n\n- [01:02:05] Spice — must flow\n',
    );
    expect(
      find.text('Bookmarks saved to C:/out/Dune bookmarks.md'),
      findsOneWidget,
    );
    // Let the toast time out.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    debugDefaultTargetPlatformOverride = null;
  });
}

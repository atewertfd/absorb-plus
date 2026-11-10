import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/library_screen.dart' show LibraryFilter;
import 'package:absorb/widgets/empty_state.dart';
import 'package:absorb/widgets/library_books_tab.dart';
import 'package:absorb/widgets/settings_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _app(Widget child) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );

void main() {
  group('AbsorbEmptyState', () {
    testWidgets('shows icon, line and one button that fires', (tester) async {
      var taps = 0;
      await tester.pumpWidget(_app(AbsorbEmptyState(
        icon: Icons.download_done_rounded,
        message: 'No downloads',
        actionLabel: 'Browse library',
        actionIcon: Icons.library_books_rounded,
        onAction: () => taps++,
      )));
      expect(find.byIcon(Icons.download_done_rounded), findsOneWidget);
      expect(find.text('No downloads'), findsOneWidget);
      await tester.tap(find.text('Browse library'));
      expect(taps, 1);
    });

    testWidgets('no handler, no button', (tester) async {
      await tester.pumpWidget(_app(const AbsorbEmptyState(
        icon: Icons.search_off_rounded,
        message: 'Nothing',
        actionLabel: 'Clear search',
      )));
      expect(find.text('Nothing'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsNothing);
    });

    testWidgets('Browse library outside the shell goes back', (tester) async {
      await tester.pumpWidget(_app(Builder(
        builder: (context) => TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => Scaffold(
                body: AbsorbEmptyState(
                  icon: Icons.download_done_rounded,
                  message: 'No downloads',
                  actionLabel: 'Browse library',
                  onAction: () => browseLibraryFrom(c),
                ),
              ),
            ),
          ),
          child: const Text('open'),
        ),
      )));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('No downloads'), findsOneWidget);
      await tester.tap(find.text('Browse library'));
      await tester.pumpAndSettle();
      expect(find.text('No downloads'), findsNothing);
      expect(find.text('open'), findsOneWidget);
    });
  });

  testWidgets('Settings search with no match offers Clear search',
      (tester) async {
    var cleared = 0;
    await tester.pumpWidget(_app(SettingsSearchResults(
      results: const [],
      onOpen: (_) {},
      onClear: () => cleared++,
    )));
    expect(find.text('No matching settings'), findsOneWidget);
    await tester.tap(find.text('Clear search'));
    expect(cleared, 1);
  });

  group('library grid with no items', () {
    Future<void> pumpTab(WidgetTester tester, LibraryFilter filter,
        {required VoidCallback onRefresh, required VoidCallback onClear}) {
      return tester.pumpWidget(_app(LibraryBooksTab(
        items: const [],
        isLoadingPage: false,
        hasMore: false,
        filter: filter,
        rectangleCovers: false,
        showSubtitles: true,
        coverAspectRatio: 1,
        onRefresh: () async => onRefresh(),
        onClearFilter: onClear,
        onLoadMore: () {},
      )));
    }

    testWidgets('unfiltered offers Refresh', (tester) async {
      var refreshed = 0;
      await pumpTab(tester, LibraryFilter.none,
          onRefresh: () => refreshed++, onClear: () {});
      expect(find.text('No books found'), findsOneWidget);
      await tester.tap(find.widgetWithText(OutlinedButton, 'Refresh'));
      expect(refreshed, 1);
    });

    testWidgets('filtered offers Clear filter', (tester) async {
      var cleared = 0;
      await pumpTab(tester, LibraryFilter.finished,
          onRefresh: () {}, onClear: () => cleared++);
      await tester.tap(find.widgetWithText(OutlinedButton, 'Clear filter'));
      expect(cleared, 1);
    });
  });
}

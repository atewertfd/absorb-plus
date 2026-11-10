import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/library_screen.dart' show LibraryFilter;
import 'package:absorb/widgets/books_sheet_shared.dart';
import 'package:absorb/widgets/library_books_tab.dart';
import 'package:absorb/widgets/loading_placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _app(Widget child, {bool reduceMotion = false}) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(disableAnimations: reduceMotion),
          child: Scaffold(body: child),
        ),
      ),
    );

double _opacity(WidgetTester tester, Finder within) {
  final fade = tester.widget<FadeTransition>(
      find.descendant(of: within, matching: find.byType(FadeTransition)).first);
  return fade.opacity.value;
}

void main() {
  group('library grid first load', () {
    Widget tab() => LibraryBooksTab(
          items: const [],
          isLoadingPage: true,
          hasMore: true,
          filter: LibraryFilter.none,
          rectangleCovers: false,
          showSubtitles: false,
          coverAspectRatio: 1,
          onRefresh: () async {},
          onClearFilter: () {},
          onLoadMore: () {},
        );

    testWidgets('shows placeholder tiles, not a spinner', (tester) async {
      await tester.pumpWidget(_app(tab()));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(LibraryGridPlaceholder), findsOneWidget);
      expect(find.byType(AspectRatio), findsWidgets);
    });

    testWidgets('tiles are as wide as real grid tiles', (tester) async {
      late double expected;
      await tester.pumpWidget(_app(Builder(builder: (context) {
        expected = coverGridTileWidth(context);
        return tab();
      })));
      await tester.pump(const Duration(milliseconds: 100));
      final cover = tester.getSize(find.byType(AspectRatio).first);
      expect(cover.width, moreOrLessEquals(expected, epsilon: 0.5));
      expect(cover.height, moreOrLessEquals(expected, epsilon: 0.5));
    });
  });

  group('Home shelves placeholder', () {
    for (final rect in [false, true]) {
      for (final subs in [false, true]) {
        testWidgets('lays out without overflow (rect $rect, subtitles $subs)',
            (tester) async {
          await tester.pumpWidget(_app(SingleChildScrollView(
            child: HomeShelvesPlaceholder(
                rectangleCovers: rect, showSubtitles: subs),
          )));
          await tester.pump(const Duration(milliseconds: 100));
          expect(tester.takeException(), isNull);
        });
      }
    }

    testWidgets('Continue row matches Home\'s row height', (tester) async {
      await tester.pumpWidget(_app(const SingleChildScrollView(
        child: HomeShelvesPlaceholder(
            rectangleCovers: true, showSubtitles: false),
      )));
      await tester.pump();
      final rows = find.descendant(
          of: find.byType(HomeShelvesPlaceholder),
          matching: find.byType(ListView));
      // Text scale 1: no extra label room.
      expect(tester.getSize(rows.first).height, 320);
    });

    testWidgets('pulses gently', (tester) async {
      await tester.pumpWidget(_app(const SingleChildScrollView(
        child: HomeShelvesPlaceholder(
            rectangleCovers: false, showSubtitles: false),
      )));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 700));
      final o = _opacity(tester, find.byType(HomeShelvesPlaceholder));
      expect(o, lessThan(1));
      expect(o, greaterThanOrEqualTo(0.55));
    });

    testWidgets('stays still with reduced motion', (tester) async {
      await tester.pumpWidget(_app(
        const SingleChildScrollView(
          child: HomeShelvesPlaceholder(
              rectangleCovers: false, showSubtitles: false),
        ),
        reduceMotion: true,
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 700));
      expect(_opacity(tester, find.byType(HomeShelvesPlaceholder)), 1);
      expect(tester.binding.hasScheduledFrame, isFalse);
    });
  });
}

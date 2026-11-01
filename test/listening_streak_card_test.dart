import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/listening_streaks.dart';
import 'package:absorb/widgets/listening_streak_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _app(Widget child) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: Padding(padding: const EdgeInsets.all(20), child: child)),
    );

String _fmt(double s) => '${(s / 60).round()}m';

void main() {
  group('ListeningStreakCard', () {
    testWidgets('streak at risk shows the hint and a goal button when the goal is off',
        (tester) async {
      var edits = 0;
      await tester.pumpWidget(_app(ListeningStreakCard(
        streak: const StreakSummary(current: 4, best: 9, todaySeconds: 60, todayCounts: false),
        goalMinutes: 0,
        onEditGoal: () => edits++,
        formatDuration: _fmt,
      )));
      expect(find.text('4d'), findsOneWidget);
      expect(find.text('9d'), findsOneWidget);
      expect(find.text('Listen 5 minutes today to keep it going'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.tap(find.byTooltip('Set a daily goal'));
      expect(edits, 1);
    });

    testWidgets('a set goal shows today in a ring that opens the goal', (tester) async {
      var edits = 0;
      await tester.pumpWidget(_app(ListeningStreakCard(
        streak: const StreakSummary(current: 2, best: 2, todaySeconds: 900, todayCounts: true),
        goalMinutes: 30,
        onEditGoal: () => edits++,
        formatDuration: _fmt,
      )));
      expect(find.text('50%'), findsOneWidget);
      expect(find.textContaining('keep it going'), findsNothing);
      await tester.tap(find.byType(CircularProgressIndicator));
      expect(edits, 1);
    });

    testWidgets('a reached goal shows a check', (tester) async {
      await tester.pumpWidget(_app(ListeningStreakCard(
        streak: const StreakSummary(current: 1, best: 3, todaySeconds: 4000, todayCounts: true),
        goalMinutes: 60,
        onEditGoal: () {},
        formatDuration: _fmt,
      )));
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('no streak explains how to start one', (tester) async {
      await tester.pumpWidget(_app(ListeningStreakCard(
        streak: const StreakSummary(current: 0, best: 0, todaySeconds: 0, todayCounts: false),
        goalMinutes: 0,
        onEditGoal: () {},
        formatDuration: _fmt,
      )));
      expect(find.text('Listen 5 minutes a day to build a streak'), findsOneWidget);
    });

    testWidgets('fits a phone-width screen', (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(_app(ListeningStreakCard(
        streak: const StreakSummary(current: 365, best: 1000, todaySeconds: 10, todayCounts: false),
        goalMinutes: 15,
        onEditGoal: () {},
        formatDuration: _fmt,
      )));
      expect(tester.takeException(), isNull);
    });
  });

  group('daily goal sheet', () {
    Future<void> openSheet(WidgetTester tester, int current) async {
      await tester.pumpWidget(_app(Builder(
        builder: (context) => TextButton(
          onPressed: () =>
              showDailyGoalSheet(context, currentMinutes: current, formatDuration: _fmt),
          child: const Text('open'),
        ),
      )));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('a preset returns its minutes', (tester) async {
      int? result;
      await tester.pumpWidget(_app(Builder(
        builder: (context) => TextButton(
          onPressed: () async => result =
              await showDailyGoalSheet(context, currentMinutes: 0, formatDuration: _fmt),
          child: const Text('open'),
        ),
      )));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Daily listening goal'), findsOneWidget);
      expect(find.text('15m'), findsOneWidget);
      expect(find.text('60m'), findsOneWidget);
      await tester.tap(find.text('30m'));
      await tester.pumpAndSettle();
      expect(result, 30);
    });

    testWidgets('Off returns zero', (tester) async {
      int? result;
      await tester.pumpWidget(_app(Builder(
        builder: (context) => TextButton(
          onPressed: () async => result =
              await showDailyGoalSheet(context, currentMinutes: 30, formatDuration: _fmt),
          child: const Text('open'),
        ),
      )));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Off'));
      await tester.pumpAndSettle();
      expect(result, 0);
    });

    testWidgets('a custom goal is typed in', (tester) async {
      int? result;
      await tester.pumpWidget(_app(Builder(
        builder: (context) => TextButton(
          onPressed: () async => result =
              await showDailyGoalSheet(context, currentMinutes: 0, formatDuration: _fmt),
          child: const Text('open'),
        ),
      )));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Custom'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), '1:15');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(result, 75);
      expect(find.text('Daily listening goal'), findsNothing);
    });

    testWidgets('a custom goal shows on its chip and bad input keeps the sheet', (tester) async {
      await openSheet(tester, 45);
      expect(find.text('Custom · 45m'), findsOneWidget);
      await tester.tap(find.text('Custom · 45m'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'soon');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(find.text('Daily listening goal'), findsOneWidget);
    });
  });

  group('MonthSummaryCard', () {
    testWidgets('shows every piece it has', (tester) async {
      await tester.pumpWidget(_app(const MonthSummaryCard(
        title: 'November 2026',
        listenedSeconds: 7200,
        booksFinished: 3,
        topBook: TopMonthBook('Alpha', 3600),
        formatDuration: _fmt,
      )));
      expect(find.text('November 2026'), findsOneWidget);
      expect(find.text('120m'), findsOneWidget);
      expect(find.text('Listened'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('Alpha'), findsOneWidget);
      expect(find.text('Top book'), findsOneWidget);
    });

    testWidgets('leaves out what is not known', (tester) async {
      await tester.pumpWidget(_app(const MonthSummaryCard(
        title: 'November 2026',
        listenedSeconds: 600,
        listenedLabel: 'Time',
        formatDuration: _fmt,
      )));
      expect(find.text('Time'), findsOneWidget);
      expect(find.text('Listened'), findsNothing);
      expect(find.text('Top book'), findsNothing);
      expect(find.text('Books'), findsNothing);
    });
  });
}

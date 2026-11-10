import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/widgets/chapter_end_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 10, 31, 22, 0);

  group('playbackEndsAt', () {
    test('divides the audio time left by the speed', () {
      expect(playbackEndsAt(remainingSeconds: 42 * 60, speed: 1, now: now),
          DateTime(2026, 10, 31, 22, 42));
      expect(playbackEndsAt(remainingSeconds: 42 * 60, speed: 2, now: now),
          DateTime(2026, 10, 31, 22, 21));
    });

    test('nothing left or bad numbers give null; bad speed falls back to 1x', () {
      expect(playbackEndsAt(remainingSeconds: 0, speed: 1, now: now), isNull);
      expect(playbackEndsAt(remainingSeconds: double.nan, speed: 1, now: now), isNull);
      expect(playbackEndsAt(remainingSeconds: 60, speed: 0, now: now),
          DateTime(2026, 10, 31, 22, 1));
    });
  });

  Widget host(Widget child, {bool use24h = false}) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: use24h),
            child: Scaffold(body: Center(child: child)),
          ),
        ),
      );

  ChapterEndTooltip tip({bool enabled = true, bool wholeBook = false}) =>
      ChapterEndTooltip(
        remainingSeconds: 84 * 60,
        speed: 2,
        enabled: enabled,
        wholeBook: wholeBook,
        now: () => now,
        child: const Text('-42:00'),
      );

  testWidgets('chapter tooltip in 12-hour time, at the current speed', (t) async {
    await t.pumpWidget(host(tip()));
    expect(find.byTooltip('Chapter ends at 10:42 PM'), findsOneWidget);
  });

  testWidgets('follows the 24-hour setting', (t) async {
    await t.pumpWidget(host(tip(), use24h: true));
    expect(find.byTooltip('Chapter ends at 22:42'), findsOneWidget);
  });

  testWidgets('chapterless items say "Ends at"', (t) async {
    await t.pumpWidget(host(tip(wholeBook: true)));
    expect(find.byTooltip('Ends at 10:42 PM'), findsOneWidget);
  });

  testWidgets('disabled leaves the label alone', (t) async {
    await t.pumpWidget(host(tip(enabled: false)));
    expect(find.byType(Tooltip), findsNothing);
    expect(find.text('-42:00'), findsOneWidget);
  });
}

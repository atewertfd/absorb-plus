import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/desktop_shortcuts.dart';
import 'package:absorb/widgets/card_button_config.dart';
import 'package:absorb/widgets/go_to_time_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeTarget implements GoToTimeTarget {
  _FakeTarget(this.length, this.position);

  @override
  final Duration length;

  @override
  Duration position;

  final seeks = <Duration>[];

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    this.position = position;
  }
}

/// "Go to time": parsing what the user types, checking it against the book
/// length, and the dialog that seeks there.
void main() {
  final l = lookupAppLocalizations(const Locale('en'));

  group('parseGoToTime', () {
    test('reads h:mm:ss, mm:ss and plain minutes', () {
      expect(
        parseGoToTime('1:23:45'),
        const Duration(hours: 1, minutes: 23, seconds: 45),
      );
      expect(
        parseGoToTime(' 23:45 '),
        const Duration(minutes: 23, seconds: 45),
      );
      expect(parseGoToTime('90:05'), const Duration(minutes: 90, seconds: 5));
      expect(parseGoToTime('90'), const Duration(minutes: 90));
      expect(parseGoToTime('12.5'), const Duration(minutes: 12, seconds: 30));
      expect(parseGoToTime('12,5'), const Duration(minutes: 12, seconds: 30));
      expect(parseGoToTime('0'), Duration.zero);
      expect(parseGoToTime('10:00:00'), const Duration(hours: 10));
    });

    test('rejects anything else', () {
      for (final bad in [
        '',
        '   ',
        'abc',
        '-5',
        '1:2:3:4',
        '1::30',
        '1:60',
        '1:5x',
        '1:70:00',
        '1:5:123',
        ':30',
      ]) {
        expect(parseGoToTime(bad), isNull, reason: bad);
      }
    });
  });

  test('a time past the end of the book is refused', () {
    const length = Duration(hours: 2, minutes: 3, seconds: 4);
    expect(goToTimeError(l, '1:00:00', length), isNull);
    expect(goToTimeError(l, '2:03:04', length), isNull);
    expect(goToTimeError(l, '2:03:05', length), l.goToTimePastEnd('2:03:04'));
    expect(goToTimeError(l, 'soon', length), l.goToTimeInvalid);
    // Unknown length: any valid time goes.
    expect(goToTimeError(l, '99:00:00', Duration.zero), isNull);
  });

  Future<void> openDialog(
    WidgetTester tester,
    _FakeTarget target,
    List<Duration?> results,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async =>
                results.add(await showGoToTimeDialog(context, target: target)),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'the dialog starts at the current spot and seeks to the typed time',
    (tester) async {
      final target = _FakeTarget(
        const Duration(hours: 2),
        const Duration(minutes: 5, seconds: 7),
      );
      final results = <Duration?>[];
      await openDialog(tester, target, results);

      expect(find.text(l.goToTime), findsOneWidget);
      expect(find.text('5:07'), findsOneWidget);
      expect(find.text(l.goToTimeLength('2:00:00')), findsOneWidget);

      await tester.enterText(find.byType(TextField), '1:15:00');
      await tester.tap(find.text(l.goToTimeGo));
      await tester.pumpAndSettle();

      expect(target.seeks, [const Duration(hours: 1, minutes: 15)]);
      expect(results, [const Duration(hours: 1, minutes: 15)]);
      expect(find.byType(AlertDialog), findsNothing);
    },
  );

  testWidgets('an invalid or too-late time keeps the dialog open', (
    tester,
  ) async {
    final target = _FakeTarget(const Duration(hours: 1), Duration.zero);
    final results = <Duration?>[];
    await openDialog(tester, target, results);

    await tester.enterText(find.byType(TextField), '2:00:00');
    await tester.testTextInput.receiveAction(TextInputAction.go);
    await tester.pumpAndSettle();
    expect(find.text(l.goToTimePastEnd('1:00:00')), findsOneWidget);
    expect(target.seeks, isEmpty);

    // Typing again clears the error; plain minutes work.
    await tester.enterText(find.byType(TextField), '45');
    await tester.pumpAndSettle();
    expect(find.text(l.goToTimePastEnd('1:00:00')), findsNothing);
    await tester.testTextInput.receiveAction(TextInputAction.go);
    await tester.pumpAndSettle();
    expect(target.seeks, [const Duration(minutes: 45)]);
  });

  testWidgets('cancel leaves the player alone', (tester) async {
    final target = _FakeTarget(const Duration(hours: 1), Duration.zero);
    final results = <Duration?>[];
    await openDialog(tester, target, results);
    await tester.tap(find.text(l.cancel));
    await tester.pumpAndSettle();
    expect(target.seeks, isEmpty);
    expect(results, [null]);
  });

  test('the More menu knows the action and Ctrl+G is a desktop shortcut', () {
    final def = buttonDefById(goToTimeButtonId);
    expect(def, isNotNull);
    expect(def!.icon, goToTimeIcon);
    expect(localizedCardButtonLabel(l, def), l.goToTime);

    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    try {
      final ctrlG = desktopNavigationShortcuts
          .where((s) => s.action == DesktopNavigationAction.goToTime)
          .single;
      expect(ctrlG.label, 'Ctrl+G');
      expect(ctrlG.focusRule, DesktopShortcutFocusRule.notTyping);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });
}

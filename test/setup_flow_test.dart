import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/screens/setup/run_setup_again_tile.dart';
import 'package:absorb/screens/setup/setup_flow_screen.dart';
import 'package:absorb/screens/setup/setup_flow_store.dart';
import 'package:absorb/ui_themes/ui_theme.dart';
import 'package:absorb/ui_themes/ui_theme_picker.dart';
import 'package:absorb/widgets/beta_logging_notice.dart';
import 'package:absorb/widgets/welcome_sheet.dart';
import 'package:absorb/widgets/whats_new_prompt.dart';
import 'package:absorb/widgets/whats_new_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/setup_fakes.dart';

const _allSteps = [
  SetupStep.welcome,
  SetupStep.connect,
  SetupStep.look,
  SetupStep.listening,
  SetupStep.downloads,
  SetupStep.permissions,
  SetupStep.done,
];

Widget _host(AuthProvider auth, Widget home) =>
    ChangeNotifierProvider<AuthProvider>.value(
      value: auth,
      child: UiThemeScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(extensions: [absorbLookFor(Brightness.light)]),
          home: home,
        ),
      ),
    );

String _stepLabel(WidgetTester tester) =>
    tester.widget<Text>(find.byKey(const ValueKey('setup-step-label'))).data!;

Future<void> _tapNext(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey('setup-next')));
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    SetupFlowStore.debugReset();
    uiThemeNotifier.value = null;
    uiThemePreviewNotifier.value = null;
  });

  group('pages per platform', () {
    test(
      'Android has every page, desktop no permissions, web no downloads',
      () {
        expect(setupStepsFor(web: false, android: true), _allSteps);
        expect(setupStepsFor(web: false, android: false), [
          SetupStep.welcome,
          SetupStep.connect,
          SetupStep.look,
          SetupStep.listening,
          SetupStep.downloads,
          SetupStep.done,
        ]);
        expect(setupStepsFor(web: true, android: false), [
          SetupStep.welcome,
          SetupStep.connect,
          SetupStep.look,
          SetupStep.listening,
          SetupStep.done,
        ]);
      },
    );

    test('sign-in comes before the per-account settings pages', () {
      for (final steps in [
        setupStepsFor(web: false, android: true),
        setupStepsFor(web: true, android: false),
      ]) {
        final connect = steps.indexOf(SetupStep.connect);
        expect(connect, lessThan(steps.indexOf(SetupStep.look)));
        expect(connect, lessThan(steps.indexOf(SetupStep.listening)));
      }
    });
  });

  group('who sees it', () {
    test('a fresh install sees it and it is remembered as started', () async {
      expect(await SetupFlowStore.decide(hasAccounts: false), isTrue);
      expect(SetupFlowStore.active, isTrue);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(SetupFlowStore.startedKey), isTrue);
    });

    test('existing users never see it', () async {
      for (final values in <Map<String, Object>>[
        {},
        {WelcomeSheet.prefKey: true},
        {'server_url': 'http://abs.test'},
        {UiThemeStore.prefKey: 'plus'},
      ]) {
        SharedPreferences.setMockInitialValues(values);
        final hasAccounts = values.isEmpty;
        expect(
          await SetupFlowStore.decide(hasAccounts: hasAccounts),
          isFalse,
          reason: '$values',
        );
        expect(SetupFlowStore.active, isFalse);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool(SetupFlowStore.doneKey), isTrue);
      }
    });

    test('a setup left half way (signed in already) comes back', () async {
      SharedPreferences.setMockInitialValues({SetupFlowStore.startedKey: true});
      expect(await SetupFlowStore.decide(hasAccounts: true), isTrue);
    });

    test('a finished setup does not come back', () async {
      SharedPreferences.setMockInitialValues({SetupFlowStore.doneKey: true});
      expect(await SetupFlowStore.decide(hasAccounts: false), isFalse);
    });
  });

  group('old prompts after the setup', () {
    test('complete marks them seen', () async {
      SharedPreferences.setMockInitialValues({
        'beta_logging_notice_pending': true,
        'loggingEnabled': true,
      });
      await SetupFlowStore.decide(hasAccounts: false);
      await SetupFlowStore.complete();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(SetupFlowStore.doneKey), isTrue);
      expect(prefs.getBool(WelcomeSheet.prefKey), isTrue);
      expect(await UiThemeStore.needsChoice(), isFalse);
      expect(prefs.getBool('beta_logging_notice_pending'), isNull);
      expect(SetupFlowStore.active, isFalse);
      expect(SetupFlowStore.finishedThisLaunch, isTrue);
    });

    testWidgets('welcome, look picker, logs notice and What\'s new stay away', (
      tester,
    ) async {
      PackageInfo.setMockInitialValues(
        appName: 'Absorb Plus',
        packageName: 'absorb',
        version: '1.12.1-beta.12',
        buildNumber: '356',
        buildSignature: '',
      );
      SharedPreferences.setMockInitialValues({
        'beta_logging_notice_pending': true,
        'loggingEnabled': true,
      });
      await SetupFlowStore.decide(hasAccounts: false);
      await SetupFlowStore.complete();
      late BuildContext ctx;
      await tester.pumpWidget(
        _host(
          SwitchableAuth(signedIn: true),
          Scaffold(
            body: Builder(
              builder: (c) {
                ctx = c;
                return const SizedBox.expand();
              },
            ),
          ),
        ),
      );
      await tester.runAsync(() async {
        await WhatsNewPrompt.showIfUpdated(ctx);
        await WelcomeSheet.showIfNeeded(ctx);
        await BetaLoggingNotice.showIfPending(ctx);
        await UiThemePicker.showIfUnchosen(ctx, delay: Duration.zero);
      });
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(Dialog), findsNothing);
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(WhatsNewSheet), findsNothing);
      // What's new still records the build, so the next update shows.
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('whats_new_last_build'), 356);
    });
  });

  group('the flow', () {
    late FakeSetupSettings settings;
    late SwitchableAuth auth;
    late int completed;
    late int finished;

    Future<void> pumpFlow(WidgetTester tester, {List<SetupStep>? steps}) async {
      settings = FakeSetupSettings(pickedLocation: r'D:\Audiobooks');
      completed = 0;
      finished = 0;
      await tester.pumpWidget(
        _host(
          auth,
          SetupFlowScreen(
            steps: steps ?? _allSteps,
            settings: settings,
            complete: () async => completed++,
            onFinished: () => finished++,
            connectBuilder: (_) =>
                const Center(child: Text('sign-in stand-in')),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    setUp(() => auth = SwitchableAuth());

    testWidgets('Connect waits for sign-in, then moves on by itself', (
      tester,
    ) async {
      await pumpFlow(tester);
      expect(_stepLabel(tester), 'Step 1 of 7');
      await _tapNext(tester);
      expect(find.text('sign-in stand-in'), findsOneWidget);
      final next = tester.widget<FilledButton>(
        find.byKey(const ValueKey('setup-next')),
      );
      expect(next.onPressed, isNull);
      auth.signIn();
      await tester.pumpAndSettle();
      expect(_stepLabel(tester), 'Step 3 of 7');
      expect(find.text('Choose a look'), findsOneWidget);
    });

    testWidgets('walks every page, saving choices with the setters', (
      tester,
    ) async {
      auth = SwitchableAuth(signedIn: true);
      await pumpFlow(tester);
      await _tapNext(tester); // Welcome -> Connect
      expect(find.text('Signed in as reader'), findsOneWidget);
      await _tapNext(tester); // -> Look
      await tester.tap(find.byKey(const ValueKey('ui-look-midnight')));
      await tester.pumpAndSettle();
      expect(uiThemeNotifier.value, AppUiTheme.midnight);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(UiThemeStore.prefKey), 'midnight');
      await _tapNext(tester); // -> Listening
      expect(_stepLabel(tester), 'Step 4 of 7');
      await tester.tap(find.byKey(const ValueKey('setup-speed-1.5')));
      await tester.pumpAndSettle();
      await tester.ensureVisible(
        find.byKey(const ValueKey('setup-auto-rewind')),
      );
      await tester.tap(find.byKey(const ValueKey('setup-auto-rewind')));
      await tester.pumpAndSettle();
      expect(settings.changes, ['speed=1.5', 'rewind=false']);
      await _tapNext(tester); // -> Downloads
      await tester.tap(find.byKey(const ValueKey('setup-download-location')));
      await tester.pumpAndSettle();
      expect(find.text(r'D:\Audiobooks'), findsOneWidget);
      await tester.tap(find.text('Wi-Fi only'));
      await tester.pumpAndSettle();
      expect(settings.wifiOnly, isTrue);
      await _tapNext(tester); // -> Permissions
      await tester.tap(find.byKey(const ValueKey('setup-allow-notifications')));
      await tester.pumpAndSettle();
      expect(
        find.byKey(const ValueKey('setup-granted-notifications')),
        findsOneWidget,
      );
      expect(find.byKey(const ValueKey('setup-allow-battery')), findsOneWidget);
      await _tapNext(tester); // -> Done
      expect(find.text("You're all set"), findsOneWidget);
      expect(find.text('Default speed: 1.50x'), findsOneWidget);
      expect(find.text('Look: Midnight'), findsOneWidget);
      expect(completed, 0);
      await _tapNext(tester); // Start listening
      expect(completed, 1);
      expect(finished, 1);
      expect(settings.changes, [
        'speed=1.5',
        'rewind=false',
        'pickLocation',
        'wifiOnly=true',
        'request=notifications',
      ]);
    });

    testWidgets('Skip shows on optional pages only and changes nothing', (
      tester,
    ) async {
      auth = SwitchableAuth(signedIn: true);
      await pumpFlow(tester);
      final skip = find.byKey(const ValueKey('setup-skip')).hitTestable();
      expect(skip, findsNothing); // Welcome
      await _tapNext(tester);
      expect(skip, findsNothing); // Connect
      await _tapNext(tester);
      for (final label in [
        'Step 3 of 7', // Look
        'Step 4 of 7', // Listening
        'Step 5 of 7', // Downloads
        'Step 6 of 7', // Permissions
      ]) {
        expect(_stepLabel(tester), label);
        await tester.tap(skip);
        await tester.pumpAndSettle();
      }
      expect(_stepLabel(tester), 'Step 7 of 7');
      expect(skip, findsNothing); // Done
      expect(settings.changes, isEmpty);
      expect(uiThemeNotifier.value, isNull);
    });

    testWidgets('Back, Alt+Left/Right and system back move between pages', (
      tester,
    ) async {
      auth = SwitchableAuth(signedIn: true);
      await pumpFlow(tester);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
      await tester.pumpAndSettle();
      expect(_stepLabel(tester), 'Step 3 of 7');
      await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
      await tester.pumpAndSettle();
      expect(_stepLabel(tester), 'Step 2 of 7');
      await _tapNext(tester);
      await tester.tap(find.byKey(const ValueKey('setup-back')));
      await tester.pumpAndSettle();
      expect(_stepLabel(tester), 'Step 2 of 7');
      // Android's back button / the mouse back button: one page back.
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(_stepLabel(tester), 'Step 1 of 7');
      expect(find.byKey(const ValueKey('setup-back')), findsNothing);
    });

    testWidgets('Alt+Right cannot pass Connect before sign-in', (tester) async {
      await pumpFlow(tester);
      for (var i = 0; i < 3; i++) {
        await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
        await tester.pumpAndSettle();
      }
      expect(_stepLabel(tester), 'Step 2 of 7');
    });

    testWidgets('the logs notice shows on the last page instead', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        'beta_logging_notice_pending': true,
        'loggingEnabled': true,
      });
      auth = SwitchableAuth(signedIn: true);
      await pumpFlow(tester, steps: const [SetupStep.done]);
      expect(find.byKey(const ValueKey('setup-logs-note')), findsOneWidget);
    });
  });

  testWidgets('Settings: Run setup again opens the flow, back leaves it', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        SwitchableAuth(signedIn: true),
        const Scaffold(body: RunSetupAgainTile()),
      ),
    );
    await tester.tap(find.text('Run setup again'));
    await tester.pumpAndSettle();
    expect(find.byType(SetupFlowScreen), findsOneWidget);
    expect(_stepLabel(tester), startsWith('Step 1 of'));
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(SetupFlowScreen), findsNothing);
    expect(find.byType(RunSetupAgainTile), findsOneWidget);
  });
}

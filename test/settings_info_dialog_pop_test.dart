import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/screens/settings_screen.dart';
import 'package:absorb/widgets/welcome_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// The Playback info dialogs' "Got it" closes the dialog, not the page under
/// it, when Settings sits in a nested navigator (upstream 9f4971a9).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final l = lookupAppLocalizations(const Locale('en'));

  setUp(() {
    SharedPreferences.setMockInitialValues({WelcomeSheet.prefKey: true});
    fakeWindowsShell({'closeToTray': false, 'keepAwake': true});
  });

  tearDown(clearFakeWindowsShell);

  Future<void> pumpNestedSettings(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final nested = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<LibraryProvider>(
            create: (_) => LibraryProvider(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Navigator(
            key: nested,
            onGenerateRoute: (_) => MaterialPageRoute<void>(
              builder: (_) => const Scaffold(body: Text('pane base')),
            ),
          ),
        ),
      ),
    );
    nested.currentState!.push(
      MaterialPageRoute<void>(builder: (_) => const SettingsScreen()),
    );
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    await tester.tap(find.text(l.sectionPlayback));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  for (final tileTitle in [
    () => l.chapterBarrierOnRewind,
    () => l.rewindOnSessionStart,
  ]) {
    testWidgets('Got it on "${tileTitle()}" keeps Settings open', (
      tester,
    ) async {
      await pumpNestedSettings(tester);
      final tile = find.ancestor(
        of: find.text(tileTitle()),
        matching: find.byType(SwitchListTile),
      );
      final info = find.descendant(
        of: tile,
        matching: find.byIcon(Icons.info_outline_rounded),
      );
      await tester.ensureVisible(info);
      await tester.pump();
      await tester.tap(info);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text(l.gotIt));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(SettingsScreen), findsOneWidget);
    });
  }
}

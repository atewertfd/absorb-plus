import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/screens/settings_screen.dart';
import 'package:absorb/utils/test_build.dart';
import 'package:absorb/widgets/developer_mode_tiles.dart';
import 'package:absorb/widgets/welcome_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

// Developer mode, the test channel and GitHub sign-in exist only in the
// "Absorb Plus Test" app (kTestBuild). A normal build shows none of them.

/// Files that are the Developer / test channel feature itself.
const _featureFiles = {
  'lib/screens/developer_screen.dart',
  'lib/screens/test_build_patch_notes_screen.dart',
  'lib/screens/test_channel_screen.dart',
  'lib/services/developer_mode.dart',
  'lib/services/github_device_auth.dart',
  'lib/services/test_build_notes.dart',
  'lib/services/test_channel_service.dart',
  'lib/widgets/developer_mode_tiles.dart',
  'lib/widgets/github_sign_in.dart',
  'lib/widgets/test_build_notes_sheet.dart',
};

/// What the rest of the app may only reach behind `kTestBuild`.
final _entryPoint = RegExp(
  r'\b(DeveloperSettingsTile|onVersionLineTapped|TestChannelLaunchPrompt|'
  r'DeveloperScreen|TestChannelScreen|TestChannelService|DeveloperMode|'
  r'GitHubSignInTile|showGitHubSignInDialog|GitHubDeviceAuth|'
  r'TestBuildNotesPrompt|TestBuildNotesStore|TestBuildPatchNotesScreen)\b',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('tests run as a normal build', () {
    expect(kTestBuild, isFalse);
  });

  test('every Developer / test channel entry point is behind kTestBuild', () {
    final unguarded = <String>[];
    var hooks = 0;
    for (final entity in Directory('lib').listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final path = entity.path.replaceAll(r'\', '/');
      if (_featureFiles.contains(path)) continue;
      final lines = entity.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.trimLeft().startsWith('import ') ||
            line.trimLeft().startsWith('//')) {
          continue;
        }
        if (!_entryPoint.hasMatch(line)) continue;
        hooks++;
        if (!line.contains('kTestBuild')) unguarded.add('$path:${i + 1}');
      }
    }
    expect(unguarded, isEmpty);
    // Settings tile, version line, launch prompt.
    expect(hooks, greaterThanOrEqualTo(3));
  });

  group('Settings in a normal build', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({
        WelcomeSheet.prefKey: true,
        // Even with Developer mode left on from a test build.
        'fork_developer_mode': true,
        'fork_test_channel_unlocked': true,
      });
      fakeWindowsShell({'closeToTray': false, 'keepAwake': true});
    });
    tearDown(clearFakeWindowsShell);

    testWidgets('has no Developer entry', (tester) async {
      tester.view.physicalSize = const Size(1200, 2400);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
            ChangeNotifierProvider<LibraryProvider>(
              create: (_) => LibraryProvider(),
            ),
          ],
          child: const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: SettingsScreen(),
          ),
        ),
      );
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      final l = lookupAppLocalizations(const Locale('en'));
      expect(
        find.byType(DeveloperSettingsTile, skipOffstage: false),
        findsNothing,
      );
      expect(find.text(l.developerTitle, skipOffstage: false), findsNothing);
      expect(find.text(l.testChannelTitle, skipOffstage: false), findsNothing);
    });
  });
}

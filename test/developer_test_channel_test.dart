import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/developer_screen.dart';
import 'package:absorb/screens/test_channel_screen.dart';
import 'package:absorb/services/developer_mode.dart';
import 'package:absorb/services/test_channel_service.dart';
import 'package:absorb/widgets/developer_mode_tiles.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _hashOf(String code) => sha256.convert(utf8.encode(code)).toString();

Map<String, dynamic> _release({
  String tag = 'test-channel',
  List<String> assets = const [],
  String body = 'Changes since v1.12.1-345:\n- New: test channel',
}) => {
  'tag_name': tag,
  'draft': false,
  'prerelease': true,
  'body': body,
  'assets': [
    for (final name in assets)
      {
        'name': name,
        'browser_download_url':
            'https://github.com/atewertfd/absorb-plus/releases/download/test-channel/$name',
      },
  ],
};

TestChannelService _service(
  http.Response Function(http.Request) answer, {
  String installed = '1.12.1+345',
}) => TestChannelService(
  clientFactory: () => MockClient((request) async => answer(request)),
  installedVersion: () async => installed,
);

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    DeveloperMode.resetForTest();
    TestChannelService.debugSupportedOverride = null;
  });
  tearDown(() {
    DeveloperMode.resetForTest();
    TestChannelService.debugSupportedOverride = null;
  });

  group('test channel code', () {
    test('checks the trimmed, upper-cased code against the hash', () {
      final hash = _hashOf('ABC-123');
      expect(
        DeveloperMode.codeMatches(' abc-123 ', expectedSha256: hash),
        isTrue,
      );
      expect(
        DeveloperMode.codeMatches('ABC-123', expectedSha256: hash),
        isTrue,
      );
      expect(
        DeveloperMode.codeMatches('ABC-124', expectedSha256: hash),
        isFalse,
      );
      expect(
        DeveloperMode.codeMatches('   ', expectedSha256: _hashOf('')),
        isFalse,
      );
    });

    test('a wrong code does not unlock the real channel', () async {
      expect(DeveloperMode.codeMatches('not the code'), isFalse);
      expect(await DeveloperMode.unlockTestChannel('not the code'), isFalse);
      expect(await DeveloperMode.isTestChannelUnlocked(), isFalse);
    });

    test('unlocking stores only a flag, never the code', () async {
      DeveloperMode.debugCodeSha256Override = _hashOf('SECRET-42');
      expect(await DeveloperMode.unlockTestChannel('secret-42'), isTrue);
      expect(await DeveloperMode.isTestChannelUnlocked(), isTrue);
      final prefs = await SharedPreferences.getInstance();
      for (final key in prefs.getKeys()) {
        final value = prefs.get(key).toString().toUpperCase();
        expect(value.contains('SECRET'), isFalse, reason: key);
      }
      expect(prefs.getKeys(), {DeveloperMode.testChannelUnlockedKey});
    });
  });

  group('version taps', () {
    test('the seventh quick tap turns it on; a pause starts over', () {
      var now = DateTime(2026, 11, 3, 12);
      final counter = VersionTapCounter(clock: () => now);
      for (var i = 0; i < 6; i++) {
        expect(counter.tap(), isFalse);
        now = now.add(const Duration(milliseconds: 300));
      }
      now = now.add(const Duration(seconds: 3)); // too slow: starts over
      for (var i = 0; i < 6; i++) {
        expect(counter.tap(), isFalse);
        now = now.add(const Duration(milliseconds: 300));
      }
      expect(counter.tap(), isTrue);
      expect(counter.tap(), isFalse); // counting starts again
    });

    testWidgets('seven taps on the version line turn Developer mode on', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => onVersionLineTapped(context),
                child: const Text('GitHub - 1.12.1+345'),
              ),
            ),
          ),
        ),
      );
      for (var i = 0; i < 7; i++) {
        await tester.tap(find.text('GitHub - 1.12.1+345'));
        await tester.pump(const Duration(milliseconds: 50));
      }
      await tester.pump();
      expect(DeveloperMode.enabled.value, isTrue);
      expect(find.text('Developer mode on'), findsOneWidget);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(DeveloperMode.enabledKey), isTrue);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('the Developer entry shows only while it is on', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(const Scaffold(body: Column(children: [DeveloperSettingsTile()]))),
      );
      await tester.pump();
      expect(find.text('Developer'), findsNothing);
      await DeveloperMode.setEnabled(true);
      await tester.pump();
      expect(find.text('Developer'), findsOneWidget);
    });
  });

  group('asset names', () {
    test('reads version and build, whatever GitHub made of the plus', () {
      final plus = parseTestChannelAssetName('absorb-plus-test-1.12.1+346.apk');
      expect(plus?.version, '1.12.1');
      expect(plus?.build, 346);
      expect(
        parseTestChannelAssetName('absorb-plus-test-1.12.1.346.apk')?.build,
        346,
      );
      expect(
        parseTestChannelAssetName('absorb-plus-test-1.12.1-346.apk')?.build,
        346,
      );
      expect(
        parseTestChannelAssetName('absorb-1.12.1-346-arm64-v8a.apk'),
        isNull,
      );
      expect(
        parseTestChannelAssetName('absorb-plus-test-1.12.1+346.zip'),
        isNull,
      );
      expect(parseTestChannelAssetName('absorb-plus-test-latest.apk'), isNull);
    });

    test('picks the highest build when an old APK is still there', () {
      final build = pickTestChannelBuild(
        _release(
          assets: [
            'absorb-plus-test-1.12.1+346.apk',
            'absorb-plus-test-1.12.1+348.apk',
            'notes.txt',
          ],
        ),
      );
      expect(build?.fullVersion, '1.12.1+348');
      expect(build?.assetName, 'absorb-plus-test-1.12.1+348.apk');
      expect(build?.notes, contains('New: test channel'));
      expect(pickTestChannelBuild(_release()), isNull);
    });

    test('newer means a higher build number', () {
      const build = TestChannelBuild(
        version: '1.12.1',
        build: 346,
        assetName: 'absorb-plus-test-1.12.1+346.apk',
        downloadUrl: 'https://example.invalid/a.apk',
      );
      expect(isNewerTestBuild(build, '1.12.1+345'), isTrue);
      expect(isNewerTestBuild(build, '1.12.1+346'), isFalse);
      expect(isNewerTestBuild(build, '1.12.1+347'), isFalse);
      expect(isNewerTestBuild(build, '1.12.0+340'), isTrue);
    });
  });

  group('checking GitHub', () {
    test('a newer build is offered with its notes', () async {
      Uri? asked;
      final result = await _service((request) {
        asked = request.url;
        return http.Response(
          jsonEncode(_release(assets: ['absorb-plus-test-1.12.1+346.apk'])),
          200,
        );
      }).check();
      expect(asked, TestChannelService.releaseUri);
      expect(asked.toString(), endsWith('/releases/tags/test-channel'));
      expect(result.status, TestChannelStatus.newer);
      expect(result.build?.build, 346);
      expect(result.installedVersion, '1.12.1+345');
      final info = TestChannelService.updateInfoFor(
        result.build!,
        installedVersion: result.installedVersion!,
        packageLabel: 'Test build 346',
      );
      expect(info.isDirectApk, isTrue);
      expect(info.hasUpdate, isTrue);
      expect(info.downloadUrl, endsWith('absorb-plus-test-1.12.1+346.apk'));
    });

    test('the same build is up to date', () async {
      final result = await _service(
        (_) => http.Response(
          jsonEncode(_release(assets: ['absorb-plus-test-1.12.1+345.apk'])),
          200,
        ),
      ).check();
      expect(result.status, TestChannelStatus.upToDate);
    });

    test('no channel yet, an error and a wrong tag', () async {
      expect(
        (await _service((_) => http.Response('{}', 404)).check()).status,
        TestChannelStatus.empty,
      );
      expect(
        (await _service((_) => http.Response('oops', 502)).check()).status,
        TestChannelStatus.failed,
      );
      expect(
        (await _service(
          (_) => http.Response(
            jsonEncode(
              _release(
                tag: 'v1.12.1-346',
                assets: ['absorb-plus-test-1.12.1+346.apk'],
              ),
            ),
            200,
          ),
        ).check()).status,
        TestChannelStatus.empty,
      );
    });
  });

  group('where it shows', () {
    test('Android GitHub build only', () {
      expect(
        TestChannelService.supportedFor(
          isAndroid: true,
          isGithubBuild: true,
          isPlayStoreBuild: false,
        ),
        isTrue,
      );
      // Play Store and F-Droid (no define) builds.
      expect(
        TestChannelService.supportedFor(
          isAndroid: true,
          isGithubBuild: false,
          isPlayStoreBuild: true,
        ),
        isFalse,
      );
      expect(
        TestChannelService.supportedFor(
          isAndroid: true,
          isGithubBuild: false,
          isPlayStoreBuild: false,
        ),
        isFalse,
      );
      // Windows, Linux and web GitHub builds.
      expect(
        TestChannelService.supportedFor(
          isAndroid: false,
          isGithubBuild: true,
          isPlayStoreBuild: false,
        ),
        isFalse,
      );
      // Tests run as neither.
      expect(TestChannelService.isSupported, isFalse);
    });

    testWidgets('elsewhere the Developer page has no test channel', (
      tester,
    ) async {
      TestChannelService.debugSupportedOverride = false;
      await tester.pumpWidget(_app(const DeveloperScreen()));
      await tester.pumpAndSettle();
      expect(
        find.text('Test builds are only for the Android GitHub version.'),
        findsOneWidget,
      );
      expect(find.byType(TextField), findsNothing);
      expect(find.text('Install the newest test build'), findsNothing);
    });

    testWidgets('the code unlocks the test channel entry', (tester) async {
      TestChannelService.debugSupportedOverride = true;
      DeveloperMode.debugCodeSha256Override = _hashOf('OPEN-SESAME');
      await tester.pumpWidget(
        _app(
          DeveloperScreen(
            testChannelScreenBuilder: (_) => const Text('channel page'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Install the newest test build'), findsNothing);

      await tester.enterText(find.byType(TextField), 'wrong');
      await tester.tap(find.text('Unlock'));
      await tester.pumpAndSettle();
      expect(find.text("That code isn't right"), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));

      await tester.enterText(find.byType(TextField), 'open-sesame');
      await tester.tap(find.text('Unlock'));
      await tester.pumpAndSettle();
      expect(find.text('Install the newest test build'), findsOneWidget);
      expect(find.text('Check for test builds on launch'), findsOneWidget);
      expect(await DeveloperMode.isTestChannelUnlocked(), isTrue);
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(find.text('Install the newest test build'));
      await tester.pumpAndSettle();
      expect(find.text('channel page'), findsOneWidget);
    });

    testWidgets('turning Developer mode off', (tester) async {
      await DeveloperMode.setEnabled(true);
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const DeveloperScreen(),
                ),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();
      expect(DeveloperMode.enabled.value, isFalse);
      expect(find.text('open'), findsOneWidget);
    });
  });

  group('launch prompt', () {
    final originalCheck = TestChannelLaunchPrompt.runCheck;
    tearDown(() => TestChannelLaunchPrompt.runCheck = originalCheck);

    const newer = TestChannelCheck(
      TestChannelStatus.newer,
      build: TestChannelBuild(
        version: '1.12.1',
        build: 346,
        assetName: 'absorb-plus-test-1.12.1+346.apk',
        downloadUrl: 'https://example.invalid/absorb-plus-test-1.12.1+346.apk',
      ),
      installedVersion: '1.12.1+345',
    );

    Future<void> launch(WidgetTester tester) async {
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => TestChannelLaunchPrompt.showIfNewer(context),
              child: const Text('launch'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('launch'));
      await tester.pumpAndSettle();
    }

    testWidgets('asks once per build, only when everything is on', (
      tester,
    ) async {
      var checks = 0;
      TestChannelLaunchPrompt.runCheck = () async {
        checks++;
        return newer;
      };
      TestChannelService.debugSupportedOverride = true;
      await DeveloperMode.setEnabled(true);
      DeveloperMode.debugCodeSha256Override = _hashOf('X');
      await DeveloperMode.unlockTestChannel('x');

      // The launch switch is off by default: no network check at all.
      await launch(tester);
      expect(checks, 0);

      await DeveloperMode.setLaunchCheckEnabled(true);
      await launch(tester);
      expect(find.text('Test build available'), findsOneWidget);
      await tester.tap(find.text('Later'));
      await tester.pumpAndSettle();

      await launch(tester);
      expect(checks, 2);
      expect(find.text('Test build available'), findsNothing);
    });

    testWidgets('never checks on unsupported builds', (tester) async {
      var checks = 0;
      TestChannelLaunchPrompt.runCheck = () async {
        checks++;
        return newer;
      };
      TestChannelService.debugSupportedOverride = false;
      await DeveloperMode.setEnabled(true);
      await DeveloperMode.setLaunchCheckEnabled(true);
      await launch(tester);
      expect(checks, 0);
    });
  });

  group('test channel page', () {
    testWidgets('a newer build offers Install', (tester) async {
      await tester.pumpWidget(
        _app(
          TestChannelScreen(
            service: _service(
              (_) => http.Response(
                jsonEncode(
                  _release(assets: ['absorb-plus-test-1.12.1+346.apk']),
                ),
                200,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Installed: 1.12.1+345'), findsOneWidget);
      expect(find.text('Newest test build: 1.12.1+346'), findsOneWidget);
      expect(find.text('Install'), findsOneWidget);
      expect(find.textContaining('New: test channel'), findsOneWidget);
    });

    testWidgets('the same build says up to date', (tester) async {
      await tester.pumpWidget(
        _app(
          TestChannelScreen(
            service: _service(
              (_) => http.Response(
                jsonEncode(
                  _release(assets: ['absorb-plus-test-1.12.1+345.apk']),
                ),
                200,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Up to date'), findsOneWidget);
      expect(find.text('Install'), findsNothing);
      expect(find.text('Check now'), findsOneWidget);
    });
  });
}

// The fork's hooks on upstream's web/desktop port:
// - Windows and Linux take the phone code paths and keep the fork's layout
//   (upstream sends desktop down the web paths).
// - The web build hides the server field and uses the page's own address only
//   when the page could be the Audiobookshelf server itself. The fork
//   publishes web on GitHub Pages (and runs it on localhost while
//   developing), where the page isn't the server, so the field stays there.
import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/screens/login_screen.dart';
import 'package:absorb/utils/app_platform.dart';
import 'package:absorb/utils/desktop_workspace.dart';
import 'package:absorb/utils/fork_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

final _l = AppLocalizationsEn();

Finder get _serverField =>
    find.widgetWithText(TextFormField, _l.loginServerAddress);

Future<void> _pumpLogin(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ChangeNotifierProvider<AuthProvider>.value(
      value: FakeAuth(),
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LoginScreen(),
      ),
    ),
  );
  // The entrance animation and the address check's debounce.
  await tester.pump(const Duration(seconds: 2));
  await tester.pump(const Duration(milliseconds: 100));
}

void main() {
  final defaultPageUri = ForkPlatform.webPageUri;

  setUp(() => SharedPreferences.setMockInitialValues({}));

  tearDown(() {
    ForkPlatform.debugIsWebOverride = null;
    ForkPlatform.webPageUri = defaultPageUri;
  });

  group('webPageHostsServer', () {
    test('GitHub Pages and local dev servers are not the server', () {
      for (final url in [
        'https://atewertfd.github.io/absorb-plus/',
        'https://github.io/',
        'http://localhost:8080/',
        'http://app.localhost:5000/',
        'http://127.0.0.1:3000/',
        'http://[::1]:3000/',
        'file:///C:/build/web/index.html',
      ]) {
        expect(
          ForkPlatform.webPageHostsServer(Uri.parse(url)),
          isFalse,
          reason: url,
        );
      }
    });

    test('any other http(s) host may be the server', () {
      for (final url in [
        'https://abs.example.com/',
        'http://192.168.1.20:13378/absorb/',
        'https://my-github.io.example.net/',
      ]) {
        expect(
          ForkPlatform.webPageHostsServer(Uri.parse(url)),
          isTrue,
          reason: url,
        );
      }
    });
  });

  test('only the web build takes the server from the page', () {
    ForkPlatform.webPageUri = () => Uri.parse('https://abs.example.com/');
    ForkPlatform.debugIsWebOverride = false;
    expect(ForkPlatform.webUsesOriginServer, isFalse);
    ForkPlatform.debugIsWebOverride = true;
    expect(ForkPlatform.webUsesOriginServer, isTrue);
    ForkPlatform.webPageUri = () =>
        Uri.parse('https://atewertfd.github.io/absorb-plus/');
    expect(ForkPlatform.webUsesOriginServer, isFalse);
  });

  testWidgets('web on GitHub Pages shows the server field', (tester) async {
    ForkPlatform.debugIsWebOverride = true;
    ForkPlatform.webPageUri = () =>
        Uri.parse('https://atewertfd.github.io/absorb-plus/');
    await _pumpLogin(tester);
    expect(_serverField, findsOneWidget);
    expect(find.text(_l.loginConnectToServer), findsOneWidget);
  });

  testWidgets('web served by the server hides the field (upstream)', (
    tester,
  ) async {
    ForkPlatform.debugIsWebOverride = true;
    ForkPlatform.webPageUri = () => Uri.parse('https://abs.example.com/');
    await _pumpLogin(tester);
    expect(_serverField, findsNothing);
  });

  testWidgets('the native app shows the server field', (tester) async {
    await _pumpLogin(tester);
    expect(_serverField, findsOneWidget);
  });

  test('desktop runs the phone code paths, not the web ones', () {
    // Upstream sends desktop down the web paths (lacksPhonePlugins was
    // isWeb || isDesktop); the fork's Windows and Linux builds have the
    // plugins, so only the browser lacks them. Tests run natively (Windows
    // here, Linux on CI).
    expect(AppPlatform.isDesktop, isTrue);
    expect(AppPlatform.lacksPhonePlugins, isFalse);
  });

  testWidgets('a wide desktop window keeps the fork layout', (tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    bool? workspace;
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          workspace = isDesktopWorkspace(context);
          return const SizedBox();
        },
      ),
    );
    expect(workspace, isFalse);
  });
}

// The alternative sign-in designs (lib/screens/login_designs/): they lay out
// without overflow, follow the saved choice, sign in through exactly the same
// AuthProvider calls as the classic screen, and the preview never signs in.
// No server is contacted: pings go to an in-memory MockClient.
import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/screens/login_designs/login_design_preview_screen.dart';
import 'package:absorb/screens/login_designs/login_designs.dart';
import 'package:absorb/screens/login_screen.dart';
import 'package:absorb/screens/setup/setup_flow_screen.dart';
import 'package:absorb/screens/setup/setup_flow_store.dart';
import 'package:absorb/services/login_design_store.dart';
import 'package:absorb/services/server_backend.dart';
import 'package:absorb/ui_themes/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';
import 'support/setup_fakes.dart';

final _l = AppLocalizationsEn();

/// Records every sign-in call; none of them succeeds.
class _RecordingAuth extends FakeAuth {
  final calls = <String>[];

  @override
  Future<bool> login({
    required String serverUrl,
    required String username,
    required String password,
    Map<String, String> customHeaders = const {},
    ServerBackend backend = ServerBackend.audiobookshelf,
    String? magicLink,
    AppLocalizations? l,
  }) async {
    calls.add(
      'login $serverUrl $username $password $customHeaders ${backend.name} $magicLink',
    );
    return false;
  }

  @override
  Future<bool> loginWithApiKey({
    required String serverUrl,
    required String apiKey,
    Map<String, String> customHeaders = const {},
    ServerBackend backend = ServerBackend.audiobookshelf,
    AppLocalizations? l,
  }) async {
    calls.add('apiKey $serverUrl');
    return false;
  }
}

Future<void> _loadRealFonts() async {
  final candidates = <String>[];
  final root = Platform.environment['FLUTTER_ROOT'];
  if (root != null) candidates.add('$root/bin/cache/artifacts/material_fonts');
  var dir = File(Platform.resolvedExecutable).parent;
  for (var i = 0; i < 8; i++) {
    candidates.add('${dir.path}/artifacts/material_fonts');
    dir = dir.parent;
  }
  for (final c in candidates) {
    if (!File('$c/roboto-regular.ttf').existsSync()) continue;
    Future<ByteData> bytes(String name) async =>
        ByteData.sublistView(File('$c/$name').readAsBytesSync());
    final roboto = FontLoader('Roboto')
      ..addFont(bytes('roboto-regular.ttf'))
      ..addFont(bytes('roboto-medium.ttf'))
      ..addFont(bytes('roboto-bold.ttf'))
      ..addFont(bytes('roboto-light.ttf'));
    await roboto.load();
    await (FontLoader(
      'MaterialIcons',
    )..addFont(bytes('materialicons-regular.otf'))).load();
    return;
  }
}

class _Combo {
  const _Combo(this.size, this.scale, this.brightness, {this.keyboard = 0});
  final Size size;
  final double scale;
  final Brightness brightness;
  final double keyboard;

  @override
  String toString() =>
      '${size.width.toInt()}x${size.height.toInt()} @${scale}x '
      '${brightness.name}${keyboard > 0 ? ' keyboard' : ''}';
}

const _combos = [
  _Combo(Size(360, 640), 1.0, Brightness.light),
  _Combo(Size(360, 640), 1.3, Brightness.dark),
  _Combo(Size(360, 640), 1.3, Brightness.light, keyboard: 280),
  _Combo(Size(640, 360), 1.0, Brightness.dark),
  _Combo(Size(640, 360), 1.3, Brightness.light),
  _Combo(Size(1280, 800), 1.0, Brightness.light),
  _Combo(Size(1280, 800), 1.3, Brightness.dark),
];

AbsorbLook _look(int i, Brightness b) => switch (i % 3) {
  0 => AbsorbLook.plus,
  1 => AbsorbLook.midnight(b),
  _ => b == Brightness.dark ? AbsorbLook.frostedDark : AbsorbLook.frostedLight,
};

Future<void> _pump(
  WidgetTester tester,
  Widget home, {
  AuthProvider? auth,
  _Combo combo = const _Combo(Size(390, 844), 1.0, Brightness.dark),
  AbsorbLook look = AbsorbLook.plus,
}) async {
  tester.view.physicalSize = combo.size;
  tester.view.devicePixelRatio = 1;
  tester.view.viewInsets = FakeViewPadding(bottom: combo.keyboard);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ChangeNotifierProvider<AuthProvider>.value(
      value: auth ?? _RecordingAuth(),
      child: MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.teal,
          brightness: combo.brightness,
          fontFamily: 'Roboto',
          extensions: [look],
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(combo.scale)),
          child: child!,
        ),
        home: home,
      ),
    ),
  );
  // The classic entrance animation and the address check's debounce.
  await tester.pump(const Duration(seconds: 2));
  await tester.pump(const Duration(milliseconds: 100));
}

Widget _screen(LoginDesign design, {bool preview = false}) {
  final Widget screen = LoginDesignScope(
    design: design,
    child: const LoginScreen(),
  );
  return preview ? LoginPreviewScope(child: screen) : screen;
}

Finder get _signInButton => find.widgetWithText(FilledButton, _l.loginSignIn);
Finder get _serverField =>
    find.widgetWithText(TextFormField, _l.loginServerAddress);
Finder get _usernameField =>
    find.widgetWithText(TextFormField, _l.loginUsername);
Finder get _passwordField =>
    find.widgetWithText(TextFormField, _l.loginPassword);

Future<void> _tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

/// On the two-step design, goes on to the sign-in page.
Future<void> _toSignInPage(WidgetTester tester) async {
  final next = find.byKey(const Key('login-steps-continue'));
  if (next.evaluate().isEmpty) return;
  await _tapVisible(tester, next);
  await tester.pump(const Duration(milliseconds: 100));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(_loadRealFonts);

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LoginDesignStore.design.value = LoginDesign.classic;
    fakePackageInfo();
  });

  tearDown(clearFakePackageInfo);

  group('every design lays out in preview mode', () {
    for (final design in LoginDesign.values) {
      testWidgets(design.id, (tester) async {
        for (final (i, combo) in _combos.indexed) {
          await _pump(
            tester,
            _screen(design, preview: true),
            combo: combo,
            look: _look(i, combo.brightness),
          );
          expect(tester.takeException(), isNull, reason: '$combo');
          final more = find.byKey(const Key('login-more-ways'));
          if (more.evaluate().isNotEmpty) {
            await _tapVisible(tester, more);
            expect(tester.takeException(), isNull, reason: 'More, $combo');
          }
          await _toSignInPage(tester);
          expect(tester.takeException(), isNull, reason: 'page 2, $combo');
          expect(_signInButton, findsOneWidget, reason: '$combo');
          // Nothing is left out of reach: scroll to the end.
          await tester.ensureVisible(_signInButton);
          await tester.pump();
          expect(tester.takeException(), isNull, reason: 'scrolled, $combo');
        }
      });
    }
  });

  testWidgets('the split design goes side by side on wide windows', (
    tester,
  ) async {
    await _pump(
      tester,
      _screen(LoginDesign.split, preview: true),
      combo: const _Combo(Size(1280, 800), 1.0, Brightness.dark),
    );
    expect(find.byKey(const Key('login-design-split-wide')), findsOneWidget);
    await _pump(
      tester,
      _screen(LoginDesign.split, preview: true),
      combo: const _Combo(Size(360, 640), 1.0, Brightness.dark),
    );
    expect(find.byKey(const Key('login-design-split-narrow')), findsOneWidget);
  });

  testWidgets('the saved design picks the layout, and changes follow', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({LoginDesignStore.key: 'steps'});
    await LoginDesignStore.load();
    await _pump(tester, const LoginScreen());
    expect(find.byKey(const Key('login-design-steps-server')), findsOneWidget);

    await LoginDesignStore.set(LoginDesign.card);
    await tester.pump();
    expect(find.byKey(const Key('login-design-card')), findsOneWidget);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(LoginDesignStore.key), 'card');

    await LoginDesignStore.set(LoginDesign.classic);
    await tester.pump();
    expect(find.byKey(const Key('login-design-card')), findsNothing);
    expect(find.byKey(const Key('paste-login-link')), findsOneWidget);
  });

  test('an unknown saved value falls back to classic', () async {
    SharedPreferences.setMockInitialValues({LoginDesignStore.key: 'nope'});
    await LoginDesignStore.load();
    expect(LoginDesignStore.design.value, LoginDesign.classic);
  });

  testWidgets("the setup flow's Connect page shows the chosen design", (
    tester,
  ) async {
    LoginDesignStore.design.value = LoginDesign.split;
    addTearDown(() => SetupFlowStore.active = false);
    await _pump(
      tester,
      SetupFlowScreen(
        steps: const [SetupStep.connect, SetupStep.done],
        settings: FakeSetupSettings(),
        complete: () async {},
      ),
    );
    expect(find.byKey(const Key('login-design-split')), findsOneWidget);
  });

  group('every design signs in like the classic screen', () {
    final ping = MockClient((request) async {
      if (request.url.path.endsWith('/ping')) {
        return http.Response('{"success":true}', 200);
      }
      return http.Response('not found', 404);
    });

    Future<List<String>> signIn(WidgetTester tester, LoginDesign design) async {
      final auth = _RecordingAuth();
      await http.runWithClient(() async {
        await _pump(tester, _screen(design), auth: auth);
        await tester.enterText(_serverField, 'abs.test');
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();
        await _toSignInPage(tester);

        // Same validation: no username, no call, the classic message.
        await _tapVisible(tester, _signInButton);
        expect(find.text(_l.loginUsernameRequired), findsOneWidget);
        expect(auth.calls, isEmpty);

        await tester.enterText(_usernameField, 'reader');
        await tester.enterText(_passwordField, 'test-password');
        await _tapVisible(tester, _signInButton);
        await tester.pump(const Duration(milliseconds: 100));
        // Same error text when the server says no.
        expect(find.text(_l.loginFailed), findsOneWidget);
      }, () => ping);
      return auth.calls;
    }

    late List<String> classic;

    testWidgets('classic', (tester) async {
      classic = await signIn(tester, LoginDesign.classic);
      expect(classic, [
        'login https://abs.test reader test-password {} audiobookshelf null',
      ]);
    });

    for (final design in LoginDesign.values.skip(1)) {
      testWidgets(design.id, (tester) async {
        expect(await signIn(tester, design), classic);
      });
    }
  });

  testWidgets('the preview never signs in, and "Use this design" saves', (
    tester,
  ) async {
    final auth = _RecordingAuth();
    await _pump(tester, const LoginDesignPreviewScreen(), auth: auth);

    for (final design in LoginDesign.values) {
      expect(find.text(design.label(_l)), findsOneWidget, reason: design.id);
      await _toSignInPage(tester);
      await tester.enterText(_usernameField, 'reader');
      await _tapVisible(tester, _signInButton);
      expect(find.text(_l.loginDesignPreviewNote), findsOneWidget);
      // Let the toast go.
      await tester.pump(const Duration(seconds: 5));
      await tester.pump(const Duration(seconds: 1));
      if (design != LoginDesign.values.last) {
        await tester.tap(find.byKey(const Key('login-preview-next')));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
      }
    }
    expect(auth.calls, isEmpty);

    // On the last page (split): use it.
    await tester.tap(find.byKey(const Key('login-preview-use')));
    await tester.pump();
    expect(LoginDesignStore.design.value, LoginDesign.split);
    expect(find.byKey(const Key('login-preview-in-use')), findsOneWidget);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(LoginDesignStore.key), 'split');
  });
}

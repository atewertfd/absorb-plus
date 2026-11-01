import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/tailscale_settings_screen.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/tailscale_native.dart';
import 'package:absorb/services/tailscale_service.dart';
import 'package:absorb/services/windows_media_cover.dart';
import 'package:absorb/widgets/tailscale_login_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeNative implements TailscaleNative {
  String statusJson = '{"state":"Starting"}';
  int port = 41234;
  final starts = <Map<String, Object>>[];
  int stops = 0;
  int logouts = 0;

  @override
  int start({
    required String stateDir,
    required String hostname,
    required String proxySecret,
    String controlUrl = '',
    String authKey = '',
    int preferredPort = 0,
  }) {
    starts.add({
      'stateDir': stateDir,
      'hostname': hostname,
      'secret': proxySecret,
      'controlUrl': controlUrl,
      'authKey': authKey,
      'preferredPort': preferredPort,
    });
    return port;
  }

  @override
  String status() => statusJson;

  @override
  void logout() => logouts++;

  bool failStop = false;

  @override
  Future<void> stop() async {
    stops++;
    if (failStop) throw StateError('stop failed');
  }

  @override
  String logs() => '';
}

/// What HttpClient does without the hook: proxies from the environment,
/// usually DIRECT. Hosts outside the tailnet must keep getting this.
String envDefault(String url) => HttpClient.findProxyFromEnvironment(Uri.parse(url));

void main() {
  late Directory dir;
  late FakeNative native;
  late int loads;
  final opened = <Uri>[];

  TailscaleService make({bool withLibrary = true}) => TailscaleService(
        loadNative: () {
          loads++;
          return withLibrary ? native : null;
        },
        stateDir: () async => dir.path,
        hostname: () => 'absorb-test',
        openExternal: (uri) async {
          opened.add(uri);
          return true;
        },
        fastPoll: const Duration(milliseconds: 10),
        slowPoll: const Duration(milliseconds: 50),
      );

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('absorb-ts-unit-');
    native = FakeNative();
    loads = 0;
    opened.clear();
  });

  tearDown(() async {
    try {
      await dir.delete(recursive: true);
    } catch (_) {}
  });

  test('off by default: no native library, nothing routed', () async {
    SharedPreferences.setMockInitialValues({});
    final ts = make();
    await ts.init();
    expect(ts.enabled, isFalse);
    expect(loads, 0);
    expect(native.starts, isEmpty);
    expect(ts.findProxy(Uri.parse('http://100.64.0.1/ping')), envDefault('http://100.64.0.1/ping'));
    expect(ts.mediaUrl('http://100.64.0.1/a?token=x'), 'http://100.64.0.1/a?token=x');
    // Doesn't wait at all for a tailnet server while off.
    final sw = Stopwatch()..start();
    await ts.waitUntilReady('http://100.64.0.1');
    expect(sw.elapsedMilliseconds, lessThan(500));
  });

  test('turning it on starts the node and routes tailnet hosts', () async {
    SharedPreferences.setMockInitialValues({});
    final ts = make();
    await ts.setEnabled(true);
    expect(native.starts, hasLength(1));
    final start = native.starts.single;
    expect(start['stateDir'], dir.path);
    expect(start['hostname'], 'absorb-test');
    expect(start['controlUrl'], ''); // the app never sets a control server
    expect(start['authKey'], '');
    final secret = start['secret'] as String;
    expect(secret.length, greaterThanOrEqualTo(32));
    expect(File('${dir.path}${Platform.pathSeparator}proxy-secret').readAsStringSync(), secret);

    expect(ts.findProxy(Uri.parse('http://100.64.0.1/ping')),
        'PROXY absorb:$secret@127.0.0.1:41234');
    expect(ts.findProxy(Uri.parse('https://abs.example.com/ping')), envDefault('https://abs.example.com/ping'));
    expect(ts.mediaUrl('http://100.64.0.1/x'),
        'http://127.0.0.1:41234/_ts/$secret/http/100.64.0.1:80/x');

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(TailscaleService.prefEnabled), isTrue);
    expect(prefs.getInt(TailscaleService.prefPort), 41234);

    await ts.setEnabled(false);
    expect(native.stops, 1);
    expect(ts.findProxy(Uri.parse('http://100.64.0.1/ping')), envDefault('http://100.64.0.1/ping'));
    expect(prefs.getBool(TailscaleService.prefEnabled), isFalse);
  });

  test('a later launch reuses the secret and asks for the same port', () async {
    SharedPreferences.setMockInitialValues({
      TailscaleService.prefEnabled: true,
      TailscaleService.prefPort: 45555,
    });
    final first = make();
    await first.init();
    final secret = native.starts.single['secret'];
    expect(native.starts.single['preferredPort'], 45555);

    final second = make();
    await second.init();
    expect(native.starts.last['secret'], secret);
    await first.setEnabled(false);
    await second.setEnabled(false);
  });

  test('MagicDNS suffix from the node is learned and remembered', () async {
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    native.statusJson =
        '{"state":"Running","ips":["100.64.0.9"],"magicDnsSuffix":"tailnet.test","proxyPort":41234}';
    final ts = make();
    await ts.init();
    await ts.waitUntilReady('http://100.64.0.1');
    expect(ts.status.isRunning, isTrue);
    expect(ts.findProxy(Uri.parse('http://abs.tailnet.test/ping')), startsWith('PROXY '));
    await Future<void>.delayed(const Duration(milliseconds: 20));
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(TailscaleService.prefDnsSuffix), 'tailnet.test');
    await ts.setEnabled(false);
  });

  test('waitUntilReady stops waiting when a sign-in is needed', () async {
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    native.statusJson = '{"state":"NeedsLogin","authUrl":"https://login.example/a/1"}';
    final ts = make();
    final sw = Stopwatch()..start();
    await ts.waitUntilReady('http://100.64.0.1', timeout: const Duration(seconds: 5));
    expect(sw.elapsedMilliseconds, lessThan(2000));
    expect(ts.status.needsLogin, isTrue);

    expect(await ts.signIn(), isTrue);
    expect(opened.single.toString(), 'https://login.example/a/1');

    ts.signOut();
    expect(native.logouts, 1);
    await ts.setEnabled(false);
  });

  test('a non-tailnet server is never held up', () async {
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    final ts = make(); // node stays "Starting"
    final sw = Stopwatch()..start();
    await ts.waitUntilReady('https://abs.example.com');
    expect(sw.elapsedMilliseconds, lessThan(2000), reason: "no 10 s wait for a non-tailnet server (2 s allows a busy machine)");
    await ts.setEnabled(false);
  });

  test('extra host names are routed and saved', () async {
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    final ts = make();
    await ts.init();
    expect(ts.findProxy(Uri.parse('http://nas:13378/ping')), envDefault('http://nas:13378/ping'));
    await ts.setExtraHosts('NAS, media.home.arpa');
    expect(ts.findProxy(Uri.parse('http://nas:13378/ping')), startsWith('PROXY '));
    expect(ts.routesServer('http://media.home.arpa'), isTrue);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(TailscaleService.prefHosts), 'nas, media.home.arpa');
    await ts.setEnabled(false);
  });

  test('a build without the library reports it instead of routing', () async {
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    final ts = make(withLibrary: false);
    await ts.init();
    expect(ts.libraryAvailable, isFalse);
    expect(ts.status.hasError, isTrue);
    expect(ts.findProxy(Uri.parse('http://100.64.0.1/ping')), envDefault('http://100.64.0.1/ping'));
  });

  group('URLs fetched outside Dart HTTP', () {
    final appInstance = TailscaleService.instance;
    tearDown(() => TailscaleService.instance = appInstance);

    ApiService api(String base) => ApiService(baseUrl: base, token: 'tok');

    test('with Tailscale on, download, ebook and cover URLs go through the proxy', () async {
      SharedPreferences.setMockInitialValues({});
      final ts = make();
      await ts.setEnabled(true);
      TailscaleService.instance = ts;
      final secret = native.starts.single['secret'];
      const proxied = 'http://127.0.0.1:41234/_ts';

      final tailnet = api('http://100.64.0.1:13378');
      expect(tailnet.buildDownloadFileUrl('li_1', '42'),
          '$proxied/$secret/http/100.64.0.1:13378/api/items/li_1/file/42?token=tok');
      expect(tailnet.buildFileUrl('li_1', '42'), tailnet.buildDownloadFileUrl('li_1', '42'));
      expect(tailnet.buildEbookUrl('li_1', '7'),
          '$proxied/$secret/http/100.64.0.1:13378/api/items/li_1/file/7?token=tok');
      expect(tailnet.buildReaderEbookUrl('li_1', '7'), tailnet.buildEbookUrl('li_1', '7'));
      expect((await tailnet.narratedEpubDownload('li_1', '7')).url, startsWith('$proxied/$secret/'));
      expect(windowsMediaCoverUri(coverUrl: 'https://nas.tail1.ts.net/api/items/li_1/cover?token=tok'),
          '$proxied/$secret/https/nas.tail1.ts.net:443/api/items/li_1/cover?token=tok');

      // Servers outside the tailnet keep their own address.
      final public = api('https://abs.example.com');
      expect(public.buildDownloadFileUrl('li_1', '42'),
          'https://abs.example.com/api/items/li_1/file/42?token=tok');
      expect(public.buildEbookUrl('li_1', '7'),
          'https://abs.example.com/api/items/li_1/file/7?token=tok');
      await ts.setEnabled(false);
    });

    test('with Tailscale off, the URLs are unchanged', () async {
      SharedPreferences.setMockInitialValues({});
      final ts = make();
      await ts.init();
      TailscaleService.instance = ts;
      final tailnet = api('http://100.64.0.1:13378');
      expect(tailnet.buildDownloadFileUrl('li_1', '42'),
          'http://100.64.0.1:13378/api/items/li_1/file/42?token=tok');
      expect(tailnet.buildEbookUrl('li_1', '7'),
          'http://100.64.0.1:13378/api/items/li_1/file/7?token=tok');
      expect(windowsMediaCoverUri(coverUrl: 'http://100.64.0.1:13378/api/items/li_1/cover'),
          'http://100.64.0.1:13378/api/items/li_1/cover');
    });
  });

  group('settings screen', () {
    Future<void> pumpScreen(WidgetTester tester, TailscaleService ts) async {
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          '/': (_) => Builder(
                builder: (context) => TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (_) => TailscaleSettingsScreen(service: ts, serverUrl: 'http://nas:13378'))),
                  child: const Text('open'),
                ),
              ),
        },
      ));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    Future<String?> savedHosts(WidgetTester tester) async {
      String? hosts;
      await tester.runAsync(() async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        hosts = (await SharedPreferences.getInstance()).getString(TailscaleService.prefHosts);
      });
      return hosts;
    }

    testWidgets('typed hosts are saved after a pause in typing', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final ts = make();
      await tester.runAsync(ts.init);
      await pumpScreen(tester, ts);
      await tester.enterText(find.byType(TextField), 'nas, media.home.arpa');
      await tester.pump(const Duration(milliseconds: 100));
      expect(ts.extraHosts, isEmpty);
      await tester.pump(TailscaleSettingsScreen.hostsSaveDelay);
      expect(ts.extraHosts, {'nas', 'media.home.arpa'});
      expect(await savedHosts(tester), 'nas, media.home.arpa');
    });

    testWidgets('typed hosts are saved when the screen closes right away', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final ts = make();
      await tester.runAsync(ts.init);
      await pumpScreen(tester, ts);
      await tester.enterText(find.byType(TextField), 'nas');
      tester.state<NavigatorState>(find.byType(Navigator)).pop();
      await tester.pumpAndSettle();
      expect(find.byType(TailscaleSettingsScreen), findsNothing);
      expect(ts.extraHosts, {'nas'});
      expect(await savedHosts(tester), 'nas');
    });

    testWidgets('tapping outside the field closes the keyboard and saves', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final ts = make();
      await tester.runAsync(ts.init);
      await pumpScreen(tester, ts);
      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.enterText(find.byType(TextField), 'nas');
      expect(tester.testTextInput.isVisible, isTrue);
      await tester.tapAt(tester.getCenter(find.byType(AppBar)));
      await tester.pump();
      expect(tester.testTextInput.isVisible, isFalse);
      expect(ts.extraHosts, {'nas'});
      await tester.pump(TailscaleSettingsScreen.hostsSaveDelay);
    });

    testWidgets('a toggle that fails shows a message instead of an error', (tester) async {
      SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
      final ts = make();
      await tester.runAsync(ts.init);
      native.failStop = true;
      await pumpScreen(tester, ts);
      await tester.tap(find.byType(Switch));
      // The service started on the real clock (runAsync), so let both run.
      for (var i = 0; i < 5; i++) {
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
        await tester.pump();
      }
      final l = lookupAppLocalizations(const Locale('en'));
      expect(find.text(l.tailscaleToggleFailed), findsOneWidget);
      expect(tester.takeException(), isNull);
      // The switch is usable again.
      expect(tester.widget<Switch>(find.byType(Switch)).onChanged, isNotNull);
      await tester.pump(const Duration(seconds: 5));
      native.failStop = false;
      await tester.runAsync(() => ts.setEnabled(false));
    });
  });

  testWidgets('settings screen: switch, sign-in button, routed server', (tester) async {
    SharedPreferences.setMockInitialValues({});
    native.statusJson = '{"state":"NeedsLogin","authUrl":"https://login.example/a/2"}';
    final ts = make();
    await tester.runAsync(ts.init);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: TailscaleSettingsScreen(service: ts, serverUrl: 'http://100.64.0.1:13378'),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Use built-in Tailscale'), findsOneWidget);
    expect(find.text('Off'), findsOneWidget);
    expect(find.text('Sign in with Tailscale'), findsNothing);
    expect(find.textContaining('is reached through Tailscale'), findsOneWidget);

    await tester.runAsync(() => ts.setEnabled(true));
    await tester.pump();
    expect(find.text('Sign in with Tailscale'), findsOneWidget);
    expect(find.text('Sign in to add this device to your tailnet'), findsOneWidget);

    await tester.runAsync(() => ts.setEnabled(false));
    await tester.pump();
  });

  testWidgets('sign-in panel: off shows the pitch and one Connect button; Advanced opens the full screen',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final ts = make();
    await tester.runAsync(ts.init);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: TailscaleLoginPanel(service: ts)),
    ));
    expect(find.text('Tailscale (built-in)'), findsOneWidget);
    expect(find.textContaining('without turning on the Tailscale VPN'), findsOneWidget);
    expect(find.text('Connect with Tailscale'), findsOneWidget);
    expect(find.text('Sign in with Tailscale'), findsNothing);
    await tester.tap(find.text('Advanced'));
    await tester.pumpAndSettle();
    expect(find.byType(TailscaleSettingsScreen), findsOneWidget);
  });

  testWidgets('sign-in chip opens the Tailscale panel in a sheet', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final ts = make();
    await tester.runAsync(ts.init);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: Center(child: TailscaleLoginChip(service: ts))),
    ));
    expect(find.text('Tailscale'), findsOneWidget);
    await tester.tap(find.byKey(const Key('tailscale-login-chip')));
    await tester.pumpAndSettle();
    expect(find.byType(TailscaleLoginPanel), findsOneWidget);
  });

  testWidgets('Connect turns Tailscale on and opens the login page', (tester) async {
    SharedPreferences.setMockInitialValues({});
    native.statusJson = '{"state":"NeedsLogin","authUrl":"https://login.example/a/9"}';
    final ts = make();
    await tester.runAsync(ts.init);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: TailscaleLoginPanel(service: ts)),
    ));
    await tester.tap(find.text('Connect with Tailscale'));
    // Up to ~3 s of real time: the full suite runs files in parallel and
    // can starve this one (0.5 s was flaky there).
    for (var i = 0; i < 60 && opened.isEmpty; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
      await tester.pump(const Duration(milliseconds: 400));
    }
    expect(ts.enabled, isTrue);
    expect(opened.single.toString(), 'https://login.example/a/9');
    await tester.runAsync(() => ts.setEnabled(false));
  });
}

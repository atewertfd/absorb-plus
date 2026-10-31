import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/tailscale_settings_screen.dart';
import 'package:absorb/services/tailscale_native.dart';
import 'package:absorb/services/tailscale_service.dart';
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

  @override
  Future<void> stop() async => stops++;

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
    expect(sw.elapsedMilliseconds, lessThan(500));
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
}

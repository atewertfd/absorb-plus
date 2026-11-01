import 'package:absorb/services/tailscale_cover_route.dart';
import 'package:absorb/services/tailscale_routing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _active = TailscaleRouting(
  enabled: true,
  proxyPort: 41234,
  secret: 'fixture-secret',
  magicDnsSuffix: 'tail1234.ts.net',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('routedBase', () {
    test('tailnet servers go through the loopback proxy', () {
      expect(
        TailscaleCoverRoute.routedBase(_active, 'https://abs.tail1234.ts.net/'),
        'http://127.0.0.1:41234/_ts/fixture-secret/https/abs.tail1234.ts.net:443',
      );
      expect(
        TailscaleCoverRoute.routedBase(_active, 'http://100.101.102.103:13378/abs'),
        'http://127.0.0.1:41234/_ts/fixture-secret/http/100.101.102.103:13378/abs',
      );
    });

    test('a cover path appended to the base matches mediaUrl', () {
      const server = 'https://abs.tail1234.ts.net/abs';
      final base = TailscaleCoverRoute.routedBase(_active, server)!;
      const path = '/api/items/li_1/cover?width=400';
      expect('$base$path', _active.mediaUrl('$server$path'));
    });

    test('direct when off, not running, or not a tailnet host', () {
      expect(
          TailscaleCoverRoute.routedBase(
              TailscaleRouting.disabled, 'https://abs.tail1234.ts.net'),
          isNull);
      expect(
          TailscaleCoverRoute.routedBase(
              const TailscaleRouting(enabled: true), 'https://abs.tail1234.ts.net'),
          isNull);
      expect(TailscaleCoverRoute.routedBase(_active, 'https://abs.example.com'),
          isNull);
      expect(TailscaleCoverRoute.routedBase(_active, null), isNull);
      expect(TailscaleCoverRoute.routedBase(_active, '  '), isNull);
    });
  });

  group('sync', () {
    test('stores the route for the current server', () async {
      SharedPreferences.setMockInitialValues(
          {'server_url': 'https://abs.tail1234.ts.net/'});
      final prefs = await SharedPreferences.getInstance();
      await TailscaleCoverRoute.sync(routing: _active, prefs: prefs, force: true);
      expect(prefs.getString(TailscaleCoverRoute.prefFrom),
          'https://abs.tail1234.ts.net');
      expect(prefs.getString(TailscaleCoverRoute.prefTo),
          'http://127.0.0.1:41234/_ts/fixture-secret/https/abs.tail1234.ts.net:443');
    });

    test('clears the route when Tailscale is off', () async {
      SharedPreferences.setMockInitialValues({
        'server_url': 'https://abs.tail1234.ts.net',
        TailscaleCoverRoute.prefFrom: 'https://abs.tail1234.ts.net',
        TailscaleCoverRoute.prefTo: 'http://127.0.0.1:1/_ts/x/https/a:443',
      });
      final prefs = await SharedPreferences.getInstance();
      await TailscaleCoverRoute.sync(
          routing: TailscaleRouting.disabled, prefs: prefs, force: true);
      expect(prefs.containsKey(TailscaleCoverRoute.prefFrom), isFalse);
      expect(prefs.containsKey(TailscaleCoverRoute.prefTo), isFalse);
    });

    test('clears the route for a server outside the tailnet', () async {
      SharedPreferences.setMockInitialValues({
        'server_url': 'https://abs.example.com',
        TailscaleCoverRoute.prefFrom: 'https://abs.tail1234.ts.net',
        TailscaleCoverRoute.prefTo: 'http://127.0.0.1:1/_ts/x/https/a:443',
      });
      final prefs = await SharedPreferences.getInstance();
      await TailscaleCoverRoute.sync(routing: _active, prefs: prefs, force: true);
      expect(prefs.containsKey(TailscaleCoverRoute.prefFrom), isFalse);
      expect(prefs.containsKey(TailscaleCoverRoute.prefTo), isFalse);
    });

    test('does nothing off Android unless forced', () async {
      SharedPreferences.setMockInitialValues(
          {'server_url': 'https://abs.tail1234.ts.net'});
      final prefs = await SharedPreferences.getInstance();
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      try {
        await TailscaleCoverRoute.sync(routing: _active, prefs: prefs);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
      expect(prefs.containsKey(TailscaleCoverRoute.prefTo), isFalse);
    });
  });
}

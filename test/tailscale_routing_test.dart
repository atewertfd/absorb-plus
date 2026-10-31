import 'package:absorb/services/tailscale_routing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const secret = '0123456789abcdef0123456789abcdef';
  const on = TailscaleRouting(
    enabled: true,
    proxyPort: 41234,
    secret: secret,
    magicDnsSuffix: 'tail1234.ts.net',
    extraHosts: {'nas'},
  );

  group('isTailnetHost', () {
    test('Tailscale address ranges', () {
      expect(on.isTailnetHost('100.64.0.1'), isTrue);
      expect(on.isTailnetHost('100.127.255.255'), isTrue);
      expect(on.isTailnetHost('100.116.45.28'), isTrue);
      expect(on.isTailnetHost('100.63.255.255'), isFalse);
      expect(on.isTailnetHost('100.128.0.1'), isFalse);
      expect(on.isTailnetHost('[fd7a:115c:a1e0::1]'), isTrue);
      expect(on.isTailnetHost('fd7a:115c:a1e0:ab12::1'), isTrue);
    });

    test('names', () {
      expect(on.isTailnetHost('nas.tail1234.ts.net'), isTrue);
      expect(on.isTailnetHost('NAS.Other.ts.net.'), isTrue);
      expect(on.isTailnetHost('nas'), isTrue); // listed by the user
      expect(on.isTailnetHost('abs.example.com'), isFalse);
      expect(on.isTailnetHost('192.168.1.10'), isFalse);
      expect(on.isTailnetHost('notts.net'), isFalse);
      expect(on.isTailnetHost(''), isFalse);
    });

    test('a headscale MagicDNS suffix', () {
      const hs = TailscaleRouting(enabled: true, magicDnsSuffix: 'tailnet.test');
      expect(hs.isTailnetHost('abs.tailnet.test'), isTrue);
      expect(hs.isTailnetHost('tailnet.test.evil.com'), isFalse);
    });
  });

  group('findProxy', () {
    test('tailnet hosts go to the embedded proxy with its password', () {
      expect(on.findProxy(Uri.parse('http://100.64.0.1:13378/ping')),
          'PROXY absorb:$secret@127.0.0.1:41234');
      expect(on.findProxy(Uri.parse('wss://nas.tail1234.ts.net/socket.io/')),
          startsWith('PROXY '));
    });

    test('everything else stays direct', () {
      expect(on.findProxy(Uri.parse('https://api.github.com/x')), 'DIRECT');
      expect(on.findProxy(Uri.parse('http://192.168.1.10:13378/ping')), 'DIRECT');
    });

    test('off, or not started yet, is always direct', () {
      for (final r in [
        TailscaleRouting.disabled,
        const TailscaleRouting(enabled: true, secret: secret), // no port yet
        const TailscaleRouting(enabled: false, proxyPort: 41234, secret: secret),
      ]) {
        expect(r.active, isFalse);
        expect(r.findProxy(Uri.parse('http://100.64.0.1/ping')), 'DIRECT');
        expect(r.mediaUrl('http://100.64.0.1/x'), 'http://100.64.0.1/x');
      }
    });
  });

  group('mediaUrl', () {
    test('rewrites tailnet URLs to the loopback reverse proxy', () {
      expect(
        on.mediaUrl('http://100.64.0.1:13378/api/items/li_1/file/2?token=abc%2Bd'),
        'http://127.0.0.1:41234/_ts/$secret/http/100.64.0.1:13378/api/items/li_1/file/2?token=abc%2Bd',
      );
      expect(
        on.mediaUrl('https://nas.tail1234.ts.net/abs/public/session/s1/track/0'),
        'http://127.0.0.1:41234/_ts/$secret/https/nas.tail1234.ts.net:443/abs/public/session/s1/track/0',
      );
      // Percent-encoding passes through untouched.
      expect(
        on.mediaUrl('http://100.64.0.1/api/items/a%2Fb/file?n=%C3%A9'),
        'http://127.0.0.1:41234/_ts/$secret/http/100.64.0.1:80/api/items/a%2Fb/file?n=%C3%A9',
      );
      expect(
        on.mediaUrl('http://[fd7a:115c:a1e0::5]/x'),
        'http://127.0.0.1:41234/_ts/$secret/http/[fd7a:115c:a1e0::5]:80/x',
      );
    });

    test('leaves other URLs alone', () {
      for (final url in [
        'https://abs.example.com/api/items/1/file/2',
        '/data/user/0/files/book.mp3',
        'file:///C:/books/a.m4b',
        'content://media/external/audio/1',
      ]) {
        expect(on.mediaUrl(url), url);
      }
    });
  });

  group('TailnetStatus.parse', () {
    test('a running node', () {
      final s = TailnetStatus.parse(
          '{"state":"Running","ips":["fd7a:115c:a1e0::2","100.64.0.2"],'
          '"dnsName":"absorb-windows.tail1234.ts.net","magicDnsSuffix":"tail1234.ts.net",'
          '"user":"me@example.com","proxyPort":41234}');
      expect(s.isRunning, isTrue);
      expect(s.primaryIp, '100.64.0.2');
      expect(s.user, 'me@example.com');
      expect(s.proxyPort, 41234);
      expect(s.magicDnsSuffix, 'tail1234.ts.net');
    });

    test('waiting for sign-in', () {
      final s = TailnetStatus.parse(
          '{"state":"NeedsLogin","authUrl":"https://login.tailscale.com/a/x"}');
      expect(s.needsLogin, isTrue);
      expect(s.authUrl, startsWith('https://'));
      expect(s.primaryIp, '');
    });

    test('off, errors and garbage', () {
      expect(TailnetStatus.parse('{"state":"Off"}').isOff, isTrue);
      final err = TailnetStatus.parse('{"state":"Error","error":"boom"}');
      expect(err.hasError, isTrue);
      expect(err.error, 'boom');
      expect(TailnetStatus.parse('not json').hasError, isTrue);
      expect(TailnetStatus.parse('[]').isOff, isTrue);
    });
  });

  test('tailscaleHostname', () {
    expect(tailscaleHostname('windows', 'DESKTOP-AB12CD'), 'absorb-desktop-ab12cd');
    expect(tailscaleHostname('android', 'localhost'), 'absorb-android');
    expect(tailscaleHostname('linux', ''), 'absorb-linux');
    expect(tailscaleHostname('linux', 'my_box.local'), 'absorb-my-box-local');
  });

  test('parseTailnetHosts', () {
    expect(parseTailnetHosts('nas, https://abs.example.com:443/x ;  NAS2\nfoo:80'),
        {'nas', 'abs.example.com', 'nas2', 'foo'});
    expect(parseTailnetHosts('  '), isEmpty);
  });
}

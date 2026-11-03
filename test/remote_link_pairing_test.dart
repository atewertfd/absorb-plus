import 'dart:convert';
import 'dart:math';

import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late DateTime now;
  DateTime clock() => now;

  setUp(() {
    now = DateTime(2026, 11, 3, 12);
    SharedPreferences.setMockInitialValues({});
  });

  group('PairingCodeIssuer', () {
    test('no code while pairing is closed', () {
      final codes = PairingCodeIssuer(now: clock);
      expect(codes.code, isNull);
      expect(codes.check('123456'), PairCodeCheck.closed);
    });

    test('six digits while open, dropped when closed', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(1));
      codes.open();
      expect(codes.code, matches(RegExp(r'^\d{6}$')));
      codes.close();
      expect(codes.code, isNull);
      expect(codes.isOpen, isFalse);
    });

    test('nested opens keep the code until the last close', () {
      final codes = PairingCodeIssuer(now: clock);
      codes.open();
      final first = codes.code;
      codes.open();
      expect(codes.code, first);
      codes.close();
      expect(codes.code, first);
      codes.close();
      expect(codes.code, isNull);
    });

    test('expires after two minutes', () {
      final codes = PairingCodeIssuer(now: clock);
      codes.open();
      final code = codes.code!;
      now = now.add(const Duration(minutes: 1, seconds: 59));
      expect(codes.isExpired, isFalse);
      now = now.add(const Duration(seconds: 1));
      expect(codes.check(code), PairCodeCheck.expired);
      codes.refreshIfExpired();
      expect(codes.isExpired, isFalse);
    });

    test('works once', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(2));
      codes.open();
      final code = codes.code!;
      expect(codes.check(code), PairCodeCheck.ok);
      expect(codes.code, isNot(code));
      expect(codes.check(code), PairCodeCheck.wrong);
    });

    test('replaced after five wrong attempts', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(3));
      codes.open();
      final code = codes.code!;
      final wrong = code == '000000' ? '000001' : '000000';
      for (var i = 0; i < 4; i++) {
        expect(codes.check(wrong), PairCodeCheck.wrong);
        expect(codes.code, code);
      }
      expect(codes.check(wrong), PairCodeCheck.wrong);
      expect(codes.code, isNot(code));
      expect(codes.check(code), PairCodeCheck.wrong);
    });

    test('refresh issues a new code and a full lifetime', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(4));
      codes.open();
      now = now.add(const Duration(minutes: 1));
      codes.refresh();
      expect(codes.expiresAt, now.add(const Duration(minutes: 2)));
    });
  });

  group('AuthFailureLimiter', () {
    test('blocks after five failures within the window, then lifts', () {
      final limiter = AuthFailureLimiter(now: clock);
      for (var i = 0; i < 4; i++) {
        limiter.recordFailure('10.0.0.9');
      }
      expect(limiter.isBlocked('10.0.0.9'), isFalse);
      limiter.recordFailure('10.0.0.9');
      expect(limiter.isBlocked('10.0.0.9'), isTrue);
      expect(limiter.isBlocked('10.0.0.8'), isFalse);
      now = now.add(const Duration(minutes: 1));
      expect(limiter.isBlocked('10.0.0.9'), isFalse);
    });

    test('old failures fall out of the window', () {
      final limiter = AuthFailureLimiter(now: clock);
      for (var i = 0; i < 4; i++) {
        limiter.recordFailure('a');
      }
      now = now.add(const Duration(minutes: 2));
      limiter.recordFailure('a');
      expect(limiter.isBlocked('a'), isFalse);
    });

    test('a success clears the count', () {
      final limiter = AuthFailureLimiter(now: clock);
      for (var i = 0; i < 4; i++) {
        limiter.recordFailure('a');
      }
      limiter.recordSuccess('a');
      limiter.recordFailure('a');
      expect(limiter.isBlocked('a'), isFalse);
    });
  });

  group('PairedDeviceStore', () {
    test('stores only a hash and matches the token', () async {
      final store = PairedDeviceStore(now: clock);
      final added = await store.add('Pixel');
      expect(added.token.length, greaterThanOrEqualTo(43));
      expect(store.match(added.token)?.id, added.device.id);
      expect(store.match('${added.token}x'), isNull);
      expect(store.match(''), isNull);

      final raw = (await SharedPreferences.getInstance()).getString(
        PairedDeviceStore.prefKey,
      )!;
      expect(raw.contains(added.token), isFalse);
      expect(raw.contains(hashRemoteToken(added.token)), isTrue);
    });

    test('survives a reload', () async {
      final first = PairedDeviceStore(now: clock);
      final added = await first.add('Pixel');
      final second = PairedDeviceStore(now: clock);
      await second.load();
      expect(second.devices.single.name, 'Pixel');
      expect(second.match(added.token), isNotNull);
    });

    test('forget revokes at once', () async {
      final store = PairedDeviceStore(now: clock);
      final a = await store.add('A');
      final b = await store.add('B');
      expect(await store.forget(a.device.id), isTrue);
      expect(store.match(a.token), isNull);
      expect(store.match(b.token), isNotNull);
      expect(await store.forget(a.device.id), isFalse);
    });

    test('touch updates last seen', () async {
      final store = PairedDeviceStore(now: clock);
      final a = await store.add('A');
      now = now.add(const Duration(hours: 1));
      await store.touch(a.device.id);
      expect(store.devices.single.lastSeen, now);
    });

    test('keeps at most maxDevices, dropping the longest unused', () async {
      final store = PairedDeviceStore(now: clock, maxDevices: 2);
      final a = await store.add('A');
      now = now.add(const Duration(minutes: 1));
      await store.add('B');
      now = now.add(const Duration(minutes: 1));
      await store.add('C');
      expect(store.devices.map((d) => d.name), unorderedEquals(['B', 'C']));
      expect(store.match(a.token), isNull);
    });

    test('a damaged list pairs nothing', () async {
      SharedPreferences.setMockInitialValues({
        PairedDeviceStore.prefKey: 'not json',
      });
      final store = PairedDeviceStore();
      await store.load();
      expect(store.devices, isEmpty);
    });
  });

  test('tokens are random and url-safe', () {
    final a = newRemoteToken();
    final b = newRemoteToken();
    expect(a, isNot(b));
    expect(a, matches(RegExp(r'^[A-Za-z0-9_-]+$')));
    expect(base64Url.decode('$a='), hasLength(32));
  });

  test('constantTimeEquals', () {
    expect(constantTimeEquals('abc', 'abc'), isTrue);
    expect(constantTimeEquals('abc', 'abd'), isFalse);
    expect(constantTimeEquals('abc', 'ab'), isFalse);
  });

  group('RemoteHostBook', () {
    test('saves, replaces by host id and forgets', () async {
      const book = RemoteHostBook();
      await book.save(
        const SavedRemoteHost(
          hostId: 'h1',
          name: 'PC',
          address: '10.0.0.2',
          port: 47390,
          token: 't',
        ),
      );
      await book.save(
        const SavedRemoteHost(
          hostId: 'h1',
          name: 'PC',
          address: '10.0.0.3',
          port: 47391,
          token: 't',
        ),
      );
      final hosts = await book.load();
      expect(hosts, hasLength(1));
      expect(hosts.single.address, '10.0.0.3');
      expect((await book.find('h1'))?.port, 47391);
      await book.forget('h1');
      expect(await book.load(), isEmpty);
    });

    test('toString never shows the token', () {
      const host = SavedRemoteHost(
        hostId: 'h1',
        name: 'PC',
        address: 'a',
        port: 1,
        token: 'secret',
      );
      expect(host.toString().contains('secret'), isFalse);
    });
  });
}

import 'dart:convert';
import 'dart:math';

import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/remote_crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late DateTime now;
  DateTime clock() => now;

  setUp(() {
    now = DateTime(2026, 11, 3, 12);
    SharedPreferences.setMockInitialValues({});
  });

  group('pairing window', () {
    test('no code while closed', () {
      final codes = PairingCodeIssuer(now: clock);
      expect(codes.code, isNull);
      expect(codes.check('123456'), PairCodeCheck.closed);
    });

    test('six digits while open, gone when closed', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(1));
      codes.open();
      expect(codes.code, matches(RegExp(r'^\d{6}$')));
      codes.close();
      expect(codes.code, isNull);
      expect(codes.isOpen, isFalse);
    });

    test('closes after two minutes', () {
      final codes = PairingCodeIssuer(now: clock);
      codes.open();
      final code = codes.code!;
      now = now.add(const Duration(minutes: 1, seconds: 59));
      expect(codes.isOpen, isTrue);
      now = now.add(const Duration(seconds: 1));
      expect(codes.isOpen, isFalse);
      expect(codes.code, isNull);
      expect(codes.check(code), PairCodeCheck.expired);
      expect(codes.check(code), PairCodeCheck.closed);
    });

    test('closeIfExpired drops a window that ran out', () {
      final codes = PairingCodeIssuer(now: clock);
      codes.open();
      var notified = 0;
      codes.addListener(() => notified++);
      codes.closeIfExpired();
      expect(notified, 0);
      now = now.add(const Duration(minutes: 3));
      codes.closeIfExpired();
      expect(notified, 1);
      expect(codes.check('000000'), PairCodeCheck.closed);
    });

    test('single use: the window closes when one device gets in', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(2));
      codes.open();
      final code = codes.code!;
      expect(codes.check(code), PairCodeCheck.ok);
      expect(codes.isOpen, isFalse);
      expect(codes.check(code), PairCodeCheck.closed);
    });

    test('closes after five wrong attempts', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(3));
      codes.open();
      final code = codes.code!;
      final wrong = code == '000000' ? '000001' : '000000';
      for (var i = 0; i < 4; i++) {
        expect(codes.check(wrong), PairCodeCheck.wrong);
        expect(codes.isOpen, isTrue);
      }
      expect(codes.check(wrong), PairCodeCheck.wrong);
      expect(codes.isOpen, isFalse);
      expect(codes.check(code), PairCodeCheck.closed);
    });

    test('"Pair another device" opens a fresh 2-minute window', () {
      final codes = PairingCodeIssuer(now: clock, random: Random(4));
      codes.open();
      codes.check(codes.code!);
      now = now.add(const Duration(minutes: 1));
      codes.open();
      expect(codes.isOpen, isTrue);
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
    String hash(String t) => hashRemoteToken(t);

    test('stores only the hash', () async {
      final store = PairedDeviceStore(now: clock);
      final device = await store.add('Pixel', tokenHash: hash('secret'));
      expect(device!.tokenHash, hash('secret'));
      final raw = (await SharedPreferences.getInstance()).getString(
        PairedDeviceStore.prefKey,
      )!;
      expect(raw.contains('secret'), isFalse);
      expect(raw.contains(hash('secret')), isTrue);
    });

    test('survives a reload', () async {
      final first = PairedDeviceStore(now: clock);
      await first.add('Pixel', tokenHash: hash('a'));
      final second = PairedDeviceStore(now: clock);
      await second.load();
      expect(second.devices.single.name, 'Pixel');
    });

    test('at most five; the sixth is refused', () async {
      final store = PairedDeviceStore(now: clock);
      for (var i = 0; i < 5; i++) {
        expect(await store.add('D$i', tokenHash: hash('$i')), isNotNull);
      }
      expect(store.isFull, isTrue);
      expect(await store.add('D6', tokenHash: hash('6')), isNull);
      expect(store.devices, hasLength(5));
    });

    test('forget, forget all', () async {
      final store = PairedDeviceStore(now: clock);
      final a = await store.add('A', tokenHash: hash('a'));
      await store.add('B', tokenHash: hash('b'));
      expect(await store.forget(a!.id), isTrue);
      expect(await store.forget(a.id), isFalse);
      expect(store.devices.single.name, 'B');
      await store.forgetAll();
      expect(store.devices, isEmpty);
      final raw = (await SharedPreferences.getInstance()).getString(
        PairedDeviceStore.prefKey,
      );
      expect(jsonDecode(raw!), isEmpty);
    });

    test('touch updates last used', () async {
      final store = PairedDeviceStore(now: clock);
      final a = await store.add('A', tokenHash: hash('a'));
      now = now.add(const Duration(hours: 1));
      await store.touch(a!.id);
      expect(store.devices.single.lastSeen, now);
    });

    test('a device unused for 90 days is forgotten', () async {
      final store = PairedDeviceStore(now: clock);
      final old = await store.add('Old', tokenHash: hash('o'));
      now = now.add(const Duration(days: 60));
      await store.add('Recent', tokenHash: hash('r'));
      now = now.add(const Duration(days: 31));
      await store.pruneUnused();
      expect(store.devices.map((d) => d.name), ['Recent']);
      expect(await store.forget(old!.id), isFalse);

      // Also on load.
      final reloaded = PairedDeviceStore(
        now: () => now.add(const Duration(days: 90)),
      );
      await reloaded.load();
      expect(reloaded.devices, isEmpty);
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

  test('secrets are random and url-safe', () {
    final a = newRemoteSecret();
    expect(a, isNot(newRemoteSecret()));
    expect(a, matches(RegExp(r'^[A-Za-z0-9_-]+$')));
    expect(base64Url.decode('$a='), hasLength(32));
  });

  group('RemoteHostBook', () {
    const host = SavedRemoteHost(
      hostId: 'h1',
      name: 'PC',
      address: '10.0.0.2',
      port: 47390,
      token: 't',
    );

    test('saves, replaces by host id and forgets', () async {
      const book = RemoteHostBook();
      await book.save(host);
      await book.save(host.copyWith(address: '10.0.0.3', port: 47391));
      final hosts = await book.load();
      expect(hosts, hasLength(1));
      expect(hosts.single.address, '10.0.0.3');
      expect((await book.find('h1'))?.port, 47391);
      await book.forget('h1');
      expect(await book.load(), isEmpty);
    });

    test('moved keeps the token and changes only the address', () async {
      const book = RemoteHostBook();
      await book.save(host);
      await book.moved('h1', '10.0.0.9', 47392);
      final moved = (await book.find('h1'))!;
      expect(moved.address, '10.0.0.9');
      expect(moved.port, 47392);
      expect(moved.token, 't');
      await book.moved('unknown', '1.2.3.4', 1);
      expect(await book.load(), hasLength(1));
    });

    test('toString never shows the token', () {
      const secret = SavedRemoteHost(
        hostId: 'h1',
        name: 'PC',
        address: 'a',
        port: 1,
        token: 'secret',
      );
      expect(secret.toString().contains('secret'), isFalse);
    });
  });
}

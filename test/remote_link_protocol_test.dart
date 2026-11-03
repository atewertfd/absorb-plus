import 'dart:convert';

import 'package:absorb/services/remote_link/protocol.dart';
import 'package:flutter_test/flutter_test.dart';

T _roundTrip<T extends RemoteMessage>(T message) {
  final decoded = RemoteMessage.decode(message.encode());
  expect(decoded, isA<T>());
  expect(decoded!.toJson(), message.toJson());
  return decoded as T;
}

void main() {
  group('messages round trip', () {
    test('hello, pair, welcome, paired', () {
      expect(_roundTrip(const HelloMessage(token: 'abc')).token, 'abc');
      final pair = _roundTrip(
        const PairMessage(code: '012345', deviceName: 'Pixel 9'),
      );
      expect(pair.code, '012345');
      expect(pair.deviceName, 'Pixel 9');
      expect(pair.version, kRemoteProtocolVersion);
      expect(
        _roundTrip(const WelcomeMessage(hostId: 'h1', hostName: 'PC')).hostName,
        'PC',
      );
      final paired = _roundTrip(
        const PairedMessage(token: 't', hostId: 'h1', hostName: 'PC'),
      );
      expect(paired.token, 't');
      expect(paired.hostId, 'h1');
    });

    test('state keeps every field', () {
      const state = RemotePlayerState(
        itemId: 'li_1',
        title: 'Book',
        author: 'Writer',
        chapterTitle: 'One',
        position: 125.5,
        duration: 3600,
        chapterStart: 100,
        chapterEnd: 200,
        playing: true,
        buffering: true,
        speed: 1.25,
        sleep: RemoteSleepState(mode: RemoteSleepState.time, remaining: 300),
        coverVersion: 3,
        skipBack: 15,
        skipForward: 45,
      );
      final decoded = _roundTrip(const StateMessage(state));
      expect(decoded.state, state);
      expect(decoded.state.hasItem, isTrue);
      expect(decoded.state.hasChapter, isTrue);
    });

    test('an empty state has no item', () {
      final decoded = _roundTrip(const StateMessage(RemotePlayerState.empty));
      expect(decoded.state.hasItem, isFalse);
      expect(decoded.state.sleep.isActive, isFalse);
    });

    test('commands', () {
      _roundTrip(const PlayCommand());
      _roundTrip(const PauseCommand());
      _roundTrip(const ToggleCommand());
      expect(_roundTrip(const SeekCommand(42.5)).position, 42.5);
      expect(_roundTrip(const SkipCommand(-15)).seconds, -15);
      expect(_roundTrip(const ChapterCommand(-1)).delta, -1);
      expect(_roundTrip(const SpeedCommand(1.5)).value, 1.5);
      expect(_roundTrip(const SleepCommand.minutes(30)).minutes, 30);
      expect(
        _roundTrip(const SleepCommand.endOfChapter()).endOfChapter,
        isTrue,
      );
      expect(_roundTrip(const SleepCommand.cancel()).cancel, isTrue);
      expect(
        _roundTrip(const ErrorMessage('nothingLoaded', 'x')).code,
        'nothingLoaded',
      );
    });
  });

  group('decode refuses bad input', () {
    test('malformed, unknown or oversized frames', () {
      expect(RemoteMessage.decode('not json'), isNull);
      expect(RemoteMessage.decode('[1,2]'), isNull);
      expect(RemoteMessage.decode('{"type":"launchMissiles"}'), isNull);
      expect(RemoteMessage.decode('{"notype":1}'), isNull);
      final huge = jsonEncode({'type': 'hello', 'token': 'x' * 9000});
      expect(RemoteMessage.decode(huge), isNull);
    });

    test('out-of-range command values', () {
      expect(RemoteMessage.decode('{"type":"seek","position":-1}'), isNull);
      expect(RemoteMessage.decode('{"type":"seek"}'), isNull);
      expect(RemoteMessage.decode('{"type":"skip","seconds":0}'), isNull);
      expect(RemoteMessage.decode('{"type":"skip","seconds":99999}'), isNull);
      expect(RemoteMessage.decode('{"type":"chapter","delta":2}'), isNull);
      expect(RemoteMessage.decode('{"type":"sleep","minutes":0}'), isNull);
      expect(RemoteMessage.decode('{"type":"sleep"}'), isNull);
      expect(RemoteMessage.decode('{"type":"hello","token":""}'), isNull);
    });

    test('speed is clamped, chapter accepts 1.0', () {
      final speed = RemoteMessage.decode('{"type":"speed","value":12}');
      expect((speed as SpeedCommand).value, SpeedCommand.max);
      final chapter = RemoteMessage.decode('{"type":"chapter","delta":1.0}');
      expect((chapter as ChapterCommand).delta, 1);
    });

    test('device names are one short line', () {
      final pair =
          RemoteMessage.decode(
                jsonEncode({
                  'type': 'pair',
                  'code': '123456',
                  'deviceName': 'Phone\n${'a' * 200}',
                }),
              )
              as PairMessage;
      expect(pair.deviceName.contains('\n'), isFalse);
      expect(pair.deviceName.length, kRemoteMaxNameLength);
    });
  });

  test('discovery announcement round trip', () {
    const a = RemoteHostAnnouncement(hostId: 'h1', name: 'PC', port: 47391);
    final decoded = RemoteHostAnnouncement.decode(a.encode())!;
    expect(decoded.hostId, 'h1');
    expect(decoded.name, 'PC');
    expect(decoded.port, 47391);
    expect(decoded.withAddress('10.0.0.2').address, '10.0.0.2');
    expect(RemoteHostAnnouncement.decode('{"type":"other"}'), isNull);
    expect(
      RemoteHostAnnouncement.decode(
        '{"type":"absorbRemoteHost","hostId":"h","port":70000}',
      ),
      isNull,
    );
  });

  test('pairing link round trip', () {
    const link = RemotePairingLink(
      address: '192.168.1.5',
      port: 47390,
      hostId: 'h1',
      code: '123456',
    );
    final parsed = RemotePairingLink.parse(link.encode())!;
    expect(parsed.address, '192.168.1.5');
    expect(parsed.port, 47390);
    expect(parsed.hostId, 'h1');
    expect(parsed.code, '123456');
    expect(RemotePairingLink.parse('https://example.com'), isNull);
  });

  test('typed addresses', () {
    expect(parseRemoteAddress('192.168.1.5'), (
      host: '192.168.1.5',
      port: kRemoteDefaultPort,
    ));
    expect(parseRemoteAddress(' 192.168.1.5:47391 '), (
      host: '192.168.1.5',
      port: 47391,
    ));
    expect(parseRemoteAddress('my-pc.local:47392'), (
      host: 'my-pc.local',
      port: 47392,
    ));
    expect(parseRemoteAddress('[fd7a::1]:47390'), (
      host: 'fd7a::1',
      port: 47390,
    ));
    expect(parseRemoteAddress('fd7a::1'), (
      host: 'fd7a::1',
      port: kRemoteDefaultPort,
    ));
    expect(parseRemoteAddress(''), isNull);
    expect(parseRemoteAddress('pc:notaport'), isNull);
    expect(parseRemoteAddress('pc:70000'), isNull);
    expect(parseRemoteAddress('http://pc/'), isNull);
  });
}

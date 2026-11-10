import 'dart:convert';

import 'package:absorb/services/remote_link/protocol.dart';
import 'package:flutter_test/flutter_test.dart';

T _roundTrip<T extends RemoteMessage>(T message) {
  final decoded = RemoteMessage.decode(
    message.encode(),
    maxLength: kRemoteMaxHostFrameLength,
  );
  expect(decoded, isA<T>());
  expect(decoded!.toJson(), message.toJson());
  return decoded as T;
}

void main() {
  group('messages round trip', () {
    test('login and pairing messages', () {
      expect(_roundTrip(const HelloMessage(nonce: 'n1')).nonce, 'n1');
      final challenge = _roundTrip(
        const ChallengeMessage(hostId: 'h1', nonce: 'n2'),
      );
      expect(challenge.hostId, 'h1');
      expect(challenge.nonce, 'n2');
      expect(_roundTrip(const AuthMessage('proof')).proof, 'proof');
      final pair = _roundTrip(
        const PairMessage(code: '012345', deviceName: 'Pixel 9', key: 'k'),
      );
      expect(pair.code, '012345');
      expect(pair.deviceName, 'Pixel 9');
      expect(pair.key, 'k');
      expect(pair.version, kRemoteProtocolVersion);
      _roundTrip(const PairWaitMessage());
      final welcome = _roundTrip(
        const WelcomeMessage(hostId: 'h1', hostName: 'PC', proof: 'p'),
      );
      expect(welcome.hostName, 'PC');
      expect(welcome.proof, 'p');
      final paired = _roundTrip(
        const PairedMessage(hostId: 'h1', hostName: 'PC', key: 'hk'),
      );
      expect(paired.key, 'hk');
      expect(paired.toJson().containsKey('token'), isFalse);
      _roundTrip(const PingMessage());
      _roundTrip(const PongMessage());
      expect(
        _roundTrip(const NoticeMessage(RemoteNoticeCode.bookmarkAdded)).code,
        RemoteNoticeCode.bookmarkAdded,
      );
    });

    test('chapters and Continue listening', () {
      final chapters = _roundTrip(
        const ChaptersMessage(
          itemId: 'li_1',
          chapters: [
            RemoteChapter(title: 'One', start: 0, end: 100),
            RemoteChapter(title: 'Two', start: 100, end: 250.5),
          ],
        ),
      );
      expect(chapters.chapters[1].end, 250.5);
      final recent = _roundTrip(
        const RecentMessage([
          RemoteRecentItem(id: 'a', title: 'A', author: 'W', progress: 0.4),
        ]),
      );
      expect(recent.items.single.progress, 0.4);
    });

    test('long lists are capped', () {
      final many = ChaptersMessage(
        itemId: 'li_1',
        chapters: [
          for (var i = 0; i < RemoteChapter.maxCount + 50; i++)
            RemoteChapter(title: 'c$i', start: i * 1.0, end: i + 1.0),
        ],
      );
      final decoded =
          RemoteMessage.decode(
                many.encode(),
                maxLength: kRemoteMaxHostFrameLength,
              )
              as ChaptersMessage;
      expect(decoded.chapters, hasLength(RemoteChapter.maxCount));
      final items = RecentMessage([
        for (var i = 0; i < 40; i++) RemoteRecentItem(id: 'i$i', title: 't'),
      ]);
      expect(
        (RemoteMessage.decode(items.encode()) as RecentMessage).items,
        hasLength(RemoteRecentItem.maxCount),
      );
    });

    test('new commands', () {
      _roundTrip(const StopCommand());
      expect(_roundTrip(const VolumeCommand(0.4)).value, 0.4);
      expect(_roundTrip(const MuteCommand(true)).muted, isTrue);
      expect(_roundTrip(const BookmarkCommand('nice')).note, 'nice');
      expect(_roundTrip(const BookmarkCommand()).note, '');
      _roundTrip(const RecentRequest());
      expect(_roundTrip(const PlayItemCommand('li_9')).itemId, 'li_9');
      expect(const VolumeCommand(1).needsItem, isFalse);
      expect(const PlayItemCommand('x').needsItem, isFalse);
      expect(const RecentRequest().needsItem, isFalse);
      expect(const StopCommand().needsItem, isTrue);
      final loud = RemoteMessage.decode('{"type":"volume","value":3}');
      expect((loud as VolumeCommand).value, 1);
      expect(RemoteMessage.decode('{"type":"mute","muted":"yes"}'), isNull);
      expect(
        RemoteMessage.decode(
          jsonEncode({'type': 'bookmark', 'note': 'x' * 501}),
        ),
        isNull,
      );
      expect(RemoteMessage.decode('{"type":"playItem","itemId":""}'), isNull);
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
      expect(
        RemoteMessage.decode(jsonEncode({'type': 'hello', 'nonce': 'x' * 200})),
        isNull,
      );
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
                  'key': 'k',
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

  group('pairing link', () {
    const link = RemotePairingLink(
      address: '192.168.1.5',
      port: 47390,
      hostId: 'h1',
      code: '123456',
    );

    test('the QR is the https page with everything in the fragment', () {
      final text = link.encode();
      expect(
        text,
        'https://atewertfd.github.io/absorb-plus/pair.html'
        '#h=192.168.1.5&p=47390&c=123456&id=h1',
      );
      final uri = Uri.parse(text);
      expect(uri.query, isEmpty);
      final parsed = RemotePairingLink.parse(text)!;
      expect(parsed.address, '192.168.1.5');
      expect(parsed.port, 47390);
      expect(parsed.hostId, 'h1');
      expect(parsed.code, '123456');
    });

    test('the app link the page opens', () {
      final text = link.encodeAppLink();
      expect(text, startsWith('absorb://remote-pair?'));
      expect(RemotePairingLink.isAppLink(Uri.parse(text)), isTrue);
      expect(RemotePairingLink.parse(text)!.code, '123456');
      expect(
        RemotePairingLink.isAppLink(Uri.parse('absorb://setup?x=1')),
        isFalse,
      );
    });

    test('bad links are refused', () {
      expect(RemotePairingLink.parse('https://example.com'), isNull);
      expect(
        RemotePairingLink.parse('absorb://remote-pair?h=1.2.3.4&p=99999&id=h'),
        isNull,
      );
      expect(
        RemotePairingLink.parse('absorb://remote-pair?h=1.2.3.4&p=1&id=h&c=12'),
        isNull,
      );
      expect(
        RemotePairingLink.parse('absorb://remote-pair?h=a%20b&p=1&id=h'),
        isNull,
      );
      expect(RemotePairingLink.parse('absorb://remote-pair?p=1&id=h'), isNull);
    });
  });

  test('the QR picks a home-network address', () {
    expect(preferredRemoteAddress(const []), isNull);
    expect(
      preferredRemoteAddress(const ['100.64.0.3', '192.168.1.5', '10.0.0.2']),
      '192.168.1.5',
    );
    expect(
      preferredRemoteAddress(const ['100.64.0.3', '10.0.0.2']),
      '10.0.0.2',
    );
    expect(preferredRemoteAddress(const ['100.64.0.3']), '100.64.0.3');
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

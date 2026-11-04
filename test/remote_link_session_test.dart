import 'dart:async';
import 'dart:convert';

import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_client.dart';
import 'package:absorb/services/remote_link/remote_crypto.dart';
import 'package:absorb/services/remote_link/remote_host.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The host and a remote over in-memory links on a fake clock: pairing with
/// the PC's approval, the mutual login, sealed frames, the heartbeat,
/// reconnecting and following a computer that moved. Deterministic: no
/// sockets, no real time.

class _Rig {
  _Rig(this.async) {
    host = RemoteHost(
      player: () => player,
      hostId: 'host-1',
      hostName: 'Test PC',
      supported: true,
      stateDebounce: Duration.zero,
      listenOnAccountChange: false,
      approver: (request) {
        asked.add(request.deviceName);
        return answer?.call(request) ?? Future.value(true);
      },
    );
    unawaited(host.startWithoutSocketsForTest());
    async.flushMicrotasks();
  }

  final FakeAsync async;
  final player = FakePlayer();
  late final RemoteHost host;
  final asked = <String>[];
  Future<bool> Function(RemotePairRequest request)? answer;

  /// Every link opened, both ends: (remote end, host end).
  final links = <(MemoryChannel, MemoryChannel)>[];

  /// Addresses that don't answer.
  final down = <String>{};

  Future<RemoteChannel> dial(String address, int port, Duration timeout) async {
    if (down.contains(address)) throw StateError('unreachable');
    final (remote, hostEnd) = MemoryChannel.pair();
    links.add((remote, hostEnd));
    host.acceptForTest(hostEnd, address);
    return remote;
  }

  /// Every frame either side sent so far.
  Iterable<String> get wire sync* {
    for (final (a, b) in links) {
      yield* a.sent;
      yield* b.sent;
    }
  }

  SavedRemoteHost pair({String code = '', String name = 'Pixel'}) {
    if (host.codes.code == null) host.openPairing();
    RemotePairResult? result;
    unawaited(
      dial('10.0.0.5', 47390, Duration.zero)
          .then(
            (channel) => pairOver(
              channel,
              address: '10.0.0.5',
              port: 47390,
              code: code.isEmpty ? host.codes.code! : code,
              deviceName: name,
            ),
          )
          .then((r) => result = r),
    );
    async.flushMicrotasks();
    expect(result?.error, isNull);
    return result!.host!;
  }

  RemoteClient client(
    SavedRemoteHost saved, {
    RemoteLocate? locate,
    void Function(SavedRemoteHost)? onMoved,
  }) => RemoteClient(
    saved,
    dial: dial,
    locate: locate,
    onMoved: onMoved,
    backoff: (_) => const Duration(seconds: 1),
    fetchCover: (_, __, ___) async => null,
  );
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('pairing asks the PC, derives the key, and never sends a token', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair(name: 'Pixel 9');
      expect(rig.asked, ['Pixel 9']);
      expect(saved.hostId, 'host-1');
      expect(saved.name, 'Test PC');
      final device = rig.host.devices.devices.single;
      expect(device.name, 'Pixel 9');
      expect(device.tokenHash, hashRemoteToken(saved.token));
      // The window closed with that one use.
      expect(rig.host.codes.isOpen, isFalse);

      final client = rig.client(saved);
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.connected);
      expect(rig.host.connections.value.single.deviceName, 'Pixel 9');

      // Neither the token nor its hash ever crossed the wire.
      for (final frame in rig.wire) {
        expect(frame.contains(saved.token), isFalse);
        expect(frame.contains(device.tokenHash), isFalse);
      }
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('Deny, or no answer in 60 s, refuses the device', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      rig.answer = (_) => Future.value(false);
      rig.host.openPairing();
      RemotePairResult? denied;
      unawaited(
        rig
            .dial('10.0.0.5', 1, Duration.zero)
            .then(
              (c) => pairOver(
                c,
                address: '10.0.0.5',
                port: 1,
                code: rig.host.codes.code!,
                deviceName: 'X',
              ),
            )
            .then((r) => denied = r),
      );
      async.flushMicrotasks();
      expect(denied?.error, RemoteErrorCode.pairDenied);
      expect(rig.host.devices.devices, isEmpty);

      // Nobody answers: refused after 60 s.
      final never = Completer<bool>();
      rig.answer = (_) => never.future;
      rig.host.openPairing();
      var waiting = false;
      RemotePairResult? timedOut;
      unawaited(
        rig
            .dial('10.0.0.5', 1, Duration.zero)
            .then(
              (c) => pairOver(
                c,
                address: '10.0.0.5',
                port: 1,
                code: rig.host.codes.code!,
                deviceName: 'Y',
                onWaiting: () => waiting = true,
              ),
            )
            .then((r) => timedOut = r),
      );
      async.flushMicrotasks();
      expect(waiting, isTrue);
      async.elapse(const Duration(seconds: 59));
      expect(timedOut, isNull);
      async.elapse(const Duration(seconds: 2));
      expect(timedOut?.error, RemoteErrorCode.pairDenied);
      expect(rig.host.devices.devices, isEmpty);
    });
  });

  test('no pairing without an open window, and at most five devices', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      RemotePairResult? closed;
      unawaited(
        rig
            .dial('10.0.0.5', 1, Duration.zero)
            .then(
              (c) => pairOver(
                c,
                address: '10.0.0.5',
                port: 1,
                code: '123456',
                deviceName: 'X',
              ),
            )
            .then((r) => closed = r),
      );
      async.flushMicrotasks();
      expect(closed?.error, RemoteErrorCode.pairingClosed);

      for (var i = 0; i < 5; i++) {
        rig.pair(name: 'D$i');
      }
      // Full: no window opens, and a pair attempt is told why.
      rig.host.openPairing();
      expect(rig.host.codes.isOpen, isFalse);
      rig.host.codes.open();
      RemotePairResult? full;
      unawaited(
        rig
            .dial('10.0.0.5', 1, Duration.zero)
            .then(
              (c) => pairOver(
                c,
                address: '10.0.0.5',
                port: 1,
                code: rig.host.codes.code!,
                deviceName: 'D6',
              ),
            )
            .then((r) => full = r),
      );
      async.flushMicrotasks();
      expect(full?.error, RemoteErrorCode.tooManyDevices);
      expect(rig.host.devices.devices, hasLength(5));
    });
  });

  test('commands, chapters, Continue listening and notices', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      rig.player.current = fakePlaying;
      rig.player.chapterList = const [
        RemoteChapter(title: 'One', start: 0, end: 100),
        RemoteChapter(title: 'Two', start: 100, end: 400),
      ];
      rig.player.recent = const [
        RemoteRecentItem(id: 'li_2', title: 'Next', progress: 0.3),
      ];
      final client = rig.client(saved);
      final events = <RemoteLinkEvent>[];
      client.events.listen(events.add);
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.state, fakePlaying);
      expect(client.chapters.map((c) => c.title), ['One', 'Two']);

      client.send(const VolumeCommand(0.5));
      client.send(const MuteCommand(true));
      client.send(const StopCommand());
      client.send(const BookmarkCommand('good bit'));
      client.send(const SeekCommand(100));
      client.requestRecent();
      async.flushMicrotasks();
      expect(client.recent!.single.title, 'Next');
      client.send(const PlayItemCommand('li_2'));
      client.send(const PlayItemCommand('not-offered'));
      async.flushMicrotasks();
      expect(rig.player.commands, [
        'volume 0.5',
        'mute true',
        'stop',
        'bookmark good bit',
        'seek 100.0',
        'playItem li_2',
      ]);
      expect(events.map((e) => e.code), [
        RemoteNoticeCode.bookmarkAdded,
        RemoteErrorCode.notFound,
      ]);

      // A new book: its chapters follow.
      rig.player.chapterList = const [
        RemoteChapter(title: 'Only', start: 0, end: 10),
      ];
      rig.player.current = const RemotePlayerState(
        itemId: 'li_2',
        title: 'Next',
      );
      async.elapse(const Duration(seconds: 1));
      expect(client.state?.itemId, 'li_2');
      expect(client.chapters.single.title, 'Only');
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('a tampered or replayed frame drops the link', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      rig.player.current = fakePlaying;
      final client = rig.client(saved);
      unawaited(client.connect());
      async.flushMicrotasks();
      client.send(const PauseCommand());
      async.flushMicrotasks();
      expect(rig.player.commands, ['pause']);
      final (remote, hostEnd) = rig.links.last;

      // Replaying the last sealed command.
      hostEnd.inject(remote.sent.last);
      async.flushMicrotasks();
      expect(rig.player.commands, ['pause']);
      expect(hostEnd.isClosed, isTrue);
      expect(rig.host.connections.value, isEmpty);

      // It reconnects on a fresh link; a forged frame goes the same way.
      async.elapse(const Duration(seconds: 1));
      expect(client.phase, RemoteLinkPhase.connected);
      client.send(const PlayCommand());
      async.flushMicrotasks();
      expect(rig.player.commands, ['pause', 'play']);
      final (remote2, host2) = rig.links.last;
      final frame = jsonDecode(remote2.sent.last) as Map;
      frame['s'] = (frame['s'] as int) + 1;
      frame['m'] = const SkipCommand(3600).encode();
      host2.inject(jsonEncode(frame));
      async.flushMicrotasks();
      expect(rig.player.commands, ['pause', 'play']);
      expect(host2.isClosed, isTrue);
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('a dead link is noticed within 10 s on both sides, then resyncs', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      rig.player.current = fakePlaying;
      final client = rig.client(saved);
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.connected);

      // Pings keep a quiet link alive.
      async.elapse(const Duration(seconds: 30));
      expect(client.phase, RemoteLinkPhase.connected);
      expect(rig.host.connections.value, hasLength(1));

      // The PC sleeps: the wire goes silent, nobody is told.
      rig.down.add('10.0.0.5');
      rig.links.last.$1.cut();
      async.elapse(const Duration(seconds: 8));
      expect(client.phase, RemoteLinkPhase.reconnecting);
      expect(client.state, isNull, reason: 'no stale controls');
      async.elapse(const Duration(seconds: 2));
      expect(rig.host.connections.value, isEmpty);

      // It wakes with something else playing: a full resync.
      rig.player.current = const RemotePlayerState(
        itemId: 'li_9',
        title: 'Other',
        position: 42,
      );
      rig.down.clear();
      async.elapse(const Duration(seconds: 11));
      expect(client.phase, RemoteLinkPhase.connected);
      expect(client.state?.itemId, 'li_9');
      expect(client.state?.position, 42);
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('reconnectNow skips the wait', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      final client = RemoteClient(
        saved,
        dial: rig.dial,
        backoff: (_) => const Duration(minutes: 5),
        fetchCover: (_, __, ___) async => null,
      );
      rig.down.add('10.0.0.5');
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.connecting);
      rig.down.clear();
      client.reconnectNow();
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.connected);
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('follows the computer to a new address once it proves itself', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      SavedRemoteHost? moved;
      final client = rig.client(
        saved,
        locate: (id) async =>
            id == 'host-1' ? (address: '10.0.0.77', port: 47391) : null,
        onMoved: (h) => moved = h,
      );
      rig.down.add('10.0.0.5');
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.connecting);
      async.elapse(const Duration(seconds: 3));
      expect(client.phase, RemoteLinkPhase.connected);
      expect(client.host.address, '10.0.0.77');
      expect(moved?.address, '10.0.0.77');
      expect(moved?.port, 47391);
      expect(moved?.token, saved.token);
      client.dispose();
      async.flushMicrotasks();
    });
  });

  test('another computer at the address never gets a proof', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      final impostor = saved.copyWith();
      final sent = <String>[];
      final client = RemoteClient(
        impostor,
        backoff: (_) => const Duration(seconds: 1),
        fetchCover: (_, __, ___) async => null,
        dial: (address, port, timeout) async {
          final (remote, fake) = MemoryChannel.pair();
          fake.frames.listen((f) {
            sent.add(f as String);
            final m = RemoteMessage.decode(f);
            if (m is HelloMessage) {
              // Claims the right id, then can't prove it knows the key.
              fake.send(
                ChallengeMessage(
                  hostId: 'host-1',
                  nonce: newRemoteSecret(),
                ).encode(),
              );
            } else if (m is AuthMessage) {
              fake.send(
                const WelcomeMessage(
                  hostId: 'host-1',
                  hostName: 'Evil',
                  proof: 'made-up',
                ).encode(),
              );
            }
          });
          return remote;
        },
      );
      unawaited(client.connect());
      async.flushMicrotasks();
      expect(client.phase, isNot(RemoteLinkPhase.connected));
      expect(client.state, isNull);
      expect(client.hostName, 'Test PC');
      // The proof it saw is useless elsewhere: it is bound to its own nonces.
      expect(sent.any((f) => f.contains(saved.token)), isFalse);

      // A computer with another id gets nothing past hello.
      final other = <String>[];
      final client2 = RemoteClient(
        saved,
        backoff: (_) => const Duration(hours: 1),
        fetchCover: (_, __, ___) async => null,
        dial: (address, port, timeout) async {
          final (remote, fake) = MemoryChannel.pair();
          fake.frames.listen((f) {
            other.add(f as String);
            if (RemoteMessage.decode(f) is HelloMessage) {
              fake.send(
                ChallengeMessage(
                  hostId: 'someone-else',
                  nonce: newRemoteSecret(),
                ).encode(),
              );
            }
          });
          return remote;
        },
      );
      unawaited(client2.connect());
      async.flushMicrotasks();
      expect(other.map((f) => RemoteMessage.decode(f)?.type), ['hello']);
      expect(client2.phase, RemoteLinkPhase.connecting);
      client.dispose();
      client2.dispose();
      async.flushMicrotasks();
    });
  });

  test('forget all drops every remote and its key', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      final saved = rig.pair();
      final client = rig.client(saved);
      unawaited(client.connect());
      async.flushMicrotasks();
      unawaited(rig.host.forgetAll());
      async.flushMicrotasks();
      expect(client.phase, RemoteLinkPhase.closed);
      expect(client.problem, RemoteLinkProblem.unauthorized);
      expect(rig.host.devices.devices, isEmpty);
      client.dispose();
      async.flushMicrotasks();
    });
  });
}

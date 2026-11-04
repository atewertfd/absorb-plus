import 'dart:async';

import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/player_facade.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:flutter/foundation.dart';

/// Shared fakes for the phone-remote tests: an in-memory link, a fake player
/// behind the host, and fake host/client/connector for the screens.

/// One end of an in-memory link. [pair] makes both ends.
class MemoryChannel implements RemoteChannel {
  MemoryChannel._();

  static (MemoryChannel, MemoryChannel) pair() {
    final a = MemoryChannel._();
    final b = MemoryChannel._();
    a._peer = b;
    b._peer = a;
    return (a, b);
  }

  late MemoryChannel _peer;
  final _in = StreamController<Object?>();
  bool _closed = false;
  int? _closeCode;

  /// Everything this end sent.
  final sent = <String>[];

  /// The wire went away (sleep, Wi-Fi gone): nothing arrives, nobody is told.
  bool _dead = false;

  @override
  Stream<Object?> get frames => _in.stream;

  @override
  void send(String text) {
    if (_closed || _dead) return;
    sent.add(text);
    if (!_peer._closed) _peer._in.add(text);
  }

  @override
  Future<void> close([int? code, String? reason]) async {
    if (_closed) return;
    _closed = true;
    _closeCode = code;
    unawaited(_in.close());
    if (!_dead && !_peer._closed) {
      _peer._closed = true;
      _peer._closeCode = code;
      unawaited(_peer._in.close());
    }
  }

  @override
  int? get closeCode => _closeCode;

  bool get isClosed => _closed;

  /// Tests: a frame arrives at this end as if the peer had sent it.
  void inject(String text) {
    if (!_closed) _in.add(text);
  }

  /// Tests: the network vanishes under both ends.
  void cut() {
    _dead = true;
    _peer._dead = true;
  }
}

/// The player behind the host: records commands.
class FakePlayer extends ChangeNotifier implements RemotePlayerFacade {
  RemotePlayerState _state = RemotePlayerState.empty;
  List<RemoteChapter> _chapters = const [];
  Uint8List? coverBytes;
  final Map<String, Uint8List> recentCovers = {};
  List<RemoteRecentItem> recent = const [];
  bool bookmarkOk = true;
  bool playItemOk = true;
  final commands = <String>[];

  set current(RemotePlayerState value) {
    _state = value;
    notifyListeners();
  }

  set chapterList(List<RemoteChapter> value) {
    _chapters = List.unmodifiable(value);
    notifyListeners();
  }

  @override
  RemotePlayerState get state => _state;

  @override
  List<RemoteChapter> get chapters => _chapters;

  @override
  Future<Uint8List?> loadCover([String? itemId]) async =>
      itemId == null ? coverBytes : recentCovers[itemId];

  void _log(String c) => commands.add(c);

  @override
  Future<void> play() async => _log('play');
  @override
  Future<void> pause() async => _log('pause');
  @override
  Future<void> toggle() async => _log('toggle');
  @override
  Future<void> stop() async => _log('stop');
  @override
  Future<void> seek(double seconds) async => _log('seek $seconds');
  @override
  Future<void> skip(int seconds) async => _log('skip $seconds');
  @override
  Future<void> chapter(int delta) async => _log('chapter $delta');
  @override
  Future<void> setSpeed(double speed) async => _log('speed $speed');
  @override
  Future<void> sleepFor(int minutes) async => _log('sleep $minutes');
  @override
  Future<void> sleepAtEndOfChapter() async => _log('sleep chapter');
  @override
  Future<void> cancelSleep() async => _log('sleep cancel');
  @override
  Future<void> setVolume(double volume) async => _log('volume $volume');
  @override
  Future<void> setMuted(bool muted) async => _log('mute $muted');
  @override
  Future<bool> addBookmark(String note) async {
    _log('bookmark $note');
    return bookmarkOk;
  }

  @override
  Future<List<RemoteRecentItem>> recentItems() async => recent;
  @override
  Future<bool> playItem(String itemId) async {
    _log('playItem $itemId');
    return playItemOk;
  }
}

const fakePlaying = RemotePlayerState(
  itemId: 'li_1',
  title: 'The Book',
  author: 'Writer',
  chapterTitle: 'Chapter 2',
  position: 150,
  duration: 3600,
  chapterStart: 100,
  chapterEnd: 400,
  playing: true,
  speed: 1.25,
  skipBack: 15,
  skipForward: 30,
  coverVersion: 1,
  volume: 0.8,
);

const fakeSavedHost = SavedRemoteHost(
  hostId: 'h1',
  name: 'Test PC',
  address: '10.0.0.2',
  port: 47390,
  token: 't',
);

/// A link for the screens: state is set by the test.
class FakeClient extends ChangeNotifier implements RemoteLinkClient {
  FakeClient({
    this.phase = RemoteLinkPhase.connected,
    this.state,
    this.problem = RemoteLinkProblem.none,
    this.chapters = const [],
  });

  @override
  RemoteLinkPhase phase;
  @override
  RemoteLinkProblem problem;
  @override
  RemotePlayerState? state;
  @override
  List<RemoteChapter> chapters;
  @override
  List<RemoteRecentItem>? recent;
  @override
  Uint8List? cover;
  @override
  String? lastError;
  @override
  SavedRemoteHost get host => fakeSavedHost;
  @override
  String get hostName => 'Test PC';

  final _events = StreamController<RemoteLinkEvent>.broadcast();
  @override
  Stream<RemoteLinkEvent> get events => _events.stream;

  final sent = <RemoteCommand>[];
  int connects = 0;
  int reconnects = 0;
  int recentRequests = 0;
  bool disposed = false;

  /// What [requestRecent] answers with (null: no answer yet).
  List<RemoteRecentItem>? recentAnswer;

  void update(void Function(FakeClient c) change) {
    change(this);
    notifyListeners();
  }

  void emit(RemoteLinkEvent event) => _events.add(event);

  @override
  Future<void> connect() async => connects++;
  @override
  void reconnectNow() => reconnects++;
  @override
  void send(RemoteCommand command) => sent.add(command);
  @override
  void requestRecent() {
    recentRequests++;
    if (recentAnswer != null) {
      recent = recentAnswer;
      scheduleMicrotask(notifyListeners);
    }
  }

  @override
  Future<Uint8List?> recentCover(String itemId) async => null;
  @override
  Future<void> close() async {}
  @override
  void dispose() {
    disposed = true;
    unawaited(_events.close());
    super.dispose();
  }
}

class FakeConnector implements RemoteLinkConnector {
  FakeConnector(this.client, {this.wait = false});
  final FakeClient client;

  /// Answer `pairWait` first and hold until [allow] completes.
  final bool wait;
  final allow = Completer<bool>();
  final pairCodes = <String>[];

  @override
  bool get isSupported => true;

  @override
  Stream<RemoteHostAnnouncement> discover({
    Duration timeout = const Duration(seconds: 2),
  }) => Stream.fromIterable(const [
    RemoteHostAnnouncement(
      hostId: 'h1',
      name: 'Test PC',
      port: 47390,
      address: '10.0.0.2',
    ),
  ]);

  @override
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
    VoidCallback? onWaiting,
  }) async {
    pairCodes.add(code);
    if (code != '123456') {
      return const RemotePairResult.failed(RemoteErrorCode.badCode);
    }
    if (wait) {
      onWaiting?.call();
      if (!await allow.future) {
        return const RemotePairResult.failed(RemoteErrorCode.pairDenied);
      }
    }
    return RemotePairResult.paired(
      SavedRemoteHost(
        hostId: 'h1',
        name: 'Test PC',
        address: address,
        port: port,
        token: 'tok',
      ),
    );
  }

  @override
  RemoteLinkClient open(SavedRemoteHost host) => client;

  @override
  Future<String> deviceName() async => 'Test phone';
}

class FakeHost implements RemoteHostController {
  final _status = ValueNotifier(const RemoteHostStatus());
  final _connections = ValueNotifier(const <RemoteConnectionInfo>[]);
  final enabledCalls = <bool>[];
  final keepOnCalls = <bool>[];
  final forgotten = <String>[];
  final disconnected = <int>[];
  int forgetAllCalls = 0;
  int pairingOpened = 0;

  @override
  bool get isSupported => true;
  @override
  ValueListenable<RemoteHostStatus> get status => _status;
  @override
  ValueListenable<List<RemoteConnectionInfo>> get connections => _connections;
  @override
  final PairingCodeIssuer codes = PairingCodeIssuer();
  @override
  final PairedDeviceStore devices = PairedDeviceStore();
  @override
  RemotePairApprover? approver;

  @override
  Future<void> start() async {}
  @override
  Future<void> setEnabled(bool enabled) async {
    enabledCalls.add(enabled);
    _status.value = enabled
        ? const RemoteHostStatus(
            enabled: true,
            running: true,
            port: 47390,
            addresses: ['100.64.0.3', '192.168.1.5'],
            hostId: 'h1',
            hostName: 'Test PC',
            discovery: true,
          )
        : const RemoteHostStatus();
    if (enabled) {
      codes.open();
    } else {
      codes.close();
    }
  }

  @override
  Future<void> setKeepOn(bool keepOn) async {
    keepOnCalls.add(keepOn);
    _status.value = _status.value.copyWith(keepOn: keepOn);
  }

  @override
  void openPairing() {
    pairingOpened++;
    codes.open();
  }

  @override
  Future<void> refreshAddresses() async {}
  @override
  Future<void> signedOut() async {}
  @override
  void shutdownForExit() {}
  @override
  Future<void> disconnect(int connectionId) async =>
      disconnected.add(connectionId);
  @override
  Future<void> forget(String deviceId) async {
    forgotten.add(deviceId);
    await devices.forget(deviceId);
  }

  @override
  Future<void> forgetAll() async {
    forgetAllCalls++;
    await devices.forgetAll();
  }

  void connect(RemoteConnectionInfo info) => _connections.value = [info];
}

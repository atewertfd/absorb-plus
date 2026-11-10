import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'protocol.dart';
import 'remote_channel_io.dart';
import 'remote_crypto.dart';
import 'remote_link_types.dart';

RemoteLinkConnector get remoteLinkConnector => const IoRemoteLinkConnector();

/// Opens a link to a host (a WebSocket in the app, in-memory in tests).
typedef RemoteDial =
    Future<RemoteChannel> Function(String address, int port, Duration timeout);

/// Looks for a paired computer on the network by its host id.
typedef RemoteLocate =
    Future<({String address, int port})?> Function(String hostId);

/// Fetches a cover from the host with this connection's ticket; [itemId]
/// for one of the host's Continue Listening books.
typedef RemoteCoverFetch =
    Future<Uint8List?> Function(
      SavedRemoteHost host,
      String ticket,
      String? itemId,
    );

/// Phone remote, the remote side (fork, dart:io): finds hosts by UDP
/// broadcast, pairs with the host's code, and opens [RemoteClient] links.
class IoRemoteLinkConnector implements RemoteLinkConnector {
  const IoRemoteLinkConnector({
    this.discoveryPort = kRemoteDefaultPort,
    this.discoveryTargets,
    this.connectTimeout = const Duration(seconds: 5),
    this.replyTimeout = const Duration(seconds: 10),
    this.approvalTimeout = const Duration(seconds: 75),
    this.book = const RemoteHostBook(),
  });

  final int discoveryPort;

  /// Tests: probe these instead of the LAN broadcast addresses.
  final List<InternetAddress>? discoveryTargets;
  final Duration connectTimeout;

  /// How long the host may take to answer the code, and then (once it is
  /// asking its user) to answer at all.
  final Duration replyTimeout;
  final Duration approvalTimeout;

  /// Where a computer that moved is remembered.
  final RemoteHostBook book;

  @override
  bool get isSupported =>
      !kIsWeb && (Platform.isAndroid || Platform.isWindows || Platform.isLinux);

  @override
  Stream<RemoteHostAnnouncement> discover({
    Duration timeout = const Duration(seconds: 2),
  }) {
    final controller = StreamController<RemoteHostAnnouncement>();
    RawDatagramSocket? socket;
    Timer? resend;
    Timer? end;
    final seen = <String>{};
    var finished = false;

    Future<void> finish() async {
      if (finished) return;
      finished = true;
      resend?.cancel();
      end?.cancel();
      socket?.close();
      await controller.close();
    }

    controller.onListen = () async {
      try {
        final s = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
        if (finished) {
          s.close();
          return;
        }
        socket = s;
        s.broadcastEnabled = true;
        s.listen((event) {
          if (event != RawSocketEvent.read) return;
          final dg = s.receive();
          if (dg == null || finished) return;
          String text;
          try {
            text = utf8.decode(dg.data);
          } catch (_) {
            return; // Not text: not an answer.
          }
          final found = RemoteHostAnnouncement.decode(text);
          if (found == null || !seen.add(found.hostId)) return;
          controller.add(found.withAddress(dg.address.address));
        }, onError: (Object _) {});
        final targets = discoveryTargets ?? await _broadcastTargets();
        final probe = utf8.encode(kRemoteDiscoverMessage);
        void send() {
          for (final t in targets) {
            try {
              s.send(probe, t, discoveryPort);
            } catch (_) {
              // An interface that can't broadcast; the others still can.
            }
          }
        }

        // Datagrams get lost: ask three times over the window.
        send();
        resend = Timer.periodic(
          Duration(milliseconds: timeout.inMilliseconds ~/ 3),
          (_) => send(),
        );
        end = Timer(timeout, finish);
      } catch (e) {
        debugPrint('[RemoteLink] Discovery failed: ${e.runtimeType}');
        await finish();
      }
    };
    controller.onCancel = finish;
    return controller.stream;
  }

  /// The limited broadcast plus each interface's /24 broadcast (some
  /// systems send 255.255.255.255 out of one interface only).
  static Future<List<InternetAddress>> _broadcastTargets() async {
    final targets = <String>{'255.255.255.255'};
    try {
      for (final i in await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      )) {
        for (final a in i.addresses) {
          if (a.isLinkLocal) continue;
          final parts = a.address.split('.');
          if (parts.length == 4) targets.add('${parts.take(3).join('.')}.255');
        }
      }
    } catch (_) {
      // No interface list here: only the targets added above are tried.
    }
    return [for (final t in targets) InternetAddress(t)];
  }

  @override
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
    VoidCallback? onWaiting,
  }) async {
    final RemoteChannel channel;
    try {
      channel = await connectRemoteChannel(address, port, connectTimeout);
    } catch (_) {
      return const RemotePairResult.failed(RemotePairResult.unreachable);
    }
    return pairOver(
      channel,
      address: address,
      port: port,
      code: code,
      deviceName: deviceName,
      onWaiting: onWaiting,
      replyTimeout: replyTimeout,
      approvalTimeout: approvalTimeout,
    );
  }

  @override
  RemoteLinkClient open(SavedRemoteHost host) => RemoteClient(
    host,
    locate: _locate,
    onMoved: (moved) =>
        unawaited(book.moved(moved.hostId, moved.address, moved.port)),
  );

  Future<({String address, int port})?> _locate(String hostId) async {
    try {
      await for (final found in discover()) {
        if (found.hostId == hostId) {
          return (address: found.address, port: found.port);
        }
      }
    } catch (e) {
      debugPrint('[RemoteLink] Looking for the computer failed: $e');
    }
    return null;
  }

  @override
  Future<String> deviceName() async {
    try {
      if (Platform.isAndroid) {
        final info = await DeviceInfoPlugin().androidInfo;
        final model = info.model.trim();
        final maker = info.manufacturer.trim();
        final name = model.toLowerCase().startsWith(maker.toLowerCase())
            ? model
            : '$maker $model';
        return cleanRemoteName(name);
      }
      return cleanRemoteName(Platform.localHostname);
    } catch (_) {
      return 'Absorb'; // No device name available: a plain fallback.
    }
  }
}

/// Pairing over an open [channel]: the code and this side's half of the
/// key exchange go out; the host answers `pairWait` while its user decides,
/// then `paired` with its half. The token is worked out here and never sent.
@visibleForTesting
Future<RemotePairResult> pairOver(
  RemoteChannel channel, {
  required String address,
  required int port,
  required String code,
  required String deviceName,
  VoidCallback? onWaiting,
  Duration replyTimeout = const Duration(seconds: 10),
  Duration approvalTimeout = const Duration(seconds: 75),
}) async {
  final exchange = RemoteKeyExchange();
  final result = Completer<RemotePairResult>();
  Timer? timer;
  void finish(RemotePairResult r) {
    timer?.cancel();
    if (!result.isCompleted) result.complete(r);
  }

  void wait(Duration d) {
    timer?.cancel();
    timer = Timer(
      d,
      () => finish(const RemotePairResult.failed(RemotePairResult.unreachable)),
    );
  }

  final sub = channel.frames.listen(
    (data) {
      final message = data is String ? RemoteMessage.decode(data) : null;
      switch (message) {
        case PairWaitMessage():
          wait(approvalTimeout);
          onWaiting?.call();
        case PairedMessage(:final hostId, :final hostName, :final key):
          final shared = exchange.sharedSecret(key);
          if (shared == null) {
            finish(const RemotePairResult.failed(RemoteErrorCode.failed));
            return;
          }
          finish(
            RemotePairResult.paired(
              SavedRemoteHost(
                hostId: hostId,
                name: hostName,
                address: address,
                port: port,
                token: remotePairingToken(
                  shared,
                  exchange.publicKey,
                  key,
                  hostId,
                ),
              ),
            ),
          );
        case ErrorMessage(:final code):
          finish(RemotePairResult.failed(code));
        default:
          break;
      }
    },
    onDone: () => finish(
      RemotePairResult.failed(
        channel.closeCode == RemoteCloseCode.tooManyAttempts
            ? RemoteErrorCode.tooManyAttempts
            : RemoteErrorCode.failed,
      ),
    ),
    onError: (Object _) =>
        finish(const RemotePairResult.failed(RemoteErrorCode.failed)),
    cancelOnError: true,
  );
  wait(replyTimeout);
  channel.send(
    PairMessage(
      code: code,
      deviceName: deviceName,
      key: exchange.publicKey,
    ).encode(),
  );
  final r = await result.future;
  unawaited(sub.cancel());
  unawaited(channel.close().catchError((Object _) {}));
  return r;
}

/// 1, 2, 4, 8, then every 10 seconds.
@visibleForTesting
Duration remoteReconnectBackoff(int attempt) {
  final shift = (attempt - 1).clamp(0, 4);
  return Duration(seconds: (1 << shift).clamp(1, 10));
}

enum _Stage { hello, auth, sealed }

/// One paired remote's link to a host: a mutual challenge-response login,
/// then sealed state in and commands out, with a heartbeat. Reconnects on
/// its own (with backoff, and looking for the computer at a new address)
/// until [close] or until the host says this device isn't welcome.
class RemoteClient extends ChangeNotifier implements RemoteLinkClient {
  RemoteClient(
    this._host, {
    Duration Function(int attempt)? backoff,
    this.connectTimeout = const Duration(seconds: 5),
    this.heartbeat = const Duration(seconds: 2),
    this.deadAfterBeats = 4,
    RemoteDial? dial,
    this.locate,
    this.onMoved,
    RemoteCoverFetch? fetchCover,
  }) : _backoff = backoff ?? remoteReconnectBackoff,
       _dialer = dial ?? connectRemoteChannel,
       _fetchCover = fetchCover ?? fetchRemoteCover,
       _hostName = _host.name,
       _savedAt = '${_host.address}:${_host.port}',
       _key = remoteDeviceKeyFromToken(_host.token);

  SavedRemoteHost _host;
  final Duration Function(int attempt) _backoff;
  final RemoteDial _dialer;
  final RemoteCoverFetch _fetchCover;
  final List<int> _key;
  final Duration connectTimeout;

  /// A ping goes out every [heartbeat]; [deadAfterBeats] beats with nothing
  /// heard means the link is dead (the PC slept or the Wi-Fi changed).
  final Duration heartbeat;
  final int deadAfterBeats;

  /// Looks for the computer when its address stops answering.
  final RemoteLocate? locate;

  /// The computer answered (and proved itself) at a new address.
  final void Function(SavedRemoteHost moved)? onMoved;

  /// Where the saved entry points (so a move is saved once).
  String _savedAt;
  RemoteLinkPhase _phase = RemoteLinkPhase.idle;
  RemoteLinkProblem _problem = RemoteLinkProblem.none;
  String _hostName;
  RemotePlayerState? _state;
  List<RemoteChapter> _chapters = const [];
  List<RemoteRecentItem>? _recent;
  final Map<String, Future<Uint8List?>> _recentCovers = {};
  Uint8List? _cover;
  String? _lastError;
  final StreamController<RemoteLinkEvent> _events =
      StreamController.broadcast();
  RemoteChannel? _channel;
  StreamSubscription<Object?>? _sub;
  _Stage _stage = _Stage.hello;
  RemoteSealer? _sealer;
  String? _ticket;
  String _nonce = '';
  String _hostNonce = '';
  Timer? _retry;
  Timer? _beat;
  int _silentBeats = 0;
  bool _closed = false;
  bool _disposed = false;
  bool _everConnected = false;
  bool _locateNext = false;
  int _attempt = 0;
  int _coverVersion = -1;
  String? _coverItem;

  @override
  RemoteLinkPhase get phase => _phase;
  @override
  RemoteLinkProblem get problem => _problem;
  @override
  SavedRemoteHost get host => _host;
  @override
  String get hostName => _hostName;
  @override
  RemotePlayerState? get state => _state;
  @override
  List<RemoteChapter> get chapters => _chapters;
  @override
  List<RemoteRecentItem>? get recent => _recent;
  @override
  Uint8List? get cover => _cover;
  @override
  String? get lastError => _lastError;
  @override
  Stream<RemoteLinkEvent> get events => _events.stream;

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  Future<void> connect() async {
    if (_closed || _phase != RemoteLinkPhase.idle) return;
    await _dial();
  }

  @override
  void reconnectNow() {
    if (_closed || _retry == null) return;
    _retry?.cancel();
    _attempt = 0;
    unawaited(_dial());
  }

  Future<void> _dial() async {
    _retry = null;
    if (_closed) return;
    _phase = _everConnected
        ? RemoteLinkPhase.reconnecting
        : RemoteLinkPhase.connecting;
    _notify();
    if (_locateNext) {
      _locateNext = false;
      await _findMovedHost();
      if (_closed) return;
    }
    final RemoteChannel channel;
    try {
      channel = await _dialer(_host.address, _host.port, connectTimeout);
    } catch (_) {
      if (_closed) return;
      _problem = RemoteLinkProblem.unreachable;
      _scheduleRetry();
      return;
    }
    if (_closed) {
      unawaited(channel.close().catchError((Object _) {}));
      return;
    }
    _channel = channel;
    _stage = _Stage.hello;
    _sealer = null;
    _ticket = null;
    _nonce = newRemoteSecret();
    _sub = channel.frames.listen(
      (data) => _onData(channel, data),
      onDone: () => _onDone(channel),
      onError: (Object _) {},
      cancelOnError: false,
    );
    channel.send(HelloMessage(nonce: _nonce).encode());
  }

  /// The computer may be at a new address (DHCP, another Wi-Fi): ask the
  /// network. It still has to prove itself before anything is sent.
  Future<void> _findMovedHost() async {
    final find = locate;
    if (find == null) return;
    final found = await find(_host.hostId);
    if (found == null || _closed) return;
    if (found.address == _host.address && found.port == _host.port) return;
    debugPrint('[RemoteLink] The computer answered at a new address');
    _host = _host.copyWith(address: found.address, port: found.port);
    _notify();
  }

  /// Drops the current link and tries again later (never for good).
  void _lose(RemoteChannel channel) {
    if (channel != _channel) return;
    _channel = null;
    unawaited(_sub?.cancel());
    _sub = null;
    unawaited(channel.close().catchError((Object _) {}));
    _onLinkGone();
    if (_closed) return;
    if (_problem == RemoteLinkProblem.none) {
      _problem = RemoteLinkProblem.unreachable;
    }
    _scheduleRetry();
  }

  /// Nothing from the old link stays on screen.
  void _onLinkGone() {
    _beat?.cancel();
    _beat = null;
    _sealer = null;
    _ticket = null;
    _state = null;
    _chapters = const [];
    _recent = null;
    _recentCovers.clear();
    _coverVersion = -1;
  }

  void _onData(RemoteChannel channel, Object? data) {
    if (channel != _channel || data is! String) return;
    _silentBeats = 0;
    switch (_stage) {
      case _Stage.hello:
        _onChallenge(channel, RemoteMessage.decode(data));
      case _Stage.auth:
        _onWelcome(channel, RemoteMessage.decode(data));
      case _Stage.sealed:
        final message = _sealer?.open(
          data,
          maxLength: kRemoteMaxHostFrameLength,
        );
        if (message == null) {
          // Forged, replayed or damaged: start over on a fresh link.
          debugPrint('[RemoteLink] Dropped the link: bad seal');
          _lose(channel);
          return;
        }
        _onSealed(message);
    }
  }

  void _onChallenge(RemoteChannel channel, RemoteMessage? message) {
    switch (message) {
      case ChallengeMessage(:final version, :final hostId, :final nonce):
        if (version != kRemoteProtocolVersion) {
          _stop(RemoteLinkProblem.unsupportedVersion);
          return;
        }
        if (hostId != _host.hostId || !isValidRemoteNonce(nonce)) {
          // Another computer answers at this address now: ours may have
          // moved. Nothing is sent to this one.
          _locateNext = true;
          _lose(channel);
          return;
        }
        _stage = _Stage.auth;
        channel.send(
          AuthMessage(
            remoteClientProof(_key, _host.hostId, _nonce, nonce),
          ).encode(),
        );
        _hostNonce = nonce;
      case ErrorMessage(:final code):
        _onPlainError(code);
      default:
        _lose(channel);
    }
  }

  void _onWelcome(RemoteChannel channel, RemoteMessage? message) {
    switch (message) {
      case WelcomeMessage(:final hostId, :final hostName, :final proof):
        final expected = remoteHostProof(
          _key,
          _host.hostId,
          _nonce,
          _hostNonce,
        );
        if (hostId != _host.hostId || !constantTimeEquals(proof, expected)) {
          // Not our computer (it can't prove it knows the key).
          debugPrint('[RemoteLink] The computer failed to prove itself');
          _locateNext = true;
          _lose(channel);
          return;
        }
        final session = remoteSessionKey(
          _key,
          _host.hostId,
          _nonce,
          _hostNonce,
        );
        _sealer = RemoteSealer(session, outgoing: RemoteDirection.remoteToHost);
        _ticket = remoteCoverTicket(session);
        _stage = _Stage.sealed;
        _everConnected = true;
        _attempt = 0;
        _phase = RemoteLinkPhase.connected;
        _problem = RemoteLinkProblem.none;
        if (hostName.isNotEmpty) _hostName = hostName;
        final at = '${_host.address}:${_host.port}';
        if (at != _savedAt) {
          _savedAt = at;
          onMoved?.call(_host);
        }
        _startHeartbeat(channel);
        _notify();
      case ErrorMessage(:final code):
        _onPlainError(code);
      default:
        _lose(channel);
    }
  }

  void _onPlainError(String code) {
    switch (code) {
      case RemoteErrorCode.unauthorized:
        _problem = RemoteLinkProblem.unauthorized;
      case RemoteErrorCode.tooManyAttempts:
        _problem = RemoteLinkProblem.tooManyAttempts;
      case RemoteErrorCode.unsupportedVersion:
        _problem = RemoteLinkProblem.unsupportedVersion;
      default:
        break;
    }
    _notify();
  }

  void _onSealed(RemoteMessage message) {
    switch (message) {
      case StateMessage(:final state):
        _state = state;
        _lastError = null;
        _notify();
        unawaited(_refreshCover(state));
      case ChaptersMessage(:final chapters):
        _chapters = chapters;
        _notify();
      case RecentMessage(:final items):
        _recent = items;
        _recentCovers.clear();
        _notify();
      case ErrorMessage(:final code):
        _lastError = code;
        if (!_events.isClosed) _events.add(RemoteLinkEvent(code));
        _notify();
      case NoticeMessage(:final code):
        if (!_events.isClosed) {
          _events.add(RemoteLinkEvent(code, isError: false));
        }
      case PongMessage():
        break;
      default:
        break;
    }
  }

  void _startHeartbeat(RemoteChannel channel) {
    _beat?.cancel();
    _silentBeats = 0;
    _beat = Timer.periodic(heartbeat, (_) {
      if (channel != _channel) return;
      if (++_silentBeats >= deadAfterBeats) {
        debugPrint('[RemoteLink] The computer went silent');
        _lose(channel);
        return;
      }
      _sendSealed(const PingMessage());
    });
  }

  void _onDone(RemoteChannel channel) {
    if (channel != _channel) return;
    _channel = null;
    _sub = null;
    _onLinkGone();
    if (_closed) {
      _notify();
      return;
    }
    switch (channel.closeCode) {
      case RemoteCloseCode.unauthorized:
      case RemoteCloseCode.forgotten:
        _stop(RemoteLinkProblem.unauthorized);
        return;
      case RemoteCloseCode.disconnectedByHost:
        _stop(RemoteLinkProblem.disconnectedByHost);
        return;
      case RemoteCloseCode.unsupportedVersion:
        _stop(RemoteLinkProblem.unsupportedVersion);
        return;
      case RemoteCloseCode.hostStopped:
        _problem = RemoteLinkProblem.hostStopped;
      case RemoteCloseCode.tooManyAttempts:
        _problem = RemoteLinkProblem.tooManyAttempts;
      default:
        if (_problem == RemoteLinkProblem.none) {
          _problem = RemoteLinkProblem.unreachable;
        }
    }
    _scheduleRetry();
  }

  void _stop(RemoteLinkProblem problem) {
    _closed = true;
    _problem = problem;
    _phase = RemoteLinkPhase.closed;
    _retry?.cancel();
    _retry = null;
    final channel = _channel;
    _channel = null;
    unawaited(_sub?.cancel());
    _sub = null;
    _onLinkGone();
    if (channel != null) unawaited(channel.close().catchError((Object _) {}));
    _notify();
  }

  void _scheduleRetry() {
    if (_closed) return;
    _attempt++;
    // From the second failure on, every other try first asks the network
    // whether the computer moved.
    if (_attempt >= 2 && _attempt.isEven) _locateNext = true;
    _phase = _everConnected
        ? RemoteLinkPhase.reconnecting
        : RemoteLinkPhase.connecting;
    _notify();
    _retry?.cancel();
    _retry = Timer(_backoff(_attempt), () => unawaited(_dial()));
  }

  Future<void> _refreshCover(RemotePlayerState state) async {
    if (!state.hasItem) {
      _coverVersion = -1;
      _coverItem = null;
      if (_cover != null) {
        _cover = null;
        _notify();
      }
      return;
    }
    if (state.coverVersion == _coverVersion && state.itemId == _coverItem) {
      return;
    }
    final ticket = _ticket;
    if (ticket == null) return;
    _coverVersion = state.coverVersion;
    _coverItem = state.itemId;
    final Uint8List? bytes;
    try {
      bytes = await _fetchCover(_host, ticket, null);
    } catch (_) {
      _coverVersion = -1; // Failed: try again with the next state.
      return;
    }
    if (_closed || state.itemId != _coverItem) return;
    _cover = bytes;
    _notify();
  }

  void _sendSealed(RemoteMessage message) {
    final channel = _channel;
    final sealer = _sealer;
    if (channel == null || sealer == null) return;
    channel.send(sealer.seal(message));
  }

  @override
  void send(RemoteCommand command) {
    if (_phase != RemoteLinkPhase.connected) return;
    _sendSealed(command);
  }

  @override
  void requestRecent() => send(const RecentRequest());

  @override
  Future<Uint8List?> recentCover(String itemId) {
    final ticket = _ticket;
    if (ticket == null) return Future.value(null);
    return _recentCovers[itemId] ??= _fetchCover(
      _host,
      ticket,
      itemId,
    ).then((b) => b, onError: (Object _) => null);
  }

  @override
  Future<void> close() async {
    if (_closed && _channel == null) return;
    _closed = true;
    _retry?.cancel();
    _retry = null;
    final channel = _channel;
    _channel = null;
    unawaited(_sub?.cancel());
    _sub = null;
    _onLinkGone();
    _phase = RemoteLinkPhase.closed;
    _notify();
    if (channel != null) {
      await channel.close(1000).catchError((Object _) {});
    }
  }

  @override
  void dispose() {
    _disposed = true;
    unawaited(close());
    unawaited(_events.close());
    super.dispose();
  }
}

const _maxCoverBytes = 8 * 1024 * 1024;

/// Fetches a cover over plain HTTP with the connection's ticket (never the
/// token). Null when there is none; throws when it fails.
Future<Uint8List?> fetchRemoteCover(
  SavedRemoteHost host,
  String ticket,
  String? itemId,
) async {
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 5);
  try {
    final request = await client.getUrl(
      Uri(
        scheme: 'http',
        host: host.address,
        port: host.port,
        path: kRemoteCoverPath,
        queryParameters: itemId == null ? null : {'item': itemId},
      ),
    );
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $ticket');
    final response = await request.close().timeout(const Duration(seconds: 5));
    if (response.statusCode != HttpStatus.ok) {
      await response.drain<void>();
      if (response.statusCode == HttpStatus.notFound) return null;
      throw HttpException('Cover: ${response.statusCode}');
    }
    final builder = BytesBuilder(copy: false);
    await for (final chunk in response) {
      builder.add(chunk);
      if (builder.length > _maxCoverBytes) return null;
    }
    return builder.takeBytes();
  } finally {
    client.close(force: true);
  }
}

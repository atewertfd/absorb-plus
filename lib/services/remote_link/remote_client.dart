import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'protocol.dart';
import 'remote_link_types.dart';

RemoteLinkConnector get remoteLinkConnector => const IoRemoteLinkConnector();

/// Phone remote, the remote side (fork, dart:io): finds hosts by UDP
/// broadcast, pairs with the host's code, and opens [RemoteClient] links.
class IoRemoteLinkConnector implements RemoteLinkConnector {
  const IoRemoteLinkConnector({
    this.discoveryPort = kRemoteDefaultPort,
    this.discoveryTargets,
    this.connectTimeout = const Duration(seconds: 5),
  });

  final int discoveryPort;

  /// Tests: probe these instead of the LAN broadcast addresses.
  final List<InternetAddress>? discoveryTargets;
  final Duration connectTimeout;

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
            return;
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
    } catch (_) {}
    return [for (final t in targets) InternetAddress(t)];
  }

  @override
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
  }) async {
    final WebSocket ws;
    try {
      ws = await connectRemoteSocket(address, port, connectTimeout);
    } catch (_) {
      return const RemotePairResult.failed(RemotePairResult.unreachable);
    }
    try {
      ws.add(PairMessage(code: code, deviceName: deviceName).encode());
      await for (final data in ws.timeout(const Duration(seconds: 10))) {
        final message = data is String ? RemoteMessage.decode(data) : null;
        if (message is PairedMessage) {
          return RemotePairResult.paired(
            SavedRemoteHost(
              hostId: message.hostId,
              name: message.hostName,
              address: address,
              port: port,
              token: message.token,
            ),
          );
        }
        if (message is ErrorMessage)
          return RemotePairResult.failed(message.code);
      }
      return RemotePairResult.failed(
        ws.closeCode == RemoteCloseCode.tooManyAttempts
            ? RemoteErrorCode.tooManyAttempts
            : RemoteErrorCode.failed,
      );
    } on TimeoutException {
      return const RemotePairResult.failed(RemotePairResult.unreachable);
    } catch (_) {
      return const RemotePairResult.failed(RemoteErrorCode.failed);
    } finally {
      unawaited(ws.close().catchError((Object _) {}));
    }
  }

  @override
  RemoteLinkClient open(SavedRemoteHost host) => RemoteClient(host);

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
      return 'Absorb';
    }
  }
}

Uri remoteSocketUri(String address, int port) =>
    Uri(scheme: 'ws', host: address, port: port, path: kRemoteSocketPath);

/// Opens the host's WebSocket (no compression). A socket that connects only
/// after [timeout] is closed instead of leaking.
Future<WebSocket> connectRemoteSocket(
  String address,
  int port,
  Duration timeout,
) async {
  final pending = WebSocket.connect(
    remoteSocketUri(address, port).toString(),
    compression: CompressionOptions.compressionOff,
  );
  try {
    return await pending.timeout(timeout);
  } on TimeoutException {
    unawaited(pending.then((ws) => ws.close(), onError: (Object _) => null));
    rethrow;
  }
}

/// 1, 2, 4, 8, then every 10 seconds.
@visibleForTesting
Duration remoteReconnectBackoff(int attempt) {
  final shift = (attempt - 1).clamp(0, 4);
  return Duration(seconds: (1 << shift).clamp(1, 10));
}

/// One paired remote's link to a host: hello with the saved token, then
/// state in and commands out. Reconnects on its own (with backoff) until
/// [close] or until the host says this device isn't welcome.
class RemoteClient extends ChangeNotifier implements RemoteLinkClient {
  RemoteClient(
    this._host, {
    Duration Function(int attempt)? backoff,
    this.connectTimeout = const Duration(seconds: 5),
    this.pingInterval = const Duration(seconds: 5),
  }) : _backoff = backoff ?? remoteReconnectBackoff,
       _hostName = _host.name;

  static const _maxCoverBytes = 8 * 1024 * 1024;

  final SavedRemoteHost _host;
  final Duration Function(int attempt) _backoff;
  final Duration connectTimeout;
  final Duration pingInterval;

  RemoteLinkPhase _phase = RemoteLinkPhase.idle;
  RemoteLinkProblem _problem = RemoteLinkProblem.none;
  String _hostName;
  RemotePlayerState? _state;
  Uint8List? _cover;
  String? _lastError;
  WebSocket? _ws;
  Timer? _retry;
  bool _closed = false;
  bool _disposed = false;
  bool _everConnected = false;
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
  Uint8List? get cover => _cover;
  @override
  String? get lastError => _lastError;

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  Future<void> connect() async {
    if (_closed || _phase != RemoteLinkPhase.idle) return;
    await _dial();
  }

  Future<void> _dial() async {
    _retry = null;
    if (_closed) return;
    _phase = _everConnected
        ? RemoteLinkPhase.reconnecting
        : RemoteLinkPhase.connecting;
    _notify();
    final WebSocket ws;
    try {
      ws = await connectRemoteSocket(_host.address, _host.port, connectTimeout);
    } catch (_) {
      if (_closed) return;
      _problem = RemoteLinkProblem.unreachable;
      _scheduleRetry();
      return;
    }
    if (_closed) {
      unawaited(ws.close().catchError((Object _) {}));
      return;
    }
    _ws = ws;
    ws.pingInterval = pingInterval;
    ws.listen(
      (data) => _onData(ws, data),
      onDone: () => _onDone(ws),
      onError: (Object _) {},
      cancelOnError: false,
    );
    ws.add(HelloMessage(token: _host.token).encode());
  }

  void _onData(WebSocket ws, dynamic data) {
    if (ws != _ws || data is! String) return;
    final message = RemoteMessage.decode(data);
    switch (message) {
      case WelcomeMessage(:final hostId, :final hostName):
        if (hostId != _host.hostId) {
          // Another computer answers at this address now: not ours.
          _stop(RemoteLinkProblem.unauthorized);
          _ws = null;
          unawaited(ws.close().catchError((Object _) {}));
          return;
        }
        _everConnected = true;
        _attempt = 0;
        _phase = RemoteLinkPhase.connected;
        _problem = RemoteLinkProblem.none;
        if (hostName.isNotEmpty) _hostName = hostName;
        _notify();
      case StateMessage(:final state):
        _state = state;
        _lastError = null;
        _notify();
        unawaited(_refreshCover(state));
      case ErrorMessage(:final code):
        switch (code) {
          case RemoteErrorCode.unauthorized:
            _problem = RemoteLinkProblem.unauthorized;
          case RemoteErrorCode.tooManyAttempts:
            _problem = RemoteLinkProblem.tooManyAttempts;
          case RemoteErrorCode.unsupportedVersion:
            _problem = RemoteLinkProblem.unsupportedVersion;
          default:
            _lastError = code;
        }
        _notify();
      default:
        break;
    }
  }

  void _onDone(WebSocket ws) {
    if (ws != _ws) return;
    _ws = null;
    if (_closed) return;
    switch (ws.closeCode) {
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
    _notify();
  }

  void _scheduleRetry() {
    if (_closed) return;
    _attempt++;
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
    _coverVersion = state.coverVersion;
    _coverItem = state.itemId;
    final client = HttpClient()..connectionTimeout = connectTimeout;
    try {
      final request = await client.getUrl(
        Uri(
          scheme: 'http',
          host: _host.address,
          port: _host.port,
          path: kRemoteCoverPath,
        ),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer ${_host.token}',
      );
      final response = await request.close().timeout(connectTimeout);
      Uint8List? bytes;
      if (response.statusCode == HttpStatus.ok) {
        final builder = BytesBuilder(copy: false);
        await for (final chunk in response) {
          builder.add(chunk);
          if (builder.length > _maxCoverBytes) break;
        }
        if (builder.length <= _maxCoverBytes) bytes = builder.takeBytes();
      } else {
        await response.drain<void>();
        // No cover is an answer; anything else is tried again later.
        if (response.statusCode != HttpStatus.notFound) _coverVersion = -1;
      }
      if (_closed || state.itemId != _coverItem) return;
      _cover = bytes;
      _notify();
    } catch (_) {
      // Try again with the next state.
      _coverVersion = -1;
    } finally {
      client.close(force: true);
    }
  }

  @override
  void send(RemoteCommand command) {
    final ws = _ws;
    if (ws == null || _phase != RemoteLinkPhase.connected) return;
    try {
      ws.add(command.encode());
    } catch (_) {}
  }

  @override
  Future<void> close() async {
    if (_closed && _ws == null) return;
    _closed = true;
    _retry?.cancel();
    _retry = null;
    final ws = _ws;
    _ws = null;
    _phase = RemoteLinkPhase.closed;
    _notify();
    if (ws != null) {
      await ws
          .close(1000)
          .timeout(const Duration(seconds: 2), onTimeout: () => null)
          .catchError((Object _) => null);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    unawaited(close());
    super.dispose();
  }
}

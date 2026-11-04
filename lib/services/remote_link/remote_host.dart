import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account_epoch.dart';
import 'app_remote_player.dart';
import 'pairing_store.dart';
import 'player_facade.dart';
import 'protocol.dart';
import 'remote_link_types.dart';

bool get remoteHostSupported => RemoteHost.instance.isSupported;

RemoteHostController get remoteHost => RemoteHost.instance;

/// Phone remote host (fork, dart:io): a small LAN WebSocket server on the PC
/// that paired remotes connect to, plus a UDP responder for discovery. Off by
/// default; see docs/design/phone-remote.md.
///
/// Security: only paired devices (token checked against a SHA-256 hash) get
/// state or send commands; pairing needs the 6-digit code shown while the
/// host sheet is open; failures are rate-limited per address; requests from
/// browsers (an Origin header) are refused; tokens are never logged; nothing
/// about the Audiobookshelf server is ever sent.
class RemoteHost implements RemoteHostController {
  RemoteHost({
    RemotePlayerFacade Function()? player,
    PairedDeviceStore? devices,
    PairingCodeIssuer? codes,
    AuthFailureLimiter? limiter,
    InternetAddress? bindAddress,
    this.firstPort = kRemoteDefaultPort,
    this.portCount = kRemotePortCount,
    this.discoveryPort = kRemoteDefaultPort,
    String? hostName,
    bool? supported,
    this.authTimeout = const Duration(seconds: 10),
    this.stateDebounce = const Duration(milliseconds: 150),
    this.stateInterval = const Duration(seconds: 1),
    this.maxConnections = 8,
    this.maxConnectionsPerAddress = 3,
    this.listenOnAccountChange = true,
  }) : _playerFactory = player ?? AppRemotePlayer.new,
       devices = devices ?? PairedDeviceStore(),
       codes = codes ?? PairingCodeIssuer(),
       _limiter = limiter ?? AuthFailureLimiter(),
       _bindAddress = bindAddress,
       _hostNameOverride = hostName,
       _supported =
           supported ?? (!kIsWeb && (Platform.isWindows || Platform.isLinux));

  static final RemoteHost instance = RemoteHost();

  static const prefEnabled = 'remote_link_host_enabled';

  final RemotePlayerFacade Function() _playerFactory;
  @override
  final PairedDeviceStore devices;
  @override
  final PairingCodeIssuer codes;
  final AuthFailureLimiter _limiter;
  final InternetAddress? _bindAddress;
  final String? _hostNameOverride;
  final bool _supported;

  /// 0 binds an ephemeral port (tests).
  final int firstPort;
  final int portCount;
  final int discoveryPort;
  final Duration authTimeout;
  final Duration stateDebounce;
  final Duration stateInterval;
  final int maxConnections;
  final int maxConnectionsPerAddress;
  final bool listenOnAccountChange;

  final ValueNotifier<RemoteHostStatus> _status = ValueNotifier(
    const RemoteHostStatus(),
  );
  final ValueNotifier<List<RemoteConnectionInfo>> _connections = ValueNotifier(
    const [],
  );

  @override
  ValueListenable<RemoteHostStatus> get status => _status;
  @override
  ValueListenable<List<RemoteConnectionInfo>> get connections => _connections;
  @override
  bool get isSupported => _supported;

  HttpServer? _server;
  RawDatagramSocket? _udp;
  RemotePlayerFacade? _player;
  final List<_Connection> _conns = [];
  int _nextConnId = 1;
  Timer? _stateTimer;
  Timer? _tick;
  String _hostId = '';
  int _coverFor = -1;
  Future<Uint8List?>? _coverLoad;
  int _discoveryReplies = 0;
  DateTime _discoveryWindow = DateTime.fromMillisecondsSinceEpoch(0);
  bool _started = false;

  /// The bound discovery port (tests bind an ephemeral one).
  int? get boundDiscoveryPort => _udp?.port;

  /// The bound WebSocket port.
  int? get boundPort => _server?.port;

  // Start, the switch and stop run one after another, so a quick on-off
  // can't leave sockets open behind a switch that says off.
  Future<void>? _queue;
  Future<void> _serial(Future<void> Function() task) {
    final previous = _queue;
    final run = previous == null
        ? Future<void>.sync(task)
        : previous.then((_) => task());
    _queue = run.catchError((Object _) {});
    return run;
  }

  @override
  Future<void> start() async {
    if (!_supported || _started) return;
    _started = true;
    if (listenOnAccountChange) AccountEpoch.addHandler(_onAccountChange);
    await _serial(() async {
      final prefs = await SharedPreferences.getInstance();
      final on = prefs.getBool(prefEnabled) ?? false;
      _status.value = RemoteHostStatus(enabled: on);
      if (on) await _openSafely();
    });
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    if (!_supported) return;
    await _serial(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefEnabled, enabled);
      if (enabled) {
        _status.value = RemoteHostStatus(enabled: true, hostId: _hostId);
        await _openSafely();
      } else {
        await _close();
        _status.value = const RemoteHostStatus();
      }
    });
  }

  @override
  Future<void> signedOut() async {
    if (!_supported) return;
    await _serial(() async {
      await _close();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefEnabled, false);
      _status.value = const RemoteHostStatus();
    });
  }

  Future<void> _onAccountChange() => signedOut();

  @override
  void shutdownForExit() {
    if (_server == null && _udp == null) return;
    // Never awaited: quitting saves progress on its own clock.
    unawaited(_close().catchError((Object _) {}));
  }

  @override
  Future<void> disconnect(int connectionId) async {
    for (final c in List.of(_conns)) {
      if (c.id == connectionId) {
        _drop(c, RemoteCloseCode.disconnectedByHost, 'Disconnected');
      }
    }
  }

  @override
  Future<void> forget(String deviceId) async {
    await devices.forget(deviceId);
    for (final c in List.of(_conns)) {
      if (c.device?.id == deviceId) {
        _drop(c, RemoteCloseCode.forgotten, 'Forgotten');
      }
    }
  }

  /// Tests: closes everything without touching the saved switch.
  @visibleForTesting
  Future<void> stopForTest() => _serial(_close);

  // ── Open / close ──────────────────────────────────────────────────

  /// Never throws: a failure closes whatever opened and shows a problem.
  Future<void> _openSafely() async {
    try {
      await _open();
    } catch (e) {
      debugPrint('[RemoteHost] Start failed: ${e.runtimeType}');
      await _close().catchError((Object _) {});
      _status.value = RemoteHostStatus(
        enabled: true,
        hostId: _hostId,
        problem: RemoteHostProblem.failed,
      );
    }
  }

  Future<void> _open() async {
    if (_server != null) return;
    await devices.load();
    if (_hostId.isEmpty) _hostId = await loadRemoteHostId();
    final address = _bindAddress ?? InternetAddress.anyIPv4;
    HttpServer? server;
    if (firstPort == 0) {
      server = await HttpServer.bind(address, 0);
    } else {
      for (
        var p = firstPort;
        p < firstPort + portCount && server == null;
        p++
      ) {
        try {
          server = await HttpServer.bind(address, p);
        } on SocketException {
          // Taken: try the next one.
        }
      }
    }
    if (server == null) {
      debugPrint(
        '[RemoteHost] No free port in $firstPort..'
        '${firstPort + portCount - 1}',
      );
      _status.value = RemoteHostStatus(
        enabled: true,
        hostId: _hostId,
        problem: RemoteHostProblem.portsBusy,
      );
      return;
    }
    server.idleTimeout = const Duration(seconds: 30);
    _server = server;

    var discovery = false;
    try {
      final udp = await RawDatagramSocket.bind(address, discoveryPort);
      _udp = udp;
      udp.listen(_onDatagram, onError: (Object _) {});
      discovery = true;
    } on SocketException catch (e) {
      debugPrint('[RemoteHost] Discovery unavailable: ${e.osError?.message}');
    }

    final player = _playerFactory();
    _player = player;
    player.addListener(_scheduleState);

    final name = _hostNameOverride ?? _localName();
    final addresses = await _localAddresses();
    debugPrint(
      '[RemoteHost] Listening on port ${server.port}'
      '${discovery ? ' (discovery on)' : ''}',
    );
    _status.value = RemoteHostStatus(
      enabled: true,
      running: true,
      port: server.port,
      addresses: addresses,
      hostId: _hostId,
      hostName: name,
      discovery: discovery,
    );
    // Last, so the first hello already finds the player and the name.
    server.listen(
      _onRequest,
      onError: (Object e) {
        debugPrint('[RemoteHost] Server error: ${e.runtimeType}');
      },
    );
  }

  Future<void> _close() async {
    _stateTimer?.cancel();
    _stateTimer = null;
    _tick?.cancel();
    _tick = null;
    for (final c in List.of(_conns)) {
      _drop(c, RemoteCloseCode.hostStopped, 'Host stopped');
    }
    _conns.clear();
    _connections.value = const [];
    final udp = _udp;
    _udp = null;
    udp?.close();
    final player = _player;
    _player = null;
    if (player != null) {
      player.removeListener(_scheduleState);
      if (player is AppRemotePlayer) player.dispose();
    }
    _coverFor = -1;
    _coverLoad = null;
    final server = _server;
    _server = null;
    if (server != null) {
      debugPrint('[RemoteHost] Closed');
      await server.close(force: true);
    }
  }

  String _localName() {
    try {
      return cleanRemoteName(Platform.localHostname);
    } catch (_) {
      return 'Absorb';
    }
  }

  Future<List<String>> _localAddresses() async {
    final bind = _bindAddress;
    if (bind != null && bind.isLoopback) return [bind.address];
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      return [
        for (final i in interfaces)
          for (final a in i.addresses)
            if (!a.isLinkLocal && !a.isLoopback) a.address,
      ];
    } catch (_) {
      return const [];
    }
  }

  // ── Discovery ─────────────────────────────────────────────────────

  void _onDatagram(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    final udp = _udp;
    final server = _server;
    final dg = udp?.receive();
    if (udp == null || server == null || dg == null) return;
    if (dg.data.length > 64) return;
    final String text;
    try {
      text = utf8.decode(dg.data).trim();
    } catch (_) {
      return;
    }
    if (text != kRemoteDiscoverMessage) return;
    // A flood of probes gets a bounded number of answers.
    final now = DateTime.now();
    if (now.difference(_discoveryWindow) > const Duration(seconds: 1)) {
      _discoveryWindow = now;
      _discoveryReplies = 0;
    }
    if (++_discoveryReplies > 20) return;
    final reply = RemoteHostAnnouncement(
      hostId: _hostId,
      name: _status.value.hostName,
      port: server.port,
    ).encode();
    try {
      udp.send(utf8.encode(reply), dg.address, dg.port);
    } catch (_) {
      // Best effort: the phone asks again if no reply arrives.
    }
  }

  // ── HTTP ──────────────────────────────────────────────────────────

  Future<void> _onRequest(HttpRequest request) async {
    final address = request.connectionInfo?.remoteAddress.address ?? '';
    final response = request.response;
    try {
      // Native remotes never send Origin; a web page always does. Refusing it
      // keeps a site open in a browser on the LAN from talking to the host.
      if (request.headers.value('origin') != null) {
        await _refuse(response, HttpStatus.forbidden);
        return;
      }
      final path = request.uri.path;
      if (path == kRemoteSocketPath &&
          WebSocketTransformer.isUpgradeRequest(request)) {
        // A blocked address is still upgraded, so it can be told why
        // (_onUnauthenticated answers tooManyAttempts and closes).
        if (_conns.length >= maxConnections ||
            _conns.where((c) => c.address == address).length >=
                maxConnectionsPerAddress) {
          await _refuse(response, HttpStatus.serviceUnavailable);
          return;
        }
        // No compression: a small compressed frame can't inflate into a
        // huge message before the length check.
        final ws = await WebSocketTransformer.upgrade(
          request,
          compression: CompressionOptions.compressionOff,
        );
        if (_server == null) {
          unawaited(ws.close(RemoteCloseCode.hostStopped));
          return;
        }
        _accept(ws, address);
        return;
      }
      if (path == kRemoteCoverPath && request.method == 'GET') {
        await _serveCover(request, address);
        return;
      }
      await _refuse(response, HttpStatus.notFound);
    } catch (e) {
      debugPrint('[RemoteHost] Request failed: ${e.runtimeType}');
      try {
        await response.close();
      } catch (_) {
        // The request already failed (logged above); the response may be gone.
      }
    }
  }

  Future<void> _refuse(HttpResponse response, int status) async {
    response.statusCode = status;
    await response.close();
  }

  Future<void> _serveCover(HttpRequest request, String address) async {
    final response = request.response;
    if (_limiter.isBlocked(address)) {
      await _refuse(response, HttpStatus.tooManyRequests);
      return;
    }
    final auth = request.headers.value(HttpHeaders.authorizationHeader) ?? '';
    final token = auth.startsWith('Bearer ') ? auth.substring(7).trim() : '';
    if (token.isEmpty || devices.match(token) == null) {
      _limiter.recordFailure(address);
      await _refuse(response, HttpStatus.unauthorized);
      return;
    }
    final bytes = await _cover();
    if (bytes == null) {
      await _refuse(response, HttpStatus.notFound);
      return;
    }
    response.headers
      ..contentType = _imageType(bytes)
      ..set(HttpHeaders.cacheControlHeader, 'no-store');
    response.contentLength = bytes.length;
    response.add(bytes);
    await response.close();
  }

  Future<Uint8List?> _cover() {
    final player = _player;
    if (player == null) return Future.value(null);
    final version = player.state.coverVersion;
    if (version == _coverFor && _coverLoad != null) return _coverLoad!;
    _coverFor = version;
    return _coverLoad = player.loadCover().then(
      (b) => b,
      onError: (Object _) => null,
    );
  }

  static ContentType _imageType(Uint8List b) {
    if (b.length > 3 && b[0] == 0x89 && b[1] == 0x50) {
      return ContentType('image', 'png');
    }
    if (b.length > 11 &&
        b[0] == 0x52 &&
        b[1] == 0x49 &&
        b[8] == 0x57 &&
        b[9] == 0x45) {
      return ContentType('image', 'webp');
    }
    return ContentType('image', 'jpeg');
  }

  // ── WebSocket ─────────────────────────────────────────────────────

  void _accept(WebSocket ws, String address) {
    final conn = _Connection(_nextConnId++, ws, address, DateTime.now());
    _conns.add(conn);
    ws.pingInterval = const Duration(seconds: 10);
    conn.authTimer = Timer(authTimeout, () {
      if (conn.device == null) {
        _drop(conn, RemoteCloseCode.badRequest, 'No hello');
      }
    });
    conn.sub = ws.listen(
      // One frame at a time per connection (pairing awaits the store).
      (data) => conn.queue = conn.queue
          .then((_) => _onFrame(conn, data))
          .catchError((Object _) {}),
      onDone: () => _forgetConnection(conn),
      onError: (Object _) => _forgetConnection(conn),
      cancelOnError: true,
    );
  }

  void _forgetConnection(_Connection conn) {
    conn.authTimer?.cancel();
    unawaited(conn.cancelListener());
    conn.closed = true;
    if (_conns.remove(conn)) _publishConnections();
  }

  /// Sends the close frame; dart:io destroys the socket if the peer hasn't
  /// answered within 5 seconds.
  void _drop(_Connection conn, int code, String reason) {
    conn.authTimer?.cancel();
    conn.closed = true;
    _conns.remove(conn);
    _publishConnections();
    unawaited(conn.ws.close(code, reason).catchError((Object _) {}));
  }

  void _publishConnections() {
    _connections.value = List.unmodifiable([
      for (final c in _conns)
        if (c.device != null)
          RemoteConnectionInfo(
            id: c.id,
            deviceId: c.device!.id,
            deviceName: c.device!.name,
            address: c.address,
            since: c.since,
          ),
    ]);
    _syncTick();
  }

  void _send(_Connection conn, RemoteMessage message) {
    if (conn.closed) return;
    try {
      conn.ws.add(message.encode());
    } catch (_) {
      // The connection is closing; its done handler forgets it.
    }
  }

  Future<void> _onFrame(_Connection conn, dynamic data) async {
    if (conn.closed) return;
    if (data is! String || data.length > kRemoteMaxFrameLength) {
      _drop(conn, RemoteCloseCode.badRequest, 'Bad frame');
      return;
    }
    final message = RemoteMessage.decode(data);
    if (conn.device == null) {
      await _onUnauthenticated(conn, message);
      return;
    }
    if (message is! RemoteCommand) {
      _send(conn, const ErrorMessage(RemoteErrorCode.badRequest));
      return;
    }
    await _run(conn, message);
  }

  Future<void> _onUnauthenticated(
    _Connection conn,
    RemoteMessage? message,
  ) async {
    final address = conn.address;
    if (_limiter.isBlocked(address)) {
      _send(conn, const ErrorMessage(RemoteErrorCode.tooManyAttempts));
      _drop(conn, RemoteCloseCode.tooManyAttempts, 'Too many attempts');
      return;
    }
    switch (message) {
      case HelloMessage(:final version, :final token):
        if (version != kRemoteProtocolVersion) {
          _send(conn, const ErrorMessage(RemoteErrorCode.unsupportedVersion));
          _drop(conn, RemoteCloseCode.unsupportedVersion, 'Version');
          return;
        }
        final device = devices.match(token);
        if (device == null) {
          _limiter.recordFailure(address);
          debugPrint('[RemoteHost] Refused an unknown device');
          _send(conn, const ErrorMessage(RemoteErrorCode.unauthorized));
          _drop(conn, RemoteCloseCode.unauthorized, 'Unauthorized');
          return;
        }
        _limiter.recordSuccess(address);
        await _authenticated(conn, device);
        _send(
          conn,
          WelcomeMessage(hostId: _hostId, hostName: _status.value.hostName),
        );
        _sendState(conn);
      case PairMessage(:final version, :final code, :final deviceName):
        if (version != kRemoteProtocolVersion) {
          _send(conn, const ErrorMessage(RemoteErrorCode.unsupportedVersion));
          _drop(conn, RemoteCloseCode.unsupportedVersion, 'Version');
          return;
        }
        final check = codes.check(code);
        if (check != PairCodeCheck.ok) {
          _limiter.recordFailure(address);
          final error = switch (check) {
            PairCodeCheck.expired => RemoteErrorCode.codeExpired,
            PairCodeCheck.closed => RemoteErrorCode.pairingClosed,
            _ => RemoteErrorCode.badCode,
          };
          _send(conn, ErrorMessage(error));
          _drop(conn, RemoteCloseCode.unauthorized, 'Pairing refused');
          return;
        }
        _limiter.recordSuccess(address);
        final added = await devices.add(deviceName);
        if (conn.closed) {
          // Gone before it got its token: don't keep a pairing nobody holds.
          await devices.forget(added.device.id);
          return;
        }
        debugPrint('[RemoteHost] Paired a new device');
        await _authenticated(conn, added.device);
        _send(
          conn,
          PairedMessage(
            token: added.token,
            hostId: _hostId,
            hostName: _status.value.hostName,
          ),
        );
        _sendState(conn);
      default:
        _drop(conn, RemoteCloseCode.badRequest, 'Expected hello');
    }
  }

  Future<void> _authenticated(_Connection conn, PairedDevice device) async {
    conn.authTimer?.cancel();
    conn.device = device;
    _publishConnections();
    await devices.touch(device.id);
  }

  Future<void> _run(_Connection conn, RemoteCommand command) async {
    final player = _player;
    if (player == null) return;
    if (!player.state.hasItem) {
      _send(conn, const ErrorMessage(RemoteErrorCode.nothingLoaded));
      return;
    }
    try {
      switch (command) {
        case PlayCommand():
          await player.play();
        case PauseCommand():
          await player.pause();
        case ToggleCommand():
          await player.toggle();
        case SeekCommand(:final position):
          await player.seek(position);
        case SkipCommand(:final seconds):
          await player.skip(seconds);
        case ChapterCommand(:final delta):
          await player.chapter(delta);
        case SpeedCommand(:final value):
          await player.setSpeed(value);
        case SleepCommand(:final cancel, :final endOfChapter, :final minutes):
          if (cancel) {
            await player.cancelSleep();
          } else if (endOfChapter) {
            await player.sleepAtEndOfChapter();
          } else if (minutes != null) {
            await player.sleepFor(minutes);
          }
      }
    } catch (e) {
      debugPrint('[RemoteHost] ${command.type} failed: ${e.runtimeType}');
      _send(conn, const ErrorMessage(RemoteErrorCode.failed));
    }
    // Answer at once (positions move without notifications).
    _broadcastState();
  }

  // ── State ─────────────────────────────────────────────────────────

  void _sendState(_Connection conn) {
    final text = StateMessage(
      _player?.state ?? RemotePlayerState.empty,
    ).encode();
    conn.lastState = text;
    if (conn.closed) return;
    try {
      conn.ws.add(text);
    } catch (_) {
      // The connection is closing; its done handler forgets it.
    }
  }

  void _scheduleState() {
    if (_stateTimer != null || !_conns.any((c) => c.device != null)) return;
    _stateTimer = Timer(stateDebounce, () {
      _stateTimer = null;
      _broadcastState();
    });
  }

  void _broadcastState() {
    final player = _player;
    if (player == null) return;
    final state = player.state;
    final text = StateMessage(state).encode();
    for (final c in List.of(_conns)) {
      if (c.device == null || c.lastState == text) continue;
      c.lastState = text;
      if (c.closed) continue;
      try {
        c.ws.add(text);
      } catch (_) {
        // The connection is closing; its done handler forgets it.
      }
    }
  }

  /// Positions move without notifications: send once a second while
  /// someone is connected (only changes go out).
  void _syncTick() {
    final anyone = _conns.any((c) => c.device != null);
    if (anyone && _tick == null && _server != null) {
      _tick = Timer.periodic(stateInterval, (_) => _broadcastState());
    } else if (!anyone) {
      _tick?.cancel();
      _tick = null;
    }
  }
}

class _Connection {
  _Connection(this.id, this.ws, this.address, this.since);

  final int id;
  final WebSocket ws;
  final String address;
  final DateTime since;
  PairedDevice? device;
  Timer? authTimer;
  StreamSubscription<dynamic>? sub;
  String? lastState;
  bool closed = false;
  Future<void> queue = Future.value();

  /// Ends the socket listener (a no-op once the socket is done).
  Future<void>? cancelListener() => sub?.cancel();
}

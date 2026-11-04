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
import 'remote_channel_io.dart';
import 'remote_crypto.dart';
import 'remote_link_types.dart';

bool get remoteHostSupported => RemoteHost.instance.isSupported;

RemoteHostController get remoteHost => RemoteHost.instance;

/// Phone remote host (fork, dart:io): a small LAN WebSocket server on the PC
/// that paired remotes connect to, plus a UDP responder for discovery. Off by
/// default; see docs/design/phone-remote.md.
///
/// Security: pairing needs an open pairing window, its single-use 6-digit
/// code and the PC user's "Allow"; the device token comes out of a key
/// exchange and never crosses the network. Logins are a mutual
/// challenge-response, and every later frame is sealed with a per-connection
/// key and a sequence number (`remote_crypto.dart`). Failures are
/// rate-limited per address; requests from browsers (an Origin header) are
/// refused; nothing about the Audiobookshelf server is ever sent.
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
    String? hostId,
    bool? supported,
    this.approver,
    this.authTimeout = const Duration(seconds: 10),
    this.approvalTimeout = const Duration(seconds: 60),
    this.stateDebounce = const Duration(milliseconds: 150),
    this.stateInterval = const Duration(seconds: 1),
    this.heartbeat = const Duration(seconds: 2),
    this.deadAfterBeats = 5,
    this.maxConnections = 8,
    this.maxConnectionsPerAddress = 3,
    this.listenOnAccountChange = true,
  }) : _playerFactory = player ?? AppRemotePlayer.new,
       devices = devices ?? PairedDeviceStore(),
       codes = codes ?? PairingCodeIssuer(),
       _limiter = limiter ?? AuthFailureLimiter(),
       _bindAddress = bindAddress,
       _hostNameOverride = hostName,
       _hostId = hostId ?? '',
       _supported =
           supported ?? (!kIsWeb && (Platform.isWindows || Platform.isLinux));

  static final RemoteHost instance = RemoteHost();

  static const prefEnabled = 'remote_link_host_enabled';
  static const prefKeepOn = 'fork_remote_link_keep_on';

  final RemotePlayerFacade Function() _playerFactory;
  @override
  final PairedDeviceStore devices;
  @override
  final PairingCodeIssuer codes;
  @override
  RemotePairApprover? approver;
  final AuthFailureLimiter _limiter;
  final InternetAddress? _bindAddress;
  final String? _hostNameOverride;
  final bool _supported;

  /// 0 binds an ephemeral port (tests).
  final int firstPort;
  final int portCount;
  final int discoveryPort;
  final Duration authTimeout;
  final Duration approvalTimeout;
  final Duration stateDebounce;
  final Duration stateInterval;

  /// A signed-in remote that sends nothing for [deadAfterBeats] beats of
  /// [heartbeat] is dropped (remotes ping every 2 s).
  final Duration heartbeat;
  final int deadAfterBeats;
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
  bool _running = false;
  final List<_Connection> _conns = [];
  int _nextConnId = 1;
  Timer? _stateTimer;
  Timer? _tick;
  Timer? _watchdog;
  String _hostId;
  String _hostName = '';
  int _coverFor = -1;
  Future<Uint8List?>? _coverLoad;
  List<RemoteChapter>? _chaptersSent;
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
      final keepOn = prefs.getBool(prefKeepOn) ?? false;
      var on = prefs.getBool(prefEnabled) ?? false;
      if (on && !keepOn) {
        // Off after every quit unless the user asked to keep it on.
        on = false;
        await prefs.setBool(prefEnabled, false);
      }
      _status.value = RemoteHostStatus(enabled: on, keepOn: keepOn);
      if (on) await _openSafely();
    });
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    if (!_supported) return;
    await _serial(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefEnabled, enabled);
      final keepOn = prefs.getBool(prefKeepOn) ?? false;
      if (enabled) {
        _status.value = RemoteHostStatus(
          enabled: true,
          hostId: _hostId,
          keepOn: keepOn,
        );
        await _openSafely();
        if (_running && !devices.isFull) codes.open();
      } else {
        codes.close();
        await _close();
        _status.value = RemoteHostStatus(keepOn: keepOn);
      }
    });
  }

  @override
  Future<void> setKeepOn(bool keepOn) async {
    if (!_supported) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKeepOn, keepOn);
    _status.value = _status.value.copyWith(keepOn: keepOn);
  }

  @override
  void openPairing() {
    if (!_running || devices.isFull) return;
    codes.open();
  }

  @override
  Future<void> refreshAddresses() async {
    if (!_running) return;
    final addresses = await _localAddresses();
    if (_running) _status.value = _status.value.copyWith(addresses: addresses);
  }

  @override
  Future<void> signedOut() async {
    if (!_supported) return;
    await _serial(() async {
      codes.close();
      await _close();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefEnabled, false);
      _status.value = RemoteHostStatus(
        keepOn: prefs.getBool(prefKeepOn) ?? false,
      );
    });
  }

  Future<void> _onAccountChange() => signedOut();

  @override
  void shutdownForExit() {
    codes.close();
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

  @override
  Future<void> forgetAll() async {
    await devices.forgetAll();
    for (final c in List.of(_conns)) {
      if (c.device != null) _drop(c, RemoteCloseCode.forgotten, 'Forgotten');
    }
  }

  /// Tests: closes everything without touching the saved switch.
  @visibleForTesting
  Future<void> stopForTest() => _serial(_close);

  /// Tests: opens the host without sockets; [acceptForTest] feeds it links.
  @visibleForTesting
  Future<void> startWithoutSocketsForTest() => _serial(() async {
    await devices.load();
    if (_hostId.isEmpty) _hostId = await loadRemoteHostId();
    _hostName = _hostNameOverride ?? 'Test';
    _attachPlayer();
    _running = true;
    _status.value = RemoteHostStatus(
      enabled: true,
      running: true,
      hostId: _hostId,
      hostName: _hostName,
    );
  });

  /// Tests: one incoming link from [address].
  @visibleForTesting
  void acceptForTest(RemoteChannel channel, String address) =>
      _accept(channel, address);

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
        keepOn: _status.value.keepOn,
      );
    }
  }

  void _attachPlayer() {
    final player = _playerFactory();
    _player = player;
    player.addListener(_scheduleState);
  }

  Future<void> _open() async {
    if (_server != null) return;
    await devices.load();
    if (_hostId.isEmpty) _hostId = await loadRemoteHostId();
    final keepOn = _status.value.keepOn;
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
        keepOn: keepOn,
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

    _attachPlayer();
    _hostName = _hostNameOverride ?? _localName();
    final addresses = await _localAddresses();
    debugPrint(
      '[RemoteHost] Listening on port ${server.port}'
      '${discovery ? ' (discovery on)' : ''}',
    );
    _running = true;
    _status.value = RemoteHostStatus(
      enabled: true,
      running: true,
      port: server.port,
      addresses: addresses,
      hostId: _hostId,
      hostName: _hostName,
      discovery: discovery,
      keepOn: keepOn,
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
    _running = false;
    _stateTimer?.cancel();
    _stateTimer = null;
    _tick?.cancel();
    _tick = null;
    _watchdog?.cancel();
    _watchdog = null;
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
    _chaptersSent = null;
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
      return 'Absorb'; // No host name available: a plain fallback.
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
      return const []; // The sheet says there is no address.
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
      return; // Not text: not a probe.
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
      name: _hostName,
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
        _accept(WebSocketRemoteChannel(ws), address);
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

  /// Covers need the ticket of a signed-in connection (it dies with the
  /// connection), never a token.
  Future<void> _serveCover(HttpRequest request, String address) async {
    final response = request.response;
    if (_limiter.isBlocked(address)) {
      await _refuse(response, HttpStatus.tooManyRequests);
      return;
    }
    final auth = request.headers.value(HttpHeaders.authorizationHeader) ?? '';
    final ticket = auth.startsWith('Bearer ') ? auth.substring(7).trim() : '';
    _Connection? conn;
    for (final c in _conns) {
      final t = c.ticket;
      if (t != null && ticket.isNotEmpty && constantTimeEquals(t, ticket)) {
        conn = c;
      }
    }
    if (conn == null) {
      _limiter.recordFailure(address);
      await _refuse(response, HttpStatus.unauthorized);
      return;
    }
    final item = request.uri.queryParameters['item'];
    Uint8List? bytes;
    if (item != null) {
      // Only books this connection was offered.
      if (!conn.recentIds.contains(item)) {
        await _refuse(response, HttpStatus.notFound);
        return;
      }
      bytes = await (_player?.loadCover(item) ?? Future.value(null)).then(
        (b) => b,
        onError: (Object _) => null,
      );
    } else {
      bytes = await _cover();
    }
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

  // ── Connections ───────────────────────────────────────────────────

  void _accept(RemoteChannel channel, String address) {
    final conn = _Connection(_nextConnId++, channel, address, DateTime.now());
    _conns.add(conn);
    conn.authTimer = Timer(authTimeout, () {
      if (conn.device == null && !conn.pairing) {
        _drop(conn, RemoteCloseCode.badRequest, 'No login');
      }
    });
    conn.sub = channel.frames.listen(
      // One frame at a time per connection (pairing awaits the user).
      (data) => conn.queue = conn.queue
          .then((_) => _onFrame(conn, data))
          .catchError((Object e) {
            debugPrint('[RemoteHost] Frame failed: ${e.runtimeType}');
          }),
      onDone: () => _forgetConnection(conn),
      onError: (Object _) => _forgetConnection(conn),
      cancelOnError: true,
    );
    _syncWatchdog();
  }

  void _forgetConnection(_Connection conn) {
    conn.authTimer?.cancel();
    unawaited(conn.cancelListener());
    conn.markClosed();
    if (_conns.remove(conn)) _publishConnections();
  }

  /// Sends the close frame; the socket goes even if the peer never answers.
  void _drop(_Connection conn, int code, String reason) {
    conn.authTimer?.cancel();
    conn.markClosed();
    _conns.remove(conn);
    _publishConnections();
    unawaited(conn.channel.close(code, reason).catchError((Object _) {}));
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
    _syncWatchdog();
  }

  /// Plain before login, sealed after.
  void _send(_Connection conn, RemoteMessage message) {
    if (conn.closed) return;
    final sealer = conn.sealer;
    conn.channel.send(sealer == null ? message.encode() : sealer.seal(message));
  }

  Future<void> _onFrame(_Connection conn, Object? data) async {
    if (conn.closed) return;
    conn.silentBeats = 0;
    if (data is! String || data.length > kRemoteMaxFrameLength + 512) {
      _drop(conn, RemoteCloseCode.badRequest, 'Bad frame');
      return;
    }
    final sealer = conn.sealer;
    if (sealer == null) {
      await _onUnauthenticated(conn, RemoteMessage.decode(data));
      return;
    }
    final message = sealer.open(data);
    if (message == null) {
      // Forged, replayed, reordered or damaged: nothing after it is trusted.
      debugPrint('[RemoteHost] Dropped a connection: bad seal');
      _drop(conn, RemoteCloseCode.badRequest, 'Bad seal');
      return;
    }
    if (message is PingMessage) {
      _send(conn, const PongMessage());
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
    final version = switch (message) {
      HelloMessage(:final version) => version,
      PairMessage(:final version) => version,
      _ => kRemoteProtocolVersion,
    };
    if (version != kRemoteProtocolVersion) {
      _send(conn, const ErrorMessage(RemoteErrorCode.unsupportedVersion));
      _drop(conn, RemoteCloseCode.unsupportedVersion, 'Version');
      return;
    }
    switch (message) {
      case HelloMessage(:final nonce) when conn.hostNonce == null:
        if (!isValidRemoteNonce(nonce)) {
          _drop(conn, RemoteCloseCode.badRequest, 'Bad nonce');
          return;
        }
        conn.remoteNonce = nonce;
        conn.hostNonce = newRemoteSecret();
        _send(conn, ChallengeMessage(hostId: _hostId, nonce: conn.hostNonce!));
      case AuthMessage(:final proof) when conn.hostNonce != null:
        await _onAuth(conn, proof);
      case PairMessage(:final code, :final deviceName, :final key)
          when conn.hostNonce == null && !conn.pairing:
        await _onPair(conn, code, deviceName, key);
      default:
        _drop(conn, RemoteCloseCode.badRequest, 'Expected login');
    }
  }

  Future<void> _onAuth(_Connection conn, String proof) async {
    final nR = conn.remoteNonce!;
    final nH = conn.hostNonce!;
    PairedDevice? found;
    List<int>? foundKey;
    // Every paired device is tried in full (at most a handful), so timing
    // doesn't tell which one matched.
    for (final d in devices.devices) {
      final key = remoteDeviceKeyFromHash(d.tokenHash);
      if (key == null) continue;
      if (constantTimeEquals(proof, remoteClientProof(key, _hostId, nR, nH))) {
        found = d;
        foundKey = key;
      }
    }
    if (found == null || foundKey == null) {
      _limiter.recordFailure(conn.address);
      debugPrint('[RemoteHost] Refused an unknown device');
      _send(conn, const ErrorMessage(RemoteErrorCode.unauthorized));
      _drop(conn, RemoteCloseCode.unauthorized, 'Unauthorized');
      return;
    }
    _limiter.recordSuccess(conn.address);
    final sessionKey = remoteSessionKey(foundKey, _hostId, nR, nH);
    _send(
      conn,
      WelcomeMessage(
        hostId: _hostId,
        hostName: _hostName,
        proof: remoteHostProof(foundKey, _hostId, nR, nH),
      ),
    );
    conn.sealer = RemoteSealer(
      sessionKey,
      outgoing: RemoteDirection.hostToRemote,
    );
    conn.ticket = remoteCoverTicket(sessionKey);
    conn.authTimer?.cancel();
    conn.device = found;
    _publishConnections();
    // Full state for a fresh (or returning) remote.
    _sendState(conn);
    _sendChapters(conn);
    await devices.touch(found.id);
  }

  Future<void> _onPair(
    _Connection conn,
    String code,
    String deviceName,
    String remoteKey,
  ) async {
    final address = conn.address;
    if (RemoteKeyExchange.parsePublic(remoteKey) == null) {
      _drop(conn, RemoteCloseCode.badRequest, 'Bad key');
      return;
    }
    if (devices.isFull) {
      _send(conn, const ErrorMessage(RemoteErrorCode.tooManyDevices));
      _drop(conn, RemoteCloseCode.unauthorized, 'Too many devices');
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
    conn.pairing = true;
    conn.authTimer?.cancel();
    _send(conn, const PairWaitMessage());
    final name = deviceName.isEmpty ? 'Remote' : deviceName;
    final allowed = await _ask(conn, name);
    if (conn.closed) return;
    if (!allowed) {
      debugPrint('[RemoteHost] Pairing refused on the PC');
      _send(conn, const ErrorMessage(RemoteErrorCode.pairDenied));
      _drop(conn, RemoteCloseCode.unauthorized, 'Pairing refused');
      return;
    }
    final exchange = RemoteKeyExchange();
    final shared = exchange.sharedSecret(remoteKey);
    if (shared == null) {
      _drop(conn, RemoteCloseCode.badRequest, 'Bad key');
      return;
    }
    final token = remotePairingToken(
      shared,
      remoteKey,
      exchange.publicKey,
      _hostId,
    );
    final device = await devices.add(name, tokenHash: hashRemoteToken(token));
    if (device == null) {
      _send(conn, const ErrorMessage(RemoteErrorCode.tooManyDevices));
      _drop(conn, RemoteCloseCode.unauthorized, 'Too many devices');
      return;
    }
    if (conn.closed) {
      // Gone before it got its half: don't keep a pairing nobody holds.
      await devices.forget(device.id);
      return;
    }
    debugPrint('[RemoteHost] Paired a new device');
    _send(
      conn,
      PairedMessage(
        hostId: _hostId,
        hostName: _hostName,
        key: exchange.publicKey,
      ),
    );
    // The remote signs in on a new connection with its new key.
    _drop(conn, 1000, 'Paired');
  }

  /// Asks the PC's user; no answer within [approvalTimeout] is a no.
  Future<bool> _ask(_Connection conn, String name) async {
    final ask = approver;
    if (ask == null) return false;
    try {
      return await ask(
        RemotePairRequest(
          deviceName: name,
          timeout: approvalTimeout,
          cancelled: conn.closedFuture,
        ),
      ).timeout(approvalTimeout, onTimeout: () => false);
    } catch (e) {
      debugPrint('[RemoteHost] Pairing question failed: ${e.runtimeType}');
      return false;
    }
  }

  Future<void> _run(_Connection conn, RemoteCommand command) async {
    final player = _player;
    if (player == null) return;
    if (command.needsItem && !player.state.hasItem) {
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
        case StopCommand():
          await player.stop();
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
        case VolumeCommand(:final value):
          await player.setVolume(value);
        case MuteCommand(:final muted):
          await player.setMuted(muted);
        case BookmarkCommand(:final note):
          final ok = await player.addBookmark(note);
          _send(
            conn,
            ok
                ? const NoticeMessage(RemoteNoticeCode.bookmarkAdded)
                : const ErrorMessage(RemoteErrorCode.failed),
          );
        case RecentRequest():
          final items = (await player.recentItems())
              .take(RemoteRecentItem.maxCount)
              .toList();
          conn.recentIds = {for (final i in items) i.id};
          _send(conn, RecentMessage(items));
        case PlayItemCommand(:final itemId):
          if (!conn.recentIds.contains(itemId)) {
            _send(conn, const ErrorMessage(RemoteErrorCode.notFound));
          } else if (!await player.playItem(itemId)) {
            _send(conn, const ErrorMessage(RemoteErrorCode.failed));
          }
      }
    } catch (e) {
      debugPrint('[RemoteHost] ${command.type} failed: ${e.runtimeType}');
      _send(conn, const ErrorMessage(RemoteErrorCode.failed));
    }
    // Answer at once (positions and volume move without notifications).
    _broadcastState();
  }

  // ── State ─────────────────────────────────────────────────────────

  void _sendState(_Connection conn) {
    final message = StateMessage(_player?.state ?? RemotePlayerState.empty);
    conn.lastState = message.encode();
    _send(conn, message);
  }

  void _sendChapters(_Connection conn) {
    final player = _player;
    if (player == null) return;
    final chapters = player.chapters;
    _chaptersSent ??= chapters;
    _send(
      conn,
      ChaptersMessage(itemId: player.state.itemId, chapters: chapters),
    );
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
    final chapters = player.chapters;
    final newChapters = !identical(chapters, _chaptersSent);
    _chaptersSent = chapters;
    final state = player.state;
    final message = StateMessage(state);
    final text = message.encode();
    for (final c in List.of(_conns)) {
      if (c.device == null || c.closed) continue;
      if (newChapters) {
        _send(c, ChaptersMessage(itemId: state.itemId, chapters: chapters));
      }
      if (c.lastState == text) continue;
      c.lastState = text;
      _send(c, message);
    }
  }

  /// Positions move without notifications: send once a second while
  /// someone is connected (only changes go out).
  void _syncTick() {
    final anyone = _conns.any((c) => c.device != null);
    if (anyone && _tick == null && _running) {
      _tick = Timer.periodic(stateInterval, (_) => _broadcastState());
    } else if (!anyone) {
      _tick?.cancel();
      _tick = null;
    }
  }

  /// Drops signed-in remotes that went silent (sleep, Wi-Fi gone).
  void _syncWatchdog() {
    final anyone = _conns.any((c) => c.device != null);
    if (anyone && _watchdog == null && _running) {
      _watchdog = Timer.periodic(heartbeat, (_) {
        for (final c in List.of(_conns)) {
          if (c.device == null) continue;
          if (++c.silentBeats >= deadAfterBeats) {
            debugPrint('[RemoteHost] A remote went silent');
            _drop(c, RemoteCloseCode.timedOut, 'Timed out');
          }
        }
      });
    } else if (!anyone) {
      _watchdog?.cancel();
      _watchdog = null;
    }
  }
}

class _Connection {
  _Connection(this.id, this.channel, this.address, this.since);

  final int id;
  final RemoteChannel channel;
  final String address;
  final DateTime since;
  PairedDevice? device;
  Timer? authTimer;
  StreamSubscription<Object?>? sub;
  String? lastState;
  String? remoteNonce;
  String? hostNonce;
  RemoteSealer? sealer;

  /// What the remote shows to fetch covers while this connection lives.
  String? ticket;

  /// Ids of the books last offered to this remote (the only ones it may
  /// start or fetch covers for).
  Set<String> recentIds = const {};
  bool pairing = false;
  int silentBeats = 0;
  Future<void> queue = Future.value();
  final Completer<void> _closed = Completer<void>();

  bool get closed => _closed.isCompleted;
  Future<void> get closedFuture => _closed.future;

  void markClosed() {
    if (!_closed.isCompleted) _closed.complete();
  }

  /// Ends the frame listener (a no-op once the link is done).
  Future<void>? cancelListener() => sub?.cancel();
}

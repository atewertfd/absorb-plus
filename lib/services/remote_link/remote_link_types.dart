import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'protocol.dart';

/// Phone remote (fork): the web-safe interfaces the UI talks to. The real
/// host and client (dart:io) are in `remote_host.dart` / `remote_client.dart`;
/// web gets the stubs. Import `remote_link.dart`, which picks the right one.

// ── Host ────────────────────────────────────────────────────────────

/// Why the host isn't running although it is switched on.
enum RemoteHostProblem { none, portsBusy, failed }

@immutable
class RemoteHostStatus {
  const RemoteHostStatus({
    this.enabled = false,
    this.running = false,
    this.port,
    this.addresses = const [],
    this.hostId = '',
    this.hostName = '',
    this.discovery = false,
    this.problem = RemoteHostProblem.none,
  });

  /// The saved switch.
  final bool enabled;

  /// Sockets open and listening.
  final bool running;
  final int? port;

  /// This PC's LAN (and system Tailscale) IPv4 addresses.
  final List<String> addresses;
  final String hostId;
  final String hostName;

  /// Whether the UDP discovery port could be opened (another copy of the app
  /// may hold it; manual entry still works then).
  final bool discovery;
  final RemoteHostProblem problem;

  @override
  bool operator ==(Object other) =>
      other is RemoteHostStatus &&
      other.enabled == enabled &&
      other.running == running &&
      other.port == port &&
      listEquals(other.addresses, addresses) &&
      other.hostId == hostId &&
      other.hostName == hostName &&
      other.discovery == discovery &&
      other.problem == problem;

  @override
  int get hashCode => Object.hash(
    enabled,
    running,
    port,
    Object.hashAll(addresses),
    hostId,
    hostName,
    discovery,
    problem,
  );
}

/// One remote connected right now.
@immutable
class RemoteConnectionInfo {
  const RemoteConnectionInfo({
    required this.id,
    required this.deviceId,
    required this.deviceName,
    required this.address,
    required this.since,
  });

  final int id;
  final String deviceId;
  final String deviceName;
  final String address;
  final DateTime since;
}

/// The PC side: off by default, switched on in Settings.
abstract class RemoteHostController {
  /// Windows and Linux.
  bool get isSupported;

  ValueListenable<RemoteHostStatus> get status;
  ValueListenable<List<RemoteConnectionInfo>> get connections;
  PairingCodeIssuer get codes;
  PairedDeviceStore get devices;

  /// App start (signed in): opens the sockets when the switch is on.
  Future<void> start();

  /// The Settings switch: remembers it, then opens or fully closes.
  Future<void> setEnabled(bool enabled);

  /// Sign-out or account switch: closes everything and turns the switch off,
  /// so the next account decides for itself.
  Future<void> signedOut();

  /// The app is quitting: starts closing and returns at once (the exit path
  /// saves progress within a few seconds and must not wait for this).
  void shutdownForExit();

  /// Drops one connection; the device stays paired but doesn't reconnect on
  /// its own.
  Future<void> disconnect(int connectionId);

  /// Revokes a device's token and drops its connections at once.
  Future<void> forget(String deviceId);
}

// ── Remote ──────────────────────────────────────────────────────────

enum RemoteLinkPhase {
  /// Not started yet.
  idle,
  connecting,
  connected,

  /// Lost the host; trying again on its own.
  reconnecting,

  /// Stopped for good (see [RemoteLinkClient.problem]).
  closed,
}

/// Why a link stopped or keeps failing.
enum RemoteLinkProblem {
  none,

  /// The host doesn't know this device (any more): pair again.
  unauthorized,

  /// "Disconnect" on the host.
  disconnectedByHost,

  /// The host was switched off or quit (keeps retrying).
  hostStopped,

  /// Too many failed attempts from here (keeps retrying, slower).
  tooManyAttempts,

  /// The host runs another version of the protocol.
  unsupportedVersion,

  /// Can't reach the address (keeps retrying).
  unreachable,
}

/// A paired remote's live link to one host.
abstract class RemoteLinkClient implements Listenable {
  RemoteLinkPhase get phase;
  RemoteLinkProblem get problem;
  SavedRemoteHost get host;

  /// The host's name from its welcome (or the saved one).
  String get hostName;

  /// Null until the first state arrives after (re)connecting.
  RemotePlayerState? get state;

  /// The current cover, or null.
  Uint8List? get cover;

  /// The last `error` code the host sent for a command (for example
  /// [RemoteErrorCode.nothingLoaded]); cleared by the next state change.
  String? get lastError;

  /// Opens the link and keeps it open (reconnecting) until [close].
  Future<void> connect();

  /// Sends [command] when connected; dropped otherwise.
  void send(RemoteCommand command);

  Future<void> close();

  void dispose();
}

/// Pairing outcome: the saved host, or a [RemoteErrorCode] / 'unreachable'.
@immutable
class RemotePairResult {
  const RemotePairResult.paired(SavedRemoteHost this.host) : error = null;
  const RemotePairResult.failed(String this.error) : host = null;

  static const unreachable = 'unreachable';

  final SavedRemoteHost? host;
  final String? error;
}

/// Finding hosts, pairing, and opening links (the remote side). Injected
/// into the connect screen so tests can use a fake.
abstract class RemoteLinkConnector {
  /// Android, Windows and Linux.
  bool get isSupported;

  /// Hosts answering the UDP broadcast within [timeout].
  Stream<RemoteHostAnnouncement> discover({
    Duration timeout = const Duration(seconds: 2),
  });

  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
  });

  RemoteLinkClient open(SavedRemoteHost host);

  /// This device's name as shown on the host.
  Future<String> deviceName();
}

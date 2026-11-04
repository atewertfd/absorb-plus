import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'protocol.dart';

/// Phone remote (fork): the web-safe interfaces the UI talks to. The real
/// host and client (dart:io) are in `remote_host.dart` / `remote_client.dart`;
/// web gets the stubs. Import `remote_link.dart`, which picks the right one.

// ── Transport ───────────────────────────────────────────────────────

/// One open link between a host and a remote: a WebSocket in the app, an
/// in-memory pair in tests.
abstract class RemoteChannel {
  /// Incoming frames: a `String` for text, anything else is a bad frame.
  /// Single-subscription; done when the link closes.
  Stream<Object?> get frames;

  /// Sends a text frame; dropped once closed.
  void send(String text);

  /// Closes the link with [code] (the other side reads it as its close code).
  Future<void> close([int? code, String? reason]);

  /// The close code the other side sent, once closed.
  int? get closeCode;
}

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
    this.keepOn = false,
  });

  /// The switch (it goes off when Absorb quits unless [keepOn]).
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

  /// "Keep on when Absorb starts" (off by default).
  final bool keepOn;

  RemoteHostStatus copyWith({List<String>? addresses, bool? keepOn}) =>
      RemoteHostStatus(
        enabled: enabled,
        running: running,
        port: port,
        addresses: addresses ?? this.addresses,
        hostId: hostId,
        hostName: hostName,
        discovery: discovery,
        problem: problem,
        keepOn: keepOn ?? this.keepOn,
      );

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
      other.problem == problem &&
      other.keepOn == keepOn;

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
    keepOn,
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

/// A device typed the right code; the PC's user allows or denies it.
@immutable
class RemotePairRequest {
  const RemotePairRequest({
    required this.deviceName,
    required this.timeout,
    required this.cancelled,
  });

  final String deviceName;

  /// No answer within this is a refusal.
  final Duration timeout;

  /// Completes when the device gave up or the host stopped (the question
  /// should close then).
  final Future<void> cancelled;
}

/// Asks the PC's user; true allows the device.
typedef RemotePairApprover = Future<bool> Function(RemotePairRequest request);

/// The PC side: off by default, switched on in Settings.
abstract class RemoteHostController {
  /// Windows and Linux.
  bool get isSupported;

  ValueListenable<RemoteHostStatus> get status;
  ValueListenable<List<RemoteConnectionInfo>> get connections;
  PairingCodeIssuer get codes;
  PairedDeviceStore get devices;

  /// Shows the "Allow …?" question; null refuses every pairing.
  RemotePairApprover? approver;

  /// App start (signed in): opens the sockets when the switch is on and
  /// "Keep on when Absorb starts" is set; otherwise the switch goes off.
  Future<void> start();

  /// The Settings switch: remembers it, then opens (with a pairing window)
  /// or fully closes.
  Future<void> setEnabled(bool enabled);

  /// "Keep on when Absorb starts".
  Future<void> setKeepOn(bool keepOn);

  /// "Pair another device": a new 2-minute pairing window.
  void openPairing();

  /// Reads this PC's addresses again (after sleep or a network change).
  Future<void> refreshAddresses();

  /// Sign-out or account switch: closes everything and turns the switch off,
  /// so the next account decides for itself.
  Future<void> signedOut();

  /// The app is quitting: starts closing and returns at once (the exit path
  /// saves progress within a few seconds and must not wait for this).
  void shutdownForExit();

  /// Drops one connection; the device stays paired but doesn't reconnect on
  /// its own.
  Future<void> disconnect(int connectionId);

  /// Revokes a device's key and drops its connections at once.
  Future<void> forget(String deviceId);

  /// "Forget all".
  Future<void> forgetAll();
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

  /// Can't reach the address, or something else answers there (keeps
  /// retrying, and looks for the computer on the network).
  unreachable,
}

/// Something the host said about a command: an [RemoteErrorCode] or a
/// [RemoteNoticeCode].
@immutable
class RemoteLinkEvent {
  const RemoteLinkEvent(this.code, {this.isError = true});
  final String code;
  final bool isError;
}

/// A paired remote's live link to one host.
abstract class RemoteLinkClient implements Listenable {
  RemoteLinkPhase get phase;
  RemoteLinkProblem get problem;

  /// Where the host is now (it follows the computer to a new address).
  SavedRemoteHost get host;

  /// The host's name from its welcome (or the saved one).
  String get hostName;

  /// Null until the first state arrives after (re)connecting, and again
  /// while disconnected.
  RemotePlayerState? get state;

  /// The chapters of what is playing (empty while disconnected).
  List<RemoteChapter> get chapters;

  /// The host's Continue Listening, null until [requestRecent] is answered.
  List<RemoteRecentItem>? get recent;

  /// The current cover, or null.
  Uint8List? get cover;

  /// The last `error` code the host sent for a command (for example
  /// [RemoteErrorCode.nothingLoaded]); cleared by the next state change.
  String? get lastError;

  /// Errors and notices about commands, as they come.
  Stream<RemoteLinkEvent> get events;

  /// Opens the link and keeps it open (reconnecting) until [close].
  Future<void> connect();

  /// Tries again now instead of waiting for the next retry (the app came
  /// back to the front, for example).
  void reconnectNow();

  /// Sends [command] when connected; dropped otherwise.
  void send(RemoteCommand command);

  /// Asks for the host's Continue Listening ([recent]).
  void requestRecent();

  /// The cover of one of the [recent] books, or null.
  Future<Uint8List?> recentCover(String itemId);

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

  /// Pairs with the code. [onWaiting] runs when the code was right and the
  /// PC is asking its user.
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
    VoidCallback? onWaiting,
  });

  RemoteLinkClient open(SavedRemoteHost host);

  /// This device's name as shown on the host.
  Future<String> deviceName();
}

import 'dart:convert';

/// Phone remote (fork): the wire format between a host (the PC that plays)
/// and a remote (a phone or another PC). JSON text frames over a WebSocket,
/// each with a `"type"`. See docs/design/phone-remote.md.
///
/// Pure Dart: no dart:io, so the web build compiles it too.

const int kRemoteProtocolVersion = 1;

/// The first TCP port the host tries; the next free one up to
/// [kRemoteDefaultPort] + [kRemotePortCount] - 1 if it is taken. Discovery
/// always listens on UDP [kRemoteDefaultPort].
const int kRemoteDefaultPort = 47390;
const int kRemotePortCount = 10;

/// The UDP broadcast a remote sends to find hosts.
const String kRemoteDiscoverMessage = 'ABSORB_REMOTE_DISCOVER v1';

const String kRemoteSocketPath = '/remote';
const String kRemoteCoverPath = '/cover';

/// Frames longer than this are refused (every real message is far smaller).
const int kRemoteMaxFrameLength = 8192;

/// The longest device name kept.
const int kRemoteMaxNameLength = 64;

/// WebSocket close codes the host uses, so the remote knows whether to
/// reconnect.
abstract final class RemoteCloseCode {
  /// Wrong, revoked or missing token: pair again.
  static const unauthorized = 4001;

  /// "Disconnect" on the host: stay paired, but don't reconnect on our own.
  static const disconnectedByHost = 4002;

  /// "Forget" on the host: the token is gone.
  static const forgotten = 4003;

  /// The host was switched off or the app is quitting.
  static const hostStopped = 4004;

  /// Too many failed attempts from this address; try again later.
  static const tooManyAttempts = 4005;

  /// Malformed, oversized or out-of-order message.
  static const badRequest = 4006;

  /// The other side speaks another protocol version.
  static const unsupportedVersion = 4007;
}

/// Error codes in `error` frames. The remote shows its own text for each.
abstract final class RemoteErrorCode {
  static const nothingLoaded = 'nothingLoaded';
  static const badCode = 'badCode';
  static const codeExpired = 'codeExpired';
  static const pairingClosed = 'pairingClosed';
  static const tooManyAttempts = 'tooManyAttempts';
  static const unauthorized = 'unauthorized';
  static const badRequest = 'badRequest';
  static const unsupportedVersion = 'unsupportedVersion';
  static const failed = 'failed';
}

/// The host's sleep timer. [remaining] is seconds in `time` mode and
/// chapters in `chapters` mode.
class RemoteSleepState {
  const RemoteSleepState({this.mode = off, this.remaining = 0});

  static const off = 'off';
  static const time = 'time';
  static const chapters = 'chapters';
  static const episodes = 'episodes';

  final String mode;
  final double remaining;

  bool get isActive => mode != off;

  Map<String, Object?> toJson() => {'mode': mode, 'remaining': remaining};

  static RemoteSleepState fromJson(Object? json) {
    if (json is! Map) return const RemoteSleepState();
    final mode = json['mode'];
    return RemoteSleepState(
      mode:
          mode is String && const {off, time, chapters, episodes}.contains(mode)
          ? mode
          : off,
      remaining: _double(json['remaining']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteSleepState &&
      other.mode == mode &&
      other.remaining == remaining;

  @override
  int get hashCode => Object.hash(mode, remaining);
}

/// What the host is playing. Times are seconds in the whole book.
class RemotePlayerState {
  const RemotePlayerState({
    this.itemId,
    this.title = '',
    this.author = '',
    this.chapterTitle = '',
    this.position = 0,
    this.duration = 0,
    this.chapterStart = 0,
    this.chapterEnd = 0,
    this.playing = false,
    this.buffering = false,
    this.speed = 1,
    this.sleep = const RemoteSleepState(),
    this.coverVersion = 0,
    this.skipBack = 10,
    this.skipForward = 30,
  });

  /// Nothing loaded on the host.
  static const empty = RemotePlayerState();

  final String? itemId;
  final String title;
  final String author;
  final String chapterTitle;
  final double position;
  final double duration;
  final double chapterStart;
  final double chapterEnd;
  final bool playing;
  final bool buffering;
  final double speed;
  final RemoteSleepState sleep;

  /// Changes whenever the cover does; the remote fetches it again then.
  final int coverVersion;

  /// The host's skip amounts in seconds (Absorb Plus addition to the design:
  /// the remote's buttons show and send the host's own amounts).
  final int skipBack;
  final int skipForward;

  bool get hasItem => itemId != null;

  bool get hasChapter => chapterEnd > chapterStart;

  Map<String, Object?> toJson() => {
    'itemId': itemId,
    'title': title,
    'author': author,
    'chapterTitle': chapterTitle,
    'position': position,
    'duration': duration,
    'chapterStart': chapterStart,
    'chapterEnd': chapterEnd,
    'playing': playing,
    'buffering': buffering,
    'speed': speed,
    'sleep': sleep.toJson(),
    'coverVersion': coverVersion,
    'skipBack': skipBack,
    'skipForward': skipForward,
  };

  static RemotePlayerState fromJson(Map json) {
    final itemId = json['itemId'];
    return RemotePlayerState(
      itemId: itemId is String && itemId.isNotEmpty ? itemId : null,
      title: _string(json['title']),
      author: _string(json['author']),
      chapterTitle: _string(json['chapterTitle']),
      position: _double(json['position']),
      duration: _double(json['duration']),
      chapterStart: _double(json['chapterStart']),
      chapterEnd: _double(json['chapterEnd']),
      playing: json['playing'] == true,
      buffering: json['buffering'] == true,
      speed: _double(json['speed'], 1),
      sleep: RemoteSleepState.fromJson(json['sleep']),
      coverVersion: _int(json['coverVersion']),
      skipBack: _int(json['skipBack'], 10),
      skipForward: _int(json['skipForward'], 30),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemotePlayerState &&
      other.itemId == itemId &&
      other.title == title &&
      other.author == author &&
      other.chapterTitle == chapterTitle &&
      other.position == position &&
      other.duration == duration &&
      other.chapterStart == chapterStart &&
      other.chapterEnd == chapterEnd &&
      other.playing == playing &&
      other.buffering == buffering &&
      other.speed == speed &&
      other.sleep == sleep &&
      other.coverVersion == coverVersion &&
      other.skipBack == skipBack &&
      other.skipForward == skipForward;

  @override
  int get hashCode => Object.hash(
    itemId,
    title,
    author,
    chapterTitle,
    position,
    duration,
    chapterStart,
    chapterEnd,
    playing,
    buffering,
    speed,
    sleep,
    coverVersion,
    skipBack,
    skipForward,
  );
}

// ── Messages ────────────────────────────────────────────────────────

/// One frame. [decode] turns text back into the right subclass.
sealed class RemoteMessage {
  const RemoteMessage();

  String get type;

  Map<String, Object?> get fields => const {};

  Map<String, Object?> toJson() => {'type': type, ...fields};

  String encode() => jsonEncode(toJson());

  /// Null for anything malformed, oversized or unknown.
  static RemoteMessage? decode(String text) {
    if (text.length > kRemoteMaxFrameLength) return null;
    Object? json;
    try {
      json = jsonDecode(text);
    } catch (_) {
      return null;
    }
    if (json is! Map) return null;
    final type = json['type'];
    if (type is! String) return null;
    try {
      return _decoders[type]?.call(json);
    } catch (_) {
      return null;
    }
  }

  static final Map<String, RemoteMessage? Function(Map json)> _decoders = {
    HelloMessage.typeName: HelloMessage._fromJson,
    PairMessage.typeName: PairMessage._fromJson,
    WelcomeMessage.typeName: WelcomeMessage._fromJson,
    PairedMessage.typeName: PairedMessage._fromJson,
    StateMessage.typeName: (json) =>
        StateMessage(RemotePlayerState.fromJson(json)),
    ErrorMessage.typeName: ErrorMessage._fromJson,
    PlayCommand.typeName: (_) => const PlayCommand(),
    PauseCommand.typeName: (_) => const PauseCommand(),
    ToggleCommand.typeName: (_) => const ToggleCommand(),
    SeekCommand.typeName: SeekCommand._fromJson,
    SkipCommand.typeName: SkipCommand._fromJson,
    ChapterCommand.typeName: ChapterCommand._fromJson,
    SpeedCommand.typeName: SpeedCommand._fromJson,
    SleepCommand.typeName: SleepCommand._fromJson,
  };
}

/// Remote → host, first frame of a paired remote.
class HelloMessage extends RemoteMessage {
  const HelloMessage({
    required this.token,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'hello';
  final int version;

  /// Secret: never log it.
  final String token;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'version': version, 'token': token};

  static HelloMessage? _fromJson(Map json) {
    final token = json['token'];
    if (token is! String || token.isEmpty || token.length > 128) return null;
    return HelloMessage(token: token, version: _int(json['version']));
  }

  @override
  String toString() => 'HelloMessage(version: $version)';
}

/// Remote → host, first frame when pairing with the code on the host's screen.
class PairMessage extends RemoteMessage {
  const PairMessage({
    required this.code,
    required this.deviceName,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'pair';
  final int version;
  final String code;
  final String deviceName;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'code': code,
    'deviceName': deviceName,
  };

  static PairMessage? _fromJson(Map json) {
    final code = json['code'];
    if (code is! String || code.length > 16) return null;
    return PairMessage(
      code: code,
      deviceName: cleanRemoteName(_string(json['deviceName'])),
      version: _int(json['version']),
    );
  }

  @override
  String toString() => 'PairMessage(version: $version, device: $deviceName)';
}

/// Host → remote: hello accepted.
class WelcomeMessage extends RemoteMessage {
  const WelcomeMessage({
    required this.hostId,
    required this.hostName,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'welcome';
  final int version;
  final String hostId;
  final String hostName;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'hostId': hostId,
    'hostName': hostName,
  };

  static WelcomeMessage? _fromJson(Map json) {
    final hostId = json['hostId'];
    if (hostId is! String || hostId.isEmpty) return null;
    return WelcomeMessage(
      hostId: hostId,
      hostName: cleanRemoteName(_string(json['hostName'])),
      version: _int(json['version']),
    );
  }
}

/// Host → remote: pairing accepted. The remote keeps [token] for [hostId].
class PairedMessage extends RemoteMessage {
  const PairedMessage({
    required this.token,
    required this.hostId,
    required this.hostName,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'paired';
  final int version;

  /// Secret: never log it.
  final String token;
  final String hostId;
  final String hostName;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'token': token,
    'hostId': hostId,
    'hostName': hostName,
  };

  static PairedMessage? _fromJson(Map json) {
    final token = json['token'];
    final hostId = json['hostId'];
    if (token is! String || token.isEmpty || token.length > 128) return null;
    if (hostId is! String || hostId.isEmpty) return null;
    return PairedMessage(
      token: token,
      hostId: hostId,
      hostName: cleanRemoteName(_string(json['hostName'])),
      version: _int(json['version']),
    );
  }

  @override
  String toString() => 'PairedMessage(hostId: $hostId)';
}

/// Host → remote: what is playing.
class StateMessage extends RemoteMessage {
  const StateMessage(this.state);
  static const typeName = 'state';
  final RemotePlayerState state;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => state.toJson();
}

/// Host → remote: a command or the pairing failed. [message] is English, for
/// logs; the remote shows its own text for [code].
class ErrorMessage extends RemoteMessage {
  const ErrorMessage(this.code, [this.message = '']);
  static const typeName = 'error';
  final String code;
  final String message;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'code': code, 'message': message};

  static ErrorMessage? _fromJson(Map json) {
    final code = json['code'];
    if (code is! String) return null;
    return ErrorMessage(code, _string(json['message']));
  }
}

/// Remote → host commands.
sealed class RemoteCommand extends RemoteMessage {
  const RemoteCommand();
}

class PlayCommand extends RemoteCommand {
  const PlayCommand();
  static const typeName = 'play';
  @override
  String get type => typeName;
}

class PauseCommand extends RemoteCommand {
  const PauseCommand();
  static const typeName = 'pause';
  @override
  String get type => typeName;
}

class ToggleCommand extends RemoteCommand {
  const ToggleCommand();
  static const typeName = 'toggle';
  @override
  String get type => typeName;
}

/// Jump to [position] seconds in the whole book.
class SeekCommand extends RemoteCommand {
  const SeekCommand(this.position);
  static const typeName = 'seek';
  final double position;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'position': position};

  static SeekCommand? _fromJson(Map json) {
    final p = json['position'];
    if (p is! num || !p.isFinite || p < 0) return null;
    return SeekCommand(p.toDouble());
  }
}

/// Skip by [seconds]; negative goes back.
class SkipCommand extends RemoteCommand {
  const SkipCommand(this.seconds);
  static const typeName = 'skip';
  static const maxSeconds = 3600;
  final int seconds;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'seconds': seconds};

  static SkipCommand? _fromJson(Map json) {
    final s = json['seconds'];
    if (s is! num || !s.isFinite) return null;
    final whole = s.round();
    if (whole == 0 || whole.abs() > maxSeconds) return null;
    return SkipCommand(whole);
  }
}

/// Previous (-1) or next (1) chapter.
class ChapterCommand extends RemoteCommand {
  const ChapterCommand(this.delta);
  static const typeName = 'chapter';
  final int delta;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'delta': delta};

  static ChapterCommand? _fromJson(Map json) {
    final d = json['delta'];
    if (d is! num || (d != 1 && d != -1)) return null;
    return ChapterCommand(d.toInt());
  }
}

class SpeedCommand extends RemoteCommand {
  const SpeedCommand(this.value);
  static const typeName = 'speed';
  static const min = 0.5;
  static const max = 5.0;
  final double value;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'value': value};

  static SpeedCommand? _fromJson(Map json) {
    final v = json['value'];
    if (v is! num || !v.isFinite) return null;
    return SpeedCommand(v.toDouble().clamp(min, max));
  }
}

/// Exactly one of: a timer of [minutes], [endOfChapter], or [cancel].
class SleepCommand extends RemoteCommand {
  const SleepCommand.minutes(int this.minutes)
    : endOfChapter = false,
      cancel = false;
  const SleepCommand.endOfChapter()
    : minutes = null,
      endOfChapter = true,
      cancel = false;
  const SleepCommand.cancel()
    : minutes = null,
      endOfChapter = false,
      cancel = true;

  static const typeName = 'sleep';
  static const maxMinutes = 24 * 60;
  final int? minutes;
  final bool endOfChapter;
  final bool cancel;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    if (minutes != null) 'minutes': minutes,
    if (endOfChapter) 'endOfChapter': true,
    if (cancel) 'cancel': true,
  };

  static SleepCommand? _fromJson(Map json) {
    if (json['cancel'] == true) return const SleepCommand.cancel();
    if (json['endOfChapter'] == true) return const SleepCommand.endOfChapter();
    final m = json['minutes'];
    if (m is! num || !m.isFinite) return null;
    final whole = m.round();
    if (whole < 1 || whole > maxMinutes) return null;
    return SleepCommand.minutes(whole);
  }
}

// ── Discovery ───────────────────────────────────────────────────────

/// A host's answer to [kRemoteDiscoverMessage]. [address] is filled in by
/// the remote from where the reply came from (never sent).
class RemoteHostAnnouncement {
  const RemoteHostAnnouncement({
    required this.hostId,
    required this.name,
    required this.port,
    this.version = kRemoteProtocolVersion,
    this.address = '',
  });

  static const typeName = 'absorbRemoteHost';

  final String hostId;
  final String name;
  final int port;
  final int version;
  final String address;

  RemoteHostAnnouncement withAddress(String address) => RemoteHostAnnouncement(
    hostId: hostId,
    name: name,
    port: port,
    version: version,
    address: address,
  );

  String encode() => jsonEncode({
    'type': typeName,
    'version': version,
    'name': name,
    'port': port,
    'hostId': hostId,
  });

  static RemoteHostAnnouncement? decode(String text) {
    if (text.length > 1024) return null;
    try {
      final json = jsonDecode(text);
      if (json is! Map || json['type'] != typeName) return null;
      final hostId = json['hostId'];
      final port = json['port'];
      if (hostId is! String || hostId.isEmpty || hostId.length > 64) {
        return null;
      }
      if (port is! int || port <= 0 || port > 65535) return null;
      return RemoteHostAnnouncement(
        hostId: hostId,
        name: cleanRemoteName(_string(json['name'])),
        port: port,
        version: _int(json['version']),
      );
    } catch (_) {
      return null;
    }
  }
}

/// What the host's QR code holds: where to connect and the current code
/// (for a camera scanner in a later stage).
class RemotePairingLink {
  const RemotePairingLink({
    required this.address,
    required this.port,
    required this.hostId,
    required this.code,
  });

  static const scheme = 'absorbremote';

  final String address;
  final int port;
  final String hostId;
  final String code;

  String encode() => Uri(
    scheme: scheme,
    host: 'pair',
    queryParameters: {'h': address, 'p': '$port', 'id': hostId, 'c': code},
  ).toString();

  static RemotePairingLink? parse(String text) {
    final uri = Uri.tryParse(text.trim());
    if (uri == null || uri.scheme != scheme || uri.host != 'pair') return null;
    final q = uri.queryParameters;
    final port = int.tryParse(q['p'] ?? '');
    final address = q['h'] ?? '';
    final hostId = q['id'] ?? '';
    final code = q['c'] ?? '';
    if (port == null || address.isEmpty || hostId.isEmpty) return null;
    return RemotePairingLink(
      address: address,
      port: port,
      hostId: hostId,
      code: code,
    );
  }
}

/// Parses a typed "address" or "address:port". Null when it isn't one.
({String host, int port})? parseRemoteAddress(String text) {
  var value = text.trim();
  if (value.isEmpty || value.contains(' ') || value.contains('/')) return null;
  var port = kRemoteDefaultPort;
  // [v6]:port, or v4/name:port. A bare v6 address has several colons.
  if (value.startsWith('[')) {
    final end = value.indexOf(']');
    if (end < 0) return null;
    final rest = value.substring(end + 1);
    value = value.substring(1, end);
    if (rest.isNotEmpty) {
      if (!rest.startsWith(':')) return null;
      final p = int.tryParse(rest.substring(1));
      if (p == null) return null;
      port = p;
    }
  } else if (':'.allMatches(value).length == 1) {
    final i = value.indexOf(':');
    final p = int.tryParse(value.substring(i + 1));
    if (p == null) return null;
    port = p;
    value = value.substring(0, i);
  }
  if (value.isEmpty || port <= 0 || port > 65535) return null;
  return (host: value, port: port);
}

/// Trims a device or host name to one short line.
String cleanRemoteName(String name) {
  final oneLine = name.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), ' ').trim();
  return oneLine.length > kRemoteMaxNameLength
      ? oneLine.substring(0, kRemoteMaxNameLength)
      : oneLine;
}

String _string(Object? v) => v is String ? v : '';

double _double(Object? v, [double fallback = 0]) =>
    v is num && v.isFinite ? v.toDouble() : fallback;

int _int(Object? v, [int fallback = 0]) =>
    v is num && v.isFinite ? v.round() : fallback;

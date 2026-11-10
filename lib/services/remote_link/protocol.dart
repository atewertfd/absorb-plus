import 'dart:convert';

/// Phone remote (fork): the wire format between a host (the PC that plays)
/// and a remote (a phone or another PC). JSON text frames over a WebSocket,
/// each with a `"type"`. After login every frame is sealed (see
/// `remote_crypto.dart`). See docs/design/phone-remote.md.
///
/// Pure Dart: no dart:io, so the web build compiles it too.

/// 2: key exchange at pairing, challenge-response login, sealed frames,
/// heartbeat, more controls.
const int kRemoteProtocolVersion = 2;

/// The first TCP port the host tries; the next free one up to
/// [kRemoteDefaultPort] + [kRemotePortCount] - 1 if it is taken. Discovery
/// always listens on UDP [kRemoteDefaultPort].
const int kRemoteDefaultPort = 47390;
const int kRemotePortCount = 10;

/// The UDP broadcast a remote sends to find hosts.
const String kRemoteDiscoverMessage = 'ABSORB_REMOTE_DISCOVER v1';

const String kRemoteSocketPath = '/remote';
const String kRemoteCoverPath = '/cover';

/// Frames from a remote longer than this are refused (every real command is
/// far smaller).
const int kRemoteMaxFrameLength = 8192;

/// Frames from the host can carry a chapter list or Continue Listening.
const int kRemoteMaxHostFrameLength = 256 * 1024;

/// The longest device name kept.
const int kRemoteMaxNameLength = 64;

/// The page the QR code opens (shipped with the web build on GitHub Pages).
/// Everything goes in the fragment, which browsers never send to a server.
const String kRemotePairPageUrl =
    'https://atewertfd.github.io/absorb-plus/pair.html';

/// WebSocket close codes the host uses, so the remote knows whether to
/// reconnect.
abstract final class RemoteCloseCode {
  /// Wrong, revoked or missing key: pair again.
  static const unauthorized = 4001;

  /// "Disconnect" on the host: stay paired, but don't reconnect on our own.
  static const disconnectedByHost = 4002;

  /// "Forget" on the host: the key is gone.
  static const forgotten = 4003;

  /// The host was switched off or the app is quitting.
  static const hostStopped = 4004;

  /// Too many failed attempts from this address; try again later.
  static const tooManyAttempts = 4005;

  /// Malformed, oversized, forged or out-of-order message.
  static const badRequest = 4006;

  /// The other side speaks another protocol version.
  static const unsupportedVersion = 4007;

  /// Nothing heard for too long.
  static const timedOut = 4008;
}

/// Error codes in `error` frames. The remote shows its own text for each.
abstract final class RemoteErrorCode {
  static const nothingLoaded = 'nothingLoaded';
  static const badCode = 'badCode';
  static const codeExpired = 'codeExpired';
  static const pairingClosed = 'pairingClosed';
  static const pairDenied = 'pairDenied';
  static const tooManyDevices = 'tooManyDevices';
  static const tooManyAttempts = 'tooManyAttempts';
  static const unauthorized = 'unauthorized';
  static const badRequest = 'badRequest';
  static const unsupportedVersion = 'unsupportedVersion';
  static const notFound = 'notFound';
  static const failed = 'failed';
}

/// Codes in `notice` frames: a command worked.
abstract final class RemoteNoticeCode {
  static const bookmarkAdded = 'bookmarkAdded';
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
    this.volume = 1,
    this.muted = false,
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

  /// The host's skip amounts in seconds.
  final int skipBack;
  final int skipForward;

  /// The PC player's volume, 0 to 1, and whether the remote muted it.
  final double volume;
  final bool muted;

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
    'volume': volume,
    'muted': muted,
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
      volume: _double(json['volume'], 1).clamp(0.0, 1.0),
      muted: json['muted'] == true,
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
      other.skipForward == skipForward &&
      other.volume == volume &&
      other.muted == muted;

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
    volume,
    muted,
  );
}

/// One chapter of what is playing (seconds in the whole book).
class RemoteChapter {
  const RemoteChapter({
    required this.title,
    required this.start,
    required this.end,
  });

  static const maxCount = 1000;
  static const maxTitleLength = 120;

  final String title;
  final double start;
  final double end;

  Map<String, Object?> toJson() => {'t': title, 's': start, 'e': end};

  static RemoteChapter? fromJson(Object? json) {
    if (json is! Map) return null;
    return RemoteChapter(
      title: _clip(_string(json['t']), maxTitleLength),
      start: _double(json['s']),
      end: _double(json['e']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteChapter &&
      other.title == title &&
      other.start == start &&
      other.end == end;

  @override
  int get hashCode => Object.hash(title, start, end);
}

/// A book the host can start (its Continue Listening).
class RemoteRecentItem {
  const RemoteRecentItem({
    required this.id,
    required this.title,
    this.author = '',
    this.progress = 0,
  });

  static const maxCount = 12;

  final String id;
  final String title;
  final String author;

  /// 0 to 1.
  final double progress;

  Map<String, Object?> toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'progress': progress,
  };

  static RemoteRecentItem? fromJson(Object? json) {
    if (json is! Map) return null;
    final id = json['id'];
    if (id is! String || id.isEmpty || id.length > 128) return null;
    return RemoteRecentItem(
      id: id,
      title: _clip(_string(json['title']), 200),
      author: _clip(_string(json['author']), 200),
      progress: _double(json['progress']).clamp(0.0, 1.0),
    );
  }
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
  static RemoteMessage? decode(
    String text, {
    int maxLength = kRemoteMaxFrameLength,
  }) {
    if (text.length > maxLength) return null;
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
    ChallengeMessage.typeName: ChallengeMessage._fromJson,
    AuthMessage.typeName: AuthMessage._fromJson,
    PairMessage.typeName: PairMessage._fromJson,
    PairWaitMessage.typeName: (_) => const PairWaitMessage(),
    WelcomeMessage.typeName: WelcomeMessage._fromJson,
    PairedMessage.typeName: PairedMessage._fromJson,
    PingMessage.typeName: (_) => const PingMessage(),
    PongMessage.typeName: (_) => const PongMessage(),
    StateMessage.typeName: (json) =>
        StateMessage(RemotePlayerState.fromJson(json)),
    ChaptersMessage.typeName: ChaptersMessage._fromJson,
    RecentMessage.typeName: RecentMessage._fromJson,
    ErrorMessage.typeName: ErrorMessage._fromJson,
    NoticeMessage.typeName: NoticeMessage._fromJson,
    PlayCommand.typeName: (_) => const PlayCommand(),
    PauseCommand.typeName: (_) => const PauseCommand(),
    ToggleCommand.typeName: (_) => const ToggleCommand(),
    StopCommand.typeName: (_) => const StopCommand(),
    SeekCommand.typeName: SeekCommand._fromJson,
    SkipCommand.typeName: SkipCommand._fromJson,
    ChapterCommand.typeName: ChapterCommand._fromJson,
    SpeedCommand.typeName: SpeedCommand._fromJson,
    SleepCommand.typeName: SleepCommand._fromJson,
    VolumeCommand.typeName: VolumeCommand._fromJson,
    MuteCommand.typeName: MuteCommand._fromJson,
    BookmarkCommand.typeName: BookmarkCommand._fromJson,
    RecentRequest.typeName: (_) => const RecentRequest(),
    PlayItemCommand.typeName: PlayItemCommand._fromJson,
  };
}

/// Remote → host, first frame of a paired remote: its nonce.
class HelloMessage extends RemoteMessage {
  const HelloMessage({
    required this.nonce,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'hello';
  final int version;
  final String nonce;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'version': version, 'nonce': nonce};

  static HelloMessage? _fromJson(Map json) {
    // An older remote sends no nonce: still decoded, so it can be told to
    // update.
    final nonce = _string(json['nonce']);
    if (nonce.length > 128) return null;
    return HelloMessage(nonce: nonce, version: _int(json['version']));
  }
}

/// Host → remote: the host's id and nonce; the remote answers with [AuthMessage].
class ChallengeMessage extends RemoteMessage {
  const ChallengeMessage({
    required this.hostId,
    required this.nonce,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'challenge';
  final int version;
  final String hostId;
  final String nonce;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'hostId': hostId,
    'nonce': nonce,
  };

  static ChallengeMessage? _fromJson(Map json) {
    final hostId = json['hostId'];
    final nonce = json['nonce'];
    if (hostId is! String || hostId.isEmpty || hostId.length > 64) return null;
    if (nonce is! String || nonce.length > 128) return null;
    return ChallengeMessage(
      hostId: hostId,
      nonce: nonce,
      version: _int(json['version']),
    );
  }
}

/// Remote → host: proof that it holds a paired device's key.
class AuthMessage extends RemoteMessage {
  const AuthMessage(this.proof);
  static const typeName = 'auth';
  final String proof;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'proof': proof};

  static AuthMessage? _fromJson(Map json) {
    final proof = json['proof'];
    if (proof is! String || proof.isEmpty || proof.length > 128) return null;
    return AuthMessage(proof);
  }
}

/// Remote → host, first frame when pairing with the code on the host's
/// screen. [key] is the remote's half of the key exchange.
class PairMessage extends RemoteMessage {
  const PairMessage({
    required this.code,
    required this.deviceName,
    required this.key,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'pair';
  final int version;
  final String code;
  final String deviceName;
  final String key;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'code': code,
    'deviceName': deviceName,
    'key': key,
  };

  static PairMessage? _fromJson(Map json) {
    final code = json['code'];
    final key = _string(json['key']);
    if (code is! String || code.length > 16) return null;
    if (key.length > 400) return null;
    return PairMessage(
      code: code,
      deviceName: cleanRemoteName(_string(json['deviceName'])),
      key: key,
      version: _int(json['version']),
    );
  }

  @override
  String toString() => 'PairMessage(version: $version, device: $deviceName)';
}

/// Host → remote: the code was right; the PC is asking its user to allow it.
class PairWaitMessage extends RemoteMessage {
  const PairWaitMessage();
  static const typeName = 'pairWait';
  @override
  String get type => typeName;
}

/// Host → remote: login accepted. [proof] shows the host knows the key too.
class WelcomeMessage extends RemoteMessage {
  const WelcomeMessage({
    required this.hostId,
    required this.hostName,
    required this.proof,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'welcome';
  final int version;
  final String hostId;
  final String hostName;
  final String proof;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'hostId': hostId,
    'hostName': hostName,
    'proof': proof,
  };

  static WelcomeMessage? _fromJson(Map json) {
    final hostId = json['hostId'];
    final proof = json['proof'];
    if (hostId is! String || hostId.isEmpty) return null;
    if (proof is! String || proof.length > 128) return null;
    return WelcomeMessage(
      hostId: hostId,
      hostName: cleanRemoteName(_string(json['hostName'])),
      proof: proof,
      version: _int(json['version']),
    );
  }
}

/// Host → remote: pairing allowed. [key] is the host's half of the key
/// exchange; the token is derived on both sides and never sent.
class PairedMessage extends RemoteMessage {
  const PairedMessage({
    required this.hostId,
    required this.hostName,
    required this.key,
    this.version = kRemoteProtocolVersion,
  });
  static const typeName = 'paired';
  final int version;
  final String hostId;
  final String hostName;
  final String key;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'version': version,
    'hostId': hostId,
    'hostName': hostName,
    'key': key,
  };

  static PairedMessage? _fromJson(Map json) {
    final hostId = json['hostId'];
    final key = json['key'];
    if (hostId is! String || hostId.isEmpty || hostId.length > 64) return null;
    if (key is! String || key.length > 400) return null;
    return PairedMessage(
      hostId: hostId,
      hostName: cleanRemoteName(_string(json['hostName'])),
      key: key,
      version: _int(json['version']),
    );
  }

  @override
  String toString() => 'PairedMessage(hostId: $hostId)';
}

/// Remote → host heartbeat; the host answers [PongMessage].
class PingMessage extends RemoteMessage {
  const PingMessage();
  static const typeName = 'ping';
  @override
  String get type => typeName;
}

class PongMessage extends RemoteMessage {
  const PongMessage();
  static const typeName = 'pong';
  @override
  String get type => typeName;
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

/// Host → remote: the chapters of [itemId] (sent after login and whenever
/// the item changes).
class ChaptersMessage extends RemoteMessage {
  const ChaptersMessage({required this.itemId, required this.chapters});
  static const typeName = 'chapters';
  final String? itemId;
  final List<RemoteChapter> chapters;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'itemId': itemId,
    'chapters': [
      for (final c in chapters.take(RemoteChapter.maxCount)) c.toJson(),
    ],
  };

  static ChaptersMessage? _fromJson(Map json) {
    final itemId = json['itemId'];
    final list = json['chapters'];
    if (list is! List) return null;
    return ChaptersMessage(
      itemId: itemId is String && itemId.isNotEmpty ? itemId : null,
      chapters: List.unmodifiable(
        list
            .take(RemoteChapter.maxCount)
            .map(RemoteChapter.fromJson)
            .whereType<RemoteChapter>(),
      ),
    );
  }
}

/// Host → remote: books the remote can start (answer to [RecentRequest]).
class RecentMessage extends RemoteMessage {
  const RecentMessage(this.items);
  static const typeName = 'recent';
  final List<RemoteRecentItem> items;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {
    'items': [
      for (final i in items.take(RemoteRecentItem.maxCount)) i.toJson(),
    ],
  };

  static RecentMessage? _fromJson(Map json) {
    final list = json['items'];
    if (list is! List) return null;
    return RecentMessage(
      List.unmodifiable(
        list
            .take(RemoteRecentItem.maxCount)
            .map(RemoteRecentItem.fromJson)
            .whereType<RemoteRecentItem>(),
      ),
    );
  }
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

/// Host → remote: a command worked and the remote should say so
/// ([RemoteNoticeCode]).
class NoticeMessage extends RemoteMessage {
  const NoticeMessage(this.code);
  static const typeName = 'notice';
  final String code;

  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'code': code};

  static NoticeMessage? _fromJson(Map json) {
    final code = json['code'];
    if (code is! String || code.length > 64) return null;
    return NoticeMessage(code);
  }
}

/// Remote → host commands.
sealed class RemoteCommand extends RemoteMessage {
  const RemoteCommand();

  /// Commands that work while nothing is loaded on the host.
  bool get needsItem => true;
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

/// Stops playback on the PC (as the player's own Stop).
class StopCommand extends RemoteCommand {
  const StopCommand();
  static const typeName = 'stop';
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

/// The PC player's volume, 0 to 1.
class VolumeCommand extends RemoteCommand {
  const VolumeCommand(this.value);
  static const typeName = 'volume';
  final double value;
  @override
  bool get needsItem => false;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'value': value};

  static VolumeCommand? _fromJson(Map json) {
    final v = json['value'];
    if (v is! num || !v.isFinite) return null;
    return VolumeCommand(v.toDouble().clamp(0.0, 1.0));
  }
}

class MuteCommand extends RemoteCommand {
  const MuteCommand(this.muted);
  static const typeName = 'mute';
  final bool muted;
  @override
  bool get needsItem => false;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'muted': muted};

  static MuteCommand? _fromJson(Map json) {
    final m = json['muted'];
    if (m is! bool) return null;
    return MuteCommand(m);
  }
}

/// A bookmark at the current spot, with an optional [note].
class BookmarkCommand extends RemoteCommand {
  const BookmarkCommand([this.note = '']);
  static const typeName = 'bookmark';
  static const maxNoteLength = 500;
  final String note;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {if (note.isNotEmpty) 'note': note};

  static BookmarkCommand? _fromJson(Map json) {
    final note = json['note'];
    if (note != null && note is! String) return null;
    final text = (note as String? ?? '').trim();
    if (text.length > maxNoteLength) return null;
    return BookmarkCommand(text);
  }
}

/// Asks for the host's Continue Listening ([RecentMessage]).
class RecentRequest extends RemoteCommand {
  const RecentRequest();
  static const typeName = 'getRecent';
  @override
  bool get needsItem => false;
  @override
  String get type => typeName;
}

/// Starts [itemId] on the PC (one of the [RecentMessage] items).
class PlayItemCommand extends RemoteCommand {
  const PlayItemCommand(this.itemId);
  static const typeName = 'playItem';
  final String itemId;
  @override
  bool get needsItem => false;
  @override
  String get type => typeName;
  @override
  Map<String, Object?> get fields => {'itemId': itemId};

  static PlayItemCommand? _fromJson(Map json) {
    final id = json['itemId'];
    if (id is! String || id.isEmpty || id.length > 128) return null;
    return PlayItemCommand(id);
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

/// What the host's QR code holds: where to connect and the current code.
///
/// The QR is an https link to [kRemotePairPageUrl] with everything in the
/// fragment, so a phone's normal camera opens it; that page hands the same
/// data to the app as `absorb://remote-pair?...`. Both forms parse.
class RemotePairingLink {
  const RemotePairingLink({
    required this.address,
    required this.port,
    required this.hostId,
    required this.code,
  });

  static const appScheme = 'absorb';
  static const appHost = 'remote-pair';

  final String address;
  final int port;
  final String hostId;
  final String code;

  Map<String, String> get _params => {
    'h': address,
    'p': '$port',
    'c': code,
    'id': hostId,
  };

  /// The QR code's https page link.
  String encode({String page = kRemotePairPageUrl}) =>
      '$page#${Uri(queryParameters: _params).query}';

  /// The in-app link the page opens.
  String encodeAppLink() => Uri(
    scheme: appScheme,
    host: appHost,
    queryParameters: _params,
  ).toString();

  static bool isAppLink(Uri uri) =>
      uri.scheme.toLowerCase() == appScheme &&
      uri.host.toLowerCase() == appHost;

  static RemotePairingLink? parse(String text) {
    final uri = Uri.tryParse(text.trim());
    if (uri == null) return null;
    Map<String, String> q;
    if (isAppLink(uri)) {
      q = uri.queryParameters;
    } else if ((uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.path.endsWith('/pair.html') &&
        uri.fragment.isNotEmpty) {
      try {
        q = Uri.splitQueryString(uri.fragment);
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
    final port = int.tryParse(q['p'] ?? '');
    final address = (q['h'] ?? '').trim();
    final hostId = (q['id'] ?? '').trim();
    final code = (q['c'] ?? '').trim();
    if (port == null || port <= 0 || port > 65535) return null;
    if (parseRemoteAddress(address) == null) return null;
    if (hostId.isEmpty || hostId.length > 64) return null;
    if (code.isNotEmpty && !RegExp(r'^\d{6}$').hasMatch(code)) return null;
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

/// The address a phone on the same Wi-Fi most likely reaches: a home-network
/// range first (192.168/16, 10/8, 172.16/12), then anything else. Null when
/// there is none.
String? preferredRemoteAddress(List<String> addresses) {
  int rank(String a) {
    final p = a.split('.').map(int.tryParse).toList();
    if (p.length != 4 || p.contains(null)) return 9;
    if (p[0] == 192 && p[1] == 168) return 0;
    if (p[0] == 10) return 1;
    if (p[0] == 172 && p[1]! >= 16 && p[1]! <= 31) return 2;
    return 5;
  }

  String? best;
  for (final a in addresses) {
    if (best == null || rank(a) < rank(best)) best = a;
  }
  return best;
}

/// Trims a device or host name to one short line.
String cleanRemoteName(String name) {
  final oneLine = name.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), ' ').trim();
  return oneLine.length > kRemoteMaxNameLength
      ? oneLine.substring(0, kRemoteMaxNameLength)
      : oneLine;
}

String _string(Object? v) => v is String ? v : '';

String _clip(String v, int max) => v.length > max ? v.substring(0, max) : v;

double _double(Object? v, [double fallback = 0]) =>
    v is num && v.isFinite ? v.toDouble() : fallback;

int _int(Object? v, [int fallback = 0]) =>
    v is num && v.isFinite ? v.round() : fallback;

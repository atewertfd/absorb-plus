import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState, WidgetsBinding;
import 'package:shared_preferences/shared_preferences.dart';

import '../media_session_guest.dart';
import 'protocol.dart';
import 'remote_link_types.dart';

/// The phone's media session as [RemoteMediaMirror] uses it: the app's audio
/// handler on Android (`remote_media_session_io.dart`), a fake in tests.
abstract class RemoteMediaSessionPort {
  /// Android with the audio service running.
  bool get isAvailable;

  /// Borrows the session; false while the phone itself plays.
  bool lend(MediaSessionGuest guest);

  void show(MediaSessionGuest guest, MediaItem? item, PlaybackState state);

  void giveBack(MediaSessionGuest guest);

  /// A file the notification can load the cover from, or null.
  Future<Uri?> coverUri(Uint8List bytes, String key);
}

/// Phone remote, stage 2 (fork): while the remote screen is connected to a
/// PC and the phone itself isn't playing, the phone's media notification,
/// lock screen, headset buttons and Wear OS show and control what the PC
/// plays. It borrows the app's one media session
/// ([AudioPlayerHandler.lendSession]); starting a book on the phone takes
/// the session back at once, and the PC's notification only returns after
/// the remote screen comes back to the front ([resume]).
///
/// The session goes back when the remote screen closes, when the setting is
/// turned off, and when the link stays down (or the PC has nothing loaded)
/// for longer than [grace].
class RemoteMediaMirror implements MediaSessionGuest {
  RemoteMediaMirror({
    required this.client,
    required this.session,
    bool enabled = true,
    this.grace = const Duration(seconds: 15),
    bool Function()? isForeground,
    DateTime Function()? now,
  }) : _enabled = enabled,
       _isForeground = isForeground ?? _appInForeground,
       _now = now ?? DateTime.now {
    client.addListener(_sync);
    _sync();
  }

  /// "Show controls on the lock screen" (default on).
  static const prefShowOnLockScreen = 'fork_remote_lock_screen';

  static Future<bool> loadEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(prefShowOnLockScreen) ?? true;
  }

  static Future<void> saveEnabled(bool on) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefShowOnLockScreen, on);
  }

  final RemoteLinkClient client;
  final RemoteMediaSessionPort session;
  final Duration grace;
  final bool Function() _isForeground;
  final DateTime Function() _now;

  bool _enabled;
  bool _lent = false;
  bool _reclaimed = false;
  bool _disposed = false;
  Timer? _graceTimer;
  RemotePlayerState? _shown;
  String? _itemKey;
  _Pushed? _pushed;
  Uint8List? _coverBytes;
  Uri? _coverUri;

  /// Whether the PC is on the phone's media session now.
  bool get showing => _lent;

  bool get enabled => _enabled;

  set enabled(bool on) {
    if (_enabled == on) return;
    _enabled = on;
    _sync();
  }

  /// The remote screen is in front again: after local playback took the
  /// session, the PC may have it back.
  void resume() {
    _reclaimed = false;
    _sync();
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    client.removeListener(_sync);
    _giveBack();
  }

  static bool _appInForeground() {
    final s = WidgetsBinding.instance.lifecycleState;
    return s == null || s == AppLifecycleState.resumed;
  }

  void _sync() {
    if (_disposed) return;
    final connected = client.phase == RemoteLinkPhase.connected;
    final state = connected ? client.state : null;
    if (!_enabled || _reclaimed) {
      _giveBack();
      return;
    }
    if (state == null || !state.hasItem) {
      // A reconnect or a book change: keep the controls for a moment.
      if (_lent) {
        _graceTimer ??= Timer(grace, _giveBack);
      }
      return;
    }
    _graceTimer?.cancel();
    _graceTimer = null;
    if (!_lent) {
      // Starting the notification needs the app in front (Android limits
      // foreground services started from the background).
      if (!session.isAvailable || !_isForeground()) return;
      if (!session.lend(this)) return;
      _lent = true;
      _itemKey = null;
      _pushed = null;
    }
    _syncCover(state);
    _show(state);
  }

  void _giveBack() {
    _graceTimer?.cancel();
    _graceTimer = null;
    if (!_lent) return;
    _lent = false;
    _shown = null;
    _itemKey = null;
    _pushed = null;
    session.giveBack(this);
  }

  void _syncCover(RemotePlayerState state) {
    final bytes = client.cover;
    if (identical(bytes, _coverBytes)) return;
    _coverBytes = bytes;
    _coverUri = null;
    if (bytes == null) return;
    final key = '${state.itemId}-${state.coverVersion}';
    unawaited(
      session
          .coverUri(bytes, key)
          .then(
            (uri) {
              if (_disposed || !identical(bytes, _coverBytes) || uri == null) {
                return;
              }
              _coverUri = uri;
              final shown = _shown;
              if (_lent && shown != null) _show(shown);
            },
            onError: (Object e) {
              debugPrint('[RemoteMirror] Cover failed: ${e.runtimeType}');
            },
          ),
    );
  }

  void _show(RemotePlayerState state) {
    _shown = state;
    final view = remoteMediaView(
      state,
      coverUri: _coverUri,
      updateTime: _now(),
    );
    final key = view.itemKey;
    final item = key == _itemKey ? null : view.item;
    final last = _pushed;
    final first = last == null;
    final pushed = _Pushed.of(state, _now());
    if (item == null && last != null && !last.differs(pushed)) return;
    _itemKey = key;
    if (first && !state.playing) {
      // Android shows the notification when a session starts playing:
      // a playing blip first, then the PC's real (paused) state. The
      // notification stays while paused (androidStopForegroundOnPause off).
      session.show(this, item, view.state.copyWith(playing: true));
      session.show(this, null, view.state);
    } else {
      session.show(this, item, view.state);
    }
    _pushed = pushed;
  }

  RemotePlayerState? get _state => _shown ?? client.state;

  bool get _chapterMode => _state?.hasChapter ?? false;

  void _send(RemoteCommand command) {
    if (_disposed) return;
    client.send(command);
  }

  // ── MediaSessionGuest ─────────────────────────────────────────────

  @override
  Future<void> play() async => _send(const PlayCommand());

  @override
  Future<void> pause() async => _send(const PauseCommand());

  /// The system's stop (Wear OS, some cars): pauses the PC, never stops it.
  @override
  Future<void> stop() async => _send(const PauseCommand());

  @override
  Future<void> seek(Duration position) async {
    final state = _state;
    if (state == null) return;
    var seconds = position.inMilliseconds / 1000;
    if (_chapterMode) seconds += state.chapterStart;
    if (seconds < 0) seconds = 0;
    _send(SeekCommand(seconds));
  }

  @override
  Future<void> fastForward() async {
    final s = _state?.skipForward ?? 0;
    _send(SkipCommand(s > 0 ? s : 30));
  }

  @override
  Future<void> rewind() async {
    final s = _state?.skipBack ?? 0;
    _send(SkipCommand(-(s > 0 ? s : 10)));
  }

  @override
  Future<void> click(MediaButton button) async {
    switch (button) {
      case MediaButton.media:
        _send(const ToggleCommand());
      case MediaButton.next:
        await fastForward();
      case MediaButton.previous:
        await rewind();
    }
  }

  @override
  Future<void> customAction(String name) async {
    switch (name) {
      case 'nextChapter':
        _send(const ChapterCommand(1));
      case 'previousChapter':
        _send(const ChapterCommand(-1));
    }
  }

  @override
  void sessionReclaimed() {
    _lent = false;
    _reclaimed = true;
    _shown = null;
    _itemKey = null;
    _pushed = null;
    _graceTimer?.cancel();
    _graceTimer = null;
  }
}

/// What was last pushed, to skip pushes that change nothing (the PC sends a
/// state every second while playing; Android moves the bar by itself).
class _Pushed {
  _Pushed(this.playing, this.buffering, this.speed, this.position, this.at);

  factory _Pushed.of(RemotePlayerState s, DateTime at) =>
      _Pushed(s.playing, s.buffering, s.speed, s.position, at);

  final bool playing;
  final bool buffering;
  final double speed;
  final double position;
  final DateTime at;

  bool differs(_Pushed next) {
    if (next.playing != playing ||
        next.buffering != buffering ||
        next.speed != speed) {
      return true;
    }
    final elapsed = next.at.difference(at).inMilliseconds / 1000;
    final expected = playing ? position + elapsed * speed : position;
    return (next.position - expected).abs() > 1.5;
  }
}

/// The media notification's view of the PC: the item and the state.
@immutable
class RemoteMediaView {
  const RemoteMediaView(this.item, this.state, this.itemKey);
  final MediaItem item;
  final PlaybackState state;

  /// Changes only when the item's text, length or cover does.
  final String itemKey;
}

/// Builds what the notification shows for [state]: the chapter's progress
/// when the book has chapters (the whole book otherwise), the PC's skip
/// amounts, and previous/next chapter buttons.
RemoteMediaView remoteMediaView(
  RemotePlayerState state, {
  Uri? coverUri,
  DateTime? updateTime,
}) {
  final chapters = state.hasChapter;
  final start = chapters ? state.chapterStart : 0.0;
  final length = chapters
      ? state.chapterEnd - state.chapterStart
      : state.duration;
  final position = (state.position - start).clamp(
    0.0,
    length > 0 ? length : 0.0,
  );
  final subtitle = state.chapterTitle.isNotEmpty
      ? state.chapterTitle
      : state.author;
  final item = MediaItem(
    id: 'absorb-remote:${state.itemId}',
    title: state.title,
    artist: subtitle,
    album: state.author,
    duration: Duration(milliseconds: (length * 1000).round()),
    artUri: coverUri,
  );
  final back = state.skipBack > 0 ? state.skipBack : 10;
  final forward = state.skipForward > 0 ? state.skipForward : 30;
  final controls = <MediaControl>[
    MediaControl(
      androidIcon: 'drawable/ic_skip_back',
      label: 'Back ${back}s',
      action: MediaAction.rewind,
    ),
    state.playing ? MediaControl.pause : MediaControl.play,
    MediaControl(
      androidIcon: 'drawable/ic_skip_forward',
      label: 'Forward ${forward}s',
      action: MediaAction.fastForward,
    ),
    if (chapters) ...[
      MediaControl.custom(
        androidIcon: 'drawable/ic_widget_prev_chapter',
        label: 'Previous chapter',
        name: 'previousChapter',
      ),
      MediaControl.custom(
        androidIcon: 'drawable/ic_widget_next_chapter',
        label: 'Next chapter',
        name: 'nextChapter',
      ),
    ],
  ];
  final playback = PlaybackState(
    controls: controls,
    systemActions: const {
      MediaAction.seek,
      MediaAction.seekForward,
      MediaAction.seekBackward,
    },
    androidCompactActionIndices: const [0, 1, 2],
    processingState: state.buffering
        ? AudioProcessingState.buffering
        : AudioProcessingState.ready,
    playing: state.playing,
    updatePosition: Duration(milliseconds: (position * 1000).round()),
    speed: state.speed > 0 ? state.speed : 1.0,
    updateTime: updateTime,
  );
  final key = [
    item.id,
    item.title,
    item.artist,
    item.album,
    item.duration?.inSeconds,
    coverUri,
  ].join('\u0001');
  return RemoteMediaView(item, playback, key);
}

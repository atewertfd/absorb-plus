import 'package:flutter/foundation.dart';

/// Exclusive audio fallback (fork-owned, Windows). With "exclusive audio" on,
/// mpv opens the output device in WASAPI exclusive mode. When Windows refuses
/// that (another app holds the device exclusively, or no format the device
/// takes in exclusive mode), mpv logs
/// `[cplayer] Could not open/initialize audio device -> no sound.` and the
/// book would stay silent. This decides, from that log line, to switch to
/// shared mode for the rest of this run: the vendored just_audio_media_kit
/// (`JustAudioMediaKit.audioOutputFallback`) applies the returned properties
/// to the live player and reopens the file where it was; [onFallBack] makes
/// players created later shared too; [notice] tells the user once.
///
/// The saved setting stays on, so the next start tries exclusive again (the
/// device may be free by then).
class ExclusiveAudioFallback {
  ExclusiveAudioFallback();

  static final ExclusiveAudioFallback instance = ExclusiveAudioFallback();

  /// The properties that turn exclusive mode off on a live mpv player.
  static const sharedModeProperties = {'audio-exclusive': 'no'};

  /// Whether players are being created in exclusive mode right now.
  bool exclusiveRequested = false;

  /// Makes players created from now on use shared mode.
  VoidCallback? onFallBack;

  /// Becomes true once, when this run fell back to shared mode.
  final ValueNotifier<bool> notice = ValueNotifier(false);

  bool _fellBack = false;
  bool get fellBack => _fellBack;

  /// mpv's line for an audio output it couldn't open. It is logged once per
  /// failed open, at error level, under the `cplayer` prefix (the same line
  /// media_kit turns into a player error).
  static bool isAudioOutputFailure(String level, String prefix, String text) {
    if (level != 'error' && level != 'fatal') return false;
    if (prefix != 'cplayer') return false;
    return text.toLowerCase().contains(
      'could not open/initialize audio device',
    );
  }

  /// For `JustAudioMediaKit.audioOutputFallback`: the properties to apply
  /// when [text] is an exclusive-mode output failure, else null. Falls back
  /// at most once per run; a failure in shared mode is reported as usual.
  Map<String, String>? decide(String level, String prefix, String text) {
    if (!exclusiveRequested || _fellBack) return null;
    if (!isAudioOutputFailure(level, prefix, text)) return null;
    _fellBack = true;
    exclusiveRequested = false;
    debugPrint(
      '[Audio] Exclusive mode refused by the device - using shared mode',
    );
    onFallBack?.call();
    notice.value = true;
    return sharedModeProperties;
  }

  /// The user turned the setting on again: let the next failure fall back
  /// (and tell them) again.
  void reset() {
    _fellBack = false;
    notice.value = false;
  }
}

import 'dart:io';

import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _exclusiveAudioKey = 'fork_windows_exclusive_audio';

bool _initialized = false;

/// Register the native playback backend before constructing an AudioPlayer.
/// SMTC (Windows) and MPRIS (Linux) register through Flutter's plugin loader.
void initializeDesktopAudio() {
  if (_initialized || (!Platform.isWindows && !Platform.isLinux)) return;
  JustAudioMediaKit.title = 'Absorb Plus';
  // The app never changes pitch. With pitch control on, media_kit routes all
  // audio, even at 1x, through mpv's old `scaletempo` filter, which distorts
  // and clips speech. Off, speed uses mpv's own pitch correction
  // (scaletempo2) and 1x plays untouched.
  JustAudioMediaKit.pitch = false;
  // Crackling and pops on Windows: mpv's audio output buffer (0.2 s by
  // default) ran dry for a moment. A second of buffer rides out short
  // stalls; pause and seek stay instant (mpv drops the buffer for those).
  _applyMpvProperties(exclusive: false);
  // The saved choice lands long before the first book opens; mpv reads
  // these properties when the player is created.
  desktopExclusiveAudio().then((on) => _applyMpvProperties(exclusive: on));
  // mpv's warnings and errors reach the app log (debugPrint, see the
  // vendored plugin's PATCHES.md). `MPVLogLevel.info` also logs the audio
  // output it opens; it was used to diagnose crackling on 2026-10-31.
  JustAudioMediaKit.mpvLogLevel = MPVLogLevel.warn;
  JustAudioMediaKit.ensureInitialized(windows: true, linux: true);
  _initialized = true;
}

/// Windows only, off by default: mpv opens the output device in WASAPI
/// exclusive mode, bypassing the Windows mixer, its resampling and any
/// "audio enhancements" on the device. Other apps go silent while Absorb
/// plays. Applies to the next player mpv creates (next app start).
Future<bool> desktopExclusiveAudio() async {
  if (!Platform.isWindows) return false;
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_exclusiveAudioKey) ?? false;
}

Future<void> setDesktopExclusiveAudio(bool on) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_exclusiveAudioKey, on);
  _applyMpvProperties(exclusive: on);
}

void _applyMpvProperties({required bool exclusive}) {
  JustAudioMediaKit.mpvProperties = {
    'audio-buffer': '1.0',
    if (exclusive && Platform.isWindows) 'audio-exclusive': 'yes',
  };
}

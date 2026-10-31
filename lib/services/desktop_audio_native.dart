import 'dart:io';

import 'package:just_audio_media_kit/just_audio_media_kit.dart';

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
  JustAudioMediaKit.mpvProperties = const {'audio-buffer': '1.0'};
  JustAudioMediaKit.ensureInitialized(windows: true, linux: true);
  _initialized = true;
}

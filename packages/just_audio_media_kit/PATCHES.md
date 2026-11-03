# Absorb Plus patches to just_audio_media_kit 2.1.0

Vendored from pub.dev (MIT, see LICENSE) so the app can set mpv properties
that the plugin doesn't expose.

- `JustAudioMediaKit.mpvProperties` (`lib/just_audio_media_kit.dart`): extra
  mpv properties applied to every player after creation
  (`lib/mediakit_player.dart`). Absorb Plus sets `audio-buffer=1.0` on
  Windows/Linux against crackling and pops, and ffmpeg's HTTP `reconnect`
  through `stream-lavf-o` so short network drops heal in place
  (`lib/services/desktop_audio_native.dart`).

- mpv log lines go through `debugPrint` (was `print`), so they reach the
  app's log file.

- `JustAudioMediaKit.audioOutputFallback` (`lib/just_audio_media_kit.dart`,
  used in `lib/mediakit_player.dart`): the log listener asks it about every
  mpv log line. When it returns properties (the app's exclusive-audio
  fallback, `lib/services/exclusive_audio_fallback.dart`), the player sets
  them, reopens the current playlist at the same position (`_reopenWith`) and
  drops that one error instead of reporting it, so playback continues in
  shared mode.

Everything else is unchanged from the published 2.1.0.

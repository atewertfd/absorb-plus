# Absorb Plus patches to just_audio_media_kit 2.1.0

Vendored from pub.dev (MIT, see LICENSE) so the app can set mpv properties
that the plugin doesn't expose.

- `JustAudioMediaKit.mpvProperties` (`lib/just_audio_media_kit.dart`): extra
  mpv properties applied to every player after creation
  (`lib/mediakit_player.dart`). Absorb Plus sets `audio-buffer=1.0` on
  Windows/Linux against crackling and pops
  (`lib/services/desktop_audio_native.dart`).

Everything else is unchanged from the published 2.1.0.

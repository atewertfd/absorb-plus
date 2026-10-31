# Absorb Plus Windows media service patch

Based on pub.dev `audio_service_win` 0.0.3, with its MIT license retained.

- Release SMTC/MediaPlayer objects while the Flutter plugin and COM apartment are alive, instead of leaving static WinRT cleanup until process teardown.
- Revoke button events and own/join artwork tasks during cleanup.
- Forward SMTC button events through the app window's message queue so Flutter channel calls run on the platform thread.
- Treat missing artwork as empty, not a literal `null` file path, and use audio_service's cached artwork path when available.

- Timeline: `updateTimeline` (position, length, rate, seekable) fed by the throttled `SmtcTimeline` (`lib/smtc_timeline.dart`); flyout scrubbing (`PlaybackPositionChangeRequested`) is forwarded as `onSMTCSeek` to the handler's `seek`. The hosting MediaPlayer's command manager is disabled so its empty state never overrides the manual SMTC values.
- Artwork: keep the current thumbnail when the same cover is re-pushed, drop loads superseded by a newer item (generation counter), clear on stop, percent-decode only `file://` URIs, and never log the artwork source (server URLs carry the token).
- Every WinRT call in the method handler is caught and logged; an SMTC failure never reaches playback.

The desktop smoke test exercises metadata submission, playback state changes, and clean shutdown. Physical media keys, artwork appearance and flyout scrubbing still need visual/hardware verification.

# Phone remote (owner idea, 2026-11-03)

Link a phone to the PC app so the phone works as a remote control and a
"now playing" display while the audio plays on the PC. Library and progress
sync already exist through Audiobookshelf; this is only about controlling one
running copy of Absorb from another.

Audiobookshelf can't relay messages between two clients, so the PC app runs
a small local link that the phone connects to directly.

## Stages

1. **Remote and display (this document's scope).** Pairing, a remote screen,
   display mode, connected-device list on the PC.
2. Phone lock screen, notification and earbud buttons control the PC; phone
   volume buttons set the PC volume; start a book on the PC from the phone;
   bookmark and sleep timer from the phone.
3. Handoff both ways at the exact second; zero-code discovery; the PC
   controlling a phone.

Out of scope for now:
- the web app as a remote (browsers block https pages from reaching plain
  LAN addresses);
- in-sync playback on two devices.

## Stage 1 design

### Roles
- **Host:** Windows and Linux (`dart:io`). Off by default. The owner turns it
  on in Settings, where the pairing code and connected phones are shown.
- **Remote:** Android, and also Windows/Linux (one PC controlling another).
  Web: hidden (no `dart:io` sockets; stub file).
- The remote doesn't need to be signed in to Audiobookshelf. Everything it
  shows comes from the host.

### Transport
- An `HttpServer` bound to all IPv4 interfaces on a fixed default port
  (47390; if busy, the next free one in 47390–47399). WebSocket at `/remote`,
  cover image at `/cover`. Windows shows its own firewall prompt the first
  time; the user answers it.
- Reachable over the LAN, and over system Tailscale if installed (a normal
  network interface). The app's built-in Tailscale (tsnet, userspace) can't
  accept incoming connections without Go changes, so it isn't covered in
  stage 1.
- **Discovery:**
  - The remote sends a UDP broadcast on port 47390 (`ABSORB_REMOTE_DISCOVER v1`).
  - Hosts that are on reply with a JSON line: protocol version, display name
    (computer name), port, and a random host id.
  - A host that's off doesn't listen at all.
  - Manual "address:port" entry is the fallback.

### Pairing and auth
- The host shows a 6-digit code (from `Random.secure`). It expires after 2
  minutes, can be refreshed, and is replaced after 5 wrong attempts. The QR
  code (qr_flutter, already a dependency) holds the same data plus the
  address, for a later camera scanner.
- The remote sends `pair {code, deviceName}`. On success the host returns a
  random 32-byte device token (base64url) and its host id.
  - The host stores a hash (SHA-256, the `crypto` package) of the token with
    the device name and the last-seen time.
  - The remote stores the token per host id.
- Every later connection starts with `hello {token}`. A wrong or forgotten
  token closes the socket. "Forget" on the host revokes a device at once.
- Tokens are never logged. Auth failures are rate-limited per IP.
- The host refuses commands when nothing is loaded, and never exposes server
  credentials or URLs. The cover is proxied through `/cover?t=<token>` from
  the app's own cover cache or API.

### Protocol
JSON text frames, each with `"type"`. The version goes in `hello` and `pair`.

Host to remote:
- `state`: sent on change, and about once a second while playing. Fields:
  - `itemId`, `title`, `author`, `chapterTitle`
  - `position`, `duration`, `chapterStart`, `chapterEnd` (seconds, double)
  - `playing`, `buffering`, `speed`
  - `sleep {mode, remaining}`
  - `coverVersion`
- `error {code, message}`.

Remote to host:
- `play`, `pause`, `toggle`
- `seek {position}`, `skip {seconds}` (negative goes back)
- `chapter {delta: -1|1}`
- `speed {value}`
- `sleep {minutes | endOfChapter | cancel}`

Every command goes through the same service calls that the keyboard
shortcuts and global hotkeys use (`windows_global_hotkeys.dart` is the
reference), so the behaviour matches: seek undo, sync and stats stay
correct.

### UI (keep Absorb's look; reuse existing widgets)
- **Host:** Settings, in the desktop/Windows section, gets a "Phone remote"
  row that opens a sheet with:
  - an on/off switch;
  - while on, the code, a QR code and the address(es);
  - connected and paired devices, with Disconnect and Forget.
- **Remote:** a "Control another device" entry (Settings, and a Ctrl+K
  action on desktop) leads to:
  - discovery, then code entry, then the remote screen;
  - the remote screen shows the cover, title, chapter, a draggable time bar,
    and buttons for play/pause, skip back/forward (the app's skip amounts),
    previous/next chapter, speed and the sleep timer;
  - **Display mode:** big cover, chapter progress, time left, a clock;
    keeps the screen on and hides system bars;
  - it reconnects automatically, and shows "Reconnecting…" instead of
    stale controls.

### Files
- `lib/services/remote_link/`
  - `protocol.dart`: message types and (de)serialization.
  - `remote_host.dart` / `remote_host_stub.dart`
  - `remote_client.dart` / `remote_client_stub.dart`
  - `pairing_store.dart`
- `lib/screens/remote_control_screen.dart`, `lib/widgets/remote_host_sheet.dart`.

### Tests
- Protocol round trips.
- Pairing: code expiry, the attempt limit, token hash checks, forget.
- Host and client over a real loopback socket in tests (127.0.0.1, an
  ephemeral port, no external network), using a fake player facade.
- The remote screen against a fake client.

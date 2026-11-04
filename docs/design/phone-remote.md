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

## Stage 1 as built (2026-11-03, branch `claude/phone-remote`)

Code map: `docs/ARCHITECTURE.md`, row "Phone remote". Changes from the
design above:

- **Pairing is open only while the host sheet shows.** The code is issued
  when "Phone remote" opens on the PC and dropped when it closes; a `pair`
  outside that gets `error pairingClosed`. Codes are also single-use (a new
  one after each pairing), besides the 2-minute expiry and the 5-try
  replacement.
- **Cover auth by header.** `/cover` takes `Authorization: Bearer <token>`
  instead of `?t=<token>`, so tokens never sit in URLs or proxy logs. The
  host serves the downloaded cover file or the app's cover cache
  (`coverCacheManager`, fetched with the app's own headers when missing).
- **Browser requests are refused.** Any request with an `Origin` header gets
  403 (native remotes never send one), so a web page on the LAN can't try
  codes or tokens.
- **Protocol additions:**
  - `welcome {version, hostId, hostName}` answers a good `hello`;
  - `paired {version, token, hostId, hostName}` answers a good `pair`;
  - `state` also carries `skipBack` and `skipForward` (the host's skip
    amounts), and the remote's buttons send `skip` with those;
  - WebSocket close codes tell the remote whether to retry: 4001
    unauthorized, 4002 disconnected by the host, 4003 forgotten, 4004 host
    stopped, 4005 too many attempts, 4006 bad request, 4007 version.
    4001, 4002, 4003 and 4007 stop reconnecting; the rest retry with
    backoff (1, 2, 4, 8, then every 10 s).
- **The token only goes where it was paired.** Discovery announcements are
  easy to fake, so a paired computer that answers from a new address is
  listed as a new one and paired again; the remote also closes the link
  when the `welcome` carries another host id. The token itself still
  crosses the LAN in the clear (plain `ws://`, as designed); someone
  sniffing the network could copy it. Forget on the host revokes it.
- **Limits:** no WebSocket compression (a small frame can't inflate),
  frames over 8 KB are refused, 8 connections at most and 3 per address, a
  10-second window for the first frame, 20 discovery replies a second, auth
  failures block an address for a minute after 5 in a minute, at most 20
  paired devices (the longest unused goes).
- **Settings place:** both rows ("Phone remote" on the PC, "Control another
  device" on phones and PCs) sit in Settings → Media Controls, because Linux
  has no Windows section. Ctrl+K has both actions too.
- **Sign-out and account switch** close everything and turn the switch off
  (the next account decides for itself). Paired devices are device-wide and
  stay. Quitting starts closing without waiting (`shutdownForExit`).
- **The remote needs a signed-in app for now**: its entries are in Settings
  and Ctrl+K. An entry on the sign-in screen is left for later.
- **Android needs no new permission:** the host answers discovery by unicast,
  and `INTERNET` exists. Dart sockets aren't subject to Android's cleartext
  policy.
- **Display mode** keeps the screen on through the app's `ScreenWake`
  (Android flag, Windows runner; Linux has none) and hides the system bars
  on Android. It shows the cover, chapter, chapter progress, time left (at
  the current speed) and a clock; a tap leaves it.
- **Discovery** sends the probe three times in 2 s to 255.255.255.255 and
  each interface's /24 broadcast address.
- **Extra files:** `remote_link.dart` (the import), `remote_link_types.dart`
  (interfaces both sides and the stubs implement), `player_facade.dart`,
  `app_remote_player.dart`, `screens/remote_connect_screen.dart`,
  `widgets/remote_link_settings_tiles.dart`.

Not verified yet: a real phone, the Windows firewall prompt, discovery on
networks with client isolation (manual address entry is the fallback), and
Linux beyond CI builds.

## v2 (2026-11-03, branch `claude/remote-v3`)

Supersedes the stage-1 notes above where they differ. Protocol version 2;
a v1 app on either side is told to update.

### Names and wording
- PC: **Control from your phone** (Settings row, sheet title). Phone:
  **Control your computer**. Both screens open with a short plain intro (the
  audio keeps playing on the PC; both on the same Wi-Fi).
- The PC sheet shows numbered steps: 1. Turn it on here. 2. Scan the code
  with your phone's camera, or open Absorb > Control your computer. 3. Enter
  the code (then choose Allow on the PC).
- Errors say what to do: "Your phone and PC aren't on the same Wi-Fi…",
  "The code expired. Get a new one on the PC…", "The PC didn't allow this
  phone…", "That PC already has 5 paired devices…".

### Pairing
- **A pairing window**, not a standing code. Turning the host on opens one
  (2 minutes); "Pair a phone" / "Pair another device" opens a new one. It
  closes when one device gets the code right, after 5 wrong tries, when it
  runs out, when the sheet closes, or when the host stops. No window, no
  pairing (`pairingClosed`).
- **The PC user decides.** A right code gets `pairWait`, and the PC asks
  "Allow ‘<device>’ to control Absorb on this PC?" (Allow / Deny). Deny, no
  answer in 60 s, or the phone giving up is a refusal (`pairDenied`).
- **The token never crosses the network.** `pair` carries the phone's half
  of a Diffie-Hellman exchange (RFC 3526 group 14); `paired` carries the
  PC's half. Both derive the token; the PC stores only its SHA-256, which is
  also the login key. The connection then closes and the phone signs in.
  Unauthenticated DH means someone actively in the middle during those
  two minutes could pair instead; the code, the Allow question and the
  short window are the guard.
- **Limits:** 5 paired devices (`tooManyDevices`; the sheet says so), last
  used shown, forgotten after 90 days unused, "Forget all" (confirmed).

### Login and frames
- `hello {nonce}` → `challenge {hostId, nonce}` → `auth {proof}` →
  `welcome {hostId, hostName, proof}`. Proofs are HMAC-SHA256 over a label,
  the host id and both nonces with the device key; the host tries each
  paired device's key (at most 5). The phone checks the PC's proof, so a
  fake computer learns nothing and gets no commands.
- After `welcome` every frame is **sealed**: `{type: sealed, s, m, a}` with
  `a` = HMAC(session key, direction, sequence, message). The session key is
  derived from the device key and both nonces, so it is new per connection.
  Tampered, replayed, reordered or bounced-back frames drop the connection.
- **Not encrypted.** Frames carry playback state, titles, chapter names and
  commands in the clear; anyone on the Wi-Fi can read them, but can't forge
  or replay them, and never sees the token or key.
- Covers: `GET /cover` (or `/cover?item=<id>` for a Continue listening book
  offered to that connection) with `Authorization: Bearer <ticket>`, where
  the ticket is derived from the session key and dies with the connection.
- Because the PC proves itself, the phone **follows a paired PC to a new
  address**: discovery by host id (every other failed retry, a scanned code,
  or a discovery hit on the connect screen) updates the saved address.

### Stability
- Heartbeat: the phone pings every 2 s and treats 8 s of silence as a dead
  link; the PC drops a signed-in remote after 10 s of silence (close 4008).
- Reconnect with backoff (1, 2, 4, 8, then every 10 s), at once when the
  app comes back to the front (`reconnectNow`). After every (re)connect the
  PC sends full state and chapters. While disconnected the phone holds no
  state, so no stale controls are shown.
- The host is off after every quit unless **Keep on when Absorb starts**
  (pref `fork_remote_link_keep_on`, default off); starting by itself opens
  no pairing window. Quitting never waits for the host.
- Tests run the pairing, login, heartbeat, reconnect, tamper and follow
  cases on a fake clock over in-memory links (`remote_link_session_test`).

### More controls
PC volume slider and mute (mute remembers the level), chapter list (tap to
jump: a `seek`), bookmark at the current spot with an optional note (the
car-mode bookmark; the phone shows "Bookmark added on the PC"), sleep
presets 15/30/45/60 min, end of chapter, cancel; speed presets plus
-0.05/+0.05; Stop; Continue listening (the PC's Continue Listening shelf, or
its Absorbing cards; up to 8; id, title, author, progress, cover; tapping
one starts it on the PC like its own front-card play). New commands:
`stop`, `volume`, `mute`, `bookmark`, `getRecent`, `playItem`; host frames
`chapters`, `recent`, `notice`.

### QR code and pair page
- The QR holds
  `https://atewertfd.github.io/absorb-plus/pair.html#h=<ip>&p=<port>&c=<code>&id=<hostId>`
  (the Pages base path is `/absorb-plus/`, from `ci.yml`). Everything is in
  the fragment, which never reaches a server; the page makes no requests.
- `web/pair.html` (plain HTML, inline JS and CSS, Absorb colours) shows a
  big "Open in Absorb": on Android
  `intent://remote-pair?...#Intent;scheme=absorb;package=com.barnabas.absorb.plus;...`
  with a second button for "Absorb Plus Test" (`.dev`), elsewhere
  `absorb://remote-pair?...`; "Or type this code in Absorb", and "Get Absorb
  Plus" (releases).
- The app takes `absorb://remote-pair` through `main.dart`'s link handler
  (`RemoteLinkHooks.offerLink`, Android intent filter on MainActivity) and
  opens Control your computer with the code filled in; the user still taps
  Pair, and the PC still asks Allow. A computer already paired just opens
  at the scanned address.
- **The page goes live only when `main` next deploys to Pages.** Until
  then the phone's camera opens a 404; typing the code still works. Windows
  has no `absorb://` handler, so the page shows the code there.

Not verified yet: a real phone and PC on the same Wi-Fi, the camera flow
end to end (needs the Pages deploy), the Windows firewall prompt, Linux.
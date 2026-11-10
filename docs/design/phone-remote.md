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
2. Phone lock screen, notification and earbud buttons control the PC (done,
   with a browser remote: see "Stage 2" at the end); phone
   volume buttons set the PC volume; start a book on the PC from the phone;
   bookmark and sleep timer from the phone.
3. Handoff both ways at the exact second; zero-code discovery; the PC
   controlling a phone.

Out of scope for now:
- the Pages web app as a remote (browsers block https pages from reaching
  plain LAN addresses; stage 2 serves a browser remote from the PC instead);
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

Supersedes the stage-1 notes above where they differ (the screen's layout
is now customizable: see "Customizable layout" at the end). Protocol version 2;
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

### Customizable layout (2026-11-03, branch `claude/remote-layout`)
- **Layout as data** (`services/remote_link/remote_layout.dart`). The
  remote screen is a list of blocks: cover, title and author, chapter
  title, progress bar with times, time left, playback buttons (previous
  chapter / back / play-pause / forward / next chapter), volume, speed,
  sleep timer, bookmark, chapters, Continue listening, stop, clock, space.
  Sizes where they make sense: cover small/medium/large, playback buttons
  compact/large, the rest normal/compact (compact buttons are icon only;
  the chapter title has one size). Consecutive small buttons share a
  wrapping row (speed + sleep, then the actions), so the default portrait
  layout is pixel-identical to the old screen (checked against the old
  code at three phone sizes).
- **Portrait and landscape are separate.** Landscape has a left and a right
  column (default: large cover left; title, chapter, progress, playback
  buttons and the quick controls right). The cover is sized to the
  column's height; each column scrolls and centres when short; if one
  column is empty the other gets the whole width. No overflow at 640x360
  with 1.3x text (tested for every preset, edit mode and display mode).
- **Saved on the phone** for every computer: pref `fork_remote_layout`
  (`{version, portrait, landscapeLeft, landscapeRight}`, entries
  `{block, size}`) and `fork_remote_display`. Unknown blocks and duplicates
  are dropped, unknown sizes fall back, missing blocks are not added back,
  and a missing or unreadable orientation uses the default.
- **Edit mode** (tune icon, "Customize", in the app bar): the live layout
  with a header on each block (drag handle, name, size toggle, remove x).
  Drag by the handle (or hold the block) to move it along its column or,
  in landscape, to the other column; a bar shows the slot it will drop
  into, and columns scroll near their edges. Toolbar: Add (sheet of blocks
  not on screen; landscape adds the cover left, others right), Presets
  (Default; Minimal = title, progress, playback; Nightstand = large cover,
  clock, time left; Full = everything but the space), Reset to default,
  Display mode, and Done. Presets and reset change only the orientation
  being edited, which follows the phone's orientation (the hint says
  which). Controls don't respond while editing (`IgnorePointer`); back
  leaves edit mode. Works while disconnected, using the last known state.
- **Display mode options** (Customize > Display mode): background (theme,
  blurred cover, black), text size (normal, large, huge), show the clock,
  24-hour clock (off follows the phone), dim after 5/10/30 min or never (a
  dark overlay; the first tap only wakes it). Landscape stays two columns
  (cover sized to the height left; clock, title, progress and time left
  right, scrolling if the text is big). The clock (`RemoteClockText`)
  ticks once a minute on its own instead of rebuilding the screen every
  second.
- Files: `widgets/remote_layout_view.dart` (columns, edit chrome, drag and
  drop, the Add and Display mode sheets); block contents stay in
  `screens/remote_control_screen.dart` (`_block`). Tests:
  `remote_layout_test.dart` (JSON, migration, editing, presets, store) and
  `remote_layout_screen_test.dart` (default order and rows, saved layout,
  edit mode disables controls, add/remove/size/preset/reset saved, drag in
  a column and between columns, landscape overflow, display options).
- *Superseded 2026-11-04:* the display mode and its options sheet are gone;
  see "More control" below.

### More control (2026-11-04, branch `claude/remote-custom2`)
Owner feedback: simple to use, but more control; full screen should not be
a different screen.
- **Per-block options.** In edit mode each block header has a gear, and a
  tap on the block opens the same sheet: the block's size, then 2-5 of its
  own options, applied and saved live. Defaults draw everything exactly as
  before.
  - Cover: corners (default = the Look's / square / rounded / circle),
    shadow, alignment, space above.
  - Title and author, chapter title: size is now the text size (normal /
    compact / large), alignment, lines (1-3; the compact title keeps 1).
  - Progress bar: time on the right (time left / total length), range
    (chapter / whole book), space above. Time left: range, alignment.
  - Playback buttons: which of the five show (at least one; fewer than five
    sit evenly), show the skip seconds, space above.
  - Volume: slider or − / + buttons (10 % steps, shows the percentage).
    Speed and sleep timer: which choices their pickers list (speed: the 12
    old values; sleep: 5-90 min and end of chapter, default 15/30/45/60 and
    end of chapter).
  - Clock: size (large = the old display mode's big clock, shrinks to fit),
    format (phone / 12-hour / 24-hour), show the date, alignment.
  - Space above: default (the screen's own gaps) / none / small 8 / large
    32. Small buttons sharing a row (speed, sleep, actions) have no
    alignment or spacing.
- **Saved** in `fork_remote_layout` version 2: an entry is
  `{block, size, options?}`, `options` holding only what the user set.
  Version 1 saves load with every option at its default; unknown or bad
  options are dropped (`RemoteOptionSpec.read`). Specs live in
  `RemoteOptions` (`remote_layout.dart`); keys and values are saved, never
  rename them.
- **Full screen** (app bar button, or a single tap on empty space: a spot
  no control takes, text included): the same layout with the app bar and
  the system bars hidden (Android immersive sticky) and the screen kept on
  (`ScreenWake` owner `remoteDisplay`). A tap on empty space or Back leaves.
  The first time, a snack bar says "Tap empty space to exit full screen"
  (pref `fork_remote_full_screen_hint`). Edit mode can't be opened from
  full screen (no app bar, and `_setFullScreen` refuses while editing).
  Works in landscape (same two columns). A dropped link shows
  "Reconnecting…" in full screen; a tap still leaves. Disabled buttons
  don't take taps, so a tap on one counts as empty space.
- **Look** (edit toolbar, "Look"; pref `fork_remote_look`, all computers):
  accent (app theme / from cover / 8 swatches), background (theme /
  blurred cover / black / soft gradient from the cover's colour), button
  style (filled = as always / outlined / plain: the play button's circle
  and the small buttons), corners (sharp / rounded / extra round: the
  cover's "default" corners and sharp button shapes), spacing (compact
  halves the screen's own gaps / comfortable), text size (normal / large
  / huge, on top of the phone's), dim after (never / 5 / 10 / 30 min;
  full screen only, the first tap only wakes). Applied live behind the
  sheet; "Reset look". The default Look adds no theme or layer at all.
  The cover's colour comes from `PaletteGenerator` on a 112 px decode
  (`cover_palette.dart`, `accentFromCoverPalette`), once per cover.
- **Migration.** Without a saved Look, the old `fork_remote_display` seeds
  it (background, text size, dimming), and its 24-hour switch becomes
  `hours: 24` on the clocks. The Nightstand preset now uses the large clock
  and, if the Look still has the theme background / no dimming, sets black
  and 10 minutes.
- Tests: `remote_layout_test.dart` (v1 to v2 with defaults, option
  round-trip and cleanup, look JSON, old display options seed the look) and
  `remote_layout_screen_test.dart` (hidden transport buttons not drawn, the
  last one can't be hidden, tap on a block opens options, saved cover /
  title / speed / sleep / volume options, full screen by tap on empty space
  vs a control, button, Back, no edit in full screen, dimming, Look sheet
  applied live and reset, outlined / plain buttons, Nightstand look, no
  overflow at 360x640 and 640x360 with 1.3x text in full screen, edit mode
  and both sheets, huge Look text in full screen).

## Stage 2 (2026-11-03, branch `claude/remote-stage2`)

### Lock screen, notification and earbuds control the PC (Android)
- While the remote screen is connected and the PC has a book loaded, the
  phone's media notification shows the PC: title, chapter (or author),
  cover, the chapter's progress (the whole book without chapters), play /
  pause, back / forward with the PC's skip amounts, and previous / next
  chapter. The lock screen, notification shade, headset and earbud buttons
  and Wear OS use the same media session, so they all control the PC.
  Commands: play, pause, toggle (headset click), skip, seek (chapter start
  plus the bar's position), chapter; the system's "stop" only pauses the PC.
- **One media session, lent.** audio_service allows one handler, so
  `AudioPlayerHandler` gained a small lend/return block
  (`lendSession`/`showGuest`/`returnSession`, interface
  `services/media_session_guest.dart`). It only lends while the local
  player isn't playing or loading. While lent, the handler's transport
  callbacks go to the guest (one guard line each) and local pushes are
  held (`refreshPlaybackState`, the playback-event listener and the
  service's `mediaItem` push, now `pushMediaItem`). The moment local
  playback starts or a book starts loading, the handler takes the session
  back, re-pushes the local item and state, and tells the guest. Nothing
  changes for local playback while nothing is lent. A paused local book's
  notification is replaced while lent and comes back after.
- **`RemoteMediaMirror`** (`services/remote_link/remote_media_mirror.dart`)
  drives it from the remote screen: lends on connect (only with the app in
  front: Android limits foreground services started from the background),
  pushes a playing blip first when the PC is paused so the notification
  appears, then only pushes changes (Android moves the bar itself; a
  position more than 1.5 s off the expected one is pushed). The cover is
  written to the temp folder (`remote_cover/<item>-<version>.img`, one file
  at a time) because the notification loads art by URI.
- **When it goes:** leaving the remote screen, turning the setting off, or
  the link (or the PC's book) gone for more than 15 s; a quicker reconnect
  keeps it. Giving back re-pushes the local state; with nothing loaded
  locally that is idle, which removes the notification like any finished
  playback. After local playback takes the session, the PC's notification
  returns only when the remote screen comes back to the front.
- **Setting:** the remote screen's menu (Android only), "Show controls on
  the lock screen", pref `fork_remote_lock_screen`, default on.
- Not verified on a phone yet: Android's notification and lock-screen
  rendering, earbud routing to the borrowed session, Wear OS.

### Browser remote
- The PC host serves a page at `http://<pc-ip>:<port>/` (the same port as
  the WebSocket, 47390 by default). The PC sheet shows "Or open
  http://192.168.x.x:47390 in any browser on the same Wi-Fi…". Any phone,
  tablet or laptop browser, iPhone included, can control the PC with
  nothing installed.
- **Plain HTTP on the LAN only.** The page, its frames and covers travel
  unencrypted, like the app's link (frames are MAC-sealed, not encrypted).
  No TLS: a self-signed certificate would only add warnings.
- **Same security as the app remote.** The page pairs with the 6-digit code
  inside an open pairing window, the PC asks "Allow ‘Safari on iPhone
  (browser)’…?" (the host appends "(browser)"), and the token comes from
  the same Diffie-Hellman exchange (JS BigInt). The browser keeps it in
  localStorage for that address (`absorbRemote.v2`), then logs in with the
  v2 challenge-response and seals every frame with HMAC-SHA256, exactly as
  the app does. It counts toward the 5-device limit, shows in the PC's
  device list with a globe icon (`PairedDevice.browser`, also on the
  connection) and Forget revokes it at once.
- **HMAC in the page, not Web Crypto:** `crypto.subtle` exists only on
  https or localhost, so the page carries a small SHA-256/HMAC
  (`crypto.getRandomValues` works on http). The page's crypto was checked
  against the Dart functions with node (proofs, session key, cover ticket,
  a sealed frame, the DH public key and the pairing token all equal), and
  the whole flow was run in a real browser against a test host (pair,
  Allow, login, play/pause, next chapter, sleep, speed, reload logs in
  with the saved token).
- **Origins.** The host still refuses every request with an Origin header,
  except from its own page: Origin must equal `http://<Host>` and the Host
  must be an IP address, `localhost`, or this PC's name (optionally with a
  suffix like `.local`) on the host's port. A page reached through any
  other name (DNS rebinding) gets 403, and so does the page itself. Other
  sites can't open the socket; a rebinding page couldn't read the token
  anyway (localStorage is per origin).
- **The page:** `services/remote_link/web_remote_page.dart`, one inline
  HTML/CSS/JS string, Absorb's colours (as `web/pair.html`), no external
  resources. CSP: `default-src 'none'`, inline script and style, `img-src
  blob:`, `connect-src 'self' ws://<host>`, `frame-ancestors 'none'`; also
  `X-Frame-Options: DENY`, `no-store`, `no-referrer`. Controls: cover,
  title, author, chapter, progress bar (seek; the chapter when there are
  chapters), play/pause, back/forward (the PC's amounts), previous/next
  chapter, volume and mute, speed -0.05/+0.05/1x, sleep 15/30/45/60/end of
  chapter/off. Portrait stacks; landscape (600 px and wider) puts the cover
  left. It pings every 2 s, treats 8 s of silence as a dead link,
  reconnects with backoff (1, 2, 4, 8, then 10 s) and at once when the tab
  becomes visible, and shows "Reconnecting…" instead of stale controls.
  Forgotten or unknown: back to pairing. "Unpair this browser" clears the
  saved token (Forget on the PC removes it there).
- Tests: `remote_web_remote_test` (page and headers, protocol constants,
  rebinding refused, cross-origin socket refused, browser pairing with
  Allow and Deny, v2 login and commands, wrong token, limit with
  browsers), `remote_media_mirror_test` (fake media session: mirror on
  connect, paused blip, foreground only, throttling, cover, commands,
  grace, dispose, local playback reclaims, setting),
  `remote_lock_screen_setting_test` (menu switch, saved off, no menu
  without a media session).
- Not verified yet: Safari on a real iPhone, a real phone and PC over
  Wi-Fi, the Windows firewall prompt for the page.

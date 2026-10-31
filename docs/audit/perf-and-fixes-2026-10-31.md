# Performance, bugs and feature ideas: 2026-10-31

Seven read-only reviews, merged and ranked:

- performance: startup, playback/downloads, UI/memory, network/data;
- two bug hunts;
- feature ideas.

File:line references are as of `claude/slim` at build 1.12.1+329. "Up" means an upstream-owned file (keep hunks small); "fork" means a fork-owned file.

Measured startup (owner's PC, `[Startup]` log):

| Step | Time |
|---|---|
| Launch → `main()` | 1205 ms |
| `main()` → first frame | 14 ms |
| Signed in | 851 ms |
| Home from saved copy | 962 ms |
| Live Home | 1595 ms |

## A. Bugs in this week's work (fix first)

| # | Bug | Where | Fix |
|---|---|---|---|
| A1 | With built-in Tailscale on, downloads fail: download URLs aren't routed through the tunnel | `api_service.dart` `buildFileUrl` / `buildDownloadFileUrl` (up) | Wrap in `TailscaleService.instance.mediaUrl`, plus narration and ebook URLs used natively |
| A2 | A failed or timed-out Home load blanks Home and overwrites the saved snapshot with `[]` | `_lp_core.dart` `_doLoadPersonalizedView` (up) | Treat `null` as failure: keep sections, no save, no precache |
| A3 | A late Home answer can land on another account or library (guard removed in the spinner fix) | `_lp_core.dart` `_doLoadPersonalizedView` / `loadPersonalizedView` (up) | Compare scope and library after the await; reload if changed; don't join an in-flight load for another library |
| A4 | ~~Environment proxies apply to every host~~: **false alarm.** Dart's `HttpClient` already defaults to `findProxyFromEnvironment`; the Tailscale hook keeps that default for non-tailnet hosts | | No change |
| A5 | A UNC download folder (`\\nas\share`) never finishes and leaves copies on `C:` | `desktop_download_folder.dart` (fork), `download_service.dart` (up) | Reject UNC paths (ask for a mapped drive) |
| A6 | Pre-cache: turning it off doesn't stop a run; a run cut short still blocks retries for 6 h | `precache_service.dart` (fork) | Re-check `isEnabled()` in `_canGoOn`; set `_lastRun` only when the run completes |
| A7 | Tailscale extra hosts are lost unless you tap outside the field; a failed toggle is an unhandled error | `tailscale_settings_screen.dart` (fork) | Save in `dispose`/debounce; unfocus; catch and show a toast |
| A8 | Space, arrows and `[ ] \` act on playback while a dialog is open | `desktop_shortcuts.dart` (fork) | Plain keys only when the top route is a page route |
| A9 | Deleting a download can remove a previously picked download folder; case-only name differences share a folder on Windows | `download_service.dart` (up) | Never delete outside known roots; compare case-insensitively on Windows |
| A10 | Small items | various | Dashboard keeps polling when covered (outer route); folder sheet can overflow at 400×600/150%; Ctrl+L/N captured on web; hard-coded English in the shortcut dialog and key names; update dialog can stack on What's new; update check only at launch; series skip change not re-armed for the playing book |

## B. Performance, ranked by felt impact

| # | Cost | Where | Fix | Risk |
|---|---|---|---|---|
| B1 | **Windows prefs file (405 KB) rewritten in full on the UI thread ~24–30×/min while playing.** The `downloads` key is 264 KB for 6 books (36 KB each, duplicated chapters/tracks); `session_cache_*` never pruned; stats caches in prefs | `download_service.dart:~1921`, `progress_sync_service.dart:106,623`, `session_cache.dart`, `stats_screen.dart` (up) | Move `downloads`, `session_cache_*`, `cached_stats`/`cached_sessions` to files in app support (one-time migration); prune session caches; don't save `downloads` at launch unless changed | med |
| B2 | **Launch → `main()` 1.2 s** | Windows runner, plugin registration | WebView (inappwebview) builds a D3D11 compositor before the first frame; register it after the first frame or lazily. Trace the rest with WPR first | med |
| B3 | Position stream fires at libmpv's rate on desktop (tens/s); `statsRow` StreamBuilder, progress bars (~50 widgets at 10 Hz) and a marquee repeat every frame while playing | `_audio_player.dart:70`, `absorbing_card.dart:792`, `card_progress_bar.dart:139,700`, `card_edge_progress_bar.dart:151` (up) | Throttle desktop ticks to 250 ms (jumps and state changes pass at once); `.distinct()` per second; paint-only repaint; marquee once per chapter | med (playback) |
| B4 | The server's echo of our own sync triggers `notifyListeners` → every tab rebuilds ~2×/20 s while playing; screens `watch` the whole provider | `_lp_core.dart:~1898`, `home_screen.dart:455`, `library_screen.dart`, `absorbing_screen.dart:610` (up) | Ignore own-session echoes while playing; move screens to `watchOnly` snapshots | low / med |
| B5 | Absorbing cards keep 1200 px covers decoded (kept alive): ~85–130 MB for a 15-card queue | `absorbing_card.dart:88,620,951` (up) | `memCacheWidth = coverW × dpr` (same look) | low |
| B6 | Sign-in waits for a ping (≈300 ms) and then authorize; an extra server-version request; libraries before shelves | `auth_provider.dart:620,665,1254`, `library_provider.dart:410` (up) | Skip the ping when there's no local server; reuse the version from authorize; start shelves alongside libraries | med |
| B7 | Socket `item_updated` reloads all of Home without debounce (a library scan floods it); playlists and collections refetched on every Home load, fully expanded | `_lp_core.dart:1928,2174` (up) | 3–5 s debounce, only for relevant items; 5–10 min cooldown and socket-driven refresh | low |
| B8 | Large JSON decoded on the UI isolate (podcasts, playlists, sessions, series, personalized view) | `api_service.dart` (up) | `Isolate.run` decode helper for bodies over ~200 KB | low |
| B9 | Admin book stats: 1000 sessions per user, decoded on the UI thread | `book_stats_service.dart:446` (up) | Pages of 100, stop early, decode off-thread | low |
| B10 | `getLibraryItem` has no in-flight sharing or short cache; podcast title hydration fetches whole shows in sequence | `api_service.dart:3215`, `_lp_absorbing.dart:371` (up) | Share in-flight requests per id plus a 30 s cache; episode endpoint | low–med |
| B11 | Drop icon and `AbsorbingWave` timers run while minimized or covered | `absorb_plus_logo.dart:247` (fork), `absorbing_shared.dart:405` | Throttled `Ticker` (pauses automatically) | low |
| B12 | Stats rebuilds all content every animation frame; Absorbing reads prefs in `build`; Settings is one huge Column; series caches unbounded; reader page-curl images never disposed | `stats_screen.dart:484`, `absorbing_screen.dart:602`, `settings_screen.dart:1890`, `_lp_state.dart:79`, `ebook_reader_view.dart:1276` (up) | As named | low |
| B13 | Small items | various | Settings-sync hash every 45 s; download progress builds Android Auto signatures on Windows; `sessionData` decoded repeatedly; podcasts load the personalized view twice; sub-series one request per book; stats then sessions run in sequence; per-line `RegExp` in `LogService`; per-download and per-card log lines | low |

Not worth changing:

- Logging volume (about 60 lines/min, under 5 ms/min).
- Frosted blur (sheets only).
- Media_kit init (9 ms).
- Whisper and pdfium (lazy).
- Tailscale when off.

**The tab fade (200 ms out plus 200 ms in) is a visual change:** owner's call.

## C. Feature ideas (easy, useful, nothing added to the main Settings list)

| # | Idea | Effort | Notes |
|---|---|---|---|
| C1 | Recent searches (chips under the empty search box) | S | Per account |
| C2 | Keyboard shortcut overlay (`?` / F1) | S | Labels already exist |
| C3 | Undo "hide series from Continue" | S | `GET /api/me/series/:id/readd-to-continue-listening` |
| C4 | "Last played on <device> · 2 h ago" on the book page | S | `deviceInfo` already returned |
| C5 | "Chapter ends at 10:42 PM" | S | Math already in the sleep timer sheet |
| C6 | "N new" badge on Recently added | S–M | Socket `item_added` |
| C7 | Export podcast OPML | S | `GET /api/libraries/:id/opml` |
| C8 | Save a copy of a book (desktop) | S | `GET /api/items/:id/download`; needs `canDownload` |
| C9 | Share a listen link (admins) | S–M | `POST /api/share/mediaitem`; public access, so confirm and expire |
| C10 | Mini player (Windows) | M | Owner wants a design first |
| C11 | Global hotkeys (Windows, opt-in) | M | `RegisterHotKey` |
| C12 | Jump list: resume and recent books | M | `ICustomDestinationList` |

Already present, so not proposed:

- smart rewind;
- settings export/import;
- continue from another device.

## Process note

Two reviewers read the owner's live `shared_preferences.json` to size it. That file also holds the sign-in token. They reported only sizes, but future briefs must forbid opening the owner's app data files (prefs, logs beyond `[Startup]` timing).

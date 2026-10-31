## Beta 11

The biggest Absorb Plus update so far: built-in Tailscale, a much faster app, new looks, a Windows version that feels at home with a mouse and keyboard, a long list of fixes, and everything new from upstream Absorb.

### New: built-in Tailscale
- **Reach a server on your tailnet without turning on the Tailscale VPN.** Absorb joins your tailnet by itself, for its own connections only, so your phone or PC stays on its normal network.
- Find it with the **Tailscale** button on the sign-in screen (next to Import) or the card at the top of **Settings**. Tap **Connect with Tailscale** and sign in once in your browser. Streaming and downloads then work with your 100.x or `.ts.net` address.
- Off by default. It's brand new, so please report anything that doesn't work on GitHub.

### Faster
- **Quicker start**, especially on Windows, where the window appears much sooner.
- **Home appears instantly** with your shelves from last time, then refreshes when the server answers.
- **Book pages open instantly.**
- **Covers are downloaded once and kept**, even in big libraries.
- Absorb keeps its connection to your server open instead of reconnecting for every request.
- Fewer redraws while a book plays, less memory used by covers, and less disk writing while you listen.
- Smooth mouse-wheel scrolling on Windows and Linux.

### Choose your look
- **Standard** (the usual look), **Frosted** (glass panels with your cover colors glowing through; Light, Medium or Strong glass) or **Midnight** (true black, or paper white in light mode, with outlined cards).
- Pick one on first launch or any time in **Settings > Appearance**, with live previews of your own covers and **Try it** to see it across the whole app first.
- **Look details** work with any look: full-quality covers, extra cover badges, Continue Reading as a shelf and compact header buttons.
- "Classic wording" is now called **Plain wording**.

### More at home on Windows
- **Mouse and keyboard:** right-click does what a long press does, and you can drag shelves and cards. **Esc** closes the player, **Alt+Left** (or the mouse's back button) goes back, and **F5** refreshes. Settings lists every shortcut.
- **The Windows media popup** shows the book cover and a seek bar.
- **Taskbar buttons** for rewind, play/pause and forward.
- **New settings:** close to tray, start with Windows, always on top, and keep the PC awake while playing. **F11** goes full screen.
- **Choose your download folder** (also on Linux).
- Wired (Ethernet) connections count as Wi-Fi, and phone-only settings are hidden.
- Closing the window saves your last seconds of progress and quits cleanly instead of sometimes crashing.

### Book settings
- A **Book settings** button on every book page: speed, skip intro and skip outro, for that book or the whole series.
- A new book in a series starts at the speed you last used for that series.

### Admin dashboard
- For server admins, one page at the top of **Admin > Manage** shows who's listening now, lets you scan libraries and run a backup, lists users with when they were last seen, and shows the server's recent warnings.

### Pre-load covers and book pages
- After Home loads, Absorb quietly fetches the covers and book pages you're likely to open next, on Wi-Fi or a wired connection only. Turn it off in **Settings > Downloads & Storage**.

### Also new
- **What's new inside the app:** after an update, these notes open in Absorb instead of your browser. Reopen them from **Settings > See what's new**.
- **A new logo:** a teal drop with sound bars, which move on the Absorbing tab while a book plays.

### Fixes
- **Playback**
  - Pausing one book no longer cancels the next book's sleep timer, and an "end of chapter" timer turns off when you switch books.
  - Seeking back to the start in a book's last seconds no longer marks it finished.
  - Stopping a podcast episode saves the position to the right episode.
  - Cleaner sound on Windows and Linux: speech at 1x now plays exactly as recorded (no speed filter in the way), with a bigger audio buffer for steadier playback on busy PCs.
- **Downloads**
  - Multi-disc books (CD1, CD2…) no longer overwrite their own tracks.
  - On Windows, books with titles ending in "..." now download.
  - Deleting a download never removes a download folder you picked.
- **Sync and accounts**
  - Offline listening time is kept until the server accepts it, instead of being dropped.
  - A downloaded book's listening can't end up on another account after you switch.
  - Switching accounts fully leaves the old one behind.
  - A failed load no longer blanks Home.
- **Sign-in and privacy**
  - The server check never gets stuck on "Checking".
  - Tokens, cookies and sign-in codes are hidden in logs.
- **Windows**
  - Keyboard shortcuts no longer swallow what you type or act behind open dialogs.
  - Updates: Cancel works, portable copies are handled, and you're told when GitHub couldn't be reached.
- **Web**
  - Fixed errors during sign-in and in Settings. Ctrl+L and Ctrl+N belong to the browser again.
- **Everywhere**
  - Text no longer gets cut off, especially with larger text sizes.
  - Fixed 11 ways the app could crash when you left a screen while it was loading.

### From upstream Absorb
- BookOrbit support with stats and Year in Review, achievements, Book Dock and book requests.
- EPUB3 narration with read-along, streamed without downloading first.
- Reader: new page turns, an editable tap grid, paragraph spacing, a Translate button and a smoother scroll mode.
- Playback: the sleep-timer rewind sticks, cars don't restart finished books, and play doesn't come back silent after a long pause.
- Choose what the media controls show, and see every genre and tag on the book page.

### Removed
- The Libation import. You can still upload files to your server from Manage > Upload.
- Contact and Discord. Support links now point to Absorb Plus on GitHub.
- The upstream author's "Support the Dev" card.

### Good to know
- Built-in Tailscale has mostly been tested on Windows and barely on phones. It isn't available in the web version.
- Chromecast and the cover in the phone's notification don't go through built-in Tailscale yet.
- Network folders (`\\server\share`) can't be download folders. Use a mapped drive letter.
- Crackly or harsh audio that also happens in other players usually comes from the file itself (for example a low-quality export) or from headset software like surround sound or volume levelling, not from Absorb Plus.

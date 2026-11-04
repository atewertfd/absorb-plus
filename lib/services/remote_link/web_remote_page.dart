/// Phone remote, stage 2 (fork): the browser remote the PC host serves at
/// `http://<pc-ip>:<port>/`, so any phone, tablet or laptop on the same
/// Wi-Fi (iPhone included) can control the PC with nothing installed.
///
/// One self-contained page: inline HTML, CSS and JS, no external requests.
/// It speaks the app's own protocol over the same WebSocket: pairing with
/// the 6-digit code, the Diffie-Hellman exchange (RFC 3526 group 14, with
/// JS BigInt), the PC's Allow question, then the v2 challenge-response login
/// and HMAC-sealed frames. The device token stays in the browser's
/// localStorage for this address. HMAC-SHA256 is implemented in the page:
/// Web Crypto (`crypto.subtle`) only exists on https or localhost, and the
/// page is plain http on the LAN (`crypto.getRandomValues` works anyway).
library;

/// Where the host serves the page.
const kRemoteWebPagePath = '/';

/// The page's Content-Security-Policy: nothing from anywhere else; the
/// WebSocket and covers only from the PC that served it ([host] is the
/// request's checked Host header).
String webRemotePagePolicy(String host) =>
    "default-src 'none'; script-src 'unsafe-inline'; "
    "style-src 'unsafe-inline'; img-src blob:; "
    "connect-src 'self' ws://$host; base-uri 'none'; form-action 'none'; "
    "frame-ancestors 'none'";

/// The page's response headers besides its type.
Map<String, String> webRemotePageHeaders(String host) => {
  'Cache-Control': 'no-store',
  'Content-Security-Policy': webRemotePagePolicy(host),
  'X-Content-Type-Options': 'nosniff',
  'X-Frame-Options': 'DENY',
  'Referrer-Policy': 'no-referrer',
};

/// The name a browser pairs under, marked so the PC's user can tell.
String browserDeviceName(String name) {
  final n = name.trim();
  if (n.isEmpty) return 'Web browser';
  return n.toLowerCase().contains('browser') ? n : '$n (browser)';
}

/// The page itself.
const kWebRemotePage = r'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="referrer" content="no-referrer">
<meta name="theme-color" content="#101014">
<meta name="color-scheme" content="dark">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>Absorb remote</title>
<style>
:root { --bg: #101014; --card: #1b1b22; --card2: #24232d; --text: #ecebf2; --muted: #a9a7b8; --accent: #7c6fbf; --accent-text: #fff; --line: #3a3848; --error: #f2a7a7; }
* { box-sizing: border-box; -webkit-tap-highlight-color: transparent; }
html, body { margin: 0; background: var(--bg); color: var(--text); }
body { font: 16px/1.45 system-ui, -apple-system, "Segoe UI", Roboto, sans-serif; min-height: 100vh; padding: max(12px, env(safe-area-inset-top)) max(16px, env(safe-area-inset-right)) max(16px, env(safe-area-inset-bottom)) max(16px, env(safe-area-inset-left)); }
[hidden] { display: none !important; }
header { display: flex; align-items: center; gap: 10px; max-width: 980px; margin: 0 auto 12px; }
#dot { width: 10px; height: 10px; border-radius: 50%; background: #6b6880; flex: none; }
#dot.on { background: #6fcf8f; }
#hostName { font-weight: 600; flex: 1; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.card { max-width: 440px; margin: 8vh auto 0; background: var(--card); border-radius: 20px; padding: 24px 20px; text-align: center; }
h1 { font-size: 22px; margin: 0 0 8px; }
p { margin: 8px 0; color: var(--muted); }
label { display: block; text-align: left; margin: 14px 0 6px; color: var(--muted); font-size: 14px; }
input[type=text], input[type=tel] { width: 100%; padding: 14px; border-radius: 12px; border: 1px solid var(--line); background: var(--bg); color: var(--text); font-size: 18px; }
#code { font-size: 28px; letter-spacing: 8px; text-align: center; font-variant-numeric: tabular-nums; }
button { font: inherit; color: var(--text); background: var(--card2); border: 0; border-radius: 24px; padding: 10px 16px; min-height: 44px; cursor: pointer; touch-action: manipulation; }
button:disabled { opacity: .45; cursor: default; }
button.primary { background: var(--accent); color: var(--accent-text); font-weight: 600; width: 100%; margin-top: 18px; padding: 14px; font-size: 18px; }
button.link { background: none; color: var(--muted); font-size: 14px; }
.msg { color: var(--muted); min-height: 1.4em; }
.msg.error { color: var(--error); }
.layout { max-width: 980px; margin: 0 auto; display: flex; flex-direction: column; align-items: center; gap: 18px; }
.art { width: min(72vw, 340px); aspect-ratio: 1 / 1; border-radius: 16px; background: var(--card); overflow: hidden; display: flex; align-items: center; justify-content: center; flex: none; }
.art img { width: 100%; height: 100%; object-fit: cover; }
.art svg { width: 30%; height: 30%; fill: var(--muted); }
.panel { width: 100%; max-width: 520px; }
#title { font-size: 21px; font-weight: 700; text-align: center; }
#author { color: var(--muted); text-align: center; }
#chapter { color: var(--text); text-align: center; margin-top: 4px; min-height: 1.4em; }
input[type=range] { width: 100%; accent-color: var(--accent); height: 32px; margin: 0; }
.times { display: flex; justify-content: space-between; color: var(--muted); font-size: 13px; font-variant-numeric: tabular-nums; }
.transport { display: flex; justify-content: center; align-items: center; gap: 6px; margin: 10px 0 8px; }
.transport button { background: none; width: 56px; height: 56px; padding: 0; border-radius: 50%; display: inline-flex; flex-direction: column; align-items: center; justify-content: center; }
.transport button svg { width: 28px; height: 28px; fill: var(--text); }
.transport button small { font-size: 11px; color: var(--muted); line-height: 1; }
.transport #play { width: 72px; height: 72px; background: var(--accent); }
.transport #play svg { width: 36px; height: 36px; fill: var(--accent-text); }
.row { display: flex; align-items: center; gap: 10px; margin: 10px 0; flex-wrap: wrap; }
.row .label { color: var(--muted); font-size: 14px; min-width: 56px; }
.row input[type=range] { flex: 1; min-width: 140px; }
#speed { min-width: 64px; text-align: center; font-variant-numeric: tabular-nums; font-weight: 600; }
.chips button { padding: 8px 12px; min-height: 40px; }
.chips button.on { background: var(--accent); color: var(--accent-text); }
#nothing { text-align: center; margin: 24px 0; }
footer { max-width: 980px; margin: 18px auto 0; text-align: center; }
@media (orientation: landscape) and (min-width: 600px) {
  .layout { flex-direction: row; align-items: flex-start; justify-content: center; gap: 28px; }
  .art { width: min(40vw, calc(100vh - 80px)); position: sticky; top: 12px; }
  .panel { flex: 1; }
}
</style>
</head>
<body>
<header><span id="dot"></span><span id="hostName">Absorb</span></header>

<section id="pairView" class="card" hidden>
  <h1>Control Absorb on your PC</h1>
  <p>Use this browser as a remote. The audio keeps playing on the PC. Both need to be on the same Wi-Fi.</p>
  <p>On the PC: Settings &gt; Control from your phone, turn it on and use the code it shows.</p>
  <label for="code">Code</label>
  <input id="code" type="tel" inputmode="numeric" autocomplete="one-time-code" maxlength="7" placeholder="000000">
  <label for="name">This device's name (shown on the PC)</label>
  <input id="name" type="text" maxlength="60">
  <button id="pairBtn" class="primary">Pair</button>
  <p id="pairMsg" class="msg"></p>
</section>

<section id="statusView" class="card" hidden>
  <p id="statusMsg" class="msg"></p>
  <button id="retryBtn" class="primary" hidden>Connect again</button>
  <button id="statusPair" class="link" hidden>Pair again</button>
</section>

<section id="remoteView" hidden>
  <div class="layout">
    <div class="art"><img id="cover" alt="" hidden><svg id="coverPh" viewBox="0 0 24 24"><path d="M12 3v10.55A4 4 0 1 0 14 17V7h4V3h-6z"/></svg></div>
    <div class="panel">
      <div id="title"></div>
      <div id="author"></div>
      <div id="chapter"></div>
      <p id="nothing" hidden>Nothing is playing on the PC. Start a book there.</p>
      <div id="controls">
        <input id="seek" type="range" min="0" max="1" step="1" value="0" aria-label="Position">
        <div class="times"><span id="pos">0:00</span><span id="left"></span></div>
        <div class="transport">
          <button id="prevCh" aria-label="Previous chapter"><svg viewBox="0 0 24 24"><path d="M6 6h2v12H6zm3.5 6 8.5 6V6z"/></svg></button>
          <button id="back" aria-label="Skip back"><svg viewBox="0 0 24 24"><path d="M12 5V1L7 6l5 5V7a6 6 0 1 1-6 6H4a8 8 0 1 0 8-8z"/></svg><small id="backLabel">10</small></button>
          <button id="play" aria-label="Play"><svg viewBox="0 0 24 24"><path id="playIcon" d="M8 5v14l11-7z"/></svg></button>
          <button id="fwd" aria-label="Skip forward"><svg viewBox="0 0 24 24"><path d="M12 5V1l5 5-5 5V7a6 6 0 1 0 6 6h2a8 8 0 1 1-8-8z"/></svg><small id="fwdLabel">30</small></button>
          <button id="nextCh" aria-label="Next chapter"><svg viewBox="0 0 24 24"><path d="M6 18l8.5-6L6 6v12zM16 6v12h2V6h-2z"/></svg></button>
        </div>
        <div class="row"><span class="label">Volume</span><button id="mute">Mute</button><input id="vol" type="range" min="0" max="100" step="1" value="100" aria-label="Volume"></div>
        <div class="row"><span class="label">Speed</span><button id="slower" aria-label="Slower">&minus;</button><span id="speed">1.00x</span><button id="faster" aria-label="Faster">+</button><button id="speed1">1x</button></div>
        <div class="row chips"><span class="label">Sleep</span><button data-sleep="15">15</button><button data-sleep="30">30</button><button data-sleep="45">45</button><button data-sleep="60">60</button><button data-sleep="eoc">End of chapter</button><button data-sleep="off">Off</button></div>
        <p id="sleepState" class="msg"></p>
      </div>
    </div>
  </div>
  <footer><button id="unpair" class="link">Unpair this browser</button></footer>
</section>

<script>
(function () {
'use strict';

// ── SHA-256 / HMAC (Web Crypto needs https; this page is LAN http) ──
var K = new Uint32Array([
0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2]);
function sha256(bytes) {
  var l = bytes.length, n = ((l + 9 + 63) >> 6) << 6;
  var m = new Uint8Array(n); m.set(bytes); m[l] = 0x80;
  var dv = new DataView(m.buffer);
  dv.setUint32(n - 8, Math.floor(l / 0x20000000)); dv.setUint32(n - 4, (l << 3) >>> 0);
  var h = [0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19];
  var w = new Uint32Array(64), i, off;
  for (off = 0; off < n; off += 64) {
    for (i = 0; i < 16; i++) w[i] = dv.getUint32(off + i * 4);
    for (i = 16; i < 64; i++) {
      var x = w[i - 15], y = w[i - 2];
      var s0 = ((x >>> 7) | (x << 25)) ^ ((x >>> 18) | (x << 14)) ^ (x >>> 3);
      var s1 = ((y >>> 17) | (y << 15)) ^ ((y >>> 19) | (y << 13)) ^ (y >>> 10);
      w[i] = (w[i - 16] + s0 + w[i - 7] + s1) | 0;
    }
    var a = h[0], b = h[1], c = h[2], d = h[3], e = h[4], f = h[5], g = h[6], k = h[7];
    for (i = 0; i < 64; i++) {
      var S1 = ((e >>> 6) | (e << 26)) ^ ((e >>> 11) | (e << 21)) ^ ((e >>> 25) | (e << 7));
      var t1 = (k + S1 + ((e & f) ^ (~e & g)) + K[i] + w[i]) | 0;
      var S0 = ((a >>> 2) | (a << 30)) ^ ((a >>> 13) | (a << 19)) ^ ((a >>> 22) | (a << 10));
      var t2 = (S0 + ((a & b) ^ (a & c) ^ (b & c))) | 0;
      k = g; g = f; f = e; e = (d + t1) | 0; d = c; c = b; b = a; a = (t1 + t2) | 0;
    }
    h[0] = (h[0] + a) | 0; h[1] = (h[1] + b) | 0; h[2] = (h[2] + c) | 0; h[3] = (h[3] + d) | 0;
    h[4] = (h[4] + e) | 0; h[5] = (h[5] + f) | 0; h[6] = (h[6] + g) | 0; h[7] = (h[7] + k) | 0;
  }
  var out = new Uint8Array(32), odv = new DataView(out.buffer);
  for (i = 0; i < 8; i++) odv.setUint32(i * 4, h[i] >>> 0);
  return out;
}
function hmac(key, msg) {
  if (key.length > 64) key = sha256(key);
  var ip = new Uint8Array(64 + msg.length), op = new Uint8Array(96), i;
  for (i = 0; i < 64; i++) { var kb = i < key.length ? key[i] : 0; ip[i] = kb ^ 0x36; op[i] = kb ^ 0x5c; }
  ip.set(msg, 64); op.set(sha256(ip), 64);
  return sha256(op);
}
function utf8(s) { return new TextEncoder().encode(s); }
function b64u(bytes) {
  var s = '', i;
  for (i = 0; i < bytes.length; i++) s += String.fromCharCode(bytes[i]);
  return btoa(s).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}
function unb64u(str) {
  str = str.replace(/-/g, '+').replace(/_/g, '/');
  while (str.length % 4) str += '=';
  var s = atob(str), out = new Uint8Array(s.length), i;
  for (i = 0; i < s.length; i++) out[i] = s.charCodeAt(i);
  return out;
}
function rand(n) { var b = new Uint8Array(n); crypto.getRandomValues(b); return b; }
function same(a, b) {
  if (typeof a !== 'string' || a.length !== b.length) return false;
  var d = 0, i;
  for (i = 0; i < a.length; i++) d |= a.charCodeAt(i) ^ b.charCodeAt(i);
  return d === 0;
}

// ── Pairing key exchange (RFC 3526 group 14, generator 2) ──
var P = BigInt('0xFFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7EDEE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3DC2007CB8A163BF0598DA48361C55D39A69163FA8FD24CF5F83655D23DCA3AD961C62F356208552BB9ED529077096966D670C354E4ABC9804F1746C08CA18217C32905E462E36CE3BE39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9DE2BCBF6955817183995497CEA956AE515D2261898FA051015728E5A8AACAA68FFFFFFFFFFFFFFFF');
var ONE = BigInt(1), ZERO = BigInt(0), B8 = BigInt(8), FF = BigInt(255);
function modPow(base, exp, mod) {
  var r = ONE; base %= mod;
  while (exp > ZERO) { if (exp & ONE) r = (r * base) % mod; exp >>= ONE; base = (base * base) % mod; }
  return r;
}
function toBytes(v) { var out = new Uint8Array(256), i; for (i = 255; i >= 0; i--) { out[i] = Number(v & FF); v >>= B8; } return out; }
function fromBytes(b) { var hex = '0', i; for (i = 0; i < b.length; i++) hex += (b[i] < 16 ? '0' : '') + b[i].toString(16); return BigInt('0x' + hex); }

var LABEL = 'absorb-remote v2';
function transcript(what, hostId, nR, nH) { return utf8(LABEL + ' ' + what + '\n' + hostId + '\n' + nR + '\n' + nH); }

// ── Saved pairing (this address only) ──
var STORE = 'absorbRemote.v2', memory = null;
function loadSaved() {
  try { var v = JSON.parse(localStorage.getItem(STORE) || 'null'); if (v && v.token && v.hostId) return v; } catch (e) { /* No storage: pair each visit. */ }
  return memory;
}
function save(v) { memory = v; try { if (v) localStorage.setItem(STORE, JSON.stringify(v)); else localStorage.removeItem(STORE); } catch (e) { /* Kept in memory only. */ } }

function $(id) { return document.getElementById(id); }
function show(view) { ['pairView', 'statusView', 'remoteView'].forEach(function (v) { $(v).hidden = v !== view; }); }
function setDot(on) { $('dot').className = on ? 'on' : ''; }

var ERRORS = {
  badCode: "That code isn't right. Check the code on the PC.",
  codeExpired: 'The code expired. Get a new one on the PC (Pair another device).',
  pairingClosed: "Pairing isn't open on the PC. Open Settings > Control from your phone there.",
  pairDenied: "The PC didn't allow this browser.",
  tooManyDevices: 'That PC already has 5 paired devices. Forget one on the PC first.',
  tooManyAttempts: 'Too many tries. Wait a minute and try again.',
  unsupportedVersion: 'This page and the app on the PC are different versions. Reload the page.'
};

function guessName() {
  var ua = navigator.userAgent;
  var dev = /iPhone/.test(ua) ? 'iPhone' : (/iPad/.test(ua) || (/Macintosh/.test(ua) && navigator.maxTouchPoints > 1)) ? 'iPad' :
    /Android/.test(ua) ? 'Android' : /Windows/.test(ua) ? 'Windows' : /Mac/.test(ua) ? 'Mac' : /Linux|CrOS/.test(ua) ? 'Linux' : 'device';
  var br = /Edg\//.test(ua) ? 'Edge' : /Firefox|FxiOS/.test(ua) ? 'Firefox' : /Chrome|CriOS/.test(ua) ? 'Chrome' : /Safari/.test(ua) ? 'Safari' : 'Browser';
  return br + ' on ' + dev;
}

var wsUrl = 'ws://' + location.host + '/remote';
var ws = null, stage = 'idle', lastError = null, retryTimer = null, attempt = 0;
var sessionKey = null, sent = 0, received = 0, ticket = null, beat = null, heard = 0;
var state = null, coverKey = null, coverUrl = null, dragging = false, volDragging = false;

function closeSocket() {
  if (beat) { clearInterval(beat); beat = null; }
  var s = ws; ws = null; sessionKey = null; ticket = null;
  if (s) { s.onopen = s.onmessage = s.onclose = s.onerror = null; try { s.close(); } catch (e) { /* Already closed. */ } }
}

// ── Pairing ──
function pair() {
  var code = $('code').value.replace(/\D/g, '');
  var name = $('name').value.trim() || guessName();
  if (code.length !== 6) { pairMsg('Type the 6-digit code from the PC.', true); return; }
  closeSocket(); clearTimeout(retryTimer);
  $('pairBtn').disabled = true; pairMsg('Connecting…');
  var secret = fromBytes(rand(32)) | BigInt(2);
  var mine = b64u(toBytes(modPow(BigInt(2), secret, P)));
  var s = new WebSocket(wsUrl); ws = s; stage = 'pair'; lastError = null;
  var done = false;
  s.onopen = function () { s.send(JSON.stringify({ type: 'pair', version: 2, code: code, deviceName: name, key: mine })); };
  s.onmessage = function (ev) {
    var m; try { m = JSON.parse(ev.data); } catch (e) { return; }
    if (m.type === 'pairWait') { pairMsg('Now choose Allow on the PC.'); }
    else if (m.type === 'error') { lastError = m.code; }
    else if (m.type === 'paired' && typeof m.key === 'string' && typeof m.hostId === 'string') {
      var peer; try { peer = fromBytes(unb64u(m.key)); } catch (e) { peer = ZERO; }
      if (peer <= ONE || peer >= P - ONE) { lastError = 'badKey'; return; }
      var shared = toBytes(modPow(peer, secret, P));
      var token = b64u(hmac(sha256(shared), utf8(LABEL + ' token\n' + m.hostId + '\n' + mine + '\n' + m.key)));
      save({ hostId: m.hostId, token: token, hostName: m.hostName || '' });
      done = true;
    }
  };
  s.onclose = function () {
    if (ws === s) ws = null;
    $('pairBtn').disabled = false;
    if (done) { pairMsg(''); $('code').value = ''; connect(); return; }
    pairMsg(ERRORS[lastError] || "Couldn't reach the PC. Check that it's on and on the same Wi-Fi.", true);
  };
}
function pairMsg(text, error) { var el = $('pairMsg'); el.textContent = text; el.className = 'msg' + (error ? ' error' : ''); }

function showPair(message) {
  closeSocket(); clearTimeout(retryTimer); stage = 'idle'; setDot(false);
  $('hostName').textContent = 'Absorb';
  if (!$('name').value) $('name').value = guessName();
  show('pairView'); pairMsg(message || '', !!message);
}
function showStatus(text, canRetry) {
  show('statusView'); $('statusMsg').textContent = text;
  $('retryBtn').hidden = !canRetry; $('statusPair').hidden = !canRetry;
}

// ── Login and sealed frames ──
function connect() {
  var saved = loadSaved();
  if (!saved) { showPair(); return; }
  closeSocket(); clearTimeout(retryTimer);
  if (saved.hostName) $('hostName').textContent = saved.hostName;
  if (!state) showStatus('Connecting…', false);
  var key = sha256(utf8(saved.token));
  var nR = b64u(rand(32)), nH = null;
  var s = new WebSocket(wsUrl); ws = s; stage = 'hello'; lastError = null;
  s.onopen = function () { s.send(JSON.stringify({ type: 'hello', version: 2, nonce: nR })); };
  s.onmessage = function (ev) {
    heard = Date.now();
    var m; try { m = JSON.parse(ev.data); } catch (e) { s.close(); return; }
    if (stage === 'hello' && m.type === 'challenge') {
      if (m.hostId !== saved.hostId || typeof m.nonce !== 'string') { lastError = 'otherHost'; s.close(); return; }
      nH = m.nonce;
      s.send(JSON.stringify({ type: 'auth', proof: b64u(hmac(key, transcript('client', saved.hostId, nR, nH))) }));
      stage = 'auth';
    } else if (stage === 'auth' && m.type === 'welcome') {
      if (!same(m.proof, b64u(hmac(key, transcript('host', saved.hostId, nR, nH))))) { lastError = 'badProof'; s.close(); return; }
      sessionKey = hmac(key, transcript('session', saved.hostId, nR, nH));
      ticket = b64u(hmac(sessionKey, utf8(LABEL + ' cover')));
      sent = 0; received = 0; stage = 'live'; attempt = 0;
      if (m.hostName) { $('hostName').textContent = m.hostName; saved.hostName = m.hostName; save(saved); }
      setDot(true);
      beat = setInterval(function () {
        if (Date.now() - heard > 8000) { s.close(); return; }
        sendCommand({ type: 'ping' });
      }, 2000);
    } else if (stage === 'live' && m.type === 'sealed') {
      var body = open(m);
      if (body === null) { s.close(); return; }
      onMessage(body);
    } else if (m.type === 'error') {
      lastError = m.code;
    } else {
      s.close();
    }
  };
  s.onclose = function (ev) { if (ws === s) { ws = null; onClosed(ev.code); } };
}
function mac(dir, seq, body) { return b64u(hmac(sessionKey, utf8(dir + '\n' + seq + '\n' + body))); }
function open(f) {
  if (typeof f.s !== 'number' || typeof f.m !== 'string' || typeof f.a !== 'string') return null;
  if (f.s !== received + 1 || !same(f.a, mac('h', f.s, f.m))) return null;
  var body; try { body = JSON.parse(f.m); } catch (e) { return null; }
  received = f.s; return body;
}
function sendCommand(cmd) {
  if (!ws || stage !== 'live' || !sessionKey) return;
  var body = JSON.stringify(cmd), seq = ++sent;
  ws.send(JSON.stringify({ type: 'sealed', s: seq, m: body, a: mac('r', seq, body) }));
}
function onClosed(code) {
  if (beat) { clearInterval(beat); beat = null; }
  setDot(false); sessionKey = null; ticket = null;
  stage = 'idle';
  if (code === 4001 || code === 4003 || lastError === 'otherHost' || lastError === 'unauthorized') {
    save(null); state = null;
    showPair(code === 4003 ? 'The PC forgot this browser. Pair again.' : "This browser isn't paired with this PC anymore. Pair again.");
    return;
  }
  if (code === 4002) { state = null; showStatus('The PC disconnected this browser.', true); return; }
  if (code === 4007) { state = null; showStatus(ERRORS.unsupportedVersion, false); return; }
  var wait = [1, 2, 4, 8][attempt] || 10; attempt++;
  // No stale controls while the link is down.
  state = null; coverKey = null;
  showStatus(code === 4004 ? 'Absorb on the PC stopped the remote. Retrying…' : 'Reconnecting…', true);
  retryTimer = setTimeout(connect, wait * 1000);
}

// ── State ──
function fmt(sec) {
  sec = Math.max(0, Math.floor(sec || 0));
  var h = Math.floor(sec / 3600), m = Math.floor(sec % 3600 / 60), s = sec % 60;
  return (h ? h + ':' + (m < 10 ? '0' : '') : '') + m + ':' + (s < 10 ? '0' : '') + s;
}
function chapterMode(st) { return st.chapterEnd > st.chapterStart; }
function onMessage(m) {
  if (m.type === 'state') { state = m; render(); }
  else if (m.type === 'error') { toast(m.code === 'nothingLoaded' ? 'Nothing is loaded on the PC.' : "The PC couldn't do that."); }
}
var toastTimer = null;
function toast(text) { var el = $('sleepState'); el.textContent = text; clearTimeout(toastTimer); toastTimer = setTimeout(function () { renderSleep(); }, 3000); }
function render() {
  var st = state; if (!st) return;
  show('remoteView');
  var has = typeof st.itemId === 'string';
  $('nothing').hidden = has; $('controls').hidden = !has;
  $('title').textContent = has ? st.title : '';
  $('author').textContent = has ? st.author : '';
  $('chapter').textContent = has ? st.chapterTitle : '';
  if (!has) { setCover(null); return; }
  var cm = chapterMode(st), start = cm ? st.chapterStart : 0, end = cm ? st.chapterEnd : st.duration;
  var seek = $('seek');
  if (!dragging) {
    seek.max = String(Math.max(1, Math.round(end - start)));
    seek.value = String(Math.round(st.position - start));
    $('pos').textContent = fmt(st.position - start);
  }
  var speed = st.speed > 0 ? st.speed : 1;
  $('left').textContent = '-' + fmt((end - st.position) / speed);
  $('playIcon').setAttribute('d', st.playing ? 'M6 5h4v14H6zm8 0h4v14h-4z' : 'M8 5v14l11-7z');
  $('play').setAttribute('aria-label', st.playing ? 'Pause' : 'Play');
  $('backLabel').textContent = String(st.skipBack || 10);
  $('fwdLabel').textContent = String(st.skipForward || 30);
  $('prevCh').disabled = !cm; $('nextCh').disabled = !cm;
  if (!volDragging) $('vol').value = String(Math.round((st.volume == null ? 1 : st.volume) * 100));
  $('mute').textContent = st.muted ? 'Unmute' : 'Mute';
  $('speed').textContent = speed.toFixed(2) + 'x';
  renderSleep();
  var ck = st.itemId + ':' + st.coverVersion;
  if (ck !== coverKey) { coverKey = ck; loadCover(ck); }
}
function renderSleep() {
  var st = state, el = $('sleepState'); if (!st) return;
  var sl = st.sleep || {};
  if (sl.mode === 'time') el.textContent = 'Sleep timer: ' + fmt(sl.remaining) + ' left';
  else if (sl.mode === 'chapters') el.textContent = 'Sleep at the end of the chapter';
  else if (sl.mode === 'episodes') el.textContent = 'Sleep at the end of the episode';
  else el.textContent = '';
}
function setCover(url) {
  if (coverUrl) URL.revokeObjectURL(coverUrl);
  coverUrl = url; $('cover').hidden = !url; $('coverPh').style.display = url ? 'none' : '';
  if (url) $('cover').src = url; else $('cover').removeAttribute('src');
}
function loadCover(key) {
  var t = ticket; if (!t) return;
  fetch('/cover', { headers: { Authorization: 'Bearer ' + t }, cache: 'no-store', credentials: 'omit' })
    .then(function (r) { return r.ok ? r.blob() : null; })
    .then(function (b) { if (key === coverKey) setCover(b ? URL.createObjectURL(b) : null); })
    .catch(function () { if (key === coverKey) coverKey = null; });
}

// ── Controls ──
function cmd(c) { return function () { sendCommand(c); }; }
$('play').onclick = cmd({ type: 'toggle' });
$('prevCh').onclick = cmd({ type: 'chapter', delta: -1 });
$('nextCh').onclick = cmd({ type: 'chapter', delta: 1 });
$('back').onclick = function () { sendCommand({ type: 'skip', seconds: -((state && state.skipBack) || 10) }); };
$('fwd').onclick = function () { sendCommand({ type: 'skip', seconds: (state && state.skipForward) || 30 }); };
$('seek').oninput = function () { dragging = true; $('pos').textContent = fmt(+this.value); };
$('seek').onchange = function () {
  dragging = false;
  if (!state) return;
  var start = chapterMode(state) ? state.chapterStart : 0;
  sendCommand({ type: 'seek', position: Math.max(0, start + (+this.value)) });
};
$('vol').oninput = function () { volDragging = true; };
$('vol').onchange = function () { volDragging = false; sendCommand({ type: 'volume', value: (+this.value) / 100 }); };
$('mute').onclick = function () { sendCommand({ type: 'mute', muted: !(state && state.muted) }); };
function stepSpeed(d) {
  var cur = (state && state.speed) || 1;
  var next = Math.min(5, Math.max(0.5, Math.round((cur + d) * 100) / 100));
  sendCommand({ type: 'speed', value: next });
}
$('slower').onclick = function () { stepSpeed(-0.05); };
$('faster').onclick = function () { stepSpeed(0.05); };
$('speed1').onclick = cmd({ type: 'speed', value: 1 });
Array.prototype.forEach.call(document.querySelectorAll('[data-sleep]'), function (b) {
  b.onclick = function () {
    var v = b.getAttribute('data-sleep');
    sendCommand(v === 'off' ? { type: 'sleep', cancel: true } : v === 'eoc' ? { type: 'sleep', endOfChapter: true } : { type: 'sleep', minutes: +v });
  };
});
$('pairBtn').onclick = pair;
$('code').onkeydown = function (e) { if (e.key === 'Enter') pair(); };
$('retryBtn').onclick = function () { attempt = 0; connect(); };
$('statusPair').onclick = function () { showPair(); };
$('unpair').onclick = function () {
  if (!confirm('Unpair this browser? To remove it from the PC too, choose Forget there.')) return;
  save(null); state = null; showPair();
};
document.addEventListener('visibilitychange', function () {
  if (document.visibilityState === 'visible' && !ws && loadSaved()) { attempt = 0; connect(); }
});

connect();
})();
</script>
</body>
</html>
''';

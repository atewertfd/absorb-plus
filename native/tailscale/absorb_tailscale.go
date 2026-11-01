// Copyright (c) Absorb Plus contributors.

// Command absorb_tailscale is built as a C shared library
// (absorb_tailscale.dll / libabsorb_tailscale.so) that embeds a Tailscale
// node (tsnet, userspace networking: no system VPN, no admin rights) in the
// Absorb Plus process. Dart loads it with dart:ffi
// (lib/services/tailscale_service.dart).
//
// The C ABI is deliberately small and never blocks the caller for long:
//
//	AbsorbTsStart(dir, hostname, controlURL, authKey, secret, preferredPort)
//	    -> local proxy port, or -1 (see AbsorbTsStatus "error")
//	AbsorbTsStatus() -> JSON (free with AbsorbTsFree); cached, no I/O
//	AbsorbTsLogout() -> 0; signs the node out in the background
//	AbsorbTsStop()   -> 0 once the node is closed, or 1 if it is still
//	                    closing after 5 s (the next start waits for it)
//	AbsorbTsLogs()   -> recent tsnet log lines for debugging (free it)
//	AbsorbTsAlloc(n) / AbsorbTsFree(p)
package main

/*
#include <stdlib.h>
*/
import "C"

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"net"
	"net/http"
	"os"
	"path/filepath"
	"runtime"
	"strconv"
	"strings"
	"sync"
	"sync/atomic"
	"time"
	"unsafe"

	"tailscale.com/client/local"
	"tailscale.com/envknob"
	"tailscale.com/ipn"
	"tailscale.com/ipn/ipnstate"
	"tailscale.com/logtail"
	"tailscale.com/net/netns"
	"tailscale.com/tsnet"
)

func main() {}

// node is one embedded Tailscale node plus its loopback proxy.
//
// Lifecycle: tsnet's Close "must not be called before or concurrently with
// Start", and two nodes must never run on the same state folder. So:
//   - the start goroutine first waits for the previous node (if any) to
//     finish closing, then runs srv.Start and closes startDone;
//   - Stop closes the proxy at once, then (in the background) waits for
//     startDone before srv.Close and closes `closed` when the node is down.
//     A node stopped before its Start began never starts at all.
type node struct {
	srv     *tsnet.Server
	ln      net.Listener
	httpSrv *http.Server
	proxy   *tailnetProxy
	port    int

	startDone chan struct{} // closed when the start goroutine is finished
	stopping  chan struct{} // closed by Stop
	closed    chan struct{} // closed when the node is fully shut down
	cancel    context.CancelFunc

	running atomic.Bool   // cached BackendState == "Running", for dial
	kick    chan struct{} // asks the status watcher for a refresh

	mu       sync.Mutex
	startErr string
	started  bool        // srv.Start succeeded
	ranStart bool        // srv.Start was called, so Close is allowed
	status   *statusJSON // last status read in the background; nil before the first
}

var (
	mu      sync.Mutex
	current *node
	lastErr string
	// previous is the most recently stopped node's `closed` channel; the next
	// node waits for it before using the same state folder.
	previous chan struct{}
)

// How long a new node waits for the previous one to close before giving up
// with an error, rather than running two nodes on one state folder.
const previousCloseWait = 30 * time.Second

func init() {
	// Never upload logs to Tailscale's log service; keep them in memory only.
	envknob.SetNoLogsNoSupport()
	logtail.Disable()
	// Test only (test/integration/tailscale_tailnet_test.dart): on Windows
	// tailscale pins its sockets to the physical default interface, which is
	// right for real use but can't reach the loopback-only throwaway tailnet.
	if os.Getenv("ABSORB_TS_TEST_LOOPBACK") == "1" {
		netns.SetEnabled(false)
	}
}

func goString(c *C.char) string {
	if c == nil {
		return ""
	}
	return C.GoString(c)
}

//export AbsorbTsStart
func AbsorbTsStart(cDir, cHostname, cControlURL, cAuthKey, cSecret *C.char, preferredPort C.int) C.int {
	mu.Lock()
	defer mu.Unlock()
	if current != nil {
		return C.int(current.port)
	}
	port, err := startLocked(goString(cDir), goString(cHostname), goString(cControlURL),
		goString(cAuthKey), goString(cSecret), int(preferredPort))
	if err != nil {
		lastErr = err.Error()
		logf("start failed: %v", err)
		return -1
	}
	lastErr = ""
	return C.int(port)
}

func startLocked(dir, hostname, controlURL, authKey, secret string, preferredPort int) (int, error) {
	if dir == "" {
		return 0, errors.New("no state directory")
	}
	if len(secret) < 16 {
		return 0, errors.New("proxy secret too short")
	}
	if err := os.MkdirAll(dir, 0o700); err != nil {
		return 0, fmt.Errorf("state directory: %w", err)
	}
	if runtime.GOOS != "windows" {
		// Dart may have created the folder and written proxy-secret with
		// default permissions; MkdirAll doesn't tighten an existing folder.
		os.Chmod(dir, 0o700)
		os.Chmod(filepath.Join(dir, "proxy-secret"), 0o600)
	}
	// Some tsnet internals (the sockstat logger) otherwise default to the
	// installed Tailscale's own folder (%LocalAppData%\Tailscale on Windows).
	// Keep everything inside Absorb's state directory.
	logsDir := filepath.Join(dir, "logs")
	if err := os.MkdirAll(logsDir, 0o700); err == nil {
		os.Setenv("TS_LOGS_DIR", logsDir)
	}
	srv := &tsnet.Server{
		Dir:        dir,
		Hostname:   hostname,
		ControlURL: controlURL,
		AuthKey:    authKey,
		Logf:       logf,
		UserLogf:   userLogf,
	}
	ctx, cancel := context.WithCancel(context.Background())
	n := &node{
		srv:       srv,
		startDone: make(chan struct{}),
		stopping:  make(chan struct{}),
		closed:    make(chan struct{}),
		cancel:    cancel,
		kick:      make(chan struct{}, 1),
	}
	n.proxy = newTailnetProxy(secret, n.dial)

	ln, err := listenLoopback(preferredPort)
	if err != nil {
		cancel()
		return 0, err
	}
	n.ln = ln
	n.port = ln.Addr().(*net.TCPAddr).Port
	n.httpSrv = &http.Server{
		Handler:           n.proxy,
		ReadHeaderTimeout: 30 * time.Second,
	}
	go n.httpSrv.Serve(ln)

	go n.run(ctx, previous)
	current = n
	return n.port, nil
}

// run waits for the previous node to close, starts this one, then keeps its
// status cached until the node is stopped.
func (n *node) run(ctx context.Context, prev chan struct{}) {
	if prev != nil {
		select {
		case <-prev:
		case <-n.stopping:
			close(n.startDone)
			return
		case <-time.After(previousCloseWait):
			n.mu.Lock()
			n.startErr = "the previous Tailscale session is still closing; turn it off and on again"
			n.mu.Unlock()
			logf("start: previous node still closing after %v", previousCloseWait)
			close(n.startDone)
			return
		}
	}
	n.mu.Lock()
	select {
	case <-n.stopping:
		n.mu.Unlock()
		close(n.startDone)
		return
	default:
	}
	n.ranStart = true
	n.mu.Unlock()

	err := n.srv.Start()
	n.mu.Lock()
	if err != nil {
		n.startErr = err.Error()
		logf("tsnet start: %v", err)
	} else {
		n.started = true
	}
	n.mu.Unlock()
	close(n.startDone)
	if err == nil {
		n.watchStatus(ctx)
	}
}

func listenLoopback(preferred int) (net.Listener, error) {
	if preferred > 0 && preferred < 65536 {
		if ln, err := net.Listen("tcp4", "127.0.0.1:"+strconv.Itoa(preferred)); err == nil {
			return ln, nil
		}
	}
	return net.Listen("tcp4", "127.0.0.1:0")
}

func (n *node) isStarted() (bool, string) {
	n.mu.Lock()
	defer n.mu.Unlock()
	return n.started, n.startErr
}

func (n *node) requestRefresh() {
	select {
	case n.kick <- struct{}{}:
	default:
	}
}

// watchStatus keeps the node's status cached, so AbsorbTsStatus (called
// synchronously on Dart's UI isolate) and every proxied dial never wait on a
// LocalAPI round trip. It refreshes when the IPN bus reports a change (at
// most four times a second) and every few seconds anyway for health changes.
func (n *node) watchStatus(ctx context.Context) {
	lc, err := n.srv.LocalClient()
	if err != nil {
		n.mu.Lock()
		n.status = &statusJSON{State: "Starting", Error: err.Error()}
		n.mu.Unlock()
		return
	}
	go n.watchBus(ctx, lc)
	ticker := time.NewTicker(5 * time.Second)
	defer ticker.Stop()
	for {
		n.refreshStatus(ctx, lc)
		select {
		case <-ctx.Done():
			return
		case <-n.kick:
		case <-ticker.C:
		}
		// Coalesce bursts of notifications (netmap updates).
		select {
		case <-ctx.Done():
			return
		case <-time.After(250 * time.Millisecond):
		}
	}
}

func (n *node) watchBus(ctx context.Context, lc *local.Client) {
	for ctx.Err() == nil {
		if w, err := lc.WatchIPNBus(ctx, ipn.NotifyInitialState); err == nil {
			for {
				if _, err := w.Next(); err != nil {
					break
				}
				n.requestRefresh()
			}
			w.Close()
		}
		select {
		case <-ctx.Done():
			return
		case <-time.After(time.Second):
		}
	}
}

func (n *node) refreshStatus(ctx context.Context, lc *local.Client) {
	sctx, cancel := context.WithTimeout(ctx, 2*time.Second)
	st, err := lc.StatusWithoutPeers(sctx)
	cancel()
	if ctx.Err() != nil {
		return
	}
	n.mu.Lock()
	defer n.mu.Unlock()
	if err != nil {
		// Keep the last good status and report the error with it.
		out := statusJSON{State: "Starting"}
		if n.status != nil {
			out = *n.status
		}
		out.Error = err.Error()
		n.status = &out
		return
	}
	out := statusJSON{}
	fillStatus(&out, st)
	n.status = &out
	n.running.Store(st.BackendState == "Running")
}

// waitRunning waits until the node is connected to the tailnet, so a request
// made right after launch doesn't fail while the node is still coming up.
func (n *node) waitRunning(ctx context.Context) error {
	for {
		if n.running.Load() {
			return nil
		}
		if _, errStr := n.isStarted(); errStr != "" {
			return errors.New(errStr)
		}
		n.requestRefresh()
		select {
		case <-ctx.Done():
			return errNotRunning
		case <-time.After(200 * time.Millisecond):
		}
	}
}

func (n *node) dial(ctx context.Context, network, address string) (net.Conn, error) {
	wctx, cancel := context.WithTimeout(ctx, 20*time.Second)
	defer cancel()
	if err := n.waitRunning(wctx); err != nil {
		return nil, err
	}
	return n.srv.Dial(ctx, network, address)
}

type statusJSON struct {
	State      string   `json:"state"`
	AuthURL    string   `json:"authUrl,omitempty"`
	IPs        []string `json:"ips,omitempty"`
	DNSName    string   `json:"dnsName,omitempty"`
	DNSSuffix  string   `json:"magicDnsSuffix,omitempty"`
	User       string   `json:"user,omitempty"`
	Tailnet    string   `json:"tailnet,omitempty"`
	ProxyPort  int      `json:"proxyPort,omitempty"`
	Error      string   `json:"error,omitempty"`
	HealthWarn []string `json:"health,omitempty"`
}

// buildStatus returns the cached status; it never does I/O.
func buildStatus() statusJSON {
	mu.Lock()
	n := current
	errStr := lastErr
	mu.Unlock()
	if n == nil {
		return statusJSON{State: "Off", Error: errStr}
	}
	out := statusJSON{State: "Starting", ProxyPort: n.port}
	n.mu.Lock()
	defer n.mu.Unlock()
	if n.startErr != "" {
		out.State = "Error"
		out.Error = n.startErr
		return out
	}
	if !n.started || n.status == nil {
		return out
	}
	out = *n.status
	out.ProxyPort = n.port
	return out
}

func fillStatus(out *statusJSON, st *ipnstate.Status) {
	out.State = st.BackendState
	out.AuthURL = st.AuthURL
	for _, ip := range st.TailscaleIPs {
		out.IPs = append(out.IPs, ip.String())
	}
	if st.Self != nil {
		out.DNSName = strings.TrimSuffix(st.Self.DNSName, ".")
		if u, ok := st.User[st.Self.UserID]; ok {
			out.User = u.LoginName
		}
	}
	if st.CurrentTailnet != nil {
		out.Tailnet = st.CurrentTailnet.Name
		out.DNSSuffix = strings.TrimSuffix(st.CurrentTailnet.MagicDNSSuffix, ".")
	}
	out.HealthWarn = st.Health
}

//export AbsorbTsStatus
func AbsorbTsStatus() *C.char {
	b, _ := json.Marshal(buildStatus())
	return C.CString(string(b))
}

//export AbsorbTsLogout
func AbsorbTsLogout() C.int {
	mu.Lock()
	n := current
	mu.Unlock()
	if n == nil {
		return -1
	}
	go func() {
		if ok, _ := n.isStarted(); !ok {
			return
		}
		lc, err := n.srv.LocalClient()
		if err != nil {
			return
		}
		ctx, cancel := context.WithTimeout(context.Background(), 15*time.Second)
		defer cancel()
		if err := lc.Logout(ctx); err != nil {
			logf("logout: %v", err)
			return
		}
		n.requestRefresh()
		// Ask for a fresh login URL so the screen can offer "Sign in" again.
		if err := lc.StartLoginInteractive(ctx); err != nil {
			logf("login after logout: %v", err)
		}
		n.requestRefresh()
	}()
	return 0
}

//export AbsorbTsStop
func AbsorbTsStop() C.int {
	mu.Lock()
	n := current
	current = nil
	if n != nil {
		previous = n.closed
	}
	mu.Unlock()
	if n == nil {
		return 0
	}
	n.mu.Lock()
	close(n.stopping)
	n.mu.Unlock()
	n.cancel()
	n.running.Store(false)
	go func() {
		n.httpSrv.Close()
		n.proxy.closeIdle()
		// Close only after Start has returned (tsnet's contract): a node
		// stopped while starting is closed as soon as its Start finishes.
		<-n.startDone
		n.mu.Lock()
		ran := n.ranStart
		n.mu.Unlock()
		if ran {
			n.srv.Close()
		}
		close(n.closed)
	}()
	select {
	case <-n.closed:
		return 0
	case <-time.After(5 * time.Second):
		// The next AbsorbTsStart waits for this node to finish closing
		// before it starts another one on the same state folder.
		logf("stop: node still closing after 5 s; it keeps closing in the background")
		return 1
	}
}

//export AbsorbTsLogs
func AbsorbTsLogs() *C.char {
	s := strings.ToValidUTF8(strings.Join(ring.snapshot(), "\n"), "?")
	// A NUL inside a line would cut the C string short.
	return C.CString(strings.ReplaceAll(s, "\x00", "?"))
}

// AbsorbTsAlloc lets Dart pass strings without depending on package:ffi:
// it allocates n zeroed bytes that the caller frees with AbsorbTsFree.
//
//export AbsorbTsAlloc
func AbsorbTsAlloc(n C.int) *C.char {
	return (*C.char)(C.calloc(C.size_t(n), 1))
}

//export AbsorbTsFree
func AbsorbTsFree(p *C.char) {
	C.free(unsafe.Pointer(p))
}

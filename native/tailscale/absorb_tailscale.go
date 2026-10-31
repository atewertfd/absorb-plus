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
//	AbsorbTsStatus() -> JSON (free with AbsorbTsFree)
//	AbsorbTsLogout() -> 0; signs the node out in the background
//	AbsorbTsStop()   -> 0; closes the proxy and the node (waits up to 5 s)
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
	"strconv"
	"strings"
	"sync"
	"time"
	"unsafe"

	"tailscale.com/envknob"
	"tailscale.com/ipn/ipnstate"
	"tailscale.com/logtail"
	"tailscale.com/net/netns"
	"tailscale.com/tsnet"
)

func main() {}

type node struct {
	srv     *tsnet.Server
	ln      net.Listener
	httpSrv *http.Server
	proxy   *tailnetProxy
	port    int

	mu       sync.Mutex
	startErr string
	started  bool
}

var (
	mu      sync.Mutex
	current *node
	lastErr string
)

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
	n := &node{srv: srv}
	n.proxy = newTailnetProxy(secret, n.dial)

	ln, err := listenLoopback(preferredPort)
	if err != nil {
		return 0, err
	}
	n.ln = ln
	n.port = ln.Addr().(*net.TCPAddr).Port
	n.httpSrv = &http.Server{
		Handler:           n.proxy,
		ReadHeaderTimeout: 30 * time.Second,
	}
	go n.httpSrv.Serve(ln)

	go func() {
		err := srv.Start()
		n.mu.Lock()
		defer n.mu.Unlock()
		if err != nil {
			n.startErr = err.Error()
			logf("tsnet start: %v", err)
			return
		}
		n.started = true
	}()
	current = n
	return n.port, nil
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

// waitRunning waits until the node is connected to the tailnet, so a request
// made right after launch doesn't fail while the node is still coming up.
func (n *node) waitRunning(ctx context.Context) error {
	for {
		if ok, errStr := n.isStarted(); errStr != "" {
			return errors.New(errStr)
		} else if ok {
			lc, err := n.srv.LocalClient()
			if err == nil {
				sctx, cancel := context.WithTimeout(ctx, 2*time.Second)
				st, err := lc.StatusWithoutPeers(sctx)
				cancel()
				if err == nil && st.BackendState == "Running" {
					return nil
				}
			}
		}
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

func buildStatus() statusJSON {
	mu.Lock()
	n := current
	errStr := lastErr
	mu.Unlock()
	if n == nil {
		return statusJSON{State: "Off", Error: errStr}
	}
	out := statusJSON{State: "Starting", ProxyPort: n.port}
	started, startErr := n.isStarted()
	if startErr != "" {
		out.State = "Error"
		out.Error = startErr
		return out
	}
	if !started {
		return out
	}
	lc, err := n.srv.LocalClient()
	if err != nil {
		out.Error = err.Error()
		return out
	}
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()
	st, err := lc.StatusWithoutPeers(ctx)
	if err != nil {
		out.Error = err.Error()
		return out
	}
	fillStatus(&out, st)
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
		// Ask for a fresh login URL so the screen can offer "Sign in" again.
		if err := lc.StartLoginInteractive(ctx); err != nil {
			logf("login after logout: %v", err)
		}
	}()
	return 0
}

//export AbsorbTsStop
func AbsorbTsStop() C.int {
	mu.Lock()
	n := current
	current = nil
	mu.Unlock()
	if n == nil {
		return 0
	}
	done := make(chan struct{})
	go func() {
		n.httpSrv.Close()
		n.proxy.closeIdle()
		n.srv.Close()
		close(done)
	}()
	select {
	case <-done:
	case <-time.After(5 * time.Second):
		logf("stop: timed out waiting for the node to close")
	}
	return 0
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

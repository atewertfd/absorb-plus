// Copyright (c) Absorb Plus contributors.

package main

import (
	"bufio"
	"context"
	"crypto/subtle"
	"encoding/base64"
	"errors"
	"io"
	"net"
	"net/http"
	"net/http/httputil"
	"net/url"
	"strings"
	"sync"
	"time"
)

// dialFunc opens a TCP connection inside the tailnet.
type dialFunc func(ctx context.Context, network, address string) (net.Conn, error)

// tailnetProxy is the only way the app reaches the tailnet. It listens on
// 127.0.0.1 and accepts three request shapes:
//
//   - CONNECT host:port (Dart's HttpClient for https:// URLs through
//     findProxy): a raw tunnel, so TLS stays end to end inside Dart.
//   - Absolute-form "GET http://host:port/path" (Dart's HttpClient for http://
//     URLs through findProxy): forwarded with the Host header intact.
//   - Origin-form "/_ts/<secret>/<scheme>/<host:port>/<path>" (media players,
//     which can't use a proxy): reverse-proxied to scheme://host:port/path.
//
// The first two need "Proxy-Authorization: Basic absorb:<secret>", the third
// carries the secret in its path, so other apps on the device can't use the
// port to reach the tailnet.
type tailnetProxy struct {
	secret    string
	dial      dialFunc
	transport *http.Transport
	rp        *httputil.ReverseProxy
}

const pathPrefix = "/_ts/"

type targetKey struct{}

// prefixKey holds "/_ts/<secret>/<scheme>/<host:port>" for media requests.
type prefixKey struct{}

// rewriteRedirect keeps a media player inside the proxy when the server
// redirects to its own origin: such a Location gets the routed prefix back.
func rewriteRedirect(resp *http.Response) error {
	ctx := resp.Request.Context()
	prefix, _ := ctx.Value(prefixKey{}).(string)
	target, _ := ctx.Value(targetKey{}).(*url.URL)
	loc := resp.Header.Get("Location")
	if prefix == "" || target == nil || loc == "" {
		return nil
	}
	u, err := url.Parse(loc)
	if err != nil {
		return nil
	}
	switch {
	case u.IsAbs():
		if u.Scheme != target.Scheme || withDefaultPort(u.Host, u.Scheme) != target.Host {
			return nil // somewhere else: leave it alone
		}
		rel := u.EscapedPath()
		if u.RawQuery != "" {
			rel += "?" + u.RawQuery
		}
		resp.Header.Set("Location", prefix+rel)
	case strings.HasPrefix(loc, "/") && !strings.HasPrefix(loc, "//"):
		resp.Header.Set("Location", prefix+loc)
	}
	return nil
}

func newTailnetProxy(secret string, dial dialFunc) *tailnetProxy {
	p := &tailnetProxy{secret: secret, dial: dial}
	p.transport = &http.Transport{
		DialContext:           dial,
		ForceAttemptHTTP2:     false,
		MaxIdleConns:          32,
		MaxIdleConnsPerHost:   8,
		IdleConnTimeout:       90 * time.Second,
		TLSHandshakeTimeout:   20 * time.Second,
		ResponseHeaderTimeout: 0, // long polls and streams
		Proxy:                 nil,
	}
	p.rp = &httputil.ReverseProxy{
		Rewrite: func(pr *httputil.ProxyRequest) {
			target := pr.In.Context().Value(targetKey{}).(*url.URL)
			pr.Out.URL.Scheme = target.Scheme
			pr.Out.URL.Host = target.Host
			pr.Out.Host = hostHeader(target)
			pr.Out.RequestURI = ""
		},
		Transport:      p.transport,
		ModifyResponse: rewriteRedirect,
		FlushInterval:  -1, // audio streams and server-sent events flush at once
		ErrorHandler: func(w http.ResponseWriter, r *http.Request, err error) {
			logf("proxy: %s %s: %v", r.Method, redactHost(r), err)
			w.WriteHeader(http.StatusBadGateway)
		},
	}
	return p
}

func (p *tailnetProxy) closeIdle() { p.transport.CloseIdleConnections() }

func (p *tailnetProxy) authorized(r *http.Request) bool {
	h := r.Header.Get("Proxy-Authorization")
	const prefix = "Basic "
	if !strings.HasPrefix(h, prefix) {
		return false
	}
	raw, err := base64.StdEncoding.DecodeString(strings.TrimPrefix(h, prefix))
	if err != nil {
		return false
	}
	_, pass, ok := strings.Cut(string(raw), ":")
	return ok && subtle.ConstantTimeCompare([]byte(pass), []byte(p.secret)) == 1
}

func (p *tailnetProxy) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	switch {
	case r.Method == http.MethodConnect:
		if !p.authorized(r) {
			proxyAuthRequired(w)
			return
		}
		p.tunnel(w, r)
	case r.URL.IsAbs() && r.URL.Host != "":
		if !p.authorized(r) {
			proxyAuthRequired(w)
			return
		}
		scheme := r.URL.Scheme
		if scheme != "http" && scheme != "https" {
			http.Error(w, "unsupported scheme", http.StatusBadRequest)
			return
		}
		target := &url.URL{Scheme: scheme, Host: withDefaultPort(r.URL.Host, scheme)}
		r.URL.Scheme, r.URL.Host = "", ""
		p.rp.ServeHTTP(w, r.WithContext(context.WithValue(r.Context(), targetKey{}, target)))
	case strings.HasPrefix(r.URL.Path, pathPrefix):
		escaped := r.URL.EscapedPath()
		target, rest, ok := parseRoutedPath(escaped, p.secret)
		if !ok {
			http.NotFound(w, r)
			return
		}
		// Keep the path exactly as sent (%2F stays %2F).
		path, err := url.PathUnescape(rest)
		if err != nil {
			http.NotFound(w, r)
			return
		}
		r.URL.Path, r.URL.RawPath = path, rest
		prefix := strings.TrimSuffix(escaped, rest)
		ctx := context.WithValue(r.Context(), targetKey{}, target)
		ctx = context.WithValue(ctx, prefixKey{}, prefix)
		p.rp.ServeHTTP(w, r.WithContext(ctx))
	default:
		http.NotFound(w, r)
	}
}

// parseRoutedPath splits the escaped path
// "/_ts/<secret>/<scheme>/<host:port>/<rest>" into the target origin and the
// still-escaped "/<rest>".
func parseRoutedPath(path, secret string) (*url.URL, string, bool) {
	parts := strings.SplitN(strings.TrimPrefix(path, pathPrefix), "/", 4)
	if len(parts) < 3 {
		return nil, "", false
	}
	if subtle.ConstantTimeCompare([]byte(parts[0]), []byte(secret)) != 1 {
		return nil, "", false
	}
	scheme := parts[1]
	host, err := url.PathUnescape(parts[2]) // "[fd7a::1]" may arrive as %5B...%5D
	if err != nil || (scheme != "http" && scheme != "https") || host == "" {
		return nil, "", false
	}
	rest := "/"
	if len(parts) == 4 {
		rest += parts[3]
	}
	return &url.URL{Scheme: scheme, Host: host}, rest, true
}

// withDefaultPort fills in the scheme's port when hostport has none or port
// 0: Dart's WebSocket sends "http://host:0/..." to a proxy for URLs without
// a port.
func withDefaultPort(hostport, scheme string) string {
	host, port, err := net.SplitHostPort(hostport)
	if err != nil {
		host, port = strings.Trim(hostport, "[]"), ""
	}
	if port == "" || port == "0" {
		port = "80"
		if scheme == "https" {
			port = "443"
		}
	}
	return net.JoinHostPort(host, port)
}

// hostHeader is the target's host with the scheme's default port left out,
// as a browser would send it (virtual hosts and `tailscale serve` match it).
func hostHeader(target *url.URL) string {
	host, port, err := net.SplitHostPort(target.Host)
	if err != nil {
		return target.Host
	}
	if (target.Scheme == "http" && port == "80") || (target.Scheme == "https" && port == "443") {
		if strings.Contains(host, ":") {
			return "[" + host + "]"
		}
		return host
	}
	return target.Host
}

func proxyAuthRequired(w http.ResponseWriter) {
	w.Header().Set("Proxy-Authenticate", `Basic realm="absorb"`)
	w.WriteHeader(http.StatusProxyAuthRequired)
}

func (p *tailnetProxy) tunnel(w http.ResponseWriter, r *http.Request) {
	ctx, cancel := context.WithTimeout(r.Context(), 30*time.Second)
	defer cancel()
	upstream, err := p.dial(ctx, "tcp", withDefaultPort(r.Host, "https"))
	if err != nil {
		logf("proxy: CONNECT %s: %v", redactHost(r), err)
		http.Error(w, "tailnet dial failed", http.StatusBadGateway)
		return
	}
	hj, ok := w.(http.Hijacker)
	if !ok {
		upstream.Close()
		http.Error(w, "hijack unsupported", http.StatusInternalServerError)
		return
	}
	client, buf, err := hj.Hijack()
	if err != nil {
		upstream.Close()
		return
	}
	if _, err := client.Write([]byte("HTTP/1.1 200 Connection Established\r\n\r\n")); err != nil {
		client.Close()
		upstream.Close()
		return
	}
	splice(client, buf, upstream)
}

// splice copies both ways until either side closes.
func splice(client net.Conn, buf *bufio.ReadWriter, upstream net.Conn) {
	var once sync.Once
	closeBoth := func() {
		once.Do(func() {
			client.Close()
			upstream.Close()
		})
	}
	go func() {
		// Bytes the server already buffered past the CONNECT line.
		if n := buf.Reader.Buffered(); n > 0 {
			b, _ := buf.Reader.Peek(n)
			if _, err := upstream.Write(b); err != nil {
				closeBoth()
				return
			}
		}
		io.Copy(upstream, client)
		closeBoth()
	}()
	io.Copy(client, upstream)
	closeBoth()
}

// redactHost keeps hostnames out of the debug ring buffer's detail: only the
// method and whether a host was present.
func redactHost(r *http.Request) string {
	if r.Host == "" {
		return "(no host)"
	}
	return "(host)"
}

var errNotRunning = errors.New("tailscale is not connected")

// Copyright (c) Absorb Plus contributors.

package main

import (
	"context"
	"encoding/base64"
	"errors"
	"net"
	"net/http"
	"net/http/httptest"
	"net/url"
	"testing"
)

const testSecret = "0123456789abcdef0123456789abcdef"

func TestParseRoutedPath(t *testing.T) {
	cases := []struct {
		path, wantTarget, wantRest string
		ok                         bool
	}{
		{"/_ts/" + testSecret + "/http/100.64.0.1:80/api/items/x?y", "http://100.64.0.1:80", "/api/items/x?y", true},
		{"/_ts/" + testSecret + "/https/nas.tail.ts.net:443", "https://nas.tail.ts.net:443", "/", true},
		{"/_ts/wrong/http/100.64.0.1:80/ping", "", "", false},
		{"/_ts/" + testSecret + "/ftp/host:21/x", "", "", false},
		{"/_ts/" + testSecret + "/http", "", "", false},
	}
	for _, c := range cases {
		target, rest, ok := parseRoutedPath(c.path, testSecret)
		if ok != c.ok {
			t.Errorf("%s: ok=%v, want %v", c.path, ok, c.ok)
			continue
		}
		if ok && (target.String() != c.wantTarget || rest != c.wantRest) {
			t.Errorf("%s: got %s %s", c.path, target, rest)
		}
	}
}

func TestWithDefaultPortAndHostHeader(t *testing.T) {
	if got := withDefaultPort("100.64.0.1:0", "http"); got != "100.64.0.1:80" {
		t.Errorf("port 0: %s", got)
	}
	if got := withDefaultPort("nas.ts.net", "https"); got != "nas.ts.net:443" {
		t.Errorf("no port: %s", got)
	}
	if got := withDefaultPort("[fd7a:115c:a1e0::1]:13378", "http"); got != "[fd7a:115c:a1e0::1]:13378" {
		t.Errorf("v6: %s", got)
	}
	if got := hostHeader(&url.URL{Scheme: "https", Host: "nas.ts.net:443"}); got != "nas.ts.net" {
		t.Errorf("host header: %s", got)
	}
	if got := hostHeader(&url.URL{Scheme: "http", Host: "100.64.0.1:13378"}); got != "100.64.0.1:13378" {
		t.Errorf("host header keeps other ports: %s", got)
	}
}

func TestProxyRequiresSecret(t *testing.T) {
	dialed := false
	p := newTailnetProxy(testSecret, func(ctx context.Context, network, address string) (net.Conn, error) {
		dialed = true
		return nil, errors.New("no tailnet in unit tests")
	})
	srv := httptest.NewServer(p)
	defer srv.Close()

	// Absolute-form without credentials: 407, nothing dialed.
	proxyURL, _ := url.Parse(srv.URL)
	client := &http.Client{Transport: &http.Transport{Proxy: http.ProxyURL(proxyURL)}}
	res, err := client.Get("http://100.64.0.1/ping")
	if err != nil {
		t.Fatal(err)
	}
	res.Body.Close()
	if res.StatusCode != http.StatusProxyAuthRequired || dialed {
		t.Fatalf("no auth: status %d dialed %v", res.StatusCode, dialed)
	}

	// With the secret it reaches the dialer (which fails here: 502).
	proxyURL.User = url.UserPassword("absorb", testSecret)
	client = &http.Client{Transport: &http.Transport{Proxy: http.ProxyURL(proxyURL)}}
	res, err = client.Get("http://100.64.0.1/ping")
	if err != nil {
		t.Fatal(err)
	}
	res.Body.Close()
	if res.StatusCode != http.StatusBadGateway || !dialed {
		t.Fatalf("auth: status %d dialed %v", res.StatusCode, dialed)
	}

	// Origin-form without the routed prefix: 404.
	res, err = http.Get(srv.URL + "/ping")
	if err != nil {
		t.Fatal(err)
	}
	res.Body.Close()
	if res.StatusCode != http.StatusNotFound {
		t.Fatalf("plain path: %d", res.StatusCode)
	}
}

func TestRoutedPathKeepsEncodingAndRewritesRedirects(t *testing.T) {
	var gotPath, gotHost string
	backend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		gotPath, gotHost = r.URL.EscapedPath(), r.Host
		switch r.URL.Path {
		case "/old":
			http.Redirect(w, r, "/new?x=1", http.StatusFound)
		case "/abs":
			http.Redirect(w, r, "http://"+r.Host+"/elsewhere", http.StatusFound)
		case "/away":
			http.Redirect(w, r, "https://example.com/x", http.StatusFound)
		}
	}))
	defer backend.Close()
	bu, _ := url.Parse(backend.URL)
	p := newTailnetProxy(testSecret, func(ctx context.Context, network, address string) (net.Conn, error) {
		return (&net.Dialer{}).DialContext(ctx, network, bu.Host)
	})
	srv := httptest.NewServer(p)
	defer srv.Close()
	noRedirect := &http.Client{CheckRedirect: func(*http.Request, []*http.Request) error { return http.ErrUseLastResponse }}
	prefix := "/_ts/" + testSecret + "/http/%5Bfd7a:115c:a1e0::9%5D:80"

	res, err := noRedirect.Get(srv.URL + prefix + "/api/items/a%2Fb/file?token=x")
	if err != nil {
		t.Fatal(err)
	}
	res.Body.Close()
	if gotPath != "/api/items/a%2Fb/file" || gotHost != "[fd7a:115c:a1e0::9]" {
		t.Fatalf("path %q host %q", gotPath, gotHost)
	}

	for path, want := range map[string]string{
		"/old":  prefix + "/new?x=1",
		"/abs":  prefix + "/elsewhere",
		"/away": "https://example.com/x",
	} {
		res, err := noRedirect.Get(srv.URL + prefix + path)
		if err != nil {
			t.Fatal(err)
		}
		res.Body.Close()
		if got := res.Header.Get("Location"); got != want {
			t.Errorf("%s: Location %q, want %q", path, got, want)
		}
	}
}

func TestAuthorizedHeader(t *testing.T) {
	p := newTailnetProxy(testSecret, nil)
	r := httptest.NewRequest("CONNECT", "http://x/", nil)
	r.Header.Set("Proxy-Authorization", "Basic "+base64.StdEncoding.EncodeToString([]byte("absorb:"+testSecret)))
	if !p.authorized(r) {
		t.Fatal("right secret rejected")
	}
	r.Header.Set("Proxy-Authorization", "Basic "+base64.StdEncoding.EncodeToString([]byte("absorb:nope")))
	if p.authorized(r) {
		t.Fatal("wrong secret accepted")
	}
}

func TestRedactLoginURL(t *testing.T) {
	got := redactLoginURL("To authenticate, visit: https://login.tailscale.com/a/abc123 now")
	if got != "To authenticate, visit: <login URL> now" {
		t.Fatal(got)
	}
}

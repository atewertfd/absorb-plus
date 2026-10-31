// Copyright (c) Absorb Plus contributors.

package main

import (
	"fmt"
	"sync"
	"time"
)

// logRing keeps the last couple of thousand tsnet log lines in memory only. Nothing
// is written to disk by this module or uploaded anywhere.
type logRing struct {
	mu    sync.Mutex
	lines []string
	next  int
	full  bool
}

const ringSize = 2000

var ring = &logRing{lines: make([]string, ringSize)}

func (r *logRing) add(s string) {
	r.mu.Lock()
	defer r.mu.Unlock()
	r.lines[r.next] = s
	r.next = (r.next + 1) % ringSize
	if r.next == 0 {
		r.full = true
	}
}

func (r *logRing) snapshot() []string {
	r.mu.Lock()
	defer r.mu.Unlock()
	if !r.full {
		return append([]string(nil), r.lines[:r.next]...)
	}
	out := make([]string, 0, ringSize)
	out = append(out, r.lines[r.next:]...)
	return append(out, r.lines[:r.next]...)
}

func logf(format string, a ...any) {
	ring.add(time.Now().Format("15:04:05.000 ") + redactLoginURL(fmt.Sprintf(format, a...)))
}

// userLogf receives tsnet's user-facing lines (such as "To start this tsnet
// server, ... go to: <login URL>"). Login URLs reach Dart through the status
// JSON instead; logf redacts them here.
func userLogf(format string, a ...any) {
	logf("[user] "+format, a...)
}

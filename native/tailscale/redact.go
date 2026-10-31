// Copyright (c) Absorb Plus contributors.

package main

import "regexp"

var loginURLPattern = regexp.MustCompile(`https?://\S+/a/\S+`)

// redactLoginURL hides one-time login links in log lines.
func redactLoginURL(s string) string {
	return loginURLPattern.ReplaceAllString(s, "<login URL>")
}

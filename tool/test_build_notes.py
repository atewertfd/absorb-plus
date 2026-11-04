"""Patch notes for an "Absorb Plus Test" build (tool/dev.ps1 apk -Local).

Turns the commit subjects since the previous test build into short
plain-English lines and writes them as JSON for the app to bundle
(assets/test_build/notes.json, git-ignored) and, optionally, as the
test-channel release body.

  python tool/test_build_notes.py --version 1.12.1+356 --since <sha> \
      --out assets/test_build/notes.json --release-notes build/notes.md \
      --commit <sha>

Without --since (or when that commit isn't an ancestor of HEAD), the last
15 commits are used. Run tests: python -m unittest discover -s tool/tests
"""

from __future__ import annotations

import argparse
import datetime as _dt
import json
import re
import subprocess
import sys
from pathlib import Path

FALLBACK_COMMITS = 15

# Conventional-commit types that describe app changes a tester notices.
_KEEP_TYPES = {"feat", "fix", "perf"}
# Scopes that are development tooling, not the app.
_SKIP_SCOPES = {"tool", "tools", "ci", "build", "dev", "hooks", "lint", "test", "tests", "docs"}

_CONVENTIONAL = re.compile(r"^(?P<type>[a-zA-Z]+)(?:\((?P<scope>[^)]*)\))?!?:\s*(?P<text>.+)$")
# Unprefixed subjects (upstream's style) that are bookkeeping, not changes.
_SKIP_PLAIN = re.compile(r"^(merge|bump|revert|wip\b|version\b|update version)", re.IGNORECASE)


def subject_to_note(subject: str) -> str | None:
    """One patch-note line for a commit subject, or None to leave it out."""
    subject = subject.strip()
    if not subject:
        return None
    match = _CONVENTIONAL.match(subject)
    if match:
        if match.group("type").lower() not in _KEEP_TYPES:
            return None
        scopes = {s.strip().lower() for s in (match.group("scope") or "").split(",")}
        if scopes & _SKIP_SCOPES:
            return None
        text = match.group("text").strip()
    else:
        if _SKIP_PLAIN.match(subject):
            return None
        text = subject
    text = text.rstrip(". ").strip()
    if not text:
        return None
    return text[0].upper() + text[1:]


def notes_from_subjects(subjects: list[str]) -> list[str]:
    """Patch-note lines in the given order, without repeats."""
    notes: list[str] = []
    seen: set[str] = set()
    for subject in subjects:
        note = subject_to_note(subject)
        if note is None:
            continue
        key = note.casefold()
        if key in seen:
            continue
        seen.add(key)
        notes.append(note)
    return notes


def split_version(full: str) -> tuple[str, int]:
    match = re.fullmatch(r"(\d+\.\d+\.\d+)\+(\d+)", full.strip())
    if not match:
        raise ValueError(f"Unexpected version: {full}")
    return match.group(1), int(match.group(2))


def notes_json(version: str, build: int, date: str, notes: list[str]) -> dict:
    return {"version": version, "build": build, "date": date, "notes": notes}


def release_body(version: str, build: int, commit: str, notes: list[str]) -> str:
    """The test-channel release body: the version line, then the bullets."""
    short = commit[:8]
    lines = [
        f"Test build {version}+{build} (commit {short}). Not a release: "
        "install it from Developer > Test channel in the Absorb Plus Test app.",
        "",
    ]
    lines += [f"- {n}" for n in notes] if notes else ["- Small fixes and internal changes"]
    return "\n".join(lines) + "\n"


def _git(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run(
        ["git", "-c", "i18n.logOutputEncoding=UTF-8", *args],
        capture_output=True,
        check=False,
    )


def commit_subjects(since: str | None) -> list[str]:
    """Subjects of the commits since [since] (newest first), or of the last
    FALLBACK_COMMITS when [since] is missing or not an ancestor of HEAD."""
    if since and _git("merge-base", "--is-ancestor", since, "HEAD").returncode == 0:
        args = ["log", "--no-merges", "--format=%s", f"{since}..HEAD"]
    else:
        args = ["log", "--no-merges", "--format=%s", "-n", str(FALLBACK_COMMITS), "HEAD"]
    result = _git(*args)
    if result.returncode != 0:
        raise RuntimeError(result.stderr.decode("utf-8", "replace").strip())
    return result.stdout.decode("utf-8", "replace").splitlines()


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--version", required=True, help="pubspec version, e.g. 1.12.1+356")
    parser.add_argument("--since", default="", help="commit of the previous test build")
    parser.add_argument("--out", required=True, help="notes JSON to write")
    parser.add_argument("--release-notes", default="", help="release body (Markdown) to write")
    parser.add_argument("--commit", default="", help="commit being built (for the release body)")
    parser.add_argument("--date", default="", help="build date (default: today)")
    args = parser.parse_args(argv)

    version, build = split_version(args.version)
    notes = notes_from_subjects(commit_subjects(args.since.strip() or None))
    date = args.date or _dt.date.today().isoformat()
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(
        json.dumps(notes_json(version, build, date, notes), ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    if args.release_notes:
        body = Path(args.release_notes)
        body.parent.mkdir(parents=True, exist_ok=True)
        body.write_text(release_body(version, build, args.commit, notes), encoding="utf-8")
    print(f"test build notes: {len(notes)} line(s) for build {build}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

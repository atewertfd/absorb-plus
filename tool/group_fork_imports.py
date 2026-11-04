#!/usr/bin/env python3
"""Gather the fork's added imports in upstream files into one block.

Each import the fork adds between upstream's imports is its own diff hunk,
and a likely merge conflict whenever upstream adds an import nearby. This
moves the fork's added single-line imports, in their current order, to one
block right after the file's last upstream import, under a marker comment.
Imports upstream has with different `show`/`hide`/`as` (a changed upstream
import, like `dart:io hide Platform`) stay where they are, as do multi-line
imports. Import order has no meaning in Dart, so behavior can't change.

Usage:
  python tool/group_fork_imports.py FILE...      rewrite these files
  python tool/group_fork_imports.py --all        every upstream file under
                                                 lib/ the fork changed
  add --dry to only report what would move.
Needs origin/main (upstream). Files upstream doesn't have are skipped.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MARKER = "// Absorb Plus imports, kept in one block for clean upstream merges."
IMPORT = re.compile(r"^import\s+(['\"])([^'\"]+)\1[^;\n]*;[^\n]*$")


def git(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run(["git", "-C", str(ROOT), *args], capture_output=True, text=True,
                          encoding="utf-8", errors="replace")


def _uri(line: str) -> str | None:
    m = IMPORT.match(line.strip())
    return m.group(2) if m else None


def _norm(line: str) -> str:
    """An import without its trailing comment and extra spaces."""
    code = line.split("//")[0] if not line.strip().startswith("//") else line
    return re.sub(r"\s+", " ", code).strip()


def group(text: str, upstream_text: str) -> tuple[str, list[str]]:
    """Returns (new text, moved import lines)."""
    lines = text.split("\n")
    up_norm = {_norm(l) for l in upstream_text.split("\n") if _uri(l)}
    up_uris = {_uri(l) for l in upstream_text.split("\n") if _uri(l)}
    fork_idx = [i for i, l in enumerate(lines)
                if _uri(l) and _norm(l) not in up_norm and _uri(l) not in up_uris]
    if not fork_idx:
        return text, []
    # Imports already in the marked block keep their order; new ones follow.
    in_block = set()
    for i, l in enumerate(lines):
        if l.strip() == MARKER:
            j = i + 1
            while j < len(lines) and _uri(lines[j]):
                in_block.add(j)
                j += 1
    fork_idx = [i for i in fork_idx if i in in_block] + [i for i in fork_idx if i not in in_block]
    moved = [lines[i] for i in fork_idx]
    keep = [l for i, l in enumerate(lines) if i not in set(fork_idx) and l.strip() != MARKER]
    # Already one block right after the last upstream import? Nothing to do.
    last_up = max((i for i, l in enumerate(keep) if _uri(l)), default=None)
    block = [MARKER, *moved]
    if last_up is None:
        first_code = next((i for i, l in enumerate(keep)
                           if l.strip() and not l.strip().startswith("//")), 0)
        new_lines = keep[:first_code] + block + [""] + keep[first_code:]
    else:
        new_lines = keep[:last_up + 1] + block + keep[last_up + 1:]
    new_text = "\n".join(new_lines)
    # Moving can leave a blank line where a lone import used to sit between
    # blank lines; collapse runs of blank lines inside the import area only.
    head_end = new_text.find(moved[-1]) + len(moved[-1])
    head = re.sub(r"\n{3,}", "\n\n", new_text[:head_end])
    new_text = head + new_text[head_end:]
    return new_text, (moved if new_text != text else [])


def upstream_of(rel: str) -> str | None:
    r = git("show", f"origin/main:{rel}")
    return r.stdout if r.returncode == 0 else None


def changed_upstream_files() -> list[str]:
    out = git("diff", "--name-only", "origin/main", "--", "lib").stdout.split()
    return [f for f in out if f.endswith(".dart") and "/l10n/" not in f
            and git("cat-file", "-e", f"origin/main:{f}").returncode == 0]


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="Gather fork imports into one block.")
    ap.add_argument("files", nargs="*")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--dry", action="store_true")
    a = ap.parse_args(argv)
    if git("rev-parse", "--verify", "--quiet", "origin/main").returncode != 0:
        print("group_fork_imports: needs origin/main (upstream)")
        return 2
    files = changed_upstream_files() if a.all else a.files
    total = 0
    for rel in files:
        rel = Path(rel).resolve().relative_to(ROOT).as_posix() if Path(rel).is_absolute() \
            else Path(rel).as_posix()
        p = ROOT / rel
        up = upstream_of(rel) if p.is_file() else None
        if up is None:
            continue
        raw = p.read_bytes()
        crlf = b"\r\n" in raw
        text = raw.decode("utf-8").replace("\r\n", "\n")
        new, moved = group(text, up.replace("\r\n", "\n"))
        if not moved:
            continue
        total += 1
        print(f"{rel}: {len(moved)} fork import(s) grouped")
        if not a.dry:
            p.write_bytes((new.replace("\n", "\r\n") if crlf else new).encode("utf-8"))
    print(f"{'would change' if a.dry else 'changed'} {total} file(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

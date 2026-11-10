"""Upstream fixes that touch code the fork changed (IMP-006).

The fork rewrites some upstream functions. When upstream later fixes the same
function, a merge either conflicts on that hunk or keeps the fork's version,
and the fix can be lost (BUG-007: upstream 4e0c6865 fixed `pushActive`, the
fork's rewrite still had the crash). This lists every upstream fix/bug/crash
commit not merged yet that touches a Dart member the fork also changed, so
each one gets a look by hand.

  python tool/upstream_fix_check.py [--ref origin/main]

Run tests: python -m unittest discover -s tool/tests
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tool"))
import code_map  # noqa: E402

FIX_PATTERN = "fix|bug|crash"


def git(*args: str) -> str:
    return subprocess.run(["git", "-C", str(ROOT), *args], capture_output=True, text=True,
                          encoding="utf-8", errors="replace").stdout


def added_lines(diff: str) -> set[int]:
    """Line numbers on the new side of a `git diff -U0` output."""
    out: set[int] = set()
    for m in re.finditer(r"^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@", diff, re.M):
        start, count = int(m.group(1)), int(m.group(2) or 1)
        out.update(range(start, start + count) if count else {max(start, 1)})
    return out


def members_touching(src: str, lines: set[int]) -> set[str]:
    """`Container.member` (or top-level name) for every member holding a line."""
    containers, top = code_map.parse(src)
    names: set[str] = set()
    for c in containers:
        for m in c.members:
            if any(m.start <= n <= m.end for n in lines):
                names.add(f"{c.name}.{m.name}")
    for m in top:
        if any(m.start <= n <= m.end for n in lines):
            names.add(m.name)
    return names


def fork_members(base: str, path: str) -> set[str]:
    src = git("show", f"HEAD:{path}")
    if not src:
        return set()
    return members_touching(src, added_lines(git("diff", "-U0", "--no-color", base, "HEAD", "--", path)))


def report(ref: str) -> list[tuple[str, str, str, list[str]]]:
    base = git("merge-base", "HEAD", ref).strip()
    if not base:
        return []
    fork_files = set(git("diff", "--name-only", base, "HEAD", "--", "lib").split())
    cache: dict[str, set[str]] = {}
    hits = []
    log = git("log", "--format=%H%x09%s", "-i", "-E", f"--grep={FIX_PATTERN}", f"{base}..{ref}", "--", "lib")
    for row in log.splitlines():
        sha, _, subject = row.partition("\t")
        for path in git("show", "--name-only", "--format=", sha).split():
            if not path.endswith(".dart") or path not in fork_files:
                continue
            src = git("show", f"{sha}:{path}")
            if not src:
                continue
            touched = members_touching(src, added_lines(git("show", "-U0", "--no-color", "--format=", sha, "--", path)))
            if path not in cache:
                cache[path] = fork_members(base, path)
            both = sorted(touched & cache[path])
            if both:
                hits.append((sha[:8], subject, path, both))
    return hits


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--ref", default="origin/main")
    args = parser.parse_args(argv[1:])
    hits = report(args.ref)
    if not hits:
        print("No unmerged upstream fix touches a member the fork changed.")
        return 0
    print(format_hits(hits))
    return 0


def format_hits(hits: list[tuple[str, str, str, list[str]]]) -> str:
    """One block per commit, its files and members under it."""
    out = [f"{len({h[0] for h in hits})} upstream fix commit(s) touch members the fork changed "
           "- check each by hand:"]
    last = None
    for sha, subject, path, names in hits:
        if sha != last:
            out.append(f"  {sha} {subject[:72]}")
            last = sha
        out.append(f"      {path}: {', '.join(names)}")
    return "\n".join(out)


if __name__ == "__main__":
    sys.exit(main(sys.argv))

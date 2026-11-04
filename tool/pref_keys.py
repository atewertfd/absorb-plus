#!/usr/bin/env python3
"""Where each saved setting lives: every SharedPreferences key in lib/.

Finds keys written as string literals in prefs calls (`getBool('x')`,
`setString('x', ...)`, `remove('x')`, `containsKey('x')`), calls that pass a
constant (`setBool(prefKey, ...)`, resolved through every `const name = 'x'`
in lib/), and key-like constants (`fooKey`, `prefix`). Each key is marked fork
(absent from upstream's lib/ on origin/main) or upstream. Keys built at
runtime (`'bookmarks_$id'`) show up through their constant prefix. Computed
on each run, so it can't go stale.

Usage:
  python tool/pref_keys.py            fork keys, with the files using them
  python tool/pref_keys.py --all      upstream keys too
  python tool/pref_keys.py --grep X   keys or files containing X
  python tool/pref_keys.py --check    exit 1 if a fork key that isn't listed
                                      in tool/pref_keys_existing.txt breaks
                                      the naming rule

Naming rule for NEW fork keys: snake_case with a `fork_` prefix, declared
once as a constant in the service that owns it. Existing keys keep their
names: renaming one would lose what users have saved.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
_TYPES = r"(?:String|Bool|Int|Double|StringList)"
CALL = re.compile(r"\b(?:get|set)" + _TYPES + r"?\(\s*'([^'$]+)'"
                  r"|\b(?:remove|containsKey)\(\s*'([^'$]+)'")
# A prefs call whose key is a constant: setBool(prefKey, ...), getString(X.k).
CALL_IDENT = re.compile(r"\b(?:get|set)" + _TYPES + r"\(\s*((?:[A-Za-z_]\w*\.)*)([A-Za-z_]\w*)\s*[,)]"
                        r"|\b(?:remove|containsKey)\(\s*((?:[A-Za-z_]\w*\.)*)([A-Za-z_]\w*)\s*\)")
CONST = re.compile(r"\b(?:static\s+)?const\s+(?:String\s+)?(\w*(?:[kK]ey|[pP]refix)\w*)\s*=\s*"
                   r"'([^'$]+)'")
ANY_CONST = re.compile(r"\bconst\s+(?:String\s+)?([A-Za-z_]\w*)\s*=\s*'([^'$]+)'")
GOOD_NEW_KEY = re.compile(r"^fork_[a-z0-9]+(?:_[a-z0-9]+)*_?$")
EXISTING_FILE = ROOT / "tool" / "pref_keys_existing.txt"


CLASS = re.compile(r"\b(?:class|enum|mixin|extension)\s+([A-Za-z_]\w*)")


def scan(text: str, by_class: dict[str, dict[str, str]] | None = None) -> set[str]:
    """Keys used in [text].

    A bare constant name (`key`, `cacheKey`) is this file's own constant. A
    qualified one (`Owner.prefsKey`) is looked up among the constants of the
    file that declares `Owner`, via [by_class] (class name -> that file's
    constants); without it only this file's constants are used.
    """
    keys = {m.group(1) or m.group(2) for m in CALL.finditer(text)}
    keys |= {m.group(2) for m in CONST.finditer(text)}
    local = {m.group(1): m.group(2) for m in ANY_CONST.finditer(text)}
    for m in CALL_IDENT.finditer(text):
        qualifier = (m.group(1) or m.group(3) or "").rstrip(".").split(".")[-1]
        name = m.group(2) or m.group(4)
        owner = (by_class or {}).get(qualifier) if qualifier else None
        value = (owner or local).get(name)
        if value is not None:
            keys.add(value)
    return {k for k in keys if re.fullmatch(r"[A-Za-z0-9_.:-]+", k)}


def upstream_text() -> str | None:
    """All of upstream's lib/*.dart (no l10n) as one text, or None without
    origin/main."""
    try:
        files = subprocess.run(["git", "-C", str(ROOT), "ls-tree", "-r", "--name-only",
                                "origin/main", "lib"], capture_output=True, text=True,
                               check=True).stdout.split()
    except (OSError, subprocess.CalledProcessError):
        return None
    out = []
    for f in files:
        if f.endswith(".dart") and "/l10n/" not in f:
            out.append(subprocess.run(["git", "-C", str(ROOT), "show", f"origin/main:{f}"],
                                      capture_output=True, text=True, encoding="utf-8",
                                      errors="replace").stdout)
    return "\n".join(out)


def collect(root: Path = ROOT) -> dict[str, list[str]]:
    files = [p for p in sorted((root / "lib").rglob("*.dart")) if "l10n" not in p.parts]
    texts = {p: p.read_text(encoding="utf-8", errors="replace") for p in files}
    by_class: dict[str, dict[str, str]] = {}
    for text in texts.values():
        consts = {m.group(1): m.group(2) for m in ANY_CONST.finditer(text)}
        for m in CLASS.finditer(text):
            by_class.setdefault(m.group(1), consts)
    where: dict[str, list[str]] = defaultdict(list)
    for p, text in texts.items():
        rel = p.relative_to(root).as_posix()
        for key in scan(text, by_class):
            where[key].append(rel)
    return dict(where)


def bad_new_keys(fork_keys: set[str], existing: set[str]) -> list[str]:
    return sorted(k for k in fork_keys - existing if not GOOD_NEW_KEY.match(k))


def read_existing(path: Path = EXISTING_FILE) -> set[str]:
    if not path.exists():
        return set()
    return {l.strip() for l in path.read_text(encoding="utf-8").splitlines()
            if l.strip() and not l.lstrip().startswith("#")}


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="SharedPreferences keys in lib/ (see docstring).")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--grep", default="")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args(argv)
    where = collect()
    up = upstream_text()
    up_keys = scan(up) if up is not None else set()
    fork_keys = set(where) - up_keys
    if a.check:
        if up is None:
            print("pref_keys: no origin/main; skipping the check")
            return 0
        bad = bad_new_keys(fork_keys, read_existing())
        for k in bad:
            print(f"  {k}  ({', '.join(where[k])}): new fork keys are fork_snake_case")
        print(f"{'FAIL' if bad else 'OK'}: {len(fork_keys)} fork key(s), {len(bad)} badly named")
        return 1 if bad else 0
    g = a.grep.lower()
    rows = []
    for key in sorted(where, key=str.lower):
        owner = "upstream" if key in up_keys else "fork"
        if owner == "upstream" and not a.all:
            continue
        files = where[key]
        if g and g not in key.lower() and not any(g in f.lower() for f in files):
            continue
        rows.append(f"{owner:8} {key:42} {', '.join(f.removeprefix('lib/') for f in files)}")
    if up is None:
        rows.insert(0, "(no origin/main: every key is listed as fork)")
    print("\n".join(rows) if rows else "no matching keys")
    return 0


if __name__ == "__main__":
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    sys.exit(main(sys.argv[1:]))

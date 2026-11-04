#!/usr/bin/env python3
"""Always-current outline of Dart files: what is where, without reading them.

Lists every class and its members (methods, getters, setters, fields,
constructors) with exact line ranges, the first line of each doc comment,
the file's own "// ── Section ──" headings, and which members the fork has
changed compared with upstream (origin/main). Nothing is cached, so the map
can't go stale; read only the line range you need afterwards.

Usage:
  python tool/code_map.py FILE [FILE...]    outline of these files
      --grep TEXT                           only members whose name, doc or
                                            section contains TEXT
      --fork                                only members the fork changed
      --min N                               only members of N+ lines
  python tool/code_map.py --find NAME       where NAME is declared, across lib/
  python tool/code_map.py --big [N]         one summary line per lib/ file of
                                            N+ lines (default 1500)

No dependencies beyond Python 3.9. Fork markers need git and origin/main;
without them they are left out.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

# "// ─── Title ───", "// -- Title --", "// == Title ==", "// ═══ Title"
SECTION_RE = re.compile(r"^\s*//\s*(?:[─━═—]+|-{2,}|={2,})\s*(.*?)\s*(?:[─━═—]+|-{2,}|={2,})?\s*$")
CONTAINER_RE = re.compile(
    r"^(?:(?:abstract|final|base|sealed|interface|mixin|macro)\s+)*"
    r"(class|mixin|extension\s+type|extension|enum)\b\s*([A-Za-z_$][\w$]*)?")
SKIP_RE = re.compile(r"^(?:import|export|part|library)\b")
IDENT = r"[A-Za-z_$][\w$]*"


@dataclass
class Member:
    kind: str          # ctor, method, get, set, field, op, func, var
    name: str
    start: int         # 1-based, first line of the declaration (after doc comment)
    end: int
    doc: str = ""
    section: str = ""
    landmarks: list = field(default_factory=list)  # (line, title) inside the body
    fork_lines: int = 0

    @property
    def size(self) -> int:
        return self.end - self.start + 1


@dataclass
class Container:
    kind: str
    name: str
    start: int
    end: int
    doc: str = ""
    members: list = field(default_factory=list)
    fork_lines: int = 0


# --------------------------------------------------------------------------
# Pass 1: blank out comments and string contents (keeping newlines and
# interpolation code), so braces only count where they are real code.
# --------------------------------------------------------------------------

def blank(src: str) -> str:
    out = list(src)
    n = len(src)
    i = 0
    # Stack of string contexts we are inside: (quote, raw). Interpolation
    # "${" pushes None; its matching "}" pops back into the string.
    stack: list = []
    brace_depth_in_interp: list = []

    def wipe(a: int, b: int) -> None:
        for k in range(a, min(b, n)):
            if out[k] != "\n":
                out[k] = " "

    while i < n:
        c = src[i]
        in_string = bool(stack) and stack[-1] is not None
        if in_string:
            quote, raw = stack[-1]
            if not raw and c == "\\":
                wipe(i, i + 2)
                i += 2
                continue
            if src.startswith(quote, i):
                wipe(i, i + len(quote))
                stack.pop()
                i += len(quote)
                continue
            if not raw and src.startswith("${", i):
                wipe(i, i + 2)
                stack.append(None)
                brace_depth_in_interp.append(0)
                i += 2
                continue
            if c != "\n":
                out[i] = " "
            i += 1
            continue
        # code (top level or inside an interpolation)
        if src.startswith("//", i):
            j = src.find("\n", i)
            j = n if j < 0 else j
            wipe(i, j)
            i = j
            continue
        if src.startswith("/*", i):
            depth, j = 1, i + 2
            while j < n and depth:
                if src.startswith("/*", j):
                    depth, j = depth + 1, j + 2
                elif src.startswith("*/", j):
                    depth, j = depth - 1, j + 2
                else:
                    j += 1
            wipe(i, j)
            i = j
            continue
        m = re.match(r"(r?)('''|\"\"\"|'|\")", src[i:i + 4])
        if m and (i == 0 or not (src[i - 1].isalnum() or src[i - 1] == "_") or not m.group(1)):
            raw = bool(m.group(1))
            quote = m.group(2)
            wipe(i, i + len(m.group(0)))
            stack.append((quote, raw))
            i += len(m.group(0))
            continue
        if stack and stack[-1] is None:  # inside ${ ... }
            if c == "{":
                brace_depth_in_interp[-1] += 1
            elif c == "}":
                if brace_depth_in_interp[-1] == 0:
                    out[i] = " "
                    stack.pop()
                    brace_depth_in_interp.pop()
                    i += 1
                    continue
                brace_depth_in_interp[-1] -= 1
        i += 1
    return "".join(out)


# --------------------------------------------------------------------------
# Pass 2: declarations at file level and class-body level.
# --------------------------------------------------------------------------

class _Lines:
    def __init__(self, src: str):
        self.starts = [0]
        for k, ch in enumerate(src):
            if ch == "\n":
                self.starts.append(k + 1)

    def line(self, offset: int) -> int:
        lo, hi = 0, len(self.starts) - 1
        while lo < hi:
            mid = (lo + hi + 1) // 2
            if self.starts[mid] <= offset:
                lo = mid
            else:
                hi = mid - 1
        return lo + 1


def _strip_annotations(header: str) -> str:
    h = header.strip()
    while h.startswith("@"):
        m = re.match(r"@[\w$.]+", h)
        if not m:
            break
        k = m.end()
        if k < len(h) and h[k] == "(":
            depth = 0
            while k < len(h):
                if h[k] == "(":
                    depth += 1
                elif h[k] == ")":
                    depth -= 1
                    if depth == 0:
                        k += 1
                        break
                k += 1
        h = h[k:].strip()
    return h


def _top_level(header: str, stop: str) -> int:
    """Index of the first char of `stop` outside ()[]<> nesting, or -1."""
    depth = 0
    for k, ch in enumerate(header):
        if depth == 0 and header.startswith(stop, k):
            return k
        if ch in "([":
            depth += 1
        elif ch in ")]":
            depth -= 1
    return -1


def classify(header: str, container: str | None) -> tuple[str, str] | None:
    h = _strip_annotations(header)
    h = re.sub(r"\s+", " ", h)
    if not h or SKIP_RE.match(h):
        return None
    op = re.match(r"[^=(]*?\boperator\s*([^\s(]+)\s*\(", h)
    if op and container:
        return "op", "operator " + op.group(1)
    paren = _top_level(h, "(")
    eq = _top_level(h, "=")
    # "void Function(int)? onTap;" is a field whose *type* has parentheses.
    fn_type = paren >= 0 and re.search(r"\bFunction\s*(?:<[^()]*>)?$", h[:paren].strip())
    if paren >= 0 and (eq < 0 or paren < eq) and not fn_type:
        before = h[:paren].strip()
        m = re.search(r"\boperator\s*(\S+)$", before)
        if m:
            return "op", "operator " + m.group(1)
        m = re.search(r"\bset\s+(" + IDENT + r")$", before)
        if m:
            return "set", m.group(1)
        m = re.search(r"(" + IDENT + r"(?:\." + IDENT + r")?)\s*(?:<[^()]*>)?$", before)
        if not m:
            return None
        name = m.group(1)
        if container and (name == container or name.startswith(container + ".")):
            return "ctor", name
        if container and re.search(r"\bfactory\b", before):
            return "ctor", name
        return ("method" if container else "func"), name
    m = re.search(r"\bget\s+(" + IDENT + r")\b", h)
    if m and (eq < 0 or m.start() < eq):
        return "get", m.group(1)
    names = h[:eq] if eq >= 0 else h.rstrip(";")
    names = re.sub(r"<[^<>]*>", "", re.sub(r"<[^<>]*>", "", names))
    names = re.sub(r"\bFunction\s*\([^()]*(?:\([^()]*\)[^()]*)*\)\??", "", names)
    ids = re.findall(IDENT, names.split(",")[0])
    if not ids:
        return None
    more = ", ..." if "," in names else ""
    return ("field" if container else "var"), ids[-1] + more


def parse(src: str) -> tuple[list, list]:
    """Returns (containers, top_level_members)."""
    code = blank(src)
    lines = _Lines(src)
    src_lines = src.split("\n")
    containers: list = []
    top: list = []

    i, n = 0, len(code)

    def skip_ws(k: int) -> int:
        while k < n and code[k] in " \t\r\n":
            k += 1
        return k

    def match_brace(k: int) -> int:  # code[k] == "{"; returns index of matching "}"
        depth = 0
        while k < n:
            if code[k] == "{":
                depth += 1
            elif code[k] == "}":
                depth -= 1
                if depth == 0:
                    return k
            k += 1
        return n - 1

    def read_decl(k: int, end_limit: int):
        """From a declaration start, return (header, body_open, decl_end).

        body_open is the index of "{" opening a block body (or class body),
        or -1 for declarations ending at ";" (fields, arrow functions, ...).
        """
        paren = 0
        expr = False  # after a top-level "=" or "=>": braces are expression
        colon_seen = False
        j = k
        while j < end_limit:
            ch = code[j]
            if ch in "([":
                paren += 1
            elif ch in ")]":
                paren -= 1
            elif paren == 0:
                if ch == ":" and not expr:
                    colon_seen = True
                elif ch == "=" and not expr and not colon_seen and code[j + 1:j + 2] != "=" \
                        and code[j - 1:j] not in ("=", "!", "<", ">"):
                    expr = True
                elif ch == "=" and code[j + 1:j + 2] == ">" and not expr:
                    expr = True
                elif ch == "{":
                    if expr:
                        j = match_brace(j)
                    else:
                        return code[k:j], j, match_brace(j)
                elif ch == ";":
                    return code[k:j], -1, j
                elif ch == "}":  # stray close (end of enclosing body)
                    return code[k:j], -1, j - 1
            j += 1
        return code[k:end_limit], -1, end_limit - 1

    def doc_for(line: int) -> str:
        k = line - 2  # 0-based index of the line above
        docs = []
        while k >= 0:
            s = src_lines[k].strip()
            if s.startswith("///"):
                docs.append(s[3:].strip())
                k -= 1
            elif s.startswith("@") and not docs:
                k -= 1
            else:
                break
        docs.reverse()
        text = " ".join(d for d in docs if d)
        text = re.split(r"(?<=[.!?])\s", text, maxsplit=1)[0] if text else ""
        return (text[:97] + "...") if len(text) > 100 else text

    def first_code_line(k: int) -> int:
        return lines.line(k)

    def sections_between(a_line: int, b_line: int) -> list:
        found = []
        for ln in range(a_line, min(b_line, len(src_lines)) + 1):
            m = SECTION_RE.match(src_lines[ln - 1])
            if m and m.group(1).strip(" ─━═—-="):
                found.append((ln, m.group(1).strip(" ─━═—-=")))
        return found

    def parse_body(open_idx: int, close_idx: int, cname: str | None, ckind: str,
                   out: list) -> None:
        k = open_idx + 1
        if ckind == "enum":
            # skip the value list (up to the first ";" at this level, if any)
            depth, j = 0, k
            while j < close_idx:
                if code[j] in "({[":
                    depth += 1
                elif code[j] in ")}]":
                    depth -= 1
                elif code[j] == ";" and depth == 0:
                    k = j + 1
                    break
                j += 1
            else:
                return
        section = ""
        last_line = lines.line(open_idx)
        while True:
            k = skip_ws(k)
            if k >= close_idx:
                break
            header, body, end = read_decl(k, close_idx)
            start_line = first_code_line(k)
            for _, title in sections_between(last_line, start_line):
                section = title
            kind_name = classify(header, cname)
            end_line = lines.line(end)
            if kind_name:
                kind, name = kind_name
                m = Member(kind, name, start_line, end_line, doc_for(start_line), section)
                if body >= 0 and end_line - start_line >= 40:
                    m.landmarks = sections_between(start_line + 1, end_line - 1)
                out.append(m)
            last_line = end_line
            k = end + 1

    while True:
        i = skip_ws(i)
        if i >= n:
            break
        header, body, end = read_decl(i, n)
        h = re.sub(r"\s+", " ", _strip_annotations(header))
        cm = CONTAINER_RE.match(h)
        start_line = lines.line(i)
        if cm and body >= 0:
            kind = cm.group(1).split()[0]
            name = cm.group(2) or "(unnamed)"
            if kind == "extension" and " on " in h and not cm.group(2):
                name = "on " + h.split(" on ", 1)[1].split("{")[0].strip()
            c = Container(kind, name, start_line, lines.line(end), doc_for(start_line))
            parse_body(body, end, name if kind in ("class", "enum") else None, kind, c.members)
            containers.append(c)
        else:
            kn = classify(header, None)
            if kn:
                top.append(Member(kn[0], kn[1], start_line, lines.line(end), doc_for(start_line)))
        i = end + 1
    return containers, top


# --------------------------------------------------------------------------
# Fork markers: lines changed compared with origin/main.
# --------------------------------------------------------------------------

def fork_changed_lines(path: Path) -> set | None:
    """Changed line numbers (in our version) vs origin/main; None if unknown.

    A file that upstream doesn't have is reported as entirely fork-owned
    with an empty set and handled by the caller.
    """
    rel = path.resolve().relative_to(ROOT).as_posix() if path.resolve().is_relative_to(ROOT) else None
    if not rel:
        return None
    try:
        has_main = subprocess.run(["git", "-C", str(ROOT), "rev-parse", "--verify", "--quiet",
                                   "origin/main"], capture_output=True, timeout=10).returncode == 0
        if not has_main:
            return None
        exists = subprocess.run(["git", "-C", str(ROOT), "cat-file", "-e", f"origin/main:{rel}"],
                                capture_output=True, timeout=10).returncode == 0
        if not exists:
            return set()  # caller marks the whole file
        out = subprocess.run(["git", "-C", str(ROOT), "diff", "-U0", "--no-color", "origin/main",
                              "--", rel], capture_output=True, text=True, timeout=30).stdout
    except (OSError, subprocess.SubprocessError):
        return None
    changed = set()
    for m in re.finditer(r"^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@", out, re.M):
        start, count = int(m.group(1)), int(m.group(2) or 1)
        if count == 0:
            changed.add(max(start, 1))  # pure deletion after this line
        changed.update(range(start, start + count))
    return changed


def upstream_has(path: Path) -> bool | None:
    try:
        rel = path.resolve().relative_to(ROOT).as_posix()
        return subprocess.run(["git", "-C", str(ROOT), "cat-file", "-e", f"origin/main:{rel}"],
                              capture_output=True, timeout=10).returncode == 0
    except (ValueError, OSError, subprocess.SubprocessError):
        return None


def mark_fork(path: Path, containers: list, top: list) -> str:
    changed = fork_changed_lines(path)
    if changed is None:
        return ""
    if not changed and upstream_has(path) is False:
        return "fork-only file"
    for c in containers:
        c.fork_lines = sum(1 for ln in changed if c.start <= ln <= c.end)
        for m in c.members:
            m.fork_lines = sum(1 for ln in changed if m.start <= ln <= m.end)
    for m in top:
        m.fork_lines = sum(1 for ln in changed if m.start <= ln <= m.end)
    return f"{len(changed)} line(s) differ from upstream"


# --------------------------------------------------------------------------
# Output
# --------------------------------------------------------------------------

def _fmt_member(m: Member, indent: str) -> str:
    fork = f" fork+{m.fork_lines}" if m.fork_lines else ""
    doc = f"  - {m.doc}" if m.doc else ""
    return f"{indent}L{m.start}-{m.end} ({m.size}) {m.kind} {m.name}{fork}{doc}"


def outline(path: Path, grep: str = "", fork_only: bool = False, min_lines: int = 0) -> str:
    src = path.read_text(encoding="utf-8")
    containers, top = parse(src)
    fork_note = mark_fork(path, containers, top)
    total = src.count("\n") + 1
    n_members = sum(len(c.members) for c in containers) + len(top)
    try:
        shown = path.resolve().relative_to(ROOT).as_posix()
    except ValueError:
        shown = str(path)
    head = f"{shown}: {total} lines, {len(containers)} type(s), {n_members} member(s)"
    out = [head + (f"; {fork_note}" if fork_note else "")]
    g = grep.lower()

    def keep(m: Member) -> bool:
        if fork_only and not m.fork_lines and fork_note != "fork-only file":
            return False
        if m.size < min_lines:
            return False
        if g and g not in (m.name + " " + m.doc + " " + m.section).lower() and \
                not any(g in t.lower() for _, t in m.landmarks):
            return False
        return True

    for m in top:
        if keep(m):
            out.append(_fmt_member(m, "  "))
    for c in containers:
        members = [m for m in c.members if keep(m)]
        if (g or fork_only or min_lines) and not members:
            continue
        fork = f" fork+{c.fork_lines}" if c.fork_lines else ""
        doc = f"  - {c.doc}" if c.doc else ""
        out.append(f"{c.kind} {c.name} L{c.start}-{c.end} ({c.end - c.start + 1}){fork}{doc}")
        section = None
        run: list = []  # consecutive one-line fields, folded into one line

        def flush() -> None:
            if len(run) >= 3:
                names = ", ".join(m.name + ("*" if m.fork_lines else "") for m in run)
                out.append(f"    L{run[0].start}-{run[-1].end} fields ({len(run)}): {names}")
            else:
                out.extend(_fmt_member(m, "    ") for m in run)
            run.clear()

        for m in members:
            if m.section != section:
                flush()
                section = m.section
                if section:
                    out.append(f"  ## {section}")
            if m.kind == "field" and m.size == 1 and not m.doc:
                run.append(m)
                continue
            flush()
            out.append(_fmt_member(m, "    "))
            for ln, title in m.landmarks:
                out.append(f"        L{ln}: {title}")
        flush()
    if any(m.fork_lines for c in containers for m in c.members):
        out.append("(fork+N = lines changed vs upstream; * in a field list = changed field)")
    return "\n".join(out)


def lib_files() -> list:
    return sorted(p for p in (ROOT / "lib").rglob("*.dart")
                  if not p.name.startswith("app_localizations"))


def find(name: str) -> str:
    want = name.lower()
    out = []
    for p in lib_files():
        try:
            containers, top = parse(p.read_text(encoding="utf-8"))
        except (OSError, UnicodeDecodeError):
            continue
        rel = p.relative_to(ROOT).as_posix()
        for c in containers:
            if want in c.name.lower():
                out.append(f"{rel}:{c.start}-{c.end} {c.kind} {c.name}")
            for m in c.members:
                if want in m.name.lower():
                    out.append(f"{rel}:{m.start}-{m.end} {m.kind} {c.name}.{m.name}")
        for m in top:
            if want in m.name.lower():
                out.append(f"{rel}:{m.start}-{m.end} {m.kind} {m.name}")
    return "\n".join(out) if out else f"no declaration matching {name!r} in lib/"


def big(min_lines: int) -> str:
    rows = []
    for p in lib_files():
        src = p.read_text(encoding="utf-8")
        total = src.count("\n") + 1
        if total < min_lines:
            continue
        containers, top = parse(src)
        biggest = max((m for c in containers for m in c.members), key=lambda m: m.size, default=None)
        b = f"; biggest member {biggest.name} ({biggest.size})" if biggest else ""
        n = sum(len(c.members) for c in containers) + len(top)
        rows.append((total, f"{total:6} lines  {n:4} members  {p.relative_to(ROOT).as_posix()}{b}"))
    return "\n".join(r for _, r in sorted(rows, reverse=True))


def main(argv: list) -> int:
    ap = argparse.ArgumentParser(description="Outline Dart files (see module docstring).")
    ap.add_argument("files", nargs="*")
    ap.add_argument("--grep", default="")
    ap.add_argument("--fork", action="store_true")
    ap.add_argument("--min", type=int, default=0)
    ap.add_argument("--find")
    ap.add_argument("--big", nargs="?", const=1500, type=int)
    a = ap.parse_args(argv)
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    if a.find:
        print(find(a.find))
    elif a.big is not None:
        print(big(a.big))
    elif a.files:
        for f in a.files:
            print(outline(Path(f), a.grep, a.fork, a.min))
    else:
        ap.print_help()
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

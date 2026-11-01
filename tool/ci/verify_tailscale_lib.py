"""Fail unless every build output given includes the built-in Tailscale library.

The native build skips the library with only a warning when Go or a cgo
compiler is missing (native/tailscale/tailscale.cmake, android.gradle), so a
runner image change could otherwise ship a release without it, and users with
built-in Tailscale on would lose their tailnet server after updating.

Usage: python3 tool/ci/verify_tailscale_lib.py PATH...
  - a folder: the Windows Release folder (absorb_tailscale.dll) or the Linux
    bundle (lib/libabsorb_tailscale.so);
  - a .zip: must contain absorb_tailscale.dll (the Windows portable ZIP);
  - an .apk: every ABI with Flutter's libapp.so must also carry
    lib/<abi>/libabsorb_tailscale.so.
"""

import sys
import zipfile
from pathlib import Path


def check_dir(path: Path) -> str | None:
    for rel in ("absorb_tailscale.dll", "lib/libabsorb_tailscale.so"):
        if (path / rel).is_file():
            return None
    return f"{path}: no absorb_tailscale.dll or lib/libabsorb_tailscale.so"


def check_zip(path: Path) -> str | None:
    with zipfile.ZipFile(path) as z:
        names = z.namelist()
    if any(n.replace("\\", "/").rsplit("/", 1)[-1] == "absorb_tailscale.dll" for n in names):
        return None
    return f"{path}: absorb_tailscale.dll missing"


def check_apk(path: Path) -> str | None:
    with zipfile.ZipFile(path) as z:
        names = set(z.namelist())
    abis = sorted(n.split("/")[1] for n in names
                  if n.startswith("lib/") and n.endswith("/libapp.so"))
    if not abis:
        return f"{path}: no lib/<abi>/libapp.so (not a Flutter release APK?)"
    missing = [a for a in abis if f"lib/{a}/libabsorb_tailscale.so" not in names]
    if missing:
        return f"{path}: libabsorb_tailscale.so missing for {', '.join(missing)}"
    return None


def main(paths: list[str]) -> int:
    if not paths:
        sys.exit("no build outputs given")
    errors = []
    for raw in paths:
        path = Path(raw)
        if path.is_dir():
            err = check_dir(path)
        elif path.suffix.lower() == ".apk":
            err = check_apk(path)
        elif path.suffix.lower() == ".zip":
            err = check_zip(path)
        else:
            err = f"{path}: not a folder, .zip or .apk"
        if err:
            errors.append(err)
        else:
            print(f"OK  {path}")
    for err in errors:
        print(f"ERROR  {err}", file=sys.stderr)
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

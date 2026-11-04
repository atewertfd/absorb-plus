"""Tests for tool/test_build_notes.py. Run: python -m unittest discover -s tool/tests"""

import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import test_build_notes as tbn  # noqa: E402


class SubjectToNoteTests(unittest.TestCase):
    def test_keeps_feat_fix_perf_and_strips_prefix(self):
        self.assertEqual(tbn.subject_to_note("feat: browser remote served by the PC host"),
                         "Browser remote served by the PC host")
        self.assertEqual(tbn.subject_to_note("fix(player): stop skipping chapters."),
                         "Stop skipping chapters")
        self.assertEqual(tbn.subject_to_note("perf!: faster library scroll"), "Faster library scroll")

    def test_skips_other_types(self):
        for subject in (
            "chore: bump build identifier to 1.12.1+355 (Beta 12)",
            "test: shared fakes",
            "docs: phone remote stage 2",
            "style: whitespace",
            "refactor: tidy fork code",
            "build: pass the client id",
        ):
            self.assertIsNone(tbn.subject_to_note(subject), subject)

    def test_skips_tooling_scopes(self):
        self.assertIsNone(tbn.subject_to_note("fix(tool): dev.ps1 apk -Local no longer fails"))
        self.assertIsNone(tbn.subject_to_note("feat(ci): cache pub"))

    def test_plain_subjects_kept_unless_bookkeeping(self):
        self.assertEqual(tbn.subject_to_note("Add Send to E-Reader on BookOrbit"),
                         "Add Send to E-Reader on BookOrbit")
        self.assertIsNone(tbn.subject_to_note("Bump to 1.12.1+303"))
        self.assertIsNone(tbn.subject_to_note("Merge branch 'x' into claude/slim"))
        self.assertIsNone(tbn.subject_to_note("Revert \"feat: x\""))
        self.assertIsNone(tbn.subject_to_note("   "))

    def test_capitalizes(self):
        self.assertEqual(tbn.subject_to_note("feat: same speed switch"), "Same speed switch")


class NotesFromSubjectsTests(unittest.TestCase):
    def test_order_kept_and_duplicates_dropped(self):
        notes = tbn.notes_from_subjects([
            "feat: phone lock screen controls the PC",
            "chore: bump build identifier",
            "fix: Phone lock screen controls the PC",
            "fix: downloads resume",
        ])
        self.assertEqual(notes, ["Phone lock screen controls the PC", "Downloads resume"])


class OutputTests(unittest.TestCase):
    def test_split_version(self):
        self.assertEqual(tbn.split_version("1.12.1+356"), ("1.12.1", 356))
        with self.assertRaises(ValueError):
            tbn.split_version("1.12.1")

    def test_release_body_has_version_line_and_bullets(self):
        body = tbn.release_body("1.12.1", 356, "abcdef1234567", ["One", "Two"])
        lines = body.splitlines()
        self.assertTrue(lines[0].startswith("Test build 1.12.1+356 (commit abcdef12)"))
        self.assertEqual(lines[2:], ["- One", "- Two"])

    def test_release_body_without_notes(self):
        body = tbn.release_body("1.12.1", 356, "abc", [])
        self.assertIn("- Small fixes and internal changes", body)

    def test_main_writes_json_and_body(self):
        subjects = ["feat: new thing", "docs: x"]
        with tempfile.TemporaryDirectory() as tmp, \
                mock.patch.object(tbn, "commit_subjects", return_value=subjects) as fake:
            out = Path(tmp) / "a" / "notes.json"
            body = Path(tmp) / "notes.md"
            tbn.main(["--version", "1.12.1+356", "--since", "abc", "--out", str(out),
                      "--release-notes", str(body), "--commit", "0123456789", "--date", "2026-11-04"])
            fake.assert_called_once_with("abc")
            data = json.loads(out.read_text(encoding="utf-8"))
            self.assertEqual(data, {"version": "1.12.1", "build": 356, "date": "2026-11-04",
                                    "notes": ["New thing"]})
            self.assertIn("- New thing", body.read_text(encoding="utf-8"))

    def test_main_without_since_uses_fallback(self):
        with tempfile.TemporaryDirectory() as tmp, \
                mock.patch.object(tbn, "commit_subjects", return_value=[]) as fake:
            tbn.main(["--version", "1.0.0+1", "--out", str(Path(tmp) / "n.json")])
            fake.assert_called_once_with(None)


if __name__ == "__main__":
    unittest.main()

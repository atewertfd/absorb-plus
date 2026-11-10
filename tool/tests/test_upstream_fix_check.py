import contextlib
import io
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import upstream_fix_check as ufc  # noqa: E402

SRC = """class LocalSessionService {
  Future<bool> pushActive() async {
    final a = 1;
    return true;
  }

  void other() {}
}
"""


class UpstreamFixCheckTest(unittest.TestCase):
    def test_added_lines(self):
        diff = "@@ -3 +3,2 @@ x\n@@ -9,0 +11 @@ y\n@@ -12,2 +13,0 @@ z\n"
        self.assertEqual(ufc.added_lines(diff), {3, 4, 11, 13})

    def test_members_touching(self):
        self.assertEqual(ufc.members_touching(SRC, {3}), {"LocalSessionService.pushActive"})
        self.assertEqual(ufc.members_touching(SRC, {7}), {"LocalSessionService.other"})
        self.assertEqual(ufc.members_touching(SRC, {1}), set())

    def _fake_git(self, answers):
        """Replaces ufc.git: the first word of the command picks the answer."""
        real = ufc.git
        ufc.git = lambda *args: answers.get(args[0], "")
        self.addCleanup(setattr, ufc, "git", real)

    def test_missing_merge_base_is_an_error_not_an_all_clear(self):
        # The ref exists but shares no history: merge-base answers nothing.
        self._fake_git({"merge-base": "", "rev-parse": "abc123\n"})
        with self.assertRaises(ufc.NoMergeBase) as caught:
            ufc.report("origin/main")
        self.assertNotIn("unfetched", str(caught.exception))
        with contextlib.redirect_stderr(io.StringIO()) as err, \
                contextlib.redirect_stdout(io.StringIO()) as out:
            code = ufc.main(["upstream_fix_check.py"])
        self.assertEqual(code, 2)
        self.assertIn("ERROR", err.getvalue())
        self.assertNotIn("No unmerged upstream fix", out.getvalue())

    def test_unfetched_ref_gets_a_fetch_hint(self):
        self._fake_git({"merge-base": "", "rev-parse": ""})
        with self.assertRaises(ufc.NoMergeBase) as caught:
            ufc.report("origin/main")
        self.assertIn("unfetched", str(caught.exception))
        self.assertIn("git fetch origin", str(caught.exception))

    def test_format_groups_by_commit(self):
        out = ufc.format_hits([("abc", "Fix x", "a.dart", ["A.b"]), ("abc", "Fix x", "c.dart", ["C.d"])])
        self.assertIn("1 upstream fix commit(s)", out)
        self.assertEqual(out.count("abc Fix x"), 1)


if __name__ == "__main__":
    unittest.main()

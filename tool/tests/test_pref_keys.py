"""Tests for tool/pref_keys.py. Run: python -m unittest discover -s tool/tests"""

import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import pref_keys as pk  # noqa: E402

SERVICE = """
class TailscaleService {
  static const prefEnabled = 'fork_tailscale_enabled';
  static const String prefsKey = 'fork_tailscale_port';
  static const _cacheKey = 'cached_thing';
  Future<void> f(SharedPreferences prefs) async {
    prefs.getBool('literal_bool');
    await prefs.setString('literal_string', 'v');
    prefs.remove('literal_removed');
    prefs.containsKey('literal_contains');
    prefs.setBool(prefEnabled, true);
    prefs.getString(_cacheKey);
    prefs.getString('bookmarks_$id');
  }
}
"""

CALLER = """
const key = 'unrelated_value';
void g(SharedPreferences prefs) {
  prefs.getInt(TailscaleService.prefsKey);
  prefs.getString(key);
  prefs.getString(somethingElse);
}
"""


class ScanTests(unittest.TestCase):
    def test_literals_constants_and_runtime_keys(self):
        keys = pk.scan(SERVICE)
        self.assertEqual(keys, {
            "fork_tailscale_enabled", "fork_tailscale_port", "cached_thing",
            "literal_bool", "literal_string", "literal_removed", "literal_contains",
        })

    def test_qualified_constant_resolves_through_its_class(self):
        by_class = {"TailscaleService": {"prefsKey": "fork_tailscale_port"}}
        keys = pk.scan(CALLER, by_class)
        self.assertIn("fork_tailscale_port", keys)
        self.assertIn("unrelated_value", keys)  # this file's own `key` constant
        self.assertEqual(len(keys), 2)

    def test_collect_attributes_each_key_to_the_files_using_it(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "lib" / "services").mkdir(parents=True)
            (root / "lib" / "l10n").mkdir()
            (root / "lib" / "services" / "tailscale_service.dart").write_text(SERVICE, encoding="utf-8")
            (root / "lib" / "caller.dart").write_text(CALLER, encoding="utf-8")
            (root / "lib" / "l10n" / "app_localizations.dart").write_text(
                "x.getString('not_a_pref');", encoding="utf-8")
            where = pk.collect(root)
        self.assertEqual(sorted(where["fork_tailscale_port"]),
                         ["lib/caller.dart", "lib/services/tailscale_service.dart"])
        self.assertNotIn("not_a_pref", where)


class NamingRuleTests(unittest.TestCase):
    def test_only_new_keys_must_be_fork_snake_case(self):
        fork_keys = {"fork_good_key", "fork_Bad", "newCamel", "old_grandfathered", "fork_prefix_"}
        self.assertEqual(pk.bad_new_keys(fork_keys, {"old_grandfathered"}), ["fork_Bad", "newCamel"])

    def test_existing_file_skips_comments(self):
        with tempfile.TemporaryDirectory() as tmp:
            f = Path(tmp) / "existing.txt"
            f.write_text("# header\nold_one\n\n  # note\nold_two\n", encoding="utf-8")
            self.assertEqual(pk.read_existing(f), {"old_one", "old_two"})


if __name__ == "__main__":
    unittest.main()

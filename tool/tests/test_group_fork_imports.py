"""Tests for tool/group_fork_imports.py. Run: python -m unittest discover -s tool/tests"""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import group_fork_imports as g  # noqa: E402

UPSTREAM = """import 'dart:async';
import 'dart:io';
import '../a.dart';
import '../b.dart';
import '../c.dart';

void main() {}
"""

OURS = """import 'dart:async';
import 'dart:io' hide Platform; // web-safe Platform below
import '../a.dart';
import '../fork_one.dart'; // fork
import '../b.dart';
import '../fork_two.dart' show x;
import '../c.dart';

void main() {}
"""


class GroupTests(unittest.TestCase):
    def test_moves_added_imports_into_one_block_after_upstream_imports(self):
        new, moved = g.group(OURS, UPSTREAM)
        self.assertEqual(moved, ["import '../fork_one.dart'; // fork",
                                 "import '../fork_two.dart' show x;"])
        self.assertEqual(new, """import 'dart:async';
import 'dart:io' hide Platform; // web-safe Platform below
import '../a.dart';
import '../b.dart';
import '../c.dart';
""" + g.MARKER + """
import '../fork_one.dart'; // fork
import '../fork_two.dart' show x;

void main() {}
""")

    def test_running_twice_changes_nothing(self):
        once, _ = g.group(OURS, UPSTREAM)
        twice, moved = g.group(once, UPSTREAM)
        self.assertEqual(twice, once)
        self.assertEqual(moved, [])

    def test_changed_upstream_import_stays_in_place(self):
        new, moved = g.group(OURS, UPSTREAM)
        self.assertNotIn("import 'dart:io' hide Platform", "\n".join(moved))
        self.assertTrue(new.split("\n")[1].startswith("import 'dart:io' hide Platform"))

    def test_no_fork_imports_no_change(self):
        new, moved = g.group(UPSTREAM, UPSTREAM)
        self.assertEqual((new, moved), (UPSTREAM, []))

    def test_new_imports_join_an_existing_block(self):
        once, _ = g.group(OURS, UPSTREAM)
        added = once.replace("import '../b.dart';\n", "import '../b.dart';\nimport '../fork_three.dart';\n")
        new, moved = g.group(added, UPSTREAM)
        self.assertEqual(new.count(g.MARKER), 1)
        block = new.split(g.MARKER + "\n")[1].split("\n\n")[0].split("\n")
        self.assertEqual(block, ["import '../fork_one.dart'; // fork",
                                 "import '../fork_two.dart' show x;",
                                 "import '../fork_three.dart';"])


if __name__ == "__main__":
    unittest.main()

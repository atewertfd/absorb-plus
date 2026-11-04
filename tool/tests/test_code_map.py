"""Tests for tool/code_map.py. Run: python -m unittest discover -s tool/tests"""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import code_map as cm  # noqa: E402

SAMPLE = '''import 'package:flutter/material.dart';

/// Formats a key.
String playbackKey(String id) => 'k:$id';

/// Plays books.
class Player extends ChangeNotifier {
  Player(this.name) : _count = 0 {
    _init();
  }
  factory Player.empty() = _EmptyPlayer;

  final String name;
  int _count;
  final Map<String, int> _cache = {'a': 1, 'b': 2};
  void Function(String a, int b)? onDone;
  static final Future<void> Function(String, String) writer = (p, c) async {};

  // ─── Playback ───────────────────────────
  /// Starts playback. Second sentence.
  Future<void> play() async {
    final s = "a { not a brace ${_cache['a']} } still string";
    final r = r'raw { $notInterp';
    /* block { comment */ // line { comment
    final t = """
      multi { line
    """;
    if (s.isEmpty) { return; }
  }

  int get count => _count;
  set count(int v) { _count = v; }
  bool operator ==(Object other) => other is Player && other.name == name;

  // ─── Helpers ───
  void _init() {}
}

enum Mode { a, b; bool get isA => this == Mode.a; }

extension PlayerX on Player {
  void reset() {}
}
'''


class ParseTests(unittest.TestCase):
    def setUp(self):
        self.containers, self.top = cm.parse(SAMPLE)
        self.player = next(c for c in self.containers if c.name == "Player")
        self.by_name = {m.name: m for m in self.player.members}

    def test_top_level_function_with_doc(self):
        self.assertEqual([(m.kind, m.name) for m in self.top], [("func", "playbackKey")])
        self.assertEqual(self.top[0].doc, "Formats a key.")

    def test_containers(self):
        kinds = [(c.kind, c.name) for c in self.containers]
        self.assertEqual(kinds, [("class", "Player"), ("enum", "Mode"), ("extension", "PlayerX")])
        self.assertEqual(self.player.doc, "Plays books.")
        last_line = SAMPLE.split("\n")[self.player.end - 1]
        self.assertEqual(last_line, "}")

    def test_member_kinds(self):
        expect = {
            "Player": "ctor", "Player.empty": "ctor", "name": "field", "_count": "field",
            "_cache": "field", "onDone": "field", "writer": "field", "play": "method",
            "operator ==": "op", "_init": "method",
        }
        for name, kind in expect.items():
            self.assertIn(name, self.by_name, name)
            self.assertEqual(self.by_name[name].kind, kind, name)
        accessors = [(m.kind, m.name) for m in self.player.members if m.kind in ("get", "set")]
        self.assertEqual(accessors, [("get", "count"), ("set", "count")])

    def test_braces_in_strings_and_comments_do_not_break_ranges(self):
        play = self.by_name["play"]
        lines = SAMPLE.split("\n")
        self.assertIn("Future<void> play()", lines[play.start - 1])
        self.assertEqual(lines[play.end - 1].strip(), "}")
        self.assertEqual(lines[play.end].strip(), "")  # next is the getter after a blank line
        self.assertEqual(play.doc, "Starts playback.")

    def test_constructor_with_initializer_list_and_body(self):
        ctor = self.by_name["Player"]
        self.assertEqual(ctor.end - ctor.start, 2)

    def test_sections(self):
        self.assertEqual(self.by_name["play"].section, "Playback")
        self.assertEqual(self.by_name["_init"].section, "Helpers")
        self.assertEqual(self.by_name["name"].section, "")

    def test_enum_members_after_values(self):
        mode = next(c for c in self.containers if c.name == "Mode")
        self.assertEqual([(m.kind, m.name) for m in mode.members], [("get", "isA")])

    def test_blank_keeps_length_and_newlines(self):
        out = cm.blank(SAMPLE)
        self.assertEqual(len(out), len(SAMPLE))
        self.assertEqual(out.count("\n"), SAMPLE.count("\n"))
        self.assertNotIn("not a brace", out)
        self.assertIn("_cache", out)  # interpolation code survives

    def test_outline_folds_one_line_fields(self):
        src = "class A {\n  int a;\n  int b;\n  int c;\n  void f() {}\n}\n"
        tmp = Path(__file__).with_name("_tmp_code_map_sample.dart")
        tmp.write_text(src, encoding="utf-8")
        try:
            text = cm.outline(tmp)
        finally:
            tmp.unlink()
        self.assertIn("fields (3): a, b, c", text)
        self.assertIn("method f", text)


if __name__ == "__main__":
    unittest.main()

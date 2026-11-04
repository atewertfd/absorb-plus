import 'dart:convert';

import 'package:absorb/services/remote_link/remote_layout.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The phone remote's layout data: JSON, editing, presets, saving.

List<RemoteBlock> _blocks(List<RemoteBlockEntry> entries) => [
  for (final e in entries) e.block,
];

void main() {
  group('defaults and presets', () {
    test('portrait default is the screen as it always was', () {
      expect(_blocks(RemoteLayout.defaults().portrait), [
        RemoteBlock.cover,
        RemoteBlock.titleAuthor,
        RemoteBlock.chapterTitle,
        RemoteBlock.progress,
        RemoteBlock.transport,
        RemoteBlock.speed,
        RemoteBlock.sleep,
        RemoteBlock.chapters,
        RemoteBlock.bookmark,
        RemoteBlock.stop,
        RemoteBlock.volume,
      ]);
      final p = RemoteLayout.defaults().portrait;
      expect(p.first.size, RemoteBlockSize.medium);
      expect(p[4].size, RemoteBlockSize.large);
    });

    test('landscape default: cover left, the rest right', () {
      final d = RemoteLayout.defaults();
      expect(d.left, [
        RemoteBlockEntry(RemoteBlock.cover, RemoteBlockSize.large),
      ]);
      expect(_blocks(d.right), _blocks(d.portrait).skip(1).toList());
    });

    test('Minimal, Nightstand and Full', () {
      final minimal = RemoteLayout.preset(RemotePreset.minimal);
      const m = [
        RemoteBlock.titleAuthor,
        RemoteBlock.progress,
        RemoteBlock.transport,
      ];
      expect(_blocks(minimal.portrait), m);
      expect(minimal.left, isEmpty);
      expect(_blocks(minimal.right), m);

      final night = RemoteLayout.preset(RemotePreset.nightstand);
      expect(night.portrait, [
        RemoteBlockEntry(RemoteBlock.cover, RemoteBlockSize.large),
        RemoteBlockEntry(RemoteBlock.clock),
        RemoteBlockEntry(RemoteBlock.timeLeft),
      ]);
      expect(_blocks(night.left), [RemoteBlock.cover]);
      expect(_blocks(night.right), [RemoteBlock.clock, RemoteBlock.timeLeft]);

      final full = RemoteLayout.preset(RemotePreset.full);
      final everything = RemoteBlock.values
          .where((b) => b != RemoteBlock.spacer)
          .toSet();
      expect(_blocks(full.portrait).toSet(), everything);
      expect(full.portrait.length, everything.length);
      expect(_blocks(full.shown(landscape: true).toList()).toSet(), everything);
      expect(full.missing(landscape: false), [RemoteBlock.spacer]);
    });

    test('a preset or reset changes only the orientation being edited', () {
      final d = RemoteLayout.defaults();
      final p = d.applyPreset(RemotePreset.minimal, landscape: false);
      expect(_blocks(p.portrait), [
        RemoteBlock.titleAuthor,
        RemoteBlock.progress,
        RemoteBlock.transport,
      ]);
      expect(p.left, d.left);
      expect(p.right, d.right);
      final l = p.applyPreset(RemotePreset.nightstand, landscape: true);
      expect(l.portrait, p.portrait);
      expect(_blocks(l.right), [RemoteBlock.clock, RemoteBlock.timeLeft]);
      expect(l.reset(landscape: true).right, d.right);
      expect(l.reset(landscape: true).portrait, p.portrait);
      expect(l.reset(landscape: false).portrait, d.portrait);
    });
  });

  group('editing', () {
    final d = RemoteLayout.defaults();

    test('reorders within a column, both ways', () {
      // Stop (index 9) to the top.
      final up = d.move(RemoteColumn.portrait, 9, RemoteColumn.portrait, 0);
      expect(up.portrait.first.block, RemoteBlock.stop);
      expect(up.portrait.length, d.portrait.length);
      // Cover (0) to just after the transport (slot 5).
      final down = d.move(RemoteColumn.portrait, 0, RemoteColumn.portrait, 5);
      expect(_blocks(down.portrait).take(5), [
        RemoteBlock.titleAuthor,
        RemoteBlock.chapterTitle,
        RemoteBlock.progress,
        RemoteBlock.transport,
        RemoteBlock.cover,
      ]);
      // To the end.
      final end = d.move(RemoteColumn.portrait, 0, RemoteColumn.portrait, 99);
      expect(end.portrait.last.block, RemoteBlock.cover);
      // Dropped where it was: nothing changes.
      expect(d.move(RemoteColumn.portrait, 3, RemoteColumn.portrait, 3), d);
      expect(d.move(RemoteColumn.portrait, 3, RemoteColumn.portrait, 4), d);
    });

    test('moves between the landscape columns, never to portrait', () {
      final moved = d.move(RemoteColumn.right, 0, RemoteColumn.left, 1);
      expect(_blocks(moved.left), [RemoteBlock.cover, RemoteBlock.titleAuthor]);
      expect(moved.right.first.block, RemoteBlock.chapterTitle);
      expect(moved.portrait, d.portrait);
      expect(d.move(RemoteColumn.portrait, 0, RemoteColumn.left, 0), d);
    });

    test('adds what is missing once, the spacer any number of times', () {
      expect(d.missing(landscape: false), [
        RemoteBlock.timeLeft,
        RemoteBlock.continueListening,
        RemoteBlock.clock,
        RemoteBlock.spacer,
      ]);
      final added = d.add(RemoteColumn.portrait, RemoteBlock.clock);
      expect(added.portrait.last, RemoteBlockEntry(RemoteBlock.clock));
      expect(
        added.missing(landscape: false),
        isNot(contains(RemoteBlock.clock)),
      );
      expect(added.add(RemoteColumn.portrait, RemoteBlock.clock), added);
      // Already in the left column: not added again on the right.
      expect(d.add(RemoteColumn.right, RemoteBlock.cover), d);
      final spaced = d
          .add(RemoteColumn.portrait, RemoteBlock.spacer)
          .add(RemoteColumn.portrait, RemoteBlock.spacer);
      expect(
        spaced.portrait.where((e) => e.block == RemoteBlock.spacer).length,
        2,
      );
    });

    test('removes, and the removed block can be added back', () {
      final removed = d.remove(RemoteColumn.portrait, 0);
      expect(removed.portrait.first.block, RemoteBlock.titleAuthor);
      expect(removed.missing(landscape: false), contains(RemoteBlock.cover));
      expect(
        removed.missing(landscape: true),
        isNot(contains(RemoteBlock.cover)),
      );
      expect(d.remove(RemoteColumn.portrait, 99), d);
    });

    test('size toggles through the sizes each block offers', () {
      var l = d;
      final sizes = <RemoteBlockSize>[];
      for (var i = 0; i < 3; i++) {
        l = l.cycleSize(RemoteColumn.portrait, 0);
        sizes.add(l.portrait[0].size);
      }
      expect(sizes, [
        RemoteBlockSize.large,
        RemoteBlockSize.small,
        RemoteBlockSize.medium,
      ]);
      expect(
        d.cycleSize(RemoteColumn.portrait, 4).portrait[4].size,
        RemoteBlockSize.compact,
      );
      expect(
        d.cycleSize(RemoteColumn.portrait, 5).portrait[5].size,
        RemoteBlockSize.compact,
      );
      // The chapter title has one size: the toggle changes nothing.
      expect(d.cycleSize(RemoteColumn.portrait, 2), d);
    });
  });

  group('JSON', () {
    test('round-trips every preset and an edited layout', () {
      for (final p in RemotePreset.values) {
        final layout = RemoteLayout.preset(p);
        final json = jsonDecode(jsonEncode(layout.toJson()));
        expect(RemoteLayout.fromJson(json), layout, reason: p.name);
      }
      final edited = RemoteLayout.defaults()
          .cycleSize(RemoteColumn.portrait, 0)
          .add(RemoteColumn.portrait, RemoteBlock.spacer)
          .add(RemoteColumn.portrait, RemoteBlock.spacer)
          .move(RemoteColumn.right, 2, RemoteColumn.left, 0);
      final json = edited.toJson();
      expect(json['version'], RemoteLayout.version);
      expect(RemoteLayout.fromJson(jsonDecode(jsonEncode(json))), edited);
    });

    test('drops unknown blocks and duplicates, keeps missing ones out', () {
      final layout = RemoteLayout.fromJson({
        'version': 7,
        'portrait': [
          {'block': 'hologram', 'size': 'large'},
          {'block': 'cover', 'size': 'gigantic'},
          {'block': 'transport', 'size': 'compact'},
          {'block': 'cover', 'size': 'small'},
          {'block': 'spacer'},
          {'block': 'spacer', 'size': 'compact'},
          'nonsense',
        ],
        'landscapeLeft': [
          {'block': 'clock'},
        ],
        'landscapeRight': [
          {'block': 'clock'},
          {'block': 'progress', 'size': 'compact'},
        ],
      });
      expect(layout.portrait, [
        RemoteBlockEntry(RemoteBlock.cover, RemoteBlockSize.medium),
        RemoteBlockEntry(RemoteBlock.transport, RemoteBlockSize.compact),
        RemoteBlockEntry(RemoteBlock.spacer),
        RemoteBlockEntry(RemoteBlock.spacer, RemoteBlockSize.compact),
      ]);
      expect(layout.left, [RemoteBlockEntry(RemoteBlock.clock)]);
      expect(layout.right, [
        RemoteBlockEntry(RemoteBlock.progress, RemoteBlockSize.compact),
      ]);
    });

    test('an empty saved layout stays empty', () {
      final layout = RemoteLayout.fromJson({
        'version': 1,
        'portrait': <Object>[],
        'landscapeLeft': <Object>[],
        'landscapeRight': <Object>[],
      });
      expect(layout.portrait, isEmpty);
      expect(layout.shown(landscape: true), isEmpty);
    });

    test('a missing orientation or garbage falls back to the default', () {
      final d = RemoteLayout.defaults();
      final onlyPortrait = RemoteLayout.fromJson({
        'portrait': [
          {'block': 'clock'},
        ],
      });
      expect(_blocks(onlyPortrait.portrait), [RemoteBlock.clock]);
      expect(onlyPortrait.left, d.left);
      expect(onlyPortrait.right, d.right);
      expect(RemoteLayout.fromJson('x'), d);
      expect(RemoteLayout.fromJson(null), d);
    });

    test('display options round-trip; bad values fall back', () {
      const o = RemoteDisplayOptions(
        background: RemoteDisplayBackground.cover,
        textSize: RemoteDisplayTextSize.huge,
        showClock: false,
        use24Hour: true,
        dimAfterMinutes: 10,
      );
      final json = jsonDecode(jsonEncode(o.toJson()));
      expect(json['version'], RemoteDisplayOptions.version);
      expect(RemoteDisplayOptions.fromJson(json), o);
      expect(
        RemoteDisplayOptions.fromJson({
          'background': 'neon',
          'textSize': 1,
          'showClock': 'yes',
          'dimAfterMinutes': 7,
        }),
        const RemoteDisplayOptions(),
      );
    });
  });

  group('RemoteLayoutStore', () {
    test('saves and loads under fork keys', () async {
      SharedPreferences.setMockInitialValues({});
      final (layout, display) = await RemoteLayoutStore.load();
      expect(layout, RemoteLayout.defaults());
      expect(display, const RemoteDisplayOptions());

      final minimal = RemoteLayout.preset(RemotePreset.minimal);
      const night = RemoteDisplayOptions(
        background: RemoteDisplayBackground.black,
      );
      await RemoteLayoutStore.saveLayout(minimal);
      await RemoteLayoutStore.saveDisplay(night);
      final prefs = await SharedPreferences.getInstance();
      expect(RemoteLayoutStore.layoutKey, startsWith('fork_'));
      expect(RemoteLayoutStore.displayKey, startsWith('fork_'));
      expect(prefs.getString(RemoteLayoutStore.layoutKey), isNotNull);
      final (l2, d2) = await RemoteLayoutStore.load();
      expect(l2, minimal);
      expect(d2, night);
    });

    test('unreadable saved JSON loads the defaults', () async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.layoutKey: '{not json',
        RemoteLayoutStore.displayKey: '[]',
      });
      final (layout, display) = await RemoteLayoutStore.load();
      expect(layout, RemoteLayout.defaults());
      expect(display, const RemoteDisplayOptions());
    });
  });
}

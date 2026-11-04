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
        RemoteBlockEntry(RemoteBlock.clock, RemoteBlockSize.large),
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
      // Text blocks: the size is the text size (normal, compact, large).
      expect(
        d.cycleSize(RemoteColumn.portrait, 2).portrait[2].size,
        RemoteBlockSize.compact,
      );
      expect(RemoteBlock.clock.sizes, contains(RemoteBlockSize.large));
      // The stop button has no large size.
      expect(RemoteBlock.stop.sizes, isNot(contains(RemoteBlockSize.large)));
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

    test('the look round-trips; bad values fall back', () {
      const o = RemoteLook(
        accent: 'p3',
        background: RemoteLookBackground.gradient,
        buttons: RemoteButtonStyle.outlined,
        corners: RemoteCorners.extraRound,
        spacing: RemoteSpacing.compact,
        textSize: RemoteTextSize.huge,
        dimAfterMinutes: 10,
      );
      final json = jsonDecode(jsonEncode(o.toJson()));
      expect(json['version'], RemoteLook.version);
      expect(RemoteLook.fromJson(json), o);
      expect(o.swatch, RemoteLook.palette[3]);
      expect(
        RemoteLook.fromJson({
          'accent': 'p9',
          'background': 'neon',
          'buttons': 3,
          'corners': null,
          'textSize': 1,
          'dimAfterMinutes': 7,
        }),
        const RemoteLook(),
      );
    });
  });

  group('block options', () {
    test('version 1 saves load with every option at its default', () {
      final v1 = {
        'version': 1,
        'portrait': [
          {'block': 'cover', 'size': 'large'},
          {'block': 'titleAuthor', 'size': 'compact'},
          {'block': 'transport'},
          {'block': 'clock'},
        ],
        'landscapeLeft': [
          {'block': 'cover'},
        ],
        'landscapeRight': [
          {'block': 'progress'},
        ],
      };
      final layout = RemoteLayout.fromJson(v1);
      for (final e in layout.shown(landscape: false)) {
        expect(e.options, isEmpty);
      }
      final p = layout.portrait;
      expect(p[0].choice('corners'), 'auto');
      expect(p[0].flag('shadow'), isFalse);
      expect(p[0].choice('align'), 'center');
      expect(p[0].choice('gap'), 'auto');
      // The compact title keeps its single line.
      expect(p[1].choice('lines'), '1');
      expect(p[2].picked('buttons'), RemoteOptions.transportButtons);
      expect(p[2].flag('skipSeconds'), isTrue);
      expect(p[3].choice('hours'), 'phone');
      expect(layout.right.single.choice('span'), 'chapter');
      // Saved again as version 2, unchanged.
      final again = layout.toJson();
      expect(again['version'], 2);
      expect(RemoteLayout.fromJson(jsonDecode(jsonEncode(again))), layout);
    });

    test('options round-trip; unknown or bad ones are dropped', () {
      final e = RemoteBlockEntry(RemoteBlock.transport)
          .withOption('buttons', ['play', 'back'])
          .withOption('skipSeconds', false);
      // Kept in the buttons' own order.
      expect(e.picked('buttons'), ['back', 'play']);
      final layout = RemoteLayout.defaults().replace(
        RemoteColumn.portrait,
        4,
        e,
      );
      final read = RemoteLayout.fromJson(jsonDecode(jsonEncode(layout)));
      expect(read, layout);
      expect(read.portrait[4].flag('skipSeconds'), isFalse);

      final bad = RemoteBlockEntry.fromJson({
        'block': 'transport',
        'options': {
          'buttons': <String>[],
          'skipSeconds': 'no',
          'teleport': true,
          'align': 'left', // not an option of this block
        },
      })!;
      expect(bad.options, isEmpty);
      final partly = RemoteBlockEntry.fromJson({
        'block': 'speed',
        'options': {
          'presets': ['1', '7', '1.5'],
        },
      })!;
      expect(partly.picked('presets'), ['1', '1.5']);
    });

    test('equal options compare equal in any order', () {
      final a = RemoteBlockEntry(
        RemoteBlock.clock,
      ).withOption('hours', '24').withOption('date', true);
      final b = RemoteBlockEntry(
        RemoteBlock.clock,
      ).withOption('date', true).withOption('hours', '24');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(RemoteBlockEntry(RemoteBlock.clock)));
      // Changing the size keeps the options.
      expect(a.nextSize().choice('hours'), '24');
    });
  });

  group('RemoteLayoutStore', () {
    test('saves and loads under fork keys', () async {
      SharedPreferences.setMockInitialValues({});
      final first = await RemoteLayoutStore.load();
      expect(first.layout, RemoteLayout.defaults());
      expect(first.look, const RemoteLook());
      expect(first.hintShown, isFalse);

      final minimal = RemoteLayout.preset(RemotePreset.minimal);
      const night = RemoteLook(background: RemoteLookBackground.black);
      await RemoteLayoutStore.saveLayout(minimal);
      await RemoteLayoutStore.saveLook(night);
      await RemoteLayoutStore.saveHintShown();
      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        RemoteLayoutStore.layoutKey,
        RemoteLayoutStore.lookKey,
        RemoteLayoutStore.hintKey,
      ]) {
        expect(key, startsWith('fork_'));
      }
      expect(prefs.getString(RemoteLayoutStore.layoutKey), isNotNull);
      final saved = await RemoteLayoutStore.load();
      expect(saved.layout, minimal);
      expect(saved.look, night);
      expect(saved.hintShown, isTrue);
    });

    test('the old display options start the look', () async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.layoutKey: jsonEncode({
          'version': 1,
          'portrait': [
            {'block': 'clock'},
          ],
          'landscapeLeft': <Object>[],
          'landscapeRight': [
            {'block': 'clock'},
          ],
        }),
        RemoteLayoutStore.displayKey: jsonEncode({
          'version': 1,
          'background': 'cover',
          'textSize': 'large',
          'showClock': false,
          'use24Hour': true,
          'dimAfterMinutes': 5,
        }),
      });
      final saved = await RemoteLayoutStore.load();
      expect(
        saved.look,
        const RemoteLook(
          background: RemoteLookBackground.cover,
          textSize: RemoteTextSize.large,
          dimAfterMinutes: 5,
        ),
      );
      // Its 24-hour switch moved to the clocks.
      expect(saved.layout.portrait.single.choice('hours'), '24');
      expect(saved.layout.right.single.choice('hours'), '24');
    });

    test('unreadable saved JSON loads the defaults', () async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.layoutKey: '{not json',
        RemoteLayoutStore.lookKey: '[]',
      });
      final saved = await RemoteLayoutStore.load();
      expect(saved.layout, RemoteLayout.defaults());
      expect(saved.look, const RemoteLook());
    });
  });
}

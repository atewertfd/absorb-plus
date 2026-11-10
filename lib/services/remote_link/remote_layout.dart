import 'dart:convert';
import 'dart:ui' show Color;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/fork_errors.dart';

/// The phone remote's layout as data (fork): which blocks the "Control your
/// computer" screen shows, in what order, size and with which options, for
/// portrait (one column) and landscape (two columns), plus the remote's
/// look. Saved on the phone as versioned JSON; see
/// `docs/design/phone-remote.md` (layout).

/// One piece of the remote screen. The names are saved: never rename one.
enum RemoteBlock {
  cover,
  titleAuthor,
  chapterTitle,
  progress,
  timeLeft,
  transport,
  volume,
  speed,
  sleep,
  bookmark,
  chapters,
  continueListening,
  stop,
  clock,
  spacer,
}

/// A block's size. Which ones apply depends on the block ([RemoteBlockInfo]).
enum RemoteBlockSize { small, medium, large, compact, normal }

extension RemoteBlockInfo on RemoteBlock {
  /// The sizes this block offers, in toggle order; one entry means no toggle.
  List<RemoteBlockSize> get sizes => switch (this) {
    RemoteBlock.cover => const [
      RemoteBlockSize.small,
      RemoteBlockSize.medium,
      RemoteBlockSize.large,
    ],
    RemoteBlock.transport => const [
      RemoteBlockSize.compact,
      RemoteBlockSize.large,
    ],
    // Text blocks: the size is the text size.
    RemoteBlock.titleAuthor ||
    RemoteBlock.chapterTitle ||
    RemoteBlock.clock => const [
      RemoteBlockSize.normal,
      RemoteBlockSize.compact,
      RemoteBlockSize.large,
    ],
    _ => const [RemoteBlockSize.normal, RemoteBlockSize.compact],
  };

  /// The block's own options (besides its size), shown in its options
  /// sheet in edit mode. Defaults draw the block as it always looked.
  List<RemoteOptionSpec> get options => switch (this) {
    RemoteBlock.cover => const [
      RemoteOptions.corners,
      RemoteOptions.shadow,
      RemoteOptions.align,
      RemoteOptions.gap,
    ],
    RemoteBlock.titleAuthor => const [
      RemoteOptions.align,
      RemoteOptions.titleLines,
      RemoteOptions.gap,
    ],
    RemoteBlock.chapterTitle => const [
      RemoteOptions.align,
      RemoteOptions.chapterLines,
      RemoteOptions.gap,
    ],
    RemoteBlock.progress => const [
      RemoteOptions.time,
      RemoteOptions.span,
      RemoteOptions.gap,
    ],
    RemoteBlock.timeLeft => const [
      RemoteOptions.span,
      RemoteOptions.align,
      RemoteOptions.gap,
    ],
    RemoteBlock.transport => const [
      RemoteOptions.buttons,
      RemoteOptions.skipSeconds,
      RemoteOptions.gap,
    ],
    RemoteBlock.volume => const [RemoteOptions.volumeStyle, RemoteOptions.gap],
    RemoteBlock.speed => const [RemoteOptions.speedPresets],
    RemoteBlock.sleep => const [RemoteOptions.sleepPresets],
    RemoteBlock.clock => const [
      RemoteOptions.hours,
      RemoteOptions.date,
      RemoteOptions.align,
      RemoteOptions.gap,
    ],
    _ => const [],
  };

  RemoteBlockSize get defaultSize => switch (this) {
    RemoteBlock.cover => RemoteBlockSize.medium,
    RemoteBlock.transport => RemoteBlockSize.large,
    _ => RemoteBlockSize.normal,
  };

  /// Small buttons that sit side by side in a wrapping row.
  bool get isInline => inlineGroup != null;

  /// Consecutive inline blocks of the same group share one row: speed and
  /// sleep, then the actions (as the screen always looked).
  int? get inlineGroup => switch (this) {
    RemoteBlock.speed || RemoteBlock.sleep => 0,
    RemoteBlock.bookmark ||
    RemoteBlock.chapters ||
    RemoteBlock.continueListening ||
    RemoteBlock.stop => 1,
    _ => null,
  };

  /// The only block that may appear more than once.
  bool get repeatable => this == RemoteBlock.spacer;
}

/// How a block option is picked: one of a few choices, on/off, or several.
enum RemoteOptionType { choice, toggle, multi }

/// One option of a block. The key and values are saved: never rename one.
@immutable
class RemoteOptionSpec {
  const RemoteOptionSpec.choice(this.key, this.values, String this.fallback)
    : type = RemoteOptionType.choice;
  const RemoteOptionSpec.toggle(this.key, bool this.fallback)
    : type = RemoteOptionType.toggle,
      values = const [];
  const RemoteOptionSpec.multi(
    this.key,
    this.values,
    List<String> this.fallback,
  ) : type = RemoteOptionType.multi;

  final String key;
  final RemoteOptionType type;
  final List<String> values;

  /// A `String` (choice), `bool` (toggle) or `List<String>` (multi).
  final Object fallback;

  /// [value] cleaned up to something this option accepts, or null: a known
  /// choice, a bool, or the known values of a list in [values]' order
  /// (never empty).
  Object? read(Object? value) {
    switch (type) {
      case RemoteOptionType.choice:
        return values.contains(value) ? value : null;
      case RemoteOptionType.toggle:
        return value is bool ? value : null;
      case RemoteOptionType.multi:
        if (value is! List) return null;
        final picked = [
          for (final v in values)
            if (value.contains(v)) v,
        ];
        return picked.isEmpty ? null : List<String>.unmodifiable(picked);
    }
  }
}

/// Every block option ([RemoteBlockInfo.options]).
abstract final class RemoteOptions {
  /// Left, centre or right; centre is how blocks always sat.
  static const align = RemoteOptionSpec.choice('align', [
    'left',
    'center',
    'right',
  ], 'center');

  /// The space above the block: `auto` keeps the screen's own spacing.
  static const gap = RemoteOptionSpec.choice('gap', [
    'auto',
    'none',
    'small',
    'large',
  ], 'auto');

  /// Cover corners: `auto` follows the Look's roundness.
  static const corners = RemoteOptionSpec.choice('corners', [
    'auto',
    'square',
    'rounded',
    'circle',
  ], 'auto');
  static const shadow = RemoteOptionSpec.toggle('shadow', false);

  /// Title lines; the compact title has one by default (see
  /// [RemoteBlockEntry.option]).
  static const titleLines = RemoteOptionSpec.choice('lines', [
    '1',
    '2',
    '3',
  ], '2');
  static const chapterLines = RemoteOptionSpec.choice('lines', [
    '1',
    '2',
    '3',
  ], '1');

  /// Right of the progress bar: the time left or the whole length.
  static const time = RemoteOptionSpec.choice('time', [
    'remaining',
    'total',
  ], 'remaining');

  /// What the bar and times cover: the chapter (or the book without
  /// chapters) or the whole book.
  static const span = RemoteOptionSpec.choice('span', [
    'chapter',
    'book',
  ], 'chapter');

  static const transportButtons = ['prev', 'back', 'play', 'forward', 'next'];
  static const buttons = RemoteOptionSpec.multi(
    'buttons',
    transportButtons,
    transportButtons,
  );
  static const skipSeconds = RemoteOptionSpec.toggle('skipSeconds', true);
  static const volumeStyle = RemoteOptionSpec.choice('style', [
    'slider',
    'buttons',
  ], 'slider');

  static const speedValues = [
    '0.75', '1', '1.1', '1.2', '1.25', '1.3', //
    '1.4', '1.5', '1.75', '2', '2.5', '3',
  ];
  static const speedPresets = RemoteOptionSpec.multi(
    'presets',
    speedValues,
    speedValues,
  );

  /// Sleep timer choices: minutes, and `chapter` for the end of the chapter.
  static const sleepValues = [
    '5', '10', '15', '20', '30', '45', '60', '90', 'chapter', //
  ];
  static const sleepPresets = RemoteOptionSpec.multi('presets', sleepValues, [
    '15',
    '30',
    '45',
    '60',
    'chapter',
  ]);

  /// `phone` follows the phone's setting.
  static const hours = RemoteOptionSpec.choice('hours', [
    'phone',
    '12',
    '24',
  ], 'phone');
  static const date = RemoteOptionSpec.toggle('date', false);
}

/// One block on the screen. Entries are compared by value; the editor tells
/// them apart by identity, so every entry is its own object (no const).
@immutable
class RemoteBlockEntry {
  RemoteBlockEntry(
    this.block, [
    RemoteBlockSize? size,
    Map<String, Object> options = const {},
  ]) : size = size != null && block.sizes.contains(size)
           ? size
           : block.defaultSize,
       options = _clean(block, options);

  final RemoteBlock block;
  final RemoteBlockSize size;

  /// The options set by the user (only valid ones; the rest use their
  /// fallback).
  final Map<String, Object> options;

  static Map<String, Object> _clean(RemoteBlock block, Map options) {
    if (options.isEmpty) return const {};
    final out = <String, Object>{};
    for (final spec in block.options) {
      final v = spec.read(options[spec.key]);
      if (v != null) out[spec.key] = v;
    }
    return Map.unmodifiable(out);
  }

  RemoteOptionSpec? _spec(String key) {
    for (final s in block.options) {
      if (s.key == key) return s;
    }
    return null;
  }

  /// The value of option [key]: what the user set, or its fallback (the
  /// compact title keeps its single line).
  Object? option(String key) {
    final set = options[key];
    if (set != null) return set;
    if (block == RemoteBlock.titleAuthor &&
        key == 'lines' &&
        size == RemoteBlockSize.compact) {
      return '1';
    }
    return _spec(key)?.fallback;
  }

  String choice(String key) => option(key) as String? ?? '';
  bool flag(String key) => option(key) == true;
  List<String> picked(String key) =>
      (option(key) as List?)?.cast<String>() ?? const [];

  RemoteBlockEntry withSize(RemoteBlockSize size) =>
      RemoteBlockEntry(block, size, options);

  RemoteBlockEntry withOption(String key, Object value) =>
      RemoteBlockEntry(block, size, {...options, key: value});

  /// The next size in [RemoteBlockInfo.sizes], wrapping around.
  RemoteBlockEntry nextSize() {
    final sizes = block.sizes;
    return withSize(sizes[(sizes.indexOf(size) + 1) % sizes.length]);
  }

  RemoteBlockEntry copy() => RemoteBlockEntry(block, size, options);

  Map<String, Object?> toJson() => {
    'block': block.name,
    'size': size.name,
    if (options.isNotEmpty) 'options': options,
  };

  /// Null for a block this version doesn't know. Unknown or bad options are
  /// dropped (version 1 had none).
  static RemoteBlockEntry? fromJson(Object? json) {
    if (json is! Map) return null;
    final block = _byName(RemoteBlock.values, json['block']);
    if (block == null) return null;
    final options = json['options'];
    return RemoteBlockEntry(
      block,
      _byName(RemoteBlockSize.values, json['size']),
      options is Map
          ? {
              for (final e in options.entries)
                if (e.key is String && e.value != null)
                  e.key as String: e.value as Object,
            }
          : const {},
    );
  }

  String get _optionsKey {
    if (options.isEmpty) return '';
    final keys = options.keys.toList()..sort();
    return jsonEncode({for (final k in keys) k: options[k]});
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteBlockEntry &&
      other.block == block &&
      other.size == size &&
      other._optionsKey == _optionsKey;

  @override
  int get hashCode => Object.hash(block, size, _optionsKey);

  @override
  String toString() =>
      '${block.name}/${size.name}${options.isEmpty ? '' : ' $options'}';
}

T? _byName<T extends Enum>(List<T> values, Object? name) {
  for (final v in values) {
    if (v.name == name) return v;
  }
  return null;
}

/// A column of the layout: portrait has one, landscape two.
enum RemoteColumn {
  portrait,
  left,
  right;

  bool get isLandscape => this != RemoteColumn.portrait;
}

/// Ready-made layouts.
enum RemotePreset { defaults, minimal, nightstand, full }

List<RemoteBlockEntry> _entries(List<Object> spec) => [
  for (final s in spec)
    s is RemoteBlock
        ? RemoteBlockEntry(s)
        : RemoteBlockEntry((s as (RemoteBlock, RemoteBlockSize)).$1, s.$2),
];

const _quickControls = [
  RemoteBlock.speed,
  RemoteBlock.sleep,
  RemoteBlock.chapters,
  RemoteBlock.bookmark,
  RemoteBlock.stop,
  RemoteBlock.volume,
];

/// The portrait and landscape layouts. Immutable: every edit returns a new one.
@immutable
class RemoteLayout {
  RemoteLayout({
    required List<RemoteBlockEntry> portrait,
    required List<RemoteBlockEntry> left,
    required List<RemoteBlockEntry> right,
  }) : portrait = List.unmodifiable(portrait),
       left = List.unmodifiable(left),
       right = List.unmodifiable(right);

  /// 2 added block options; version 1 saves load with their defaults.
  static const version = 2;

  final List<RemoteBlockEntry> portrait;
  final List<RemoteBlockEntry> left;
  final List<RemoteBlockEntry> right;

  /// The screen as it always looked; landscape: cover left, the rest right.
  factory RemoteLayout.defaults() => RemoteLayout.preset(RemotePreset.defaults);

  factory RemoteLayout.preset(RemotePreset preset) {
    switch (preset) {
      case RemotePreset.defaults:
        return RemoteLayout(
          portrait: _entries(const [
            RemoteBlock.cover,
            RemoteBlock.titleAuthor,
            RemoteBlock.chapterTitle,
            RemoteBlock.progress,
            RemoteBlock.transport,
            ..._quickControls,
          ]),
          left: _entries(const [(RemoteBlock.cover, RemoteBlockSize.large)]),
          right: _entries(const [
            RemoteBlock.titleAuthor,
            RemoteBlock.chapterTitle,
            RemoteBlock.progress,
            RemoteBlock.transport,
            ..._quickControls,
          ]),
        );
      case RemotePreset.minimal:
        const blocks = [
          RemoteBlock.titleAuthor,
          RemoteBlock.progress,
          RemoteBlock.transport,
        ];
        return RemoteLayout(
          portrait: _entries(blocks),
          left: const [],
          right: _entries(blocks),
        );
      case RemotePreset.nightstand:
        return RemoteLayout(
          portrait: _entries(const [
            (RemoteBlock.cover, RemoteBlockSize.large),
            (RemoteBlock.clock, RemoteBlockSize.large),
            RemoteBlock.timeLeft,
          ]),
          left: _entries(const [(RemoteBlock.cover, RemoteBlockSize.large)]),
          right: _entries(const [
            (RemoteBlock.clock, RemoteBlockSize.large),
            RemoteBlock.timeLeft,
          ]),
        );
      case RemotePreset.full:
        const rest = [
          RemoteBlock.titleAuthor,
          RemoteBlock.chapterTitle,
          RemoteBlock.progress,
          RemoteBlock.timeLeft,
          RemoteBlock.transport,
          RemoteBlock.speed,
          RemoteBlock.sleep,
          RemoteBlock.chapters,
          RemoteBlock.bookmark,
          RemoteBlock.continueListening,
          RemoteBlock.stop,
          RemoteBlock.volume,
        ];
        return RemoteLayout(
          portrait: _entries(const [
            RemoteBlock.clock,
            RemoteBlock.cover,
            ...rest,
          ]),
          left: _entries(const [(RemoteBlock.cover, RemoteBlockSize.large)]),
          right: _entries(const [RemoteBlock.clock, ...rest]),
        );
    }
  }

  List<RemoteBlockEntry> column(RemoteColumn c) => switch (c) {
    RemoteColumn.portrait => portrait,
    RemoteColumn.left => left,
    RemoteColumn.right => right,
  };

  RemoteLayout _with(RemoteColumn c, List<RemoteBlockEntry> blocks) =>
      RemoteLayout(
        portrait: c == RemoteColumn.portrait ? blocks : portrait,
        left: c == RemoteColumn.left ? blocks : left,
        right: c == RemoteColumn.right ? blocks : right,
      );

  /// Every block on screen in one orientation.
  Iterable<RemoteBlockEntry> shown({required bool landscape}) =>
      landscape ? [...left, ...right] : portrait;

  bool contains(RemoteBlock block, {required bool landscape}) =>
      shown(landscape: landscape).any((e) => e.block == block);

  /// Blocks that can be added in this orientation (the spacer always can).
  List<RemoteBlock> missing({required bool landscape}) => [
    for (final b in RemoteBlock.values)
      if (b.repeatable || !contains(b, landscape: landscape)) b,
  ];

  /// Moves the block at [from]/[fromIndex] to slot [toSlot] of [to]
  /// (0 = before the first block, `length` = after the last, counted in
  /// [to] as it is now). Only within one orientation.
  RemoteLayout move(
    RemoteColumn from,
    int fromIndex,
    RemoteColumn to,
    int toSlot,
  ) {
    if (from.isLandscape != to.isLandscape) return this;
    final source = column(from);
    if (fromIndex < 0 || fromIndex >= source.length) return this;
    final target = column(to);
    var slot = toSlot.clamp(0, target.length);
    if (from == to) {
      if (slot > fromIndex) slot--;
      if (slot == fromIndex) return this;
      final list = [...source];
      final entry = list.removeAt(fromIndex);
      list.insert(slot, entry);
      return _with(from, list);
    }
    final src = [...source];
    final entry = src.removeAt(fromIndex);
    final dst = [...target]..insert(slot, entry);
    return _with(from, src)._with(to, dst);
  }

  /// Adds [block] at the end of [to]; a block already shown in that
  /// orientation (other than the spacer) is left where it is.
  RemoteLayout add(RemoteColumn to, RemoteBlock block) {
    if (!block.repeatable && contains(block, landscape: to.isLandscape)) {
      return this;
    }
    return _with(to, [...column(to), RemoteBlockEntry(block)]);
  }

  RemoteLayout remove(RemoteColumn c, int index) {
    final list = [...column(c)];
    if (index < 0 || index >= list.length) return this;
    list.removeAt(index);
    return _with(c, list);
  }

  RemoteLayout cycleSize(RemoteColumn c, int index) {
    final list = [...column(c)];
    if (index < 0 || index >= list.length) return this;
    return replace(c, index, list[index].nextSize());
  }

  /// [entry] in place of the block at [index] of [c] (its size or options
  /// changed).
  RemoteLayout replace(RemoteColumn c, int index, RemoteBlockEntry entry) {
    final list = [...column(c)];
    if (index < 0 || index >= list.length) return this;
    list[index] = entry;
    return _with(c, list);
  }

  /// Every entry passed through [f] (used by migrations).
  RemoteLayout map(RemoteBlockEntry Function(RemoteBlockEntry) f) =>
      RemoteLayout(
        portrait: [for (final e in portrait) f(e)],
        left: [for (final e in left) f(e)],
        right: [for (final e in right) f(e)],
      );

  /// [preset] for one orientation, leaving the other as it is.
  RemoteLayout applyPreset(RemotePreset preset, {required bool landscape}) {
    final p = RemoteLayout.preset(preset);
    return landscape
        ? RemoteLayout(portrait: portrait, left: p.left, right: p.right)
        : RemoteLayout(portrait: p.portrait, left: left, right: right);
  }

  /// Back to the default for one orientation.
  RemoteLayout reset({required bool landscape}) =>
      applyPreset(RemotePreset.defaults, landscape: landscape);

  Map<String, Object?> toJson() => {
    'version': version,
    'portrait': [for (final e in portrait) e.toJson()],
    'landscapeLeft': [for (final e in left) e.toJson()],
    'landscapeRight': [for (final e in right) e.toJson()],
  };

  /// Reads a saved layout: unknown blocks are dropped, duplicates kept once,
  /// missing blocks are not added back, and a missing or unreadable
  /// orientation falls back to the default.
  factory RemoteLayout.fromJson(Object? json) {
    final d = RemoteLayout.defaults();
    if (json is! Map) return d;
    List<RemoteBlockEntry>? read(Object? list, Set<RemoteBlock> seen) {
      if (list is! List) return null;
      final out = <RemoteBlockEntry>[];
      for (final item in list) {
        final e = RemoteBlockEntry.fromJson(item);
        if (e == null) continue;
        if (!e.block.repeatable && !seen.add(e.block)) continue;
        out.add(e);
      }
      return out;
    }

    final portrait = read(json['portrait'], {});
    final landscape = <RemoteBlock>{};
    final left = read(json['landscapeLeft'], landscape);
    final right = read(json['landscapeRight'], landscape);
    final landscapeOk = left != null && right != null;
    return RemoteLayout(
      portrait: portrait ?? d.portrait,
      left: landscapeOk ? left : d.left,
      right: landscapeOk ? right : d.right,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteLayout &&
      listEquals(other.portrait, portrait) &&
      listEquals(other.left, left) &&
      listEquals(other.right, right);

  @override
  int get hashCode => Object.hash(
    Object.hashAll(portrait),
    Object.hashAll(left),
    Object.hashAll(right),
  );
}

/// What the remote shows behind its blocks.
enum RemoteLookBackground { theme, cover, black, gradient }

/// The play button and the small buttons: filled (as always), outlined, or
/// plain icons.
enum RemoteButtonStyle { filled, outlined, plain }

/// How round the cover and the buttons are.
enum RemoteCorners {
  sharp(0),
  rounded(16),
  extraRound(32);

  const RemoteCorners(this.coverRadius);
  final double coverRadius;
}

enum RemoteSpacing {
  compact(0.5),
  comfortable(1.0);

  const RemoteSpacing(this.gapScale);
  final double gapScale;
}

enum RemoteTextSize {
  normal(1.0),
  large(1.25),
  huge(1.5);

  const RemoteTextSize(this.scale);
  final double scale;
}

/// The whole remote's look, saved on the phone. The defaults are Absorb's
/// normal look.
@immutable
class RemoteLook {
  const RemoteLook({
    this.accent = accentTheme,
    this.background = RemoteLookBackground.theme,
    this.buttons = RemoteButtonStyle.filled,
    this.corners = RemoteCorners.rounded,
    this.spacing = RemoteSpacing.comfortable,
    this.textSize = RemoteTextSize.normal,
    this.dimAfterMinutes = 0,
  });

  static const version = 1;

  /// Accent choices: the app theme, the cover's colour, or a swatch
  /// (`p0`..`p7`, [palette]).
  static const accentTheme = 'theme';
  static const accentCover = 'cover';
  static const palette = [
    Color(0xFFE53935),
    Color(0xFFFB8C00),
    Color(0xFFFDD835),
    Color(0xFF43A047),
    Color(0xFF00897B),
    Color(0xFF1E88E5),
    Color(0xFF5E35B1),
    Color(0xFFD81B60),
  ];
  static List<String> get accents => [
    accentTheme,
    accentCover,
    for (var i = 0; i < palette.length; i++) 'p$i',
  ];

  /// Dim choices in minutes; 0 is never.
  static const dimChoices = [0, 5, 10, 30];

  final String accent;
  final RemoteLookBackground background;
  final RemoteButtonStyle buttons;
  final RemoteCorners corners;
  final RemoteSpacing spacing;
  final RemoteTextSize textSize;

  /// Full screen dims after this many minutes without a touch; 0 never.
  final int dimAfterMinutes;

  /// The swatch picked as the accent, if one is.
  Color? get swatch {
    if (!accent.startsWith('p')) return null;
    final i = int.tryParse(accent.substring(1));
    return i != null && i >= 0 && i < palette.length ? palette[i] : null;
  }

  /// Whether the blocks need the cover's colour.
  bool get usesCoverColor =>
      accent == accentCover || background == RemoteLookBackground.gradient;

  /// Light text on a dark background, whatever the app theme.
  bool get darkBackground =>
      background == RemoteLookBackground.cover ||
      background == RemoteLookBackground.black;

  RemoteLook copyWith({
    String? accent,
    RemoteLookBackground? background,
    RemoteButtonStyle? buttons,
    RemoteCorners? corners,
    RemoteSpacing? spacing,
    RemoteTextSize? textSize,
    int? dimAfterMinutes,
  }) => RemoteLook(
    accent: accent ?? this.accent,
    background: background ?? this.background,
    buttons: buttons ?? this.buttons,
    corners: corners ?? this.corners,
    spacing: spacing ?? this.spacing,
    textSize: textSize ?? this.textSize,
    dimAfterMinutes: dimAfterMinutes ?? this.dimAfterMinutes,
  );

  Map<String, Object?> toJson() => {
    'version': version,
    'accent': accent,
    'background': background.name,
    'buttons': buttons.name,
    'corners': corners.name,
    'spacing': spacing.name,
    'textSize': textSize.name,
    'dimAfterMinutes': dimAfterMinutes,
  };

  factory RemoteLook.fromJson(Object? json) {
    const d = RemoteLook();
    if (json is! Map) return d;
    final accent = json['accent'];
    final dim = json['dimAfterMinutes'];
    return RemoteLook(
      accent: accents.contains(accent) ? accent as String : d.accent,
      background:
          _byName(RemoteLookBackground.values, json['background']) ??
          d.background,
      buttons: _byName(RemoteButtonStyle.values, json['buttons']) ?? d.buttons,
      corners: _byName(RemoteCorners.values, json['corners']) ?? d.corners,
      spacing: _byName(RemoteSpacing.values, json['spacing']) ?? d.spacing,
      textSize: _byName(RemoteTextSize.values, json['textSize']) ?? d.textSize,
      dimAfterMinutes: dimChoices.contains(dim) ? dim as int : 0,
    );
  }

  /// The old display mode's options (`fork_remote_display`, before the
  /// Look): its background, text size and dimming carry over.
  factory RemoteLook.fromDisplayJson(Object? json) {
    if (json is! Map) return const RemoteLook();
    final dim = json['dimAfterMinutes'];
    return RemoteLook(
      background:
          _byName(RemoteLookBackground.values, json['background']) ??
          RemoteLookBackground.theme,
      textSize:
          _byName(RemoteTextSize.values, json['textSize']) ??
          RemoteTextSize.normal,
      dimAfterMinutes: dimChoices.contains(dim) ? dim as int : 0,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteLook &&
      other.accent == accent &&
      other.background == background &&
      other.buttons == buttons &&
      other.corners == corners &&
      other.spacing == spacing &&
      other.textSize == textSize &&
      other.dimAfterMinutes == dimAfterMinutes;

  @override
  int get hashCode => Object.hash(
    accent,
    background,
    buttons,
    corners,
    spacing,
    textSize,
    dimAfterMinutes,
  );
}

/// What [RemoteLayoutStore.load] reads.
typedef RemoteSaved = ({RemoteLayout layout, RemoteLook look, bool hintShown});

/// Saves the layout and the look on the phone (all devices share them; not
/// per computer).
class RemoteLayoutStore {
  RemoteLayoutStore._();

  static const layoutKey = 'fork_remote_layout';
  static const lookKey = 'fork_remote_look';

  /// The old display mode's options; read once to start the Look.
  static const displayKey = 'fork_remote_display';

  /// Whether the "Tap empty space to exit full screen" hint was shown.
  static const hintKey = 'fork_remote_full_screen_hint';

  static Object? _decode(String? raw) {
    if (raw == null) return null;
    try {
      return jsonDecode(raw);
    } catch (e) {
      swallow('RemoteLayout', e);
      return null;
    }
  }

  static Future<RemoteSaved> load() async {
    final prefs = await SharedPreferences.getInstance();
    var layout = RemoteLayout.fromJson(_decode(prefs.getString(layoutKey)));
    final lookRaw = prefs.getString(lookKey);
    final RemoteLook look;
    if (lookRaw != null) {
      look = RemoteLook.fromJson(_decode(lookRaw));
    } else {
      // Before the Look: the display mode's options, and its 24-hour
      // switch moves to the clocks.
      final display = _decode(prefs.getString(displayKey));
      look = RemoteLook.fromDisplayJson(display);
      if (display is Map && display['use24Hour'] == true) {
        layout = layout.map(
          (e) => e.block == RemoteBlock.clock && e.options['hours'] == null
              ? e.withOption('hours', '24')
              : e,
        );
      }
    }
    return (
      layout: layout,
      look: look,
      hintShown: prefs.getBool(hintKey) ?? false,
    );
  }

  static Future<void> saveLayout(RemoteLayout layout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(layoutKey, jsonEncode(layout.toJson()));
  }

  static Future<void> saveLook(RemoteLook look) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lookKey, jsonEncode(look.toJson()));
  }

  static Future<void> saveHintShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(hintKey, true);
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/fork_errors.dart';

/// The phone remote's layout as data (fork): which blocks the "Control your
/// computer" screen shows, in what order and size, for portrait (one column)
/// and landscape (two columns), plus the display mode's options. Saved on
/// the phone as versioned JSON; see `docs/design/phone-remote.md` (layout).

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
    RemoteBlock.chapterTitle => const [RemoteBlockSize.normal],
    _ => const [RemoteBlockSize.normal, RemoteBlockSize.compact],
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

/// One block on the screen. Entries are compared by value; the editor tells
/// them apart by identity, so every entry is its own object (no const).
@immutable
class RemoteBlockEntry {
  RemoteBlockEntry(this.block, [RemoteBlockSize? size])
    : size = size != null && block.sizes.contains(size)
          ? size
          : block.defaultSize;

  final RemoteBlock block;
  final RemoteBlockSize size;

  RemoteBlockEntry withSize(RemoteBlockSize size) =>
      RemoteBlockEntry(block, size);

  /// The next size in [RemoteBlockInfo.sizes], wrapping around.
  RemoteBlockEntry nextSize() {
    final sizes = block.sizes;
    return withSize(sizes[(sizes.indexOf(size) + 1) % sizes.length]);
  }

  RemoteBlockEntry copy() => RemoteBlockEntry(block, size);

  Map<String, Object?> toJson() => {'block': block.name, 'size': size.name};

  /// Null for a block this version doesn't know.
  static RemoteBlockEntry? fromJson(Object? json) {
    if (json is! Map) return null;
    final block = _byName(RemoteBlock.values, json['block']);
    if (block == null) return null;
    return RemoteBlockEntry(
      block,
      _byName(RemoteBlockSize.values, json['size']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteBlockEntry && other.block == block && other.size == size;

  @override
  int get hashCode => Object.hash(block, size);

  @override
  String toString() => '${block.name}/${size.name}';
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

  static const version = 1;

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
            RemoteBlock.clock,
            RemoteBlock.timeLeft,
          ]),
          left: _entries(const [(RemoteBlock.cover, RemoteBlockSize.large)]),
          right: _entries(const [RemoteBlock.clock, RemoteBlock.timeLeft]),
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
    list[index] = list[index].nextSize();
    return _with(c, list);
  }

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

/// What the display mode shows behind its text.
enum RemoteDisplayBackground { theme, cover, black }

enum RemoteDisplayTextSize {
  normal(1.0),
  large(1.25),
  huge(1.5);

  const RemoteDisplayTextSize(this.scale);
  final double scale;
}

/// The display mode's options.
@immutable
class RemoteDisplayOptions {
  const RemoteDisplayOptions({
    this.background = RemoteDisplayBackground.theme,
    this.textSize = RemoteDisplayTextSize.normal,
    this.showClock = true,
    this.use24Hour = false,
    this.dimAfterMinutes = 0,
  });

  static const version = 1;

  /// Dim choices in minutes; 0 is never.
  static const dimChoices = [0, 5, 10, 30];

  final RemoteDisplayBackground background;
  final RemoteDisplayTextSize textSize;
  final bool showClock;

  /// Always 24-hour; off follows the phone's setting.
  final bool use24Hour;
  final int dimAfterMinutes;

  RemoteDisplayOptions copyWith({
    RemoteDisplayBackground? background,
    RemoteDisplayTextSize? textSize,
    bool? showClock,
    bool? use24Hour,
    int? dimAfterMinutes,
  }) => RemoteDisplayOptions(
    background: background ?? this.background,
    textSize: textSize ?? this.textSize,
    showClock: showClock ?? this.showClock,
    use24Hour: use24Hour ?? this.use24Hour,
    dimAfterMinutes: dimAfterMinutes ?? this.dimAfterMinutes,
  );

  Map<String, Object?> toJson() => {
    'version': version,
    'background': background.name,
    'textSize': textSize.name,
    'showClock': showClock,
    'use24Hour': use24Hour,
    'dimAfterMinutes': dimAfterMinutes,
  };

  factory RemoteDisplayOptions.fromJson(Object? json) {
    const d = RemoteDisplayOptions();
    if (json is! Map) return d;
    final dim = json['dimAfterMinutes'];
    return RemoteDisplayOptions(
      background:
          _byName(RemoteDisplayBackground.values, json['background']) ??
          d.background,
      textSize:
          _byName(RemoteDisplayTextSize.values, json['textSize']) ?? d.textSize,
      showClock: json['showClock'] is bool
          ? json['showClock'] as bool
          : d.showClock,
      use24Hour: json['use24Hour'] is bool
          ? json['use24Hour'] as bool
          : d.use24Hour,
      dimAfterMinutes: dimChoices.contains(dim) ? dim as int : 0,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RemoteDisplayOptions &&
      other.background == background &&
      other.textSize == textSize &&
      other.showClock == showClock &&
      other.use24Hour == use24Hour &&
      other.dimAfterMinutes == dimAfterMinutes;

  @override
  int get hashCode =>
      Object.hash(background, textSize, showClock, use24Hour, dimAfterMinutes);
}

/// Saves the layout and display options on the phone (all devices share
/// them; not per computer).
class RemoteLayoutStore {
  RemoteLayoutStore._();

  static const layoutKey = 'fork_remote_layout';
  static const displayKey = 'fork_remote_display';

  static Object? _decode(String? raw) {
    if (raw == null) return null;
    try {
      return jsonDecode(raw);
    } catch (e) {
      swallow('RemoteLayout', e);
      return null;
    }
  }

  static Future<(RemoteLayout, RemoteDisplayOptions)> load() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      RemoteLayout.fromJson(_decode(prefs.getString(layoutKey))),
      RemoteDisplayOptions.fromJson(_decode(prefs.getString(displayKey))),
    );
  }

  static Future<void> saveLayout(RemoteLayout layout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(layoutKey, jsonEncode(layout.toJson()));
  }

  static Future<void> saveDisplay(RemoteDisplayOptions options) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(displayKey, jsonEncode(options.toJson()));
  }
}

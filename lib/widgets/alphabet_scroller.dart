import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../l10n/app_localizations.dart';
import '../screens/library_screen.dart' show LibrarySort;

/// The rail's letters, top to bottom for an A-Z list.
const alphabetScrollerLetters = [
  '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', //
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
];

/// Lists shorter than this get no rail: a flick reaches any letter anyway.
const alphabetScrollerMinItems = 40;

const _accents = {
  'A': 'ÀÁÂÃÄÅĀĂĄ',
  'C': 'ÇĆČ',
  'D': 'Ď',
  'E': 'ÈÉÊËĒĖĘĚ',
  'I': 'ÌÍÎÏĪĮ',
  'L': 'Ł',
  'N': 'ÑŃŇ',
  'O': 'ÒÓÔÕÖØŌŐ',
  'R': 'Ř',
  'S': 'ŚŠŞ',
  'T': 'Ť',
  'U': 'ÙÚÛÜŪŮŰ',
  'Y': 'ÝŸ',
  'Z': 'ŹŻŽ',
};

/// The rail letter [text] files under: its first letter without accents,
/// or '#' for digits, symbols, other scripts and empty text.
String alphabetLetterOf(String? text) {
  final trimmed = (text ?? '').trimLeft();
  if (trimmed.isEmpty) return '#';
  final first = String.fromCharCode(trimmed.runes.first).toUpperCase();
  if (first.length == 1 &&
      first.codeUnitAt(0) >= 0x41 &&
      first.codeUnitAt(0) <= 0x5A) {
    return first;
  }
  for (final MapEntry(key: letter, value: forms) in _accents.entries) {
    if (forms.contains(first)) return letter;
  }
  return '#';
}

int _rank(String letter) => alphabetScrollerLetters.indexOf(letter);

/// Where the rail sends [letter] in a list whose items file under
/// [letters]: the first item at that letter, else the first one past it in
/// list order. Null when every item comes before it (more may still load).
int? alphabetJumpIndex(
  List<String> letters,
  String letter, {
  bool descending = false,
}) {
  final exact = letters.indexOf(letter);
  if (exact >= 0) return exact;
  final target = _rank(letter);
  for (var i = 0; i < letters.length; i++) {
    final rank = _rank(letters[i]);
    if (descending ? rank < target : rank > target) return i;
  }
  return null;
}

/// Whether the library grid gets a rail with this sort order.
bool librarySortHasAlphabet(LibrarySort sort) =>
    sort == LibrarySort.alphabetical ||
    sort == LibrarySort.authorName ||
    sort == LibrarySort.authorFirstLast;

/// The rail letter of every library grid item for [sort]. Titles may be
/// sorted with or without "The"/"A" (a server setting), so both readings
/// are tried and the one that fits the list's order wins.
List<String> libraryAlphabetLetters(
  List<Map<String, dynamic>> items, {
  required LibrarySort sort,
  required bool podcast,
  bool descending = false,
}) {
  Map<String, dynamic> metadataOf(Map<String, dynamic> item) {
    final media = item['media'];
    final metadata = media is Map<String, dynamic> ? media['metadata'] : null;
    return metadata is Map<String, dynamic> ? metadata : const {};
  }

  String? text(Map<String, dynamic> item, {required bool ignorePrefix}) {
    if (sort != LibrarySort.alphabetical) {
      final m = metadataOf(item);
      if (podcast) return m['author'] as String?;
      return (sort == LibrarySort.authorFirstLast
              ? m['authorName']
              : m['authorNameLF'] ?? m['authorName'])
          as String?;
    }
    final series = item['collapsedSeries'];
    if (series is Map<String, dynamic>) {
      return (ignorePrefix ? series['nameIgnorePrefix'] ?? series['name']
          : series['name']) as String?;
    }
    final m = metadataOf(item);
    return (ignorePrefix ? m['titleIgnorePrefix'] ?? m['title'] : m['title'])
        as String?;
  }

  List<String> read(bool ignorePrefix) => [
        for (final item in items)
          alphabetLetterOf(text(item, ignorePrefix: ignorePrefix)),
      ];

  final plain = read(false);
  if (sort != LibrarySort.alphabetical) return plain;
  final ignoring = read(true);
  int outOfOrder(List<String> letters) {
    var count = 0;
    for (var i = 1; i < letters.length; i++) {
      final step = _rank(letters[i]) - _rank(letters[i - 1]);
      if (descending ? step > 0 : step < 0) count++;
    }
    return count;
  }

  return outOfOrder(ignoring) < outOfOrder(plain) ? ignoring : plain;
}

/// The library grid's A-Z rail, wired to library_screen's state.
class LibraryAlphabetRail extends StatelessWidget {
  const LibraryAlphabetRail({
    super.key,
    required this.sort,
    required this.descending,
    required this.podcast,
    required this.items,
    required this.hasMore,
    required this.onLoadMore,
    required this.controller,
    required this.child,
    this.generation = 0,
  });

  final LibrarySort sort;
  final bool descending;
  final bool podcast;
  final List<Map<String, dynamic>> items;
  final bool hasMore;
  final VoidCallback onLoadMore;
  final ScrollController controller;
  final Widget child;

  /// Changes whenever [items] is cleared or refilled. library_screen keeps
  /// one list object and refills it in place, so neither its identity nor its
  /// length tells a new filter's first page from the old list.
  final int generation;

  // The grid rebuilds on every provider change; the letters only change
  // when a page arrives or the list is refilled, or the sort changes.
  static ({Object key, List<String> letters})? _cache;

  List<String> _letters() {
    final key = (
      sort,
      podcast,
      descending,
      generation,
      items.length,
      items.first['id'],
      items.last['id'],
    );
    final cached = _cache;
    if (cached != null && cached.key == key) return cached.letters;
    final letters = libraryAlphabetLetters(
      items,
      sort: sort,
      podcast: podcast,
      descending: descending,
    );
    _cache = (key: key, letters: letters);
    return letters;
  }

  @override
  Widget build(BuildContext context) {
    final enabled = librarySortHasAlphabet(sort) &&
        items.length >= alphabetScrollerMinItems;
    if (!enabled) _cache = null; // the list is being refilled
    return AlphabetScroller(
      controller: controller,
      enabled: enabled,
      letters: enabled ? _letters() : const [],
      descending: descending,
      hasMore: hasMore,
      onLoadMore: onLoadMore,
      child: child,
    );
  }
}

/// Where the rail reads the grid's layout from. The grid and its header
/// report their sliver layout here as they lay out ([reportGrid],
/// [reportHeader]), so the rail never has to search the render tree for
/// them, and a change to the slivers around the grid can't break it.
class AlphabetGridLayout {
  SliverConstraints? _gridConstraints;
  SliverGridDelegate? _gridDelegate;
  SliverGeometry? _headerGeometry;

  /// The layout of the nearest [AlphabetScroller] above [context], if any.
  static AlphabetGridLayout? maybeOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<_AlphabetGridLayoutScope>()
      ?.layout;

  /// [grid], reporting its layout to the rail above [context]. Unchanged
  /// when there is no rail.
  static Widget reportGrid(BuildContext context, SliverGrid grid) {
    final layout = maybeOf(context);
    if (layout == null) return grid;
    return _SliverLayoutReport(
      onLayout: (constraints, _) {
        layout._gridConstraints = constraints;
        layout._gridDelegate = grid.gridDelegate;
      },
      onDetach: () {
        layout._gridConstraints = null;
        layout._gridDelegate = null;
      },
      sliver: grid,
    );
  }

  /// [header], the scroll view's first sliver, reporting how much of it is
  /// on screen so the rail stays below it. Unchanged when there is no rail.
  static Widget reportHeader(BuildContext context, Widget header) {
    final layout = maybeOf(context);
    if (layout == null) return header;
    return _SliverLayoutReport(
      onLayout: (_, geometry) => layout._headerGeometry = geometry,
      onDetach: () => layout._headerGeometry = null,
      sliver: header,
    );
  }

  /// The scroll offset of the grid row holding item [index], or null while
  /// the grid hasn't been laid out.
  double? scrollOffsetOf(int index) {
    final constraints = _gridConstraints;
    final delegate = _gridDelegate;
    if (constraints == null || delegate == null) return null;
    final row =
        delegate.getLayout(constraints).getGeometryForChildIndex(index);
    return constraints.precedingScrollExtent + row.scrollOffset;
  }

  /// How much of the header is on screen now.
  double get headerPaintExtent => _headerGeometry?.paintExtent ?? 0;

  /// How tall the header is when fully shown.
  double get headerMaxExtent => _headerGeometry?.maxPaintExtent ?? 0;
}

class _AlphabetGridLayoutScope extends InheritedWidget {
  const _AlphabetGridLayoutScope({required this.layout, required super.child});

  final AlphabetGridLayout layout;

  @override
  bool updateShouldNotify(_AlphabetGridLayoutScope oldWidget) =>
      layout != oldWidget.layout;
}

class _SliverLayoutReport extends SingleChildRenderObjectWidget {
  const _SliverLayoutReport({
    required this.onLayout,
    required this.onDetach,
    required Widget sliver,
  }) : super(child: sliver);

  final void Function(SliverConstraints, SliverGeometry) onLayout;
  final VoidCallback onDetach;

  @override
  _RenderSliverLayoutReport createRenderObject(BuildContext context) =>
      _RenderSliverLayoutReport(onLayout, onDetach);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSliverLayoutReport renderObject,
  ) {
    renderObject
      ..onLayout = onLayout
      ..onDetach = onDetach;
  }
}

class _RenderSliverLayoutReport extends RenderProxySliver {
  _RenderSliverLayoutReport(this.onLayout, this.onDetach);

  void Function(SliverConstraints, SliverGeometry) onLayout;
  VoidCallback onDetach;

  @override
  void performLayout() {
    super.performLayout();
    onLayout(constraints, geometry!);
  }

  @override
  void detach() {
    onDetach();
    super.detach();
  }
}

/// A slim letter rail on the right edge of a scrolling grid. With a mouse it
/// shows while the pointer is near the edge or the list scrolls; on touch it
/// shows while scrolling and can be dragged. Picking a letter jumps to its
/// first item, loading further pages (up to [maxAutoLoads]) when that letter
/// hasn't arrived yet. A small bubble shows the letter while dragging.
class AlphabetScroller extends StatefulWidget {
  const AlphabetScroller({
    super.key,
    required this.controller,
    required this.letters,
    required this.child,
    this.enabled = true,
    this.descending = false,
    this.hasMore = false,
    this.onLoadMore,
    this.maxAutoLoads = 12,
  });

  /// The grid's scroll controller.
  final ScrollController controller;

  /// The rail letter of each grid item, in grid order.
  final List<String> letters;
  final Widget child;
  final bool enabled;
  final bool descending;
  final bool hasMore;
  final VoidCallback? onLoadMore;

  /// How many extra pages one jump may load looking for its letter.
  final int maxAutoLoads;

  @override
  State<AlphabetScroller> createState() => AlphabetScrollerState();
}

@visibleForTesting
class AlphabetScrollerState extends State<AlphabetScroller> {
  static const _railWidth = 24.0;

  /// Room left at the right edge for the scrollbar Flutter adds on desktop,
  /// so the rail never takes the presses meant for its thumb or track.
  static const _desktopScrollbarRoom = 16.0;
  static const _hideAfter = Duration(milliseconds: 1500);

  final _layout = AlphabetGridLayout();
  bool _hovering = false;
  bool _dragging = false;
  bool _recentlyActive = false;
  Timer? _hideTimer;
  String? _current;
  double _bubbleY = 0;
  double _topInset = 0;

  // A letter still being looked for while more pages load.
  String? _pending;
  int _autoLoads = 0;

  bool get railVisible =>
      widget.enabled && (_hovering || _dragging || _recentlyActive);

  @override
  void didUpdateWidget(AlphabetScroller oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled || widget.letters.length < oldWidget.letters.length) {
      _pending = null; // a new sort, filter or refresh
    }
    final pending = _pending;
    if (pending != null &&
        (widget.letters.length != oldWidget.letters.length ||
            widget.hasMore != oldWidget.hasMore)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _pending == pending) _jumpTo(pending);
      });
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _poke() {
    _hideTimer?.cancel();
    if (!_recentlyActive) setState(() => _recentlyActive = true);
    _hideTimer = Timer(_hideAfter, () {
      if (mounted) setState(() => _recentlyActive = false);
    });
  }

  /// Picks [letter] as if the user had tapped it on the rail.
  @visibleForTesting
  void selectLetter(String letter) {
    _autoLoads = 0;
    _jumpTo(letter);
  }

  void _jumpTo(String letter) {
    final letters = widget.letters;
    if (letters.isEmpty) return;
    final index =
        alphabetJumpIndex(letters, letter, descending: widget.descending);
    if (index != null) {
      _pending = null;
      _scrollToIndex(index);
      return;
    }
    _scrollToIndex(letters.length - 1);
    final loadMore = widget.onLoadMore;
    if (widget.hasMore && loadMore != null && _autoLoads < widget.maxAutoLoads) {
      _pending = letter;
      _autoLoads++;
      loadMore();
    } else {
      _pending = null;
    }
  }

  void _scrollToIndex(int index) {
    if (!widget.controller.hasClients) return;
    final offset = _layout.scrollOffsetOf(index);
    if (offset == null) return; // the grid isn't laid out yet
    var target = offset;
    final position = widget.controller.position;
    // Scrolling back brings a floating header down over the first row.
    if (target < position.pixels) target -= _layout.headerMaxExtent;
    widget.controller.jumpTo(
      target.clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  /// Keeps the rail below the header while it is on screen.
  void _measureTopInset() {
    final inset = _layout.headerPaintExtent;
    if ((inset - _topInset).abs() > 1) setState(() => _topInset = inset);
  }

  bool _onScroll(ScrollNotification notification) {
    if (!widget.enabled || notification.depth != 0) return false;
    if (notification is ScrollUpdateNotification && !_dragging) {
      _poke();
    }
    _measureTopInset();
    return false;
  }

  void _pickAt(double dy, double height, {bool start = false}) {
    final letters = _railLetters;
    final i = (dy / height * letters.length)
        .floor()
        .clamp(0, letters.length - 1);
    final letter = letters[i];
    final changed = start || letter != _current;
    setState(() {
      _dragging = true;
      _bubbleY = dy.clamp(0, height);
      _current = letter;
    });
    // One budget of page loads per tap or drag, not per letter crossed, or
    // a slow drag down the rail would page in the whole library.
    if (start) _autoLoads = 0;
    if (changed) _jumpTo(letter);
  }

  List<String> get _railLetters => widget.descending
      ? alphabetScrollerLetters.reversed.toList()
      : alphabetScrollerLetters;

  void _endDrag() {
    setState(() => _dragging = false);
    _poke();
  }

  @override
  Widget build(BuildContext context) {
    // The same tree with the rail on or off, so the grid keeps its state
    // when a growing list turns the rail on.
    final child = _AlphabetGridLayoutScope(
      layout: _layout,
      child: NotificationListener<ScrollNotification>(
        onNotification: _onScroll,
        child: widget.child,
      ),
    );
    if (!widget.enabled) {
      return Stack(fit: StackFit.passthrough, children: [child]);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _measureTopInset();
    });
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final letters = _railLetters;
    // Clear of the bottom navigation bar and mini player on phones.
    final bottom = 112 + MediaQuery.paddingOf(context).bottom;
    final right = switch (ScrollConfiguration.of(context).getPlatform(context)) {
      TargetPlatform.windows ||
      TargetPlatform.linux ||
      TargetPlatform.macOS => 2 + _desktopScrollbarRoom,
      _ => 2.0,
    };

    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned(
          top: _topInset + 8,
          bottom: bottom,
          right: right,
          width: _railWidth,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;
              return MouseRegion(
                hitTestBehavior: HitTestBehavior.translucent,
                onEnter: (_) => setState(() => _hovering = true),
                onExit: (_) {
                  setState(() => _hovering = false);
                  _poke();
                },
                child: IgnorePointer(
                  ignoring: !railVisible,
                  child: AnimatedOpacity(
                    opacity: railVisible ? 1 : 0,
                    duration: reduceMotion
                        ? Duration.zero
                        : const Duration(milliseconds: 150),
                    child: Semantics(
                      container: true,
                      label: AppLocalizations.of(context)!
                          .alphabetScrollerLabel,
                      child: GestureDetector(
                        key: const ValueKey('alphabet-rail'),
                        behavior: HitTestBehavior.opaque,
                        dragStartBehavior: DragStartBehavior.down,
                        onTapDown: (d) =>
                            _pickAt(d.localPosition.dy, height, start: true),
                        onTapUp: (_) => _endDrag(),
                        onTapCancel: () {
                          if (_dragging) _endDrag();
                        },
                        onVerticalDragStart: (d) =>
                            _pickAt(d.localPosition.dy, height, start: true),
                        onVerticalDragUpdate: (d) =>
                            _pickAt(d.localPosition.dy, height),
                        onVerticalDragEnd: (_) => _endDrag(),
                        onVerticalDragCancel: _endDrag,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: cs.surfaceContainerHigh
                                .withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              for (final letter in letters)
                                Expanded(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        letter,
                                        style: tt.labelSmall?.copyWith(
                                          fontSize: 10,
                                          fontWeight: letter == _current
                                              ? FontWeight.w800
                                              : FontWeight.w600,
                                          color: letter == _current
                                              ? cs.primary
                                              : cs.onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (_dragging && _current != null)
          Positioned(
            right: right + _railWidth + 10,
            top: _topInset + 8 + math.max(0, _bubbleY - 24),
            child: IgnorePointer(
              child: Container(
                key: const ValueKey('alphabet-bubble'),
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _current!,
                  style: tt.headlineSmall?.copyWith(
                    color: cs.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

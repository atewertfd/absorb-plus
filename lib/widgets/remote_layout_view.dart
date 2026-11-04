import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_layout.dart';
import 'adaptive_modal.dart';

/// Lays out the phone remote's blocks from a [RemoteLayout] (fork): one
/// column in portrait, two in landscape, and in edit mode drag handles,
/// a remove button and a size toggle on every block. The blocks themselves
/// come from the screen through [RemoteLayoutView.buildBlock].

/// Where a block is drawn: the room it has.
@immutable
class RemoteBlockSlot {
  const RemoteBlockSlot({
    required this.maxWidth,
    required this.maxHeight,
    required this.landscape,
  });

  final double maxWidth;
  final double maxHeight;
  final bool landscape;
}

/// Builds one block, or null when it has nothing to show right now (no
/// chapter title, say).
typedef RemoteBlockBuilder =
    Widget? Function(
      BuildContext context,
      RemoteBlockEntry entry,
      RemoteBlockSlot slot,
    );

class RemoteLayoutView extends StatefulWidget {
  const RemoteLayoutView({
    super.key,
    required this.layout,
    required this.landscape,
    required this.buildBlock,
    this.editing = false,
    this.onChanged,
  });

  final RemoteLayout layout;
  final bool landscape;
  final bool editing;
  final RemoteBlockBuilder buildBlock;
  final ValueChanged<RemoteLayout>? onChanged;

  /// The space above a block, so the default layout keeps the screen's
  /// original spacing.
  static double gapBefore(RemoteBlockEntry? previous, RemoteBlockEntry e) {
    if (previous == null) return 0;
    if (e.block.isInline && previous.block.isInline) return 0;
    return switch (e.block) {
      RemoteBlock.cover || RemoteBlock.titleAuthor => 20,
      RemoteBlock.chapterTitle => 4,
      RemoteBlock.progress => 16,
      RemoteBlock.timeLeft || RemoteBlock.volume => 8,
      RemoteBlock.transport || RemoteBlock.clock => 12,
      RemoteBlock.spacer => 0,
      _ => 16,
    };
  }

  @override
  State<RemoteLayoutView> createState() => _RemoteLayoutViewState();
}

typedef _Ref = ({RemoteColumn column, int index});

class _RemoteLayoutViewState extends State<RemoteLayoutView> {
  static const _portraitPadding = EdgeInsets.fromLTRB(24, 8, 24, 24);
  static const _columnPadding = EdgeInsets.fromLTRB(16, 8, 16, 16);

  final _scroll = <RemoteColumn, ScrollController>{
    for (final c in RemoteColumn.values) c: ScrollController(),
  };
  final _columnKeys = <RemoteColumn, GlobalKey>{
    for (final c in RemoteColumn.values) c: GlobalKey(),
  };
  final _blockKeys = Expando<GlobalKey>();

  _Ref? _dragging;
  _Ref? _hover;

  @override
  void dispose() {
    for (final c in _scroll.values) {
      c.dispose();
    }
    super.dispose();
  }

  GlobalKey _keyFor(RemoteBlockEntry e) => _blockKeys[e] ??= GlobalKey();

  // ── Dragging ──────────────────────────────────────────────────────

  Rect? _rectOf(GlobalKey key) {
    final box = key.currentContext?.findRenderObject();
    if (box is! RenderBox || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }

  List<RemoteColumn> get _columns => widget.landscape
      ? const [RemoteColumn.left, RemoteColumn.right]
      : const [RemoteColumn.portrait];

  void _dragUpdate(Offset pointer) {
    _Ref? hover;
    for (final c in _columns) {
      final area = _rectOf(_columnKeys[c]!);
      if (area == null) continue;
      if (pointer.dx < area.left || pointer.dx > area.right) continue;
      _autoScroll(c, area, pointer.dy);
      final entries = widget.layout.column(c);
      var slot = entries.length;
      for (var i = 0; i < entries.length; i++) {
        final r = _rectOf(_keyFor(entries[i]));
        if (r != null && pointer.dy < r.center.dy) {
          slot = i;
          break;
        }
      }
      hover = (column: c, index: slot);
      break;
    }
    if (hover != _hover) setState(() => _hover = hover);
  }

  /// Near the top or bottom of a column, scroll it so far-off slots can
  /// be reached.
  void _autoScroll(RemoteColumn c, Rect area, double y) {
    final controller = _scroll[c]!;
    if (!controller.hasClients) return;
    const edge = 56.0;
    final pos = controller.position;
    double delta = 0;
    if (y < area.top + edge) delta = -10;
    if (y > area.bottom - edge) delta = 10;
    if (delta == 0) return;
    controller.jumpTo(
      (pos.pixels + delta).clamp(pos.minScrollExtent, pos.maxScrollExtent),
    );
  }

  void _dragEnd() {
    final from = _dragging;
    final to = _hover;
    setState(() {
      _dragging = null;
      _hover = null;
    });
    if (from == null || to == null) return;
    final moved = widget.layout.move(
      from.column,
      from.index,
      to.column,
      to.index,
    );
    if (moved != widget.layout) widget.onChanged?.call(moved);
  }

  /// Whether dropping at [slot] would change nothing (right where it was).
  bool _isNoop(_Ref slot) {
    final from = _dragging;
    return from != null &&
        from.column == slot.column &&
        (slot.index == from.index || slot.index == from.index + 1);
  }

  // ── Build ─────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!widget.landscape) {
          return _scrollColumn(
            RemoteColumn.portrait,
            constraints,
            padding: _portraitPadding,
            slot: RemoteBlockSlot(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              landscape: false,
            ),
            center: false,
          );
        }
        final left = widget.layout.left;
        final right = widget.layout.right;
        // One column has everything: use the whole width for it.
        if (!widget.editing && (left.isEmpty || right.isEmpty)) {
          return _scrollColumn(
            left.isEmpty ? RemoteColumn.right : RemoteColumn.left,
            constraints,
            padding: _portraitPadding,
            slot: RemoteBlockSlot(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              landscape: true,
            ),
          );
        }
        final hasCover = left.any((e) => e.block == RemoteBlock.cover);
        // The cover is sized to the height; otherwise split the width.
        final leftWidth = hasCover && !widget.editing
            ? (constraints.maxHeight + _columnPadding.horizontal).clamp(
                0.0,
                constraints.maxWidth * 0.45,
              )
            : constraints.maxWidth * 0.45;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: leftWidth,
              child: LayoutBuilder(
                builder: (context, c) => _landscapeColumn(RemoteColumn.left, c),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, c) =>
                    _landscapeColumn(RemoteColumn.right, c),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _landscapeColumn(RemoteColumn column, BoxConstraints c) =>
      _scrollColumn(
        column,
        c,
        padding: _columnPadding,
        slot: RemoteBlockSlot(
          maxWidth: (c.maxWidth - _columnPadding.horizontal).clamp(0.0, 480.0),
          maxHeight: (c.maxHeight - _columnPadding.vertical).clamp(
            0.0,
            double.infinity,
          ),
          landscape: true,
        ),
      );

  /// A scrolling column, centred vertically when it is shorter than the
  /// screen ([center]; the portrait screen starts at the top as it always
  /// did).
  Widget _scrollColumn(
    RemoteColumn column,
    BoxConstraints constraints, {
    required EdgeInsets padding,
    required RemoteBlockSlot slot,
    bool center = true,
  }) {
    final content = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: widget.editing ? _editColumn(column, slot) : _column(column, slot),
    );
    return SingleChildScrollView(
      key: _columnKeys[column],
      controller: _scroll[column],
      padding: padding,
      child: center
          ? ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (constraints.maxHeight - padding.vertical).clamp(
                  0.0,
                  double.infinity,
                ),
              ),
              child: Center(child: content),
            )
          : Center(child: content),
    );
  }

  Widget _column(RemoteColumn column, RemoteBlockSlot slot) {
    final children = <Widget>[];
    RemoteBlockEntry? previous;
    List<Widget>? row;
    int? rowGroup;
    void endRow() {
      if (row == null) return;
      children.add(
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: row!,
        ),
      );
      row = null;
      rowGroup = null;
    }

    for (final e in widget.layout.column(column)) {
      final child = widget.buildBlock(context, e, slot);
      if (child == null) continue;
      final group = e.block.inlineGroup;
      if (group != null && row != null && group == rowGroup) {
        row!.add(child);
        previous = e;
        continue;
      }
      endRow();
      final gap = RemoteLayoutView.gapBefore(previous, e);
      if (gap > 0) children.add(SizedBox(height: gap));
      if (group != null) {
        row = [child];
        rowGroup = group;
      } else {
        children.add(child);
      }
      previous = e;
    }
    endRow();
    return Column(mainAxisSize: MainAxisSize.min, children: children);
  }

  // ── Edit mode ─────────────────────────────────────────────────────

  Widget _editColumn(RemoteColumn column, RemoteBlockSlot slot) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final entries = widget.layout.column(column);
    final hover = _hover;
    Widget indicator(int index) {
      final show =
          hover != null &&
          hover.column == column &&
          hover.index == index &&
          !_isNoop(hover);
      return AnimatedSize(
        duration: const Duration(milliseconds: 120),
        child: show
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  key: const Key('remote-layout-drop'),
                  height: 4,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              )
            : const SizedBox(width: double.infinity),
      );
    }

    return Column(
      key: Key('remote-layout-${column.name}'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < entries.length; i++) ...[
          indicator(i),
          if (i > 0) const SizedBox(height: 8),
          _editBlock(column, i, entries[i], slot),
        ],
        indicator(entries.length),
        if (entries.isEmpty)
          Container(
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant),
            ),
            child: Text(
              l.remoteCustomizeDropHere,
              style: TextStyle(color: cs.onSurfaceVariant),
            ),
          ),
      ],
    );
  }

  Widget _editBlock(
    RemoteColumn column,
    int index,
    RemoteBlockEntry entry,
    RemoteBlockSlot slot,
  ) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final ref = (column: column, index: index);
    final name = remoteBlockName(l, entry.block);
    final content =
        widget.buildBlock(context, entry, slot) ??
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Icon(
            remoteBlockIcon(entry.block),
            color: cs.onSurfaceVariant.withValues(alpha: 0.6),
          ),
        );

    Widget box(Widget handle) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
        color: cs.surface,
      ),
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              handle,
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
              if (entry.block.sizes.length > 1)
                Flexible(
                  child: TextButton(
                    key: Key('remote-block-size-${entry.block.name}'),
                    onPressed: () => widget.onChanged?.call(
                      widget.layout.cycleSize(column, index),
                    ),
                    child: Text(
                      remoteSizeName(l, entry.size),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              IconButton(
                key: Key('remote-block-remove-${entry.block.name}'),
                tooltip: l.remove,
                visualDensity: VisualDensity.compact,
                onPressed: () =>
                    widget.onChanged?.call(widget.layout.remove(column, index)),
                icon: const Icon(Icons.close_rounded, size: 20),
              ),
            ],
          ),
          // Controls don't work while editing.
          IgnorePointer(child: content),
        ],
      ),
    );

    final handleIcon = Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(Icons.drag_indicator_rounded, color: cs.onSurfaceVariant),
    );

    return LayoutBuilder(
      key: _keyFor(entry),
      builder: (context, c) {
        final feedback = Material(
          color: Colors.transparent,
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(width: c.maxWidth, child: box(handleIcon)),
        );
        void start() => setState(() => _dragging = ref);
        final handle = Draggable<_Ref>(
          key: Key('remote-block-handle-${entry.block.name}'),
          data: ref,
          feedback: feedback,
          onDragStarted: start,
          onDragUpdate: (d) => _dragUpdate(d.globalPosition),
          onDragEnd: (_) => _dragEnd(),
          child: Tooltip(message: l.remoteCustomizeMove, child: handleIcon),
        );
        // The handle stays mounted while it drags (a Draggable that goes
        // away mid-drag never reports the drop), so only dim the block.
        return LongPressDraggable<_Ref>(
          data: ref,
          feedback: feedback,
          onDragStarted: start,
          onDragUpdate: (d) => _dragUpdate(d.globalPosition),
          onDragEnd: (_) => _dragEnd(),
          child: Opacity(
            opacity: _dragging == ref ? 0.35 : 1,
            child: box(handle),
          ),
        );
      },
    );
  }
}

/// The clock, kept current every minute on its own (no rebuild of the
/// whole screen).
class RemoteClockText extends StatefulWidget {
  const RemoteClockText({
    super.key,
    required this.use24Hour,
    this.style,
    this.textAlign,
  });

  final bool use24Hour;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<RemoteClockText> createState() => _RemoteClockTextState();
}

class _RemoteClockTextState extends State<RemoteClockText> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _schedule();
  }

  void _schedule() {
    final now = DateTime.now();
    final next = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    ).add(const Duration(minutes: 1));
    _timer = Timer(next.difference(now), () {
      if (!mounted) return;
      setState(() {});
      _schedule();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.now(),
      alwaysUse24HourFormat:
          widget.use24Hour || MediaQuery.alwaysUse24HourFormatOf(context),
    );
    return Text(text, textAlign: widget.textAlign, style: widget.style);
  }
}

String remoteBlockName(AppLocalizations l, RemoteBlock b) => switch (b) {
  RemoteBlock.cover => l.remoteBlockCover,
  RemoteBlock.titleAuthor => l.remoteBlockTitle,
  RemoteBlock.chapterTitle => l.remoteBlockChapterTitle,
  RemoteBlock.progress => l.remoteBlockProgress,
  RemoteBlock.timeLeft => l.remoteBlockTimeLeft,
  RemoteBlock.transport => l.remoteBlockTransport,
  RemoteBlock.volume => l.remoteVolume,
  RemoteBlock.speed => l.remoteSpeed,
  RemoteBlock.sleep => l.remoteSleepTimer,
  RemoteBlock.bookmark => l.remoteBookmark,
  RemoteBlock.chapters => l.remoteChapters,
  RemoteBlock.continueListening => l.remoteContinueListening,
  RemoteBlock.stop => l.remoteStop,
  RemoteBlock.clock => l.remoteBlockClock,
  RemoteBlock.spacer => l.remoteBlockSpacer,
};

IconData remoteBlockIcon(RemoteBlock b) => switch (b) {
  RemoteBlock.cover => Icons.image_outlined,
  RemoteBlock.titleAuthor => Icons.title_rounded,
  RemoteBlock.chapterTitle => Icons.bookmark_outline_rounded,
  RemoteBlock.progress => Icons.linear_scale_rounded,
  RemoteBlock.timeLeft => Icons.hourglass_bottom_rounded,
  RemoteBlock.transport => Icons.play_circle_outline_rounded,
  RemoteBlock.volume => Icons.volume_up_rounded,
  RemoteBlock.speed => Icons.speed_rounded,
  RemoteBlock.sleep => Icons.bedtime_outlined,
  RemoteBlock.bookmark => Icons.bookmark_add_outlined,
  RemoteBlock.chapters => Icons.format_list_numbered_rounded,
  RemoteBlock.continueListening => Icons.history_rounded,
  RemoteBlock.stop => Icons.stop_rounded,
  RemoteBlock.clock => Icons.schedule_rounded,
  RemoteBlock.spacer => Icons.space_bar_rounded,
};

String remoteSizeName(AppLocalizations l, RemoteBlockSize s) => switch (s) {
  RemoteBlockSize.small => l.remoteSizeSmall,
  RemoteBlockSize.medium => l.remoteSizeMedium,
  RemoteBlockSize.large => l.remoteSizeLarge,
  RemoteBlockSize.compact => l.remoteSizeCompact,
  RemoteBlockSize.normal => l.remoteSizeNormal,
};

String remotePresetName(AppLocalizations l, RemotePreset p) => switch (p) {
  RemotePreset.defaults => l.remotePresetDefault,
  RemotePreset.minimal => l.remotePresetMinimal,
  RemotePreset.nightstand => l.remotePresetNightstand,
  RemotePreset.full => l.remotePresetFull,
};

/// "Add to the screen": the blocks not shown in this orientation.
Future<RemoteBlock?> showRemoteAddBlockSheet(
  BuildContext context,
  RemoteLayout layout, {
  required bool landscape,
}) {
  final l = AppLocalizations.of(context)!;
  final missing = layout.missing(landscape: landscape);
  return showAdaptiveSheetDialog<RemoteBlock>(
    context: context,
    showDragHandle: true,
    builder: (ctx, controller) => ListView(
      controller: controller,
      children: [
        ListTile(
          title: Text(
            l.remoteCustomizeAddTitle,
            style: Theme.of(ctx).textTheme.titleMedium,
          ),
        ),
        for (final b in missing)
          ListTile(
            key: Key('remote-add-${b.name}'),
            leading: Icon(remoteBlockIcon(b)),
            title: Text(remoteBlockName(l, b)),
            onTap: () => Navigator.pop(ctx, b),
          ),
      ],
    ),
  );
}

/// The display mode's options, saved as they change through [onChanged].
Future<void> showRemoteDisplayOptionsSheet(
  BuildContext context,
  RemoteDisplayOptions options,
  ValueChanged<RemoteDisplayOptions> onChanged,
) {
  var current = options;
  return showAdaptiveSheetDialog<void>(
    context: context,
    showDragHandle: true,
    builder: (ctx, controller) => StatefulBuilder(
      builder: (ctx, setSheet) {
        final l = AppLocalizations.of(ctx)!;
        final tt = Theme.of(ctx).textTheme;
        void set(RemoteDisplayOptions o) {
          setSheet(() => current = o);
          onChanged(o);
        }

        Widget label(String text) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(text, style: tt.labelLarge),
        );
        Widget choices<T>(
          List<T> values,
          T selected,
          String Function(T) name,
          void Function(T) pick,
          String keyPrefix,
        ) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final v in values)
                ChoiceChip(
                  key: Key('$keyPrefix-$v'),
                  label: Text(name(v)),
                  selected: v == selected,
                  onSelected: (_) => pick(v),
                ),
            ],
          ),
        );

        return ListView(
          controller: controller,
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            ListTile(title: Text(l.remoteDisplayMode, style: tt.titleMedium)),
            label(l.remoteDisplayBackground),
            choices(
              RemoteDisplayBackground.values,
              current.background,
              (b) => switch (b) {
                RemoteDisplayBackground.theme => l.remoteDisplayBackgroundTheme,
                RemoteDisplayBackground.cover => l.remoteDisplayBackgroundCover,
                RemoteDisplayBackground.black => l.remoteDisplayBackgroundBlack,
              },
              (b) => set(current.copyWith(background: b)),
              'remote-display-bg',
            ),
            label(l.remoteDisplayTextSize),
            choices(
              RemoteDisplayTextSize.values,
              current.textSize,
              (s) => switch (s) {
                RemoteDisplayTextSize.normal => l.remoteSizeNormal,
                RemoteDisplayTextSize.large => l.remoteSizeLarge,
                RemoteDisplayTextSize.huge => l.remoteDisplayTextHuge,
              },
              (s) => set(current.copyWith(textSize: s)),
              'remote-display-text',
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              key: const Key('remote-display-show-clock'),
              title: Text(l.remoteDisplayShowClock),
              value: current.showClock,
              onChanged: (v) => set(current.copyWith(showClock: v)),
            ),
            SwitchListTile(
              key: const Key('remote-display-24h'),
              title: Text(l.remoteDisplay24Hour),
              value: current.use24Hour,
              onChanged: (v) => set(current.copyWith(use24Hour: v)),
            ),
            label(l.remoteDisplayDim),
            choices(
              RemoteDisplayOptions.dimChoices,
              current.dimAfterMinutes,
              (m) => m == 0 ? l.remoteDisplayDimNever : l.remoteSleepMinutes(m),
              (m) => set(current.copyWith(dimAfterMinutes: m)),
              'remote-display-dim',
            ),
          ],
        );
      },
    ),
  );
}

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import 'text_scale_room.dart';

/// What a quick-switcher row stands for.
enum QuickSwitcherKind { action, book, podcast, series, author }

/// One row of the quick switcher: an app action or a library result.
class QuickSwitcherEntry {
  const QuickSwitcherEntry({
    required this.kind,
    required this.title,
    required this.onSelected,
    this.subtitle,
    this.imageUrl,
    this.icon,
    this.keywords = '',
  });

  final QuickSwitcherKind kind;
  final String title;
  final String? subtitle;

  /// Small cover (books, podcasts, series) or author photo.
  final String? imageUrl;

  /// Shown when there is no image (actions, or a missing cover).
  final IconData? icon;

  /// Extra words an action also matches ("pause", "timer").
  final String keywords;

  /// Runs after the switcher has closed.
  final VoidCallback onSelected;
}

/// Finds library results for [query]; an empty list when nothing matches
/// or the server can't be reached.
typedef QuickSwitcherSearch = Future<List<QuickSwitcherEntry>> Function(
    String query);

/// How long typing must pause before the library is searched.
const quickSwitcherDebounce = Duration(milliseconds: 250);

/// The [actions] whose title or keywords contain every word of [query]
/// (case-insensitive). An empty query keeps them all.
List<QuickSwitcherEntry> filterQuickSwitcherActions(
  List<QuickSwitcherEntry> actions,
  String query,
) {
  final words = query
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();
  if (words.isEmpty) return actions;
  return actions.where((entry) {
    final haystack = '${entry.title} ${entry.keywords}'.toLowerCase();
    return words.every(haystack.contains);
  }).toList();
}

/// Opens the quick switcher over [context] and runs the picked entry once
/// the dialog has closed.
Future<void> showQuickSwitcher(
  BuildContext context, {
  required List<QuickSwitcherEntry> actions,
  QuickSwitcherSearch? search,
  Map<String, String> imageHeaders = const {},
}) async {
  final picked = await showDialog<QuickSwitcherEntry>(
    context: context,
    builder: (_) => QuickSwitcherDialog(
      actions: actions,
      search: search,
      imageHeaders: imageHeaders,
    ),
  );
  picked?.onSelected();
}

/// A centered search box: type to find books, podcasts, series and authors
/// in the current library, or an app action. Up/Down move the highlight,
/// Enter opens it, Esc closes.
class QuickSwitcherDialog extends StatefulWidget {
  const QuickSwitcherDialog({
    super.key,
    required this.actions,
    this.search,
    this.imageHeaders = const {},
    this.debounce = quickSwitcherDebounce,
  });

  final List<QuickSwitcherEntry> actions;
  final QuickSwitcherSearch? search;
  final Map<String, String> imageHeaders;
  final Duration debounce;

  @override
  State<QuickSwitcherDialog> createState() => _QuickSwitcherDialogState();
}

class _QuickSwitcherDialogState extends State<QuickSwitcherDialog> {
  static const _listPadding = 8.0;

  // 56 px at the normal text size, growing with the two lines of text in
  // each row when the system text size is larger.
  double _rowHeight(BuildContext context) => 56 + textScaleRoom(context, 36);

  final _controller = TextEditingController();
  final _scroll = ScrollController();
  Timer? _debounce;
  List<QuickSwitcherEntry> _results = const [];
  String _resultsQuery = '';
  bool _searching = false;
  int _selected = 0;

  // Drops a response that a newer query (or clearing the box) made stale.
  int _gen = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  String get _query => _controller.text.trim();

  List<QuickSwitcherEntry> get _entries => [
        ...filterQuickSwitcherActions(widget.actions, _query),
        if (_query.isNotEmpty && _resultsQuery == _query) ..._results,
      ];

  void _onChanged(String _) {
    _debounce?.cancel();
    final query = _query;
    final gen = ++_gen;
    setState(() {
      _selected = 0;
      if (query.isEmpty) {
        _results = const [];
        _resultsQuery = '';
        _searching = false;
      }
    });
    final search = widget.search;
    if (query.isEmpty || search == null) return;
    _debounce = Timer(widget.debounce, () async {
      if (!mounted || gen != _gen) return;
      setState(() => _searching = true);
      List<QuickSwitcherEntry> found;
      try {
        found = await search(query);
      } catch (_) {
        found = const [];
      }
      if (!mounted || gen != _gen) return;
      setState(() {
        _results = found;
        _resultsQuery = query;
        _searching = false;
      });
    });
  }

  void _move(int delta) {
    final count = _entries.length;
    if (count == 0) return;
    setState(() => _selected = (_selected + delta) % count);
    _keepSelectedVisible();
  }

  void _keepSelectedVisible() {
    if (!_scroll.hasClients) return;
    final position = _scroll.position;
    final rowHeight = _rowHeight(context);
    final top = _listPadding + _selected * rowHeight;
    final last = _selected == _entries.length - 1;
    final bottom = top + rowHeight + (last ? _listPadding : 0);
    if (top < position.pixels) {
      _scroll.jumpTo(_selected == 0 ? 0 : top);
    } else if (bottom > position.pixels + position.viewportDimension) {
      _scroll.jumpTo(bottom - position.viewportDimension);
    }
  }

  bool _picked = false;

  // Enter can arrive both as a key and as the field's submit; pop once.
  void _pick(QuickSwitcherEntry entry) {
    if (_picked) return;
    _picked = true;
    Navigator.of(context).pop(entry);
  }

  void _pickSelected() {
    final entries = _entries;
    if (entries.isEmpty) return;
    _pick(entries[_selected.clamp(0, entries.length - 1)]);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final entries = _entries;
    final selected =
        entries.isEmpty ? -1 : _selected.clamp(0, entries.length - 1);

    return Dialog(
      alignment: const Alignment(0, -0.4),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560, maxHeight: 460),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: CallbackShortcuts(
                bindings: {
                  const SingleActivator(LogicalKeyboardKey.arrowDown): () =>
                      _move(1),
                  const SingleActivator(LogicalKeyboardKey.arrowUp): () =>
                      _move(-1),
                  const SingleActivator(LogicalKeyboardKey.enter):
                      _pickSelected,
                  const SingleActivator(LogicalKeyboardKey.numpadEnter):
                      _pickSelected,
                },
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  onChanged: _onChanged,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (_) => _pickSelected(),
                  decoration: InputDecoration(
                    hintText: l.quickSwitcherHint,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: _searching
                        ? const Padding(
                            padding: EdgeInsets.all(14),
                            child: SizedBox.square(
                              dimension: 16,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            Divider(height: 1, color: cs.onSurface.withValues(alpha: 0.08)),
            Flexible(
              child: entries.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        _searching ? '' : l.quickSwitcherNoResults,
                        style: tt.bodyMedium
                            ?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    )
                  : ListView.builder(
                      controller: _scroll,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(_listPadding),
                      itemExtent: _rowHeight(context),
                      itemCount: entries.length,
                      itemBuilder: (context, index) => _QuickSwitcherRow(
                        entry: entries[index],
                        selected: index == selected,
                        imageHeaders: widget.imageHeaders,
                        onTap: () => _pick(entries[index]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickSwitcherRow extends StatelessWidget {
  const _QuickSwitcherRow({
    required this.entry,
    required this.selected,
    required this.imageHeaders,
    required this.onTap,
  });

  final QuickSwitcherEntry entry;
  final bool selected;
  final Map<String, String> imageHeaders;
  final VoidCallback onTap;

  String _kindLabel(AppLocalizations l) => switch (entry.kind) {
        QuickSwitcherKind.action => l.quickSwitcherKindAction,
        QuickSwitcherKind.book => l.quickSwitcherKindBook,
        QuickSwitcherKind.podcast => l.quickSwitcherKindPodcast,
        QuickSwitcherKind.series => l.quickSwitcherKindSeries,
        QuickSwitcherKind.author => l.quickSwitcherKindAuthor,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final round = entry.kind == QuickSwitcherKind.author;
    final placeholder = Container(
      color: cs.secondaryContainer,
      alignment: Alignment.center,
      child: Icon(
        entry.icon ??
            (round ? Icons.person_rounded : Icons.auto_stories_rounded),
        size: 20,
        color: cs.onSecondaryContainer.withValues(alpha: 0.7),
      ),
    );
    final url = entry.imageUrl;
    final image = SizedBox.square(
      dimension: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(round ? 20 : 6),
        child: url == null
            ? placeholder
            : CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                httpHeaders: imageHeaders,
                placeholder: (_, __) => placeholder,
                errorWidget: (_, __, ___) => placeholder,
              ),
      ),
    );
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected
            ? cs.onSurface.withValues(alpha: 0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                image,
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tt.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: cs.onSurface,
                        ),
                      ),
                      if (entry.subtitle != null && entry.subtitle!.isNotEmpty)
                        Text(
                          entry.subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: tt.bodySmall
                              ?.copyWith(color: cs.onSurfaceVariant),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _kindLabel(l),
                  style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

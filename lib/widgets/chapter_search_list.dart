// Absorb Plus: a search field above the chapter list for long books.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../utils/chapter_search.dart';

/// Wraps a chapter list. Books with [kChapterSearchMinChapters] or more
/// chapters get a search field on top that filters chapters by title or
/// jumps to the chapter holding a typed time (`1:23:00`). Ctrl+F focuses
/// the field while the list is open. Shorter books get the list unchanged.
///
/// [builder] gets the indices into [chapters] to show, in order.
class ChapterSearchList extends StatefulWidget {
  const ChapterSearchList({
    super.key,
    required this.chapters,
    required this.fallbackTitle,
    required this.builder,
  });

  static const fieldKey = Key('chapterSearchField');

  final List<dynamic> chapters;
  final String Function(int index) fallbackTitle;
  final Widget Function(BuildContext context, List<int> shown) builder;

  @override
  State<ChapterSearchList> createState() => _ChapterSearchListState();
}

class _ChapterSearchListState extends State<ChapterSearchList> {
  final _controller = TextEditingController();
  final _fieldFocus = FocusNode(debugLabel: 'chapterSearch');
  List<int>? _all;

  bool get _searchable => widget.chapters.length >= kChapterSearchMinChapters;

  @override
  void didUpdateWidget(ChapterSearchList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.chapters, widget.chapters)) _all = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _fieldFocus.dispose();
    super.dispose();
  }

  List<int> get _allIndices =>
      _all ??= List<int>.generate(widget.chapters.length, (i) => i);

  @override
  Widget build(BuildContext context) {
    if (!_searchable) return widget.builder(context, _allIndices);

    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final query = _controller.text;
    final shown = query.trim().isEmpty
        ? _allIndices
        : filterChapterIndices(
            widget.chapters,
            query,
            fallbackTitle: widget.fallbackTitle,
          );

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.keyF, control: true): () {
          _fieldFocus.requestFocus();
          _controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: _controller.text.length,
          );
        },
      },
      // Holds keyboard focus inside the sheet so Ctrl+F reaches the
      // binding above before the app-wide search shortcut.
      child: Focus(
        autofocus: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: TextField(
                key: ChapterSearchList.fieldKey,
                controller: _controller,
                focusNode: _fieldFocus,
                textInputAction: TextInputAction.search,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: l.chapterSearchHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: query.isEmpty
                      ? null
                      : IconButton(
                          tooltip: l.clear,
                          onPressed: () => setState(_controller.clear),
                          icon: const Icon(Icons.clear_rounded),
                        ),
                  filled: true,
                  fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.45),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              // The list stays mounted when nothing matches, so the sheet's
              // scroll controller keeps a scrollable and still drags.
              child: Stack(
                children: [
                  Positioned.fill(child: widget.builder(context, shown)),
                  if (shown.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          l.chapterSearchNoResults,
                          style: tt.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

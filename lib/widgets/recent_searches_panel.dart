import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/recent_searches.dart';

/// Wraps the library search bar and, while the box is focused and empty,
/// floats the account's recent searches under it as chips. Tap a chip to
/// search again, its x or a long press to forget it, Clear to forget all.
class RecentSearchesAnchor extends StatefulWidget {
  const RecentSearchesAnchor({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSelected,
    required this.child,
    this.store,
  });

  final TextEditingController controller;

  /// Null on the inactive tabs' copies of the bar: no panel there.
  final FocusNode? focusNode;
  final ValueChanged<String> onSelected;
  final RecentSearches? store;
  final Widget child;

  @override
  State<RecentSearchesAnchor> createState() => _RecentSearchesAnchorState();
}

class _RecentSearchesAnchorState extends State<RecentSearchesAnchor> {
  final _portal = OverlayPortalController();
  late RecentSearches _store = widget.store ?? RecentSearches();
  List<String> _terms = const [];
  bool _hadFocus = false;

  @override
  void initState() {
    super.initState();
    _listen(widget);
  }

  @override
  void didUpdateWidget(RecentSearchesAnchor old) {
    super.didUpdateWidget(old);
    if (old.focusNode != widget.focusNode || old.controller != widget.controller) {
      _unlisten(old);
      _listen(widget);
    }
    if (old.store != widget.store) _store = widget.store ?? RecentSearches();
  }

  @override
  void dispose() {
    _unlisten(widget);
    super.dispose();
  }

  void _listen(RecentSearchesAnchor w) {
    w.focusNode?.addListener(_onFocus);
    w.controller.addListener(_sync);
    _hadFocus = w.focusNode?.hasFocus ?? false;
    if (_hadFocus) _reload();
  }

  void _unlisten(RecentSearchesAnchor w) {
    w.focusNode?.removeListener(_onFocus);
    w.controller.removeListener(_sync);
  }

  void _onFocus() {
    final has = widget.focusNode?.hasFocus ?? false;
    // Reload on every focus gain: the list may have grown since, or the
    // account may have changed.
    if (has && !_hadFocus) _reload();
    _hadFocus = has;
    _sync();
  }

  Future<void> _reload() async {
    final terms = await _store.load();
    if (!mounted) return;
    setState(() => _terms = terms);
    _sync();
  }

  void _sync() {
    if (!mounted) return;
    final show = (widget.focusNode?.hasFocus ?? false) &&
        widget.controller.text.trim().isEmpty &&
        _terms.isNotEmpty;
    if (show && !_portal.isShowing) {
      _portal.show();
    } else if (!show && _portal.isShowing) {
      _portal.hide();
    }
  }

  Future<void> _remove(String term) async {
    final terms = await _store.remove(term);
    if (!mounted) return;
    setState(() => _terms = terms);
    _sync();
  }

  Future<void> _clear() async {
    await _store.clear();
    if (!mounted) return;
    setState(() => _terms = const []);
    _sync();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.focusNode == null) return widget.child;
    return OverlayPortal.overlayChildLayoutBuilder(
      controller: _portal,
      overlayChildBuilder: (context, info) {
        final bottomLeft = MatrixUtils.transformPoint(
            info.childPaintTransform, Offset(0, info.childSize.height));
        return Stack(children: [
          Positioned(
            left: bottomLeft.dx,
            top: bottomLeft.dy + 6,
            width: info.childSize.width,
            child: TextFieldTapRegion(
              child: RecentSearchesPanel(
                terms: _terms,
                onSelected: widget.onSelected,
                onRemove: _remove,
                onClear: _clear,
              ),
            ),
          ),
        ]);
      },
      child: widget.child,
    );
  }
}

/// Calls [onTap] when a tap (not a scroll) lands on [child], without joining
/// the gesture arena, so the result tile's own tap still opens it. Used to
/// save the search term when the user opens a result.
class RecentSearchTapSaver extends StatefulWidget {
  const RecentSearchTapSaver({super.key, required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<RecentSearchTapSaver> createState() => _RecentSearchTapSaverState();
}

class _RecentSearchTapSaverState extends State<RecentSearchTapSaver> {
  Offset? _down;

  @override
  Widget build(BuildContext context) => Listener(
        behavior: HitTestBehavior.deferToChild,
        onPointerDown: (e) => _down = e.position,
        onPointerCancel: (_) => _down = null,
        onPointerUp: (e) {
          final down = _down;
          _down = null;
          if (down != null && (e.position - down).distance < kTouchSlop) {
            widget.onTap();
          }
        },
        child: widget.child,
      );
}

/// The chips themselves, in the app's usual surface card.
class RecentSearchesPanel extends StatelessWidget {
  const RecentSearchesPanel({
    super.key,
    required this.terms,
    required this.onSelected,
    required this.onRemove,
    required this.onClear,
  });

  final List<String> terms;
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onRemove;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    return Material(
      color: cs.surfaceContainerHigh,
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 4, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Text(l.recentSearchesTitle,
                    style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant)),
              ),
              TextButton(onPressed: onClear, child: Text(l.recentSearchesClear)),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  for (final t in terms)
                    RawGestureDetector(
                      gestures: {
                        LongPressGestureRecognizer:
                            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
                          LongPressGestureRecognizer.new,
                          (r) => r.onLongPress = () => onRemove(t),
                        ),
                      },
                      child: InputChip(
                        label: Text(t),
                        avatar: const Icon(Icons.history_rounded, size: 18),
                        onPressed: () => onSelected(t),
                        onDeleted: () => onRemove(t),
                        deleteButtonTooltipMessage: l.recentSearchesRemove,
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

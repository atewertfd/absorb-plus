// Absorb Plus: "N new" pill on the Home "Recently added" shelf.
//
// Counts the shelf's items added since this account last looked at it in
// this library. New items reach the shelf through the normal Home reload
// (the socket's item_added already triggers one), so nothing polls. The
// "last seen" mark is the newest addedAt the user saw (server time, so the
// device clock doesn't matter), kept per account (ScopedPrefs) per library.
// It moves forward when the user scrolls the shelf or taps anything on it.
import 'package:flutter/gestures.dart' show kTouchSlop;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/library_provider.dart';
import '../services/scoped_prefs.dart';

/// Storage and counting for the "last seen" mark.
class RecentlyAddedSeen {
  RecentlyAddedSeen._();

  static const sectionId = 'recently-added';

  static String key(String libraryId) => 'fork_recently_added_seen_$libraryId';

  static Future<int?> load(String libraryId) => ScopedPrefs.getInt(key(libraryId));

  static Future<void> save(String libraryId, int addedAt) =>
      ScopedPrefs.setInt(key(libraryId), addedAt);

  static int? addedAtOf(Object? entity) {
    if (entity is! Map) return null;
    final v = entity['addedAt'];
    return v is num ? v.toInt() : null;
  }

  /// The newest addedAt among [entities], or null when none carry one.
  static int? newest(List<dynamic> entities) {
    int? best;
    for (final e in entities) {
      final at = addedAtOf(e);
      if (at != null && (best == null || at > best)) best = at;
    }
    return best;
  }

  /// How many of [entities] were added after [seen]. Nothing counts as new
  /// before the first mark exists.
  static int countNew(List<dynamic> entities, int? seen) {
    if (seen == null) return 0;
    var n = 0;
    for (final e in entities) {
      final at = addedAtOf(e);
      if (at != null && at > seen) n++;
    }
    return n;
  }
}

/// Wraps the Recently added shelf; any other shelf passes straight through.
class RecentlyAddedScope extends StatefulWidget {
  final String sectionId;
  final List<dynamic> entities;
  final Widget child;

  /// Library the shelf belongs to; read from [LibraryProvider] when null.
  final String? libraryId;

  const RecentlyAddedScope({
    super.key,
    required this.sectionId,
    required this.entities,
    required this.child,
    this.libraryId,
  });

  @override
  State<RecentlyAddedScope> createState() => _RecentlyAddedScopeState();
}

class _RecentlyAddedScopeState extends State<RecentlyAddedScope> {
  String? _libraryId;
  int? _seen;
  bool _loaded = false;
  Offset? _down;

  bool get _active => widget.sectionId == RecentlyAddedSeen.sectionId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resolveLibrary();
  }

  @override
  void didUpdateWidget(RecentlyAddedScope old) {
    super.didUpdateWidget(old);
    _resolveLibrary();
    // A reload brought new items: if no mark exists yet, start one now.
    if (_loaded && _seen == null) _firstMark();
  }

  void _resolveLibrary() {
    if (!_active) return;
    final id = widget.libraryId ??
        Provider.of<LibraryProvider?>(context, listen: false)?.selectedLibraryId;
    if (id == null || id == _libraryId) return;
    _libraryId = id;
    _loaded = false;
    _seen = null;
    _load(id);
  }

  Future<void> _load(String id) async {
    final seen = await RecentlyAddedSeen.load(id);
    if (!mounted || id != _libraryId) return;
    setState(() {
      _seen = seen;
      _loaded = true;
    });
    if (seen == null) _firstMark();
  }

  /// The first time an account sees the shelf in a library, everything on
  /// it counts as seen.
  void _firstMark() {
    final id = _libraryId;
    final newest = RecentlyAddedSeen.newest(widget.entities);
    if (id == null || newest == null) return;
    _seen = newest;
    RecentlyAddedSeen.save(id, newest);
  }

  void _markSeen() {
    final id = _libraryId;
    final newest = RecentlyAddedSeen.newest(widget.entities);
    if (id == null || newest == null || !_loaded) return;
    if (_seen != null && newest <= _seen!) return;
    setState(() => _seen = newest);
    RecentlyAddedSeen.save(id, newest);
  }

  @override
  void dispose() {
    // Leaving the shelf (Home closed, library switched) counts as having
    // seen what it showed.
    final id = _libraryId;
    final newest = RecentlyAddedSeen.newest(widget.entities);
    if (_active && _loaded && id != null && newest != null &&
        (_seen == null || newest > _seen!)) {
      RecentlyAddedSeen.save(id, newest);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_active) return widget.child;
    final count = _loaded ? RecentlyAddedSeen.countNew(widget.entities, _seen) : 0;
    return _RecentlyAddedCount(
      count: count,
      child: NotificationListener<UserScrollNotification>(
        onNotification: (n) {
          if (n.metrics.axis == Axis.horizontal) _markSeen();
          return false;
        },
        // A Listener stays out of the gesture arena, so the cards and the
        // title keep their own taps.
        child: Listener(
          onPointerDown: (e) => _down = e.position,
          onPointerUp: (e) {
            final down = _down;
            _down = null;
            if (down != null && (e.position - down).distance < kTouchSlop) {
              _markSeen();
            }
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class _RecentlyAddedCount extends InheritedWidget {
  final int count;
  const _RecentlyAddedCount({required this.count, required super.child});

  @override
  bool updateShouldNotify(_RecentlyAddedCount old) => old.count != count;
}

/// The pill itself, for the shelf header. Empty unless a [RecentlyAddedScope]
/// above it has something new.
class RecentlyAddedBadge extends StatelessWidget {
  const RecentlyAddedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context
            .dependOnInheritedWidgetOfExactType<_RecentlyAddedCount>()
            ?.count ??
        0;
    if (count <= 0) return const SizedBox.shrink();
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final label = AppLocalizations.of(context)?.homeRecentlyAddedNewBadge(count) ??
        '$count new';
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: cs.primary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: tt.labelSmall?.copyWith(
            color: cs.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/library_provider.dart';
import '../services/desktop_shortcuts.dart';
import '../utils/fork_platform.dart';
import 'author_books_sheet.dart';
import 'book_detail_sheet.dart';
import 'desktop_shortcut_help.dart';
import 'desktop_shortcut_scope.dart';
import 'episode_list_sheet.dart';
import 'quick_switcher.dart';
import 'series_books_sheet.dart';

/// How many rows of each kind a library search adds to the switcher.
const _maxBooks = 8;
const _maxSeries = 4;
const _maxAuthors = 4;

/// What the app shell lends the quick switcher's actions.
class QuickSwitcherAppCallbacks {
  const QuickSwitcherAppCallbacks({
    required this.goToTab,
    required this.runNavAction,
  });

  /// Shows a shell tab (0 Home, 1 Library, 2 Absorbing, 3 Stats,
  /// 4 Settings), closing whatever page is on top first.
  final void Function(int tab) goToTab;

  /// Runs one of the shell's nav-hold actions ('downloads', 'playPause',
  /// 'sleep').
  final void Function(String id) runNavAction;
}

/// The app actions the quick switcher always offers.
List<QuickSwitcherEntry> quickSwitcherAppActions(
  BuildContext context,
  AppLocalizations l,
  QuickSwitcherAppCallbacks app,
) {
  QuickSwitcherEntry action(
    String title,
    IconData icon,
    VoidCallback run, [
    String keywords = '',
  ]) =>
      QuickSwitcherEntry(
        kind: QuickSwitcherKind.action,
        title: title,
        icon: icon,
        keywords: keywords,
        onSelected: run,
      );
  return [
    action(l.quickSwitcherGoHome, Icons.home_rounded, () => app.goToTab(0)),
    action(l.quickSwitcherGoLibrary, Icons.library_books_rounded,
        () => app.goToTab(1)),
    action(l.quickSwitcherGoAbsorbing, Icons.headphones_rounded,
        () => app.goToTab(2), 'now playing'),
    action(l.quickSwitcherGoStats, Icons.bar_chart_rounded,
        () => app.goToTab(3)),
    action(l.quickSwitcherGoSettings, Icons.settings_rounded,
        () => app.goToTab(4), 'preferences options'),
    action(l.quickSwitcherGoDownloads, Icons.download_rounded,
        () => app.runNavAction('downloads'), 'offline'),
    action(l.quickSwitcherPlayPause, Icons.play_arrow_rounded,
        () => app.runNavAction('playPause'), 'resume pause'),
    action(l.quickSwitcherSleepTimer, Icons.bedtime_rounded,
        () => app.runNavAction('sleep'), 'timer'),
    action(l.desktopShortcutsTitle, Icons.keyboard_rounded,
        () => unawaited(showDesktopShortcutsDialog(context)),
        'keys help hotkeys'),
  ];
}

/// Opens one library search result.
typedef QuickSwitcherOpen = void Function(
    QuickSwitcherKind kind, Map<String, dynamic> data);

/// Turns a `/api/libraries/{id}/search` response into switcher rows: books
/// (or podcasts), then series, then authors, a few of each.
List<QuickSwitcherEntry> quickSwitcherEntriesFromSearch(
  Map<String, dynamic> data, {
  required bool isPodcast,
  required AppLocalizations l,
  required String? Function(String itemId) coverUrl,
  required String? Function(Map<String, dynamic> author) authorImageUrl,
  required QuickSwitcherOpen open,
}) {
  final entries = <QuickSwitcherEntry>[];
  Map<String, dynamic>? itemOf(dynamic result) {
    if (result is! Map<String, dynamic>) return null;
    final item = result['libraryItem'];
    return item is Map<String, dynamic> ? item : result;
  }

  Map<String, dynamic> metadataOf(Map<String, dynamic> item) {
    final media = item['media'];
    final metadata = media is Map<String, dynamic> ? media['metadata'] : null;
    return metadata is Map<String, dynamic> ? metadata : const {};
  }

  final kind = isPodcast ? QuickSwitcherKind.podcast : QuickSwitcherKind.book;
  final books = data[isPodcast ? 'podcast' : 'book'];
  if (books is List) {
    for (final result in books.take(_maxBooks)) {
      final item = itemOf(result);
      final id = item?['id'];
      if (item == null || id is! String) continue;
      final metadata = metadataOf(item);
      entries.add(QuickSwitcherEntry(
        kind: kind,
        title: metadata['title'] as String? ?? l.unknown,
        subtitle: (isPodcast ? metadata['author'] : metadata['authorName'])
            as String?,
        imageUrl: coverUrl(id),
        onSelected: () => open(kind, item),
      ));
    }
  }

  final series = data['series'];
  if (series is List) {
    for (final result in series.take(_maxSeries)) {
      if (result is! Map<String, dynamic>) continue;
      final info = result['series'];
      if (info is! Map<String, dynamic>) continue;
      final seriesBooks = result['books'] is List
          ? result['books'] as List
          : const [];
      final firstId =
          seriesBooks.isEmpty ? null : itemOf(seriesBooks.first)?['id'];
      entries.add(QuickSwitcherEntry(
        kind: QuickSwitcherKind.series,
        title: info['name'] as String? ?? l.unknown,
        subtitle: l.librarySearchResultsBookCount(seriesBooks.length),
        imageUrl: firstId is String ? coverUrl(firstId) : null,
        onSelected: () => open(QuickSwitcherKind.series, result),
      ));
    }
  }

  final authors = data['authors'];
  if (authors is List) {
    for (final result in authors.take(_maxAuthors)) {
      if (result is! Map<String, dynamic>) continue;
      final author = result['author'] is Map<String, dynamic>
          ? result['author'] as Map<String, dynamic>
          : result;
      if (author['id'] is! String) continue;
      final numBooks = author['numBooks'];
      entries.add(QuickSwitcherEntry(
        kind: QuickSwitcherKind.author,
        title: author['name'] as String? ?? l.unknown,
        subtitle:
            numBooks is int ? l.librarySearchResultsBookCount(numBooks) : null,
        imageUrl: authorImageUrl(author),
        onSelected: () => open(QuickSwitcherKind.author, author),
      ));
    }
  }
  return entries;
}

/// Searches the selected library with the same endpoint as the Library
/// search bar. Null while signed out, offline or with no library picked.
QuickSwitcherSearch? quickSwitcherLibrarySearch(BuildContext context) {
  final auth = context.read<AuthProvider>();
  final lib = context.read<LibraryProvider>();
  final api = auth.apiService;
  final libraryId = lib.selectedLibraryId;
  if (api == null || libraryId == null || lib.isOffline) return null;
  final l = AppLocalizations.of(context)!;
  final isPodcast = lib.isPodcastLibrary;

  void open(QuickSwitcherKind kind, Map<String, dynamic> data) {
    if (!context.mounted) return;
    switch (kind) {
      case QuickSwitcherKind.book:
        final id = data['id'] as String;
        showBookDetailSheet(context, id, initialItem: data);
      case QuickSwitcherKind.podcast:
        EpisodeListSheet.show(context, data);
      case QuickSwitcherKind.series:
        final info = data['series'] as Map<String, dynamic>;
        showSeriesBooksSheet(
          context,
          seriesName: info['name'] as String? ?? l.unknown,
          seriesId: info['id'] as String?,
          books: data['books'] as List? ?? const [],
          serverUrl: auth.serverUrl,
          token: auth.token,
        );
      case QuickSwitcherKind.author:
        showAuthorDetailSheet(
          context,
          authorId: data['id'] as String,
          authorName: data['name'] as String? ?? l.unknown,
        );
      case QuickSwitcherKind.action:
        break;
    }
  }

  return (query) async {
    final data = await api.searchLibrary(libraryId, query, limit: _maxBooks);
    if (data == null) return const [];
    return quickSwitcherEntriesFromSearch(
      data,
      isPodcast: isPodcast,
      l: l,
      coverUrl: (id) => lib.getCoverUrl(id, width: 120),
      authorImageUrl: (author) => author['imagePath'] == null
          ? null
          : api.getAuthorImageUrl(author['id'] as String, width: 120),
      open: open,
    );
  };
}

/// The whole quick switcher as the app shell opens it (Ctrl+K, or the
/// search icon on Home).
Future<void> showAppQuickSwitcher(
  BuildContext context,
  QuickSwitcherAppCallbacks app,
) {
  final l = AppLocalizations.of(context)!;
  return showQuickSwitcher(
    context,
    actions: quickSwitcherAppActions(context, l, app),
    search: quickSwitcherLibrarySearch(context),
    imageHeaders: context.read<LibraryProvider>().mediaHeaders,
  );
}

/// A small search icon that opens the quick switcher, for headers on the
/// desktop and web builds (where Ctrl+K works too).
class QuickSwitcherButton extends StatelessWidget {
  const QuickSwitcherButton({super.key});

  static bool get available => ForkPlatform.isDesktop || ForkPlatform.isWeb;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Tooltip(
      message: l.quickSwitcherTooltip,
      child: IconButton(
        icon: const Icon(Icons.search_rounded),
        onPressed: () => DesktopShortcutScope.handlers
            ?.run(DesktopShortcutAction.quickSwitcher),
      ),
    );
  }
}

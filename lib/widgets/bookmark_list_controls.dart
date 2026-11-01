// Absorb Plus: the All bookmarks screen's sort/group menu and the bookmark
// export action (also used by a book's own bookmark list). Kept out of the
// upstream screens so they only hook these in.
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/bookmark_service.dart';
import '../services/scoped_prefs.dart';
import '../services/text_file_export.dart';
import '../utils/bookmark_list_tools.dart';
import 'overlay_toast.dart';

/// Per-account prefs for the All bookmarks view (ScopedPrefs scopes keys to
/// the signed-in account).
abstract final class BookmarkViewPrefs {
  static const key = 'bookmarks_list_view';

  static Future<BookmarkView> load({String? legacySort}) async =>
      BookmarkView.fromPref(
        await ScopedPrefs.getString(key),
        legacySort: legacySort,
      );

  static Future<void> save(BookmarkView view) =>
      ScopedPrefs.setString(key, view.prefValue);
}

/// The small "sort and group" chip in the All bookmarks header. Same look as
/// the sort chip it replaces, but opens a menu instead of cycling.
class BookmarkViewMenu extends StatelessWidget {
  const BookmarkViewMenu({
    super.key,
    required this.view,
    required this.onChanged,
  });

  final BookmarkView view;
  final ValueChanged<BookmarkView> onChanged;

  static IconData iconFor(BookmarkView v) => switch (v) {
    BookmarkView.byBook => Icons.library_books_outlined,
    BookmarkView.newest => Icons.schedule_rounded,
    BookmarkView.position => Icons.arrow_upward_rounded,
  };

  static String labelFor(AppLocalizations l, BookmarkView v) => switch (v) {
    BookmarkView.byBook => l.bookmarksViewByBook,
    BookmarkView.newest => l.bookmarksViewNewest,
    BookmarkView.position => l.bookmarksViewPosition,
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    return PopupMenuButton<BookmarkView>(
      tooltip: l.bookmarksViewMenu,
      initialValue: view,
      onSelected: onChanged,
      itemBuilder: (_) => [
        for (final v in BookmarkView.values)
          CheckedPopupMenuItem<BookmarkView>(
            value: v,
            checked: v == view,
            child: Text(labelFor(l, v)),
          ),
      ],
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: cs.onSurface.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconFor(view), color: cs.onSurfaceVariant, size: 16),
            const SizedBox(width: 4),
            Text(
              labelFor(l, view),
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

/// Exports [groups] as Markdown and tells the user how it went. [bookTitle]
/// names the file when exporting a single book.
Future<void> exportBookmarksMarkdown(
  BuildContext context, {
  required Map<String, List<Bookmark>> groups,
  required BookmarkBookInfo Function(String itemId) bookInfo,
  String? bookTitle,
}) async {
  final l = AppLocalizations.of(context)!;
  final box = context.findRenderObject() as RenderBox?;
  final origin = box == null || !box.hasSize
      ? null
      : box.localToGlobal(Offset.zero) & box.size;
  final markdown = bookmarksToMarkdown(
    groups,
    bookInfo,
    heading: bookTitle == null ? l.bookmarksTitle : null,
    unknownTitle: l.unknown,
  );
  final result = await TextFileExport.export(
    fileName: bookmarksExportFileName(bookTitle),
    content: markdown,
    dialogTitle: l.bookmarksExportDialogTitle,
    mimeType: 'text/markdown',
    sharePositionOrigin: origin,
  );
  if (!context.mounted) return;
  switch (result.status) {
    case TextFileExportStatus.saved:
      showOverlayToast(
        context,
        l.bookmarksExportSaved(result.path ?? ''),
        icon: Icons.check_circle_outline_rounded,
      );
    case TextFileExportStatus.downloaded:
      showOverlayToast(
        context,
        l.bookmarksExportDownloaded,
        icon: Icons.check_circle_outline_rounded,
      );
    case TextFileExportStatus.failed:
      showOverlayToast(
        context,
        l.bookmarksExportFailed,
        icon: Icons.error_outline_rounded,
      );
    case TextFileExportStatus.shared:
    case TextFileExportStatus.cancelled:
      break;
  }
}

/// The export button. [dense] fits it into a text row (a book's bookmark
/// list) without making the row taller.
class BookmarkExportButton extends StatelessWidget {
  const BookmarkExportButton({
    super.key,
    required this.groups,
    required this.bookInfo,
    this.bookTitle,
    this.dense = false,
  });

  final Map<String, List<Bookmark>> Function() groups;
  final BookmarkBookInfo Function(String itemId) bookInfo;
  final String? bookTitle;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return IconButton(
      icon: Icon(
        Icons.ios_share_rounded,
        color: dense
            ? cs.onSurface.withValues(alpha: 0.3)
            : cs.onSurfaceVariant,
        size: dense ? 18 : 22,
      ),
      tooltip: AppLocalizations.of(context)!.bookmarksExportAction,
      padding: dense ? EdgeInsets.zero : null,
      constraints: dense
          ? const BoxConstraints(minWidth: 32, minHeight: 24)
          : null,
      visualDensity: VisualDensity.compact,
      onPressed: () => exportBookmarksMarkdown(
        context,
        groups: groups(),
        bookInfo: bookInfo,
        bookTitle: bookTitle,
      ),
    );
  }
}

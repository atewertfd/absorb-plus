// Absorb Plus: the "Check files" sheet for a book. Read-only: it shows what
// FileHealthCheck finds in the server's data (and the local download), and
// its only action is re-downloading a damaged local copy after a confirm.

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/api_service.dart';
import '../services/desktop_download_folder.dart';
import '../services/download_service.dart';
import '../services/file_health_check.dart';
import '../utils/duration_format.dart';
import 'adaptive_modal.dart';
import 'overlay_toast.dart';

/// Opens "Check files" for [item] (the library item JSON). [api] is null
/// when offline, which leaves re-downloading unavailable.
Future<void> showFileHealthSheet(
  BuildContext context, {
  required String itemId,
  required Map<String, dynamic> item,
  ApiService? api,
  String? title,
  String? author,
  String? coverUrl,
}) {
  return showAdaptiveSheetDialog<void>(
    context: context,
    initialChildSize: 0.6,
    minChildSize: 0.4,
    builder: (ctx, scroll) => FileHealthSheet(
      itemId: itemId,
      item: item,
      api: api,
      title: title,
      author: author,
      coverUrl: coverUrl,
      scroll: scroll,
    ),
  );
}

class FileHealthSheet extends StatefulWidget {
  final String itemId;
  final Map<String, dynamic> item;
  final ApiService? api;
  final String? title;
  final String? author;
  final String? coverUrl;
  final ScrollController? scroll;

  /// Stats the downloaded files; tests pass a fake.
  final Future<List<LocalFileStat>> Function(List<String> paths)? statLocal;

  /// The downloaded book's file paths, or null when it isn't downloaded
  /// (or its audio came out of an ebook). Tests pass a fake.
  final Future<List<String>?> Function(String itemId)? localPaths;

  const FileHealthSheet({
    super.key,
    required this.itemId,
    required this.item,
    this.api,
    this.title,
    this.author,
    this.coverUrl,
    this.scroll,
    this.statLocal,
    this.localPaths,
  });

  @override
  State<FileHealthSheet> createState() => _FileHealthSheetState();
}

class _FileHealthSheetState extends State<FileHealthSheet> {
  late FileHealthReport _report = FileHealthCheck.check(widget.item);
  bool _checkingLocal = false;
  bool _redownloading = false;

  @override
  void initState() {
    super.initState();
    _checkLocal();
  }

  Future<void> _checkLocal() async {
    final paths = await (widget.localPaths ?? _downloadedPaths)(widget.itemId);
    if (paths == null || paths.isEmpty || !mounted) return;
    setState(() => _checkingLocal = true);
    final stats = await (widget.statLocal ??
        (p) => FileHealthCheck.statLocalFiles(p, skip: (path) => DesktopDownloadFolder.isOnMissingDrive(path)))(paths);
    if (!mounted) return;
    setState(() {
      _report = FileHealthCheck.check(widget.item, local: stats);
      _checkingLocal = false;
    });
  }

  static Future<List<String>?> _downloadedPaths(String itemId) async {
    final dl = DownloadService();
    if (!dl.isDownloaded(itemId)) return null;
    final onPhone = await dl.onPhone(itemId);
    // A narrated EPUB's audio is cut from the ebook, not the server's files.
    if (!onPhone.audio || onPhone.fromEbook) return null;
    return dl.getInfo(itemId).localPaths;
  }

  Future<void> _confirmRedownload() async {
    final l = AppLocalizations.of(context)!;
    final api = widget.api;
    if (api == null) {
      showOverlayToast(context, l.fileHealthNotAvailableOffline, icon: Icons.cloud_off_rounded);
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.fileHealthRedownloadQuestion),
        content: Text(l.fileHealthRedownloadInfo),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.redownload)),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _redownloading = true);
    final dl = DownloadService();
    final info = dl.getInfo(widget.itemId);
    await dl.deleteDownload(widget.itemId);
    final error = await dl.downloadItem(
      api: api,
      itemId: widget.itemId,
      title: widget.title ?? info.title ?? '',
      author: widget.author ?? info.author,
      // The sheet's cover can be the local copy, which goes with the download.
      coverUrl: info.coverUrl ?? widget.coverUrl,
      libraryId: widget.item['libraryId'] as String? ?? info.libraryId,
    );
    if (!mounted) return;
    setState(() => _redownloading = false);
    showOverlayToast(context, error ?? l.redownloadStarted,
        icon: error == null ? Icons.download_rounded : Icons.error_outline_rounded);
    if (error == null) Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final report = _report;
    final summary = report.healthy ? l.fileHealthAllFine(report.fileCount) : l.fileHealthProblems(report.findings.length);

    return ListView(
      controller: widget.scroll,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cs.onSurface.withValues(alpha: 0.24),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(l.fileHealthTitle, style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Row(children: [
          Icon(
            report.healthy ? Icons.check_circle_rounded : Icons.error_outline_rounded,
            size: 20,
            color: report.healthy
                ? Colors.green
                : report.findings.any((f) => f.serious)
                    ? cs.error
                    : Colors.orange,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(summary, style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600))),
          if (_checkingLocal) const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
        ]),
        const SizedBox(height: 6),
        Text(
          [l.fileHealthReadOnlyNote, if (report.checkedLocal) l.fileHealthLocalChecked].join(' '),
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
        ),
        for (final f in report.findings) _FindingSection(finding: f),
        if (report.canRedownload) ...[
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: _redownloading ? null : _confirmRedownload,
            icon: const Icon(Icons.download_rounded),
            label: Text(l.fileHealthRedownload),
          ),
        ],
      ],
    );
  }
}

class _FindingSection extends StatelessWidget {
  final FileHealthFinding finding;
  const _FindingSection({required this.finding});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final (title, info) = _texts(l, finding);
    final tint = finding.serious ? cs.error : Colors.orange;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(finding.serious ? Icons.error_outline_rounded : Icons.info_outline_rounded, size: 18, color: tint),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700))),
          if (finding.entries.length > 1)
            Text('${finding.entries.length}', style: tt.labelMedium?.copyWith(color: cs.onSurfaceVariant)),
        ]),
        const SizedBox(height: 6),
        Text(info, style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
        if (finding.entries.isNotEmpty) const SizedBox(height: 6),
        for (final e in finding.entries) _EntryTile(kind: finding.kind, entry: e),
      ]),
    );
  }

  static (String, String) _texts(AppLocalizations l, FileHealthFinding f) => switch (f.kind) {
        FileHealthKind.itemMissing => (l.fileHealthItemMissing, l.fileHealthItemMissingInfo),
        FileHealthKind.itemInvalid => (l.fileHealthItemInvalid, l.fileHealthItemInvalidInfo),
        FileHealthKind.invalidFiles => (l.fileHealthInvalidFiles, l.fileHealthInvalidFilesInfo),
        FileHealthKind.emptyFiles => (l.fileHealthEmptyFiles, l.fileHealthEmptyFilesInfo),
        FileHealthKind.trackGaps => (l.fileHealthTrackGaps, l.fileHealthTrackGapsInfo),
        FileHealthKind.trackOverlaps => (l.fileHealthTrackOverlaps, l.fileHealthTrackOverlapsInfo),
        FileHealthKind.durationMismatch => (
            l.fileHealthDurationMismatch,
            l.fileHealthDurationMismatchInfo(fileHealthDuration(f.actualSeconds ?? 0), fileHealthDuration(f.expectedSeconds ?? 0)),
          ),
        FileHealthKind.lowBitrate => (l.fileHealthLowBitrate, l.fileHealthLowBitrateInfo),
        FileHealthKind.mixedSampleRates => (l.fileHealthMixedSampleRates, l.fileHealthMixedSampleRatesInfo),
        FileHealthKind.mixedChannels => (l.fileHealthMixedChannels, l.fileHealthMixedChannelsInfo),
        FileHealthKind.chaptersPastEnd => (l.fileHealthChaptersPastEnd, l.fileHealthChaptersPastEndInfo),
        FileHealthKind.localMissing => (l.fileHealthLocalMissing, l.fileHealthLocalMissingInfo),
        FileHealthKind.localSizeMismatch => (l.fileHealthLocalSizeMismatch, l.fileHealthLocalSizeMismatchInfo),
      };
}

class _EntryTile extends StatelessWidget {
  final FileHealthKind kind;
  final FileHealthEntry entry;
  const _EntryTile({required this.kind, required this.entry});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final detail = _detail(l);
    final icon = kind == FileHealthKind.chaptersPastEnd ? Icons.bookmark_border_rounded : Icons.audio_file_rounded;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 18, color: cs.onSurfaceVariant),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(entry.name, style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 3, overflow: TextOverflow.ellipsis),
            if (detail != null) ...[
              const SizedBox(height: 2),
              Text(detail, style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant), maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          ]),
        ),
      ]),
    );
  }

  String? _detail(AppLocalizations l) {
    final seconds = entry.seconds;
    final value = entry.value;
    return switch (kind) {
      FileHealthKind.invalidFiles => entry.error,
      FileHealthKind.trackGaps || FileHealthKind.trackOverlaps => seconds == null ? null : fileHealthDuration(seconds),
      FileHealthKind.lowBitrate => value == null ? null : l.kbpsValue(value),
      FileHealthKind.mixedSampleRates => value == null ? null : l.fileHealthSampleRate(_khz(value)),
      FileHealthKind.mixedChannels => value == null
          ? null
          : value == 1
              ? l.fileHealthMono
              : value == 2
                  ? l.fileHealthStereo
                  : l.fileInfoChannels(value),
      FileHealthKind.chaptersPastEnd => seconds == null ? null : l.fileHealthStartsAt(fileHealthDuration(seconds)),
      FileHealthKind.localSizeMismatch => value == null || entry.expected == null
          ? null
          : _sizes(l, value, entry.expected!),
      _ => null,
    };
  }

  /// Sizes that round to the same text fall back to exact bytes, so a
  /// small difference still shows.
  static String _sizes(AppLocalizations l, int local, int server) {
    var a = fileHealthSize(local), b = fileHealthSize(server);
    if (a == b) (a, b) = ('$local B', '$server B');
    return l.fileHealthSizeHere(a, b);
  }

  /// 44100 -> "44.1", 48000 -> "48", 22050 -> "22.05".
  static String _khz(int hz) => (hz / 1000).toString().replaceFirst(RegExp(r'\.0$'), '');
}

/// "12s", "4m 5s" or "3h 12m": short spans need seconds, unlike [formatHm].
String fileHealthDuration(double seconds) {
  final s = seconds.abs();
  if (s < 60) return '${s.round()}s';
  if (s < 3600) return '${(s / 60).floor()}m ${(s % 60).floor()}s';
  return formatHm(s);
}

String fileHealthSize(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  if (bytes < 1073741824) return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  return '${(bytes / 1073741824).toStringAsFixed(2)} GB';
}

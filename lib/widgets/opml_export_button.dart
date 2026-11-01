import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../services/opml_export.dart';
import 'overlay_toast.dart';

/// Absorb Plus: the podcast manager's "Export OPML" header button (audit C7).
/// Hidden on BookOrbit, which has no OPML endpoint.
class OpmlExportButton extends StatefulWidget {
  final String libraryId;
  final String libraryName;
  const OpmlExportButton(
      {super.key, required this.libraryId, required this.libraryName});

  @override
  State<OpmlExportButton> createState() => _OpmlExportButtonState();
}

class _OpmlExportButtonState extends State<OpmlExportButton> {
  bool _busy = false;

  Future<void> _export() async {
    final auth = context.read<AuthProvider>();
    final api = auth.apiService;
    if (api == null || _busy) return;
    final l = AppLocalizations.of(context)!;
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null || !box.hasSize
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    setState(() => _busy = true);
    final result = await OpmlExport.export(api,
        libraryId: widget.libraryId,
        libraryName: widget.libraryName,
        dialogTitle: l.opmlExportDialogTitle,
        sharePositionOrigin: origin);
    if (!mounted) return;
    setState(() => _busy = false);
    switch (result.status) {
      case OpmlExportStatus.saved:
        showOverlayToast(context, l.opmlExportSaved(result.path ?? ''),
            icon: Icons.check_circle_outline_rounded);
      case OpmlExportStatus.downloaded:
        showOverlayToast(context, l.opmlExportDownloaded,
            icon: Icons.check_circle_outline_rounded);
      case OpmlExportStatus.failed:
        showOverlayToast(context, l.opmlExportFailed,
            icon: Icons.error_outline_rounded);
      case OpmlExportStatus.shared:
      case OpmlExportStatus.cancelled:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    if (auth.isBookOrbit || widget.libraryId.isEmpty) {
      return const SizedBox.shrink();
    }
    final cs = Theme.of(context).colorScheme;
    return IconButton(
      icon: Icon(Icons.upload_file_rounded,
          color: cs.onSurfaceVariant.withValues(alpha: 0.6), size: 22),
      tooltip: AppLocalizations.of(context)!.opmlExportAction,
      onPressed: _busy ? null : _export,
    );
  }
}

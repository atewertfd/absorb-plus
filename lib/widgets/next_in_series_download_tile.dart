import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/next_in_series_download.dart';

/// Absorb Plus: the "Download the next book in the series automatically"
/// switch in Settings > Downloads & Storage. Loads and saves its own
/// per-account value.
class NextInSeriesDownloadTile extends StatefulWidget {
  const NextInSeriesDownloadTile({
    super.key,
    this.load = getAutoDownloadNextInSeries,
    this.save = setAutoDownloadNextInSeries,
  });

  final Future<bool> Function() load;
  final Future<void> Function(bool value) save;

  @override
  State<NextInSeriesDownloadTile> createState() => _NextInSeriesDownloadTileState();
}

class _NextInSeriesDownloadTileState extends State<NextInSeriesDownloadTile> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    widget.load().then((v) {
      if (mounted) setState(() => _value = v);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return SwitchListTile(
      title: Text(l.autoDownloadNextInSeries),
      subtitle: Text(l.autoDownloadNextInSeriesSubtitle,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
      value: _value ?? false,
      onChanged: _value == null
          ? null
          : (v) {
              setState(() => _value = v);
              widget.save(v);
            },
    );
  }
}

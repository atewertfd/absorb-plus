import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/book_settings_service.dart';

/// Settings › Playback: one speed for every book (the default speed above),
/// instead of each book and series remembering its own.
class SameSpeedTile extends StatefulWidget {
  const SameSpeedTile({super.key});

  @override
  State<SameSpeedTile> createState() => _SameSpeedTileState();
}

class _SameSpeedTileState extends State<SameSpeedTile> {
  bool? _enabled;

  @override
  void initState() {
    super.initState();
    unawaited(BookSettingsService.sameSpeedForAllBooks().then((on) {
      if (mounted) setState(() => _enabled = on);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return SwitchListTile(
      secondary: Icon(Icons.speed_rounded, color: cs.primary),
      title: Text(l.sameSpeedAllBooksTitle),
      subtitle: Text(l.sameSpeedAllBooksSubtitle,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
      value: _enabled ?? false,
      onChanged: _enabled == null
          ? null
          : (v) {
              setState(() => _enabled = v);
              unawaited(BookSettingsService.setSameSpeedForAllBooks(v));
            },
    );
  }
}

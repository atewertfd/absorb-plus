import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/precache_service.dart';

/// Settings › Downloads & storage: turns the background pre-cache of covers
/// and book pages on or off (on by default; see PrecacheService).
class PrecacheSettingTile extends StatefulWidget {
  const PrecacheSettingTile({super.key});

  @override
  State<PrecacheSettingTile> createState() => _PrecacheSettingTileState();
}

class _PrecacheSettingTileState extends State<PrecacheSettingTile> {
  bool? _enabled;

  @override
  void initState() {
    super.initState();
    PrecacheService.isEnabled().then((on) {
      if (mounted) setState(() => _enabled = on);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return SwitchListTile(
      secondary: Icon(Icons.cloud_download_outlined, color: cs.primary),
      title: Text(l.precacheTitle),
      subtitle: Text(l.precacheSubtitle,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
      value: _enabled ?? true,
      onChanged: _enabled == null
          ? null
          : (v) {
              setState(() => _enabled = v);
              PrecacheService.setEnabled(v);
            },
    );
  }
}

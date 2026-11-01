import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/desktop_audio.dart';

/// Settings › Playback (Windows only): plays through the device in exclusive
/// mode, skipping the Windows mixer and the device's sound enhancements.
/// A fix for crackling or pumping volume that other players show too.
class ExclusiveAudioTile extends StatefulWidget {
  const ExclusiveAudioTile({super.key});

  static bool get supported =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

  @override
  State<ExclusiveAudioTile> createState() => _ExclusiveAudioTileState();
}

class _ExclusiveAudioTileState extends State<ExclusiveAudioTile> {
  bool? _enabled;

  @override
  void initState() {
    super.initState();
    desktopExclusiveAudio().then((on) {
      if (mounted) setState(() => _enabled = on);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ExclusiveAudioTile.supported) return const SizedBox.shrink();
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return SwitchListTile(
      secondary: Icon(Icons.headphones_rounded, color: cs.primary),
      title: Text(l.exclusiveAudioTitle),
      subtitle: Text(l.exclusiveAudioSubtitle,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
      value: _enabled ?? false,
      onChanged: _enabled == null
          ? null
          : (v) {
              setState(() => _enabled = v);
              setDesktopExclusiveAudio(v);
            },
    );
  }
}

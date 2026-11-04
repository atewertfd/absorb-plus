import 'dart:async';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/developer_mode.dart';
import '../services/test_channel_service.dart';
import '../widgets/overlay_toast.dart';
import 'test_channel_screen.dart';

/// Settings > Advanced > Developer (Absorb Plus; shown once Developer mode
/// is on). Turns Developer mode off and unlocks the test channel.
class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key, this.testChannelScreenBuilder});

  /// Tests replace the test channel page.
  final WidgetBuilder? testChannelScreenBuilder;

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  final _codeController = TextEditingController();
  bool _loaded = false;
  bool _unlocked = false;
  bool _launchCheck = false;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final unlocked = await DeveloperMode.isTestChannelUnlocked();
    final launchCheck = await DeveloperMode.launchCheckEnabled();
    if (!mounted) return;
    setState(() {
      _unlocked = unlocked;
      _launchCheck = launchCheck;
      _loaded = true;
    });
  }

  Future<void> _unlock(AppLocalizations l) async {
    final ok = await DeveloperMode.unlockTestChannel(_codeController.text);
    if (!mounted) return;
    _codeController.clear();
    if (!ok) {
      showOverlayToast(
        context,
        l.testChannelWrongCode,
        icon: Icons.error_outline_rounded,
      );
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() => _unlocked = true);
    showOverlayToast(
      context,
      l.testChannelUnlocked,
      icon: Icons.lock_open_rounded,
    );
  }

  Future<void> _turnOff() async {
    await DeveloperMode.setEnabled(false);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final supported = TestChannelService.isSupported;
    final subtitleStyle = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    return Scaffold(
      appBar: AppBar(title: Text(l.developerTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          SwitchListTile(
            title: Text(l.developerModeSwitch),
            subtitle: Text(l.developerModeSwitchSubtitle, style: subtitleStyle),
            value: true,
            onChanged: (v) {
              if (!v) unawaited(_turnOff());
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              l.testChannelTitle,
              style: tt.titleSmall?.copyWith(color: cs.primary),
            ),
          ),
          if (!supported)
            ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color: cs.onSurfaceVariant,
              ),
              title: Text(l.testChannelUnavailable, style: subtitleStyle),
            )
          else if (!_loaded)
            const SizedBox.shrink()
          else if (!_unlocked)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _codeController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: l.testChannelCodeLabel,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onSubmitted: (_) => _unlock(l),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () => _unlock(l),
                    child: Text(l.testChannelUnlock),
                  ),
                ],
              ),
            )
          else ...[
            ListTile(
              leading: Icon(Icons.science_rounded, color: cs.primary),
              title: Text(l.testChannelTitle),
              subtitle: Text(l.testChannelSubtitle, style: subtitleStyle),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: cs.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      widget.testChannelScreenBuilder ??
                      (_) => const TestChannelScreen(),
                ),
              ),
            ),
            const Divider(height: 1, indent: 16, endIndent: 16),
            SwitchListTile(
              title: Text(l.testChannelLaunchCheck),
              subtitle: Text(
                l.testChannelLaunchCheckSubtitle,
                style: subtitleStyle,
              ),
              value: _launchCheck,
              onChanged: (v) async {
                setState(() => _launchCheck = v);
                await DeveloperMode.setLaunchCheckEnabled(v);
              },
            ),
          ],
        ],
      ),
    );
  }
}

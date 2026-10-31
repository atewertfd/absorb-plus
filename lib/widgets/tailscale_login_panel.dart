import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../screens/tailscale_settings_screen.dart';
import '../services/tailscale_service.dart';
import 'overlay_toast.dart';

/// Built-in Tailscale on the sign-in screen, styled like the form's fields
/// (same rounded box, fill and border): a switch to turn it on, its status,
/// "Sign in with Tailscale" while the device still needs adding, and an
/// Advanced link to the full Tailscale screen (sign out, extra host names).
class TailscaleLoginPanel extends StatefulWidget {
  const TailscaleLoginPanel({super.key, this.service});

  final TailscaleService? service;

  @override
  State<TailscaleLoginPanel> createState() => _TailscaleLoginPanelState();
}

class _TailscaleLoginPanelState extends State<TailscaleLoginPanel> {
  late final TailscaleService _svc =
      widget.service ?? TailscaleService.instance;
  bool _busy = false;

  Future<void> _toggle(bool value) async {
    final l = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      await _svc.setEnabled(value);
    } catch (e) {
      debugPrint('[Tailscale] toggle failed: $e');
      if (mounted) {
        showOverlayToast(context, l.tailscaleToggleFailed,
            icon: Icons.error_outline_rounded);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _signIn() async {
    final l = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    final opened = await _svc.signIn();
    if (!mounted) return;
    setState(() => _busy = false);
    if (!opened) {
      showOverlayToast(context, l.tailscaleSignInNoLink,
          icon: Icons.info_outline_rounded);
    }
  }

  void _openAdvanced() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => TailscaleSettingsScreen(service: _svc),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: _svc,
      builder: (context, _) {
        final status = _svc.status;
        final on = _svc.enabled;
        final connected = on && status.isRunning;
        final needsLogin = on && status.needsLogin && status.authUrl.isNotEmpty;
        final accent = connected ? Colors.green.shade400 : cs.primary;
        return Container(
          decoration: BoxDecoration(
            color: cs.surface.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: connected
                  ? Colors.green.shade400.withValues(alpha: 0.4)
                  : cs.outlineVariant.withValues(alpha: 0.15),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(14, 8, 6, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    connected
                        ? Icons.check_circle_rounded
                        : Icons.vpn_lock_rounded,
                    size: 22,
                    color: on ? accent : cs.onSurfaceVariant,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.tailscaleBuiltInTitle,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          on
                              ? tailscaleStatusText(l, _svc, status)
                              : l.tailscaleCardPitch,
                          style: TextStyle(
                            fontSize: 12,
                            color: cs.onSurfaceVariant.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: on,
                    onChanged: _busy ? null : _toggle,
                  ),
                ],
              ),
              if (needsLogin) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilledButton.tonalIcon(
                    onPressed: _busy ? null : _signIn,
                    icon: const Icon(Icons.login_rounded, size: 18),
                    label: Text(l.tailscaleSignIn),
                  ),
                ),
              ],
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _openAdvanced,
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: cs.onSurfaceVariant,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: Text(l.loginAdvanced),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

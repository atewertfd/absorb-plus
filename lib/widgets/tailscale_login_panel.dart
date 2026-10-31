import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../screens/tailscale_settings_screen.dart';
import '../services/tailscale_service.dart';
import 'overlay_toast.dart';

/// Built-in Tailscale on the sign-in screen, styled like the form's fields
/// (same rounded box, fill and border). One obvious action per state:
/// "Connect with Tailscale" (turns it on and opens the Tailscale login in
/// the browser), "Sign in with Tailscale" while the device still needs
/// adding, "Turn off" once on; plus an Advanced link to the full screen
/// (sign out, extra host names).
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

  Future<void> _run(Future<void> Function() action) async {
    final l = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      await action();
    } catch (e) {
      debugPrint('[Tailscale] action failed: $e');
      if (mounted) {
        showOverlayToast(context, l.tailscaleToggleFailed,
            icon: Icons.error_outline_rounded);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// One step for the user: turn it on, then open the Tailscale login in
  /// the browser as soon as the node offers one (signIn waits for it).
  Future<void> _connect() => _run(() async {
        await _svc.setEnabled(true);
        if (_svc.status.isRunning) return; // already signed in before
        final opened = await _svc.signIn();
        if (!opened && mounted && !_svc.status.isRunning) {
          showOverlayToast(
              context, AppLocalizations.of(context)!.tailscaleSignInNoLink,
              icon: Icons.info_outline_rounded);
        }
      });

  Future<void> _signIn() => _run(() async {
        final opened = await _svc.signIn();
        if (!opened && mounted) {
          showOverlayToast(
              context, AppLocalizations.of(context)!.tailscaleSignInNoLink,
              icon: Icons.info_outline_rounded);
        }
      });

  Future<void> _turnOff() => _run(() => _svc.setEnabled(false));

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
        final unavailable = on && !_svc.libraryAvailable;
        final accent = connected ? Colors.green.shade400 : cs.primary;

        Widget action;
        if (!on) {
          action = FilledButton.icon(
            onPressed: _busy ? null : _connect,
            icon: _busy
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.vpn_lock_rounded, size: 18),
            label: Text(l.tailscaleConnect),
          );
        } else if (needsLogin) {
          action = FilledButton.icon(
            onPressed: _busy ? null : _signIn,
            icon: const Icon(Icons.open_in_new_rounded, size: 18),
            label: Text(l.tailscaleSignIn),
          );
        } else {
          action = OutlinedButton(
            onPressed: _busy ? null : _turnOff,
            child: Text(l.tailscaleTurnOff),
          );
        }

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
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    connected
                        ? Icons.check_circle_rounded
                        : Icons.vpn_lock_rounded,
                    size: 24,
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
                            fontSize: 15,
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
                            color: connected
                                ? Colors.green.shade400
                                : cs.onSurfaceVariant.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (!unavailable) action,
              if (!on) ...[
                const SizedBox(height: 6),
                Text(
                  l.tailscaleConnectHint,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: cs.onSurfaceVariant.withValues(alpha: 0.6),
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

/// Sign-in screen: a "Tailscale" chip beside Import and Paste login link.
/// It opens [TailscaleLoginPanel] in a sheet, and its icon turns green
/// while built-in Tailscale is connected.
class TailscaleLoginChip extends StatelessWidget {
  const TailscaleLoginChip({super.key, this.service});

  final TailscaleService? service;

  static Future<void> showSheet(BuildContext context, TailscaleService svc) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              16, 0, 16, 16 + MediaQuery.viewInsetsOf(context).bottom),
          child: TailscaleLoginPanel(service: svc),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final svc = service ?? TailscaleService.instance;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final muted = cs.onSurfaceVariant.withValues(alpha: 0.6);
    return ListenableBuilder(
      listenable: svc,
      builder: (context, _) {
        final connected = svc.enabled && svc.status.isRunning;
        return ActionChip(
          key: const Key('tailscale-login-chip'),
          avatar: Icon(
            connected ? Icons.check_circle_rounded : Icons.vpn_lock_rounded,
            size: 16,
            color: connected ? Colors.green.shade400 : muted,
          ),
          label: Text(l.tailscaleChip,
              style: tt.labelSmall?.copyWith(color: muted)),
          backgroundColor: cs.surfaceContainerHighest.withValues(alpha: 0.3),
          side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.15)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tooltip: l.tailscaleCardPitch,
          onPressed: () => showSheet(context, svc),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../services/tailscale_routing.dart';
import '../services/tailscale_service.dart';
import '../ui_themes/ui_theme_hooks.dart';
import '../widgets/overlay_toast.dart';

/// One-line status for the built-in Tailscale node, shared by the settings
/// tile and the screen.
String tailscaleStatusText(
    AppLocalizations l, TailscaleService service, TailnetStatus s) {
  if (!service.enabled) return l.tailscaleStatusOff;
  if (!service.libraryAvailable) return l.tailscaleNotIncluded;
  if (s.isRunning) {
    return s.user.isNotEmpty
        ? l.tailscaleStatusConnected(s.user)
        : l.tailscaleStatusConnectedNoUser;
  }
  if (s.needsLogin && s.authUrl.isNotEmpty) return l.tailscaleStatusNeedsLogin;
  if (s.needsApproval) return l.tailscaleStatusNeedsApproval;
  if (s.hasError && s.error.isNotEmpty) return l.tailscaleStatusError(s.error);
  return l.tailscaleStatusStarting;
}

/// Settings tile (Settings → Advanced, and the sign-in screen's Advanced
/// section) that opens [TailscaleSettingsScreen]. Fork prototype.
class TailscaleSettingsTile extends StatelessWidget {
  const TailscaleSettingsTile({super.key, this.service});

  final TailscaleService? service;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final svc = service ?? TailscaleService.instance;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: svc,
      builder: (context, _) => ListTile(
        title: Text(l.tailscaleBuiltInTitle),
        subtitle: Text(tailscaleStatusText(l, svc, svc.status),
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => TailscaleSettingsScreen(service: svc),
        )),
      ),
    );
  }
}

/// Settings: a card at the top (next to the Admin card) instead of a row
/// under Advanced, so built-in Tailscale is easy to find.
class TailscaleSettingsCard extends StatelessWidget {
  const TailscaleSettingsCard({super.key, this.service});

  final TailscaleService? service;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final svc = service ?? TailscaleService.instance;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Material(
        color: lookPanelColor(context, cs.surfaceContainerHigh),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: lookPanelSide(context, BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (_) => TailscaleSettingsScreen(service: svc),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: ListenableBuilder(
              listenable: svc,
              builder: (context, _) => Row(
                children: [
                  Icon(Icons.vpn_lock_rounded, color: cs.primary, size: 22),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.tailscaleBuiltInTitle,
                            style: tt.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        Text(
                          svc.enabled
                              ? tailscaleStatusText(l, svc, svc.status)
                              : l.tailscaleCardPitch,
                          style: tt.bodySmall
                              ?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      color: cs.onSurfaceVariant.withValues(alpha: 0.5)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Turn the built-in Tailscale node on or off, sign in and out, and see
/// whether the account's server goes through it.
class TailscaleSettingsScreen extends StatefulWidget {
  const TailscaleSettingsScreen({super.key, this.service, this.serverUrl});

  final TailscaleService? service;

  /// The server to describe; defaults to the signed-in account's.
  final String? serverUrl;

  /// How long typing pauses before the extra host list is saved.
  static const hostsSaveDelay = Duration(milliseconds: 800);

  @override
  State<TailscaleSettingsScreen> createState() =>
      _TailscaleSettingsScreenState();
}

class _TailscaleSettingsScreenState extends State<TailscaleSettingsScreen> {
  late final TailscaleService _svc = widget.service ?? TailscaleService.instance;
  late final TextEditingController _hosts =
      TextEditingController(text: _svc.extraHosts.join(', '));
  late String _savedHosts; // the text last saved, set before any typing
  Timer? _hostsSave;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _savedHosts = _hosts.text;
  }

  @override
  void dispose() {
    _saveHosts(); // typed but not yet saved (back button, tab switch)
    _hosts.dispose();
    super.dispose();
  }

  void _hostsChanged(String _) {
    _hostsSave?.cancel();
    _hostsSave = Timer(TailscaleSettingsScreen.hostsSaveDelay, _saveHosts);
  }

  void _saveHosts() {
    _hostsSave?.cancel();
    _hostsSave = null;
    final text = _hosts.text;
    if (text == _savedHosts) return;
    _savedHosts = text;
    unawaited(_svc.setExtraHosts(text).catchError((Object e) {
      debugPrint('[Tailscale] saving extra hosts failed: $e');
    }));
  }

  String? _serverUrl(BuildContext context) {
    if (widget.serverUrl != null) return widget.serverUrl;
    try {
      return context.read<AuthProvider>().serverUrl;
    } catch (_) {
      return null; // no AuthProvider above this route (tests)
    }
  }

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

  Future<void> _signIn(AppLocalizations l) async {
    setState(() => _busy = true);
    final opened = await _svc.signIn();
    if (!mounted) return;
    setState(() => _busy = false);
    if (!opened) {
      showOverlayToast(context, l.tailscaleSignInNoLink,
          icon: Icons.info_outline_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final server = _serverUrl(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.tailscaleBuiltInTitle)),
      body: ListenableBuilder(
        listenable: _svc,
        builder: (context, _) {
          final s = _svc.status;
          final available = _svc.libraryAvailable;
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(l.tailscaleIntro,
                    style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
              ),
              SwitchListTile(
                title: Text(l.tailscaleUseSwitch),
                subtitle: Text(tailscaleStatusText(l, _svc, s),
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
                value: _svc.enabled,
                onChanged: (!available && !_svc.enabled) || _busy ? null : _toggle,
              ),
              if (_svc.enabled && s.isRunning && s.primaryIp.isNotEmpty)
                ListTile(
                  leading: Icon(Icons.check_circle_rounded,
                      color: Colors.greenAccent.shade400),
                  title: Text(l.tailscaleDeviceAddress(
                      s.dnsName.isNotEmpty ? '${s.dnsName} (${s.primaryIp})' : s.primaryIp)),
                ),
              if (_svc.enabled && s.needsLogin && s.authUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: FilledButton.icon(
                    icon: const Icon(Icons.login_rounded, size: 18),
                    label: Text(l.tailscaleSignIn),
                    onPressed: _busy ? null : () => _signIn(l),
                  ),
                ),
              if (_svc.enabled && (s.isRunning || s.needsApproval))
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.logout_rounded, size: 18),
                    label: Text(l.tailscaleSignOut),
                    onPressed: _busy ? null : _svc.signOut,
                  ),
                ),
              if (server != null && server.isNotEmpty) ...[
                const Divider(height: 1, indent: 16, endIndent: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Text(
                    _svc.routesServer(server)
                        ? l.tailscaleServerRouted(server)
                        : l.tailscaleServerNotRouted(server),
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: TextField(
                  controller: _hosts,
                  decoration: InputDecoration(
                    labelText: l.tailscaleExtraHostsLabel,
                    hintText: l.tailscaleExtraHostsHint,
                    helperText: l.tailscaleExtraHostsHelp,
                    helperMaxLines: 4,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: _hostsChanged,
                  onSubmitted: (_) => _saveHosts(),
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _saveHosts();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

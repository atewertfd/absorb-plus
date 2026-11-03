import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_link.dart';
import 'adaptive_modal.dart';

/// Phone remote, the PC side (fork): the on/off switch, the pairing code
/// and QR code while it is on, and the connected and paired devices.
/// Pairing is open only while this sheet is showing.
class RemoteHostSheet extends StatefulWidget {
  const RemoteHostSheet({super.key, this.host, this.scrollController});

  /// Injected in tests; the app uses [remoteHost].
  final RemoteHostController? host;
  final ScrollController? scrollController;

  static Future<void> show(BuildContext context, {RemoteHostController? host}) {
    return showAdaptiveSheetDialog<void>(
      context: context,
      initialChildSize: 0.8,
      showDragHandle: true,
      builder: (ctx, controller) =>
          RemoteHostSheet(host: host, scrollController: controller),
    );
  }

  @override
  State<RemoteHostSheet> createState() => _RemoteHostSheetState();
}

class _RemoteHostSheetState extends State<RemoteHostSheet> {
  RemoteHostController get _host => widget.host ?? remoteHost;
  Timer? _tick;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _host.codes.open();
    unawaited(_host.devices.load());
    // The countdown, and a fresh code when one runs out.
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      _host.codes.refreshIfExpired();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    _host.codes.close();
    super.dispose();
  }

  Future<void> _setEnabled(bool on) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await _host.setEnabled(on);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final small = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    return ListenableBuilder(
      listenable: Listenable.merge([
        _host.status,
        _host.connections,
        _host.codes,
        _host.devices,
      ]),
      builder: (context, _) {
        final status = _host.status.value;
        final connections = _host.connections.value;
        final paired = _host.devices.devices;
        return ListView(
          controller: widget.scrollController,
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
              child: Text(
                l.remoteHostTitle,
                style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 8),
              child: Text(
                l.remoteHostSheetBody,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
            ),
            SwitchListTile(
              key: const Key('remote-host-switch'),
              title: Text(l.remoteHostSwitch),
              subtitle: Text(l.remoteHostSwitchSubtitle, style: small),
              value: status.enabled,
              onChanged: _busy ? null : _setEnabled,
            ),
            if (status.enabled && status.problem == RemoteHostProblem.portsBusy)
              _note(
                context,
                l.remoteHostPortsBusy(
                  kRemoteDefaultPort,
                  kRemoteDefaultPort + kRemotePortCount - 1,
                ),
                error: true,
              ),
            if (status.running) ..._pairing(context, status),
            if (connections.isNotEmpty) ...[
              _header(context, l.remoteHostConnectedTitle),
              for (final c in connections)
                ListTile(
                  leading: Icon(Icons.phone_android_rounded, color: cs.primary),
                  title: Text(c.deviceName),
                  subtitle: Text(
                    l.remoteHostConnectedFrom(
                      c.address,
                      MaterialLocalizations.of(
                        context,
                      ).formatTimeOfDay(TimeOfDay.fromDateTime(c.since)),
                    ),
                    style: small,
                  ),
                  trailing: TextButton(
                    onPressed: () => _host.disconnect(c.id),
                    child: Text(l.remoteHostDisconnect),
                  ),
                ),
            ],
            _header(context, l.remoteHostPairedTitle),
            if (paired.isEmpty)
              _note(context, l.remoteHostNoDevices)
            else
              for (final d in paired)
                ListTile(
                  leading: Icon(
                    Icons.devices_rounded,
                    color: cs.onSurfaceVariant,
                  ),
                  title: Text(d.name),
                  subtitle: Text(
                    l.remoteHostLastUsed(
                      MaterialLocalizations.of(
                        context,
                      ).formatMediumDate(d.lastSeen),
                    ),
                    style: small,
                  ),
                  trailing: TextButton(
                    key: Key('remote-host-forget-${d.id}'),
                    onPressed: () => _host.forget(d.id),
                    child: Text(l.remoteHostForget),
                  ),
                ),
          ],
        );
      },
    );
  }

  List<Widget> _pairing(BuildContext context, RemoteHostStatus status) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final codes = _host.codes;
    final code = codes.code;
    final expires = codes.expiresAt;
    final left = expires == null
        ? Duration.zero
        : expires.difference(DateTime.now());
    final secs = left.isNegative ? 0 : left.inSeconds;
    final countdown = '${secs ~/ 60}:${(secs % 60).toString().padLeft(2, '0')}';
    final address = status.addresses.isEmpty ? null : status.addresses.first;
    final shownCode = code == null
        ? '------'
        : '${code.substring(0, 3)} ${code.substring(3)}';
    return [
      _header(context, l.remoteHostPairTitle),
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: Text(
          l.remoteHostPairHelp,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          color: cs.surfaceContainerHigh,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 24,
              runSpacing: 16,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l.remoteHostCodeLabel,
                      style: tt.labelMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Semantics(
                      label: l.remoteHostCodeLabel,
                      value: code,
                      child: Text(
                        shownCode,
                        key: const Key('remote-host-code'),
                        style: tt.displaySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l.remoteHostCodeExpires(countdown),
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                    TextButton.icon(
                      onPressed: codes.refresh,
                      icon: const Icon(Icons.refresh_rounded, size: 18),
                      label: Text(l.remoteHostNewCode),
                    ),
                  ],
                ),
                if (code != null && address != null && status.port != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: QrImageView(
                      data: RemotePairingLink(
                        address: address,
                        port: status.port!,
                        hostId: status.hostId,
                        code: code,
                      ).encode(),
                      version: QrVersions.auto,
                      size: 132,
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.black,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      _note(
        context,
        status.addresses.isEmpty
            ? l.remoteHostNoAddress
            : l.remoteHostAddresses(
                status.addresses.map((a) => '$a:${status.port}').join(', '),
              ),
        selectable: true,
      ),
      if (!status.discovery) _note(context, l.remoteHostNoDiscovery),
    ];
  }

  Widget _header(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _note(
    BuildContext context,
    String text, {
    bool error = false,
    bool selectable = false,
  }) {
    final cs = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: error ? cs.error : cs.onSurfaceVariant,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
      child: selectable
          ? SelectableText(text, style: style)
          : Text(text, style: style),
    );
  }
}

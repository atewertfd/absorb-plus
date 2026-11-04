import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_link.dart';
import 'adaptive_modal.dart';

/// "Control from your phone", the PC side (fork): the on/off switch, the
/// pairing steps with the code and QR code while a pairing window is open,
/// and the connected and paired devices. Closing the sheet closes pairing.
class RemoteHostSheet extends StatefulWidget {
  const RemoteHostSheet({super.key, this.host, this.scrollController});

  /// Injected in tests; the app uses [remoteHost].
  final RemoteHostController? host;
  final ScrollController? scrollController;

  static Future<void> show(BuildContext context, {RemoteHostController? host}) {
    return showAdaptiveSheetDialog<void>(
      context: context,
      initialChildSize: 0.85,
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
    unawaited(_host.devices.load());
    unawaited(_host.refreshAddresses());
    // The countdown, and closing a window that ran out.
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      _host.codes.closeIfExpired();
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

  Future<void> _forgetAll() async {
    final l = AppLocalizations.of(context)!;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(l.remoteHostForgetAllConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel),
          ),
          FilledButton(
            key: const Key('remote-host-forget-all-confirm'),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.remoteHostForgetAll),
          ),
        ],
      ),
    );
    if (ok == true) await _host.forgetAll();
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
            SwitchListTile(
              key: const Key('remote-host-keep-on'),
              title: Text(l.remoteHostKeepOn),
              subtitle: Text(l.remoteHostKeepOnSubtitle, style: small),
              value: status.keepOn,
              onChanged: (v) => unawaited(_host.setKeepOn(v)),
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
            ..._pairing(context, status, paired.isNotEmpty),
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
            _header(
              context,
              l.remoteHostPairedTitle,
              trailing: paired.isEmpty
                  ? null
                  : TextButton(
                      key: const Key('remote-host-forget-all'),
                      onPressed: _forgetAll,
                      child: Text(l.remoteHostForgetAll),
                    ),
            ),
            if (paired.isEmpty)
              _note(context, l.remoteHostNoDevices)
            else ...[
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
              _note(context, l.remoteHostUnusedNote),
            ],
          ],
        );
      },
    );
  }

  List<Widget> _pairing(
    BuildContext context,
    RemoteHostStatus status,
    bool anyPaired,
  ) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    final codes = _host.codes;
    final code = status.running ? codes.code : null;
    final address = preferredRemoteAddress(status.addresses);
    final steps = [l.remoteHostStep1, l.remoteHostStep2, l.remoteHostStep3];
    return [
      _header(context, l.remoteHostPairTitle),
      for (final step in steps)
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 2, 24, 2),
          child: Text(step, style: tt.bodyMedium),
        ),
      const SizedBox(height: 8),
      if (code != null)
        _codeCard(context, status, code, address)
      else if (status.running && _host.devices.isFull)
        _note(context, l.remoteHostFull)
      else if (status.running) ...[
        _note(context, l.remoteHostPairingClosed),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.tonalIcon(
              key: const Key('remote-host-pair-another'),
              onPressed: _host.openPairing,
              icon: const Icon(Icons.add_link_rounded),
              label: Text(
                anyPaired ? l.remoteHostPairAnother : l.remoteHostPairFirst,
              ),
            ),
          ),
        ),
      ],
      if (status.running) ...[
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
      ],
    ];
  }

  Widget _codeCard(
    BuildContext context,
    RemoteHostStatus status,
    String code,
    String? address,
  ) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final expires = _host.codes.expiresAt;
    final left = expires == null
        ? Duration.zero
        : expires.difference(DateTime.now());
    final secs = left.isNegative ? 0 : left.inSeconds;
    final countdown = '${secs ~/ 60}:${(secs % 60).toString().padLeft(2, '0')}';
    final shownCode = '${code.substring(0, 3)} ${code.substring(3)}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: cs.surfaceContainerHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              if (address != null && status.port != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: QrImageView(
                    key: const Key('remote-host-qr'),
                    data: RemotePairingLink(
                      address: address,
                      port: status.port!,
                      hostId: status.hostId,
                      code: code,
                    ).encode(),
                    version: QrVersions.auto,
                    size: 148,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l.remoteHostCodeLabel,
                    style: tt.labelMedium?.copyWith(color: cs.onSurfaceVariant),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, String text, {Widget? trailing}) {
    final cs = Theme.of(context).colorScheme;
    final label = Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: cs.primary,
        fontWeight: FontWeight.w600,
      ),
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 20, trailing == null ? 24 : 12, 6),
      child: trailing == null
          ? label
          : Row(
              children: [
                Expanded(child: label),
                trailing,
              ],
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

/// "Allow ‘<device>’ to control Absorb on this PC?" Deny, no answer within
/// the request's timeout, or the device giving up all mean no.
class RemotePairApprovalDialog extends StatelessWidget {
  const RemotePairApprovalDialog({
    super.key,
    required this.deviceName,
    required this.onAnswer,
  });

  final String deviceName;
  final ValueChanged<bool> onAnswer;

  /// Shows the question on [navigator] and answers [request].
  static Future<bool> ask(NavigatorState navigator, RemotePairRequest request) {
    final done = Completer<bool>();
    late final DialogRoute<void> route;
    void answer(bool allowed) {
      if (!done.isCompleted) done.complete(allowed);
      if (route.isActive) navigator.removeRoute(route);
    }

    route = DialogRoute<void>(
      context: navigator.overlay?.context ?? navigator.context,
      barrierDismissible: false,
      builder: (_) => RemotePairApprovalDialog(
        deviceName: request.deviceName,
        onAnswer: answer,
      ),
    );
    unawaited(navigator.push(route).then((_) => answer(false)));
    final timer = Timer(request.timeout, () => answer(false));
    unawaited(request.cancelled.then((_) => answer(false)));
    return done.future.whenComplete(timer.cancel);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.phonelink_lock_rounded),
      title: Text(l.remoteHostAllowTitle(deviceName)),
      content: Text(l.remoteHostAllowBody),
      actions: [
        TextButton(
          key: const Key('remote-host-deny'),
          onPressed: () => onAnswer(false),
          child: Text(l.remoteHostDeny),
        ),
        FilledButton(
          key: const Key('remote-host-allow'),
          onPressed: () => onAnswer(true),
          child: Text(l.remoteHostAllow),
        ),
      ],
    );
  }
}

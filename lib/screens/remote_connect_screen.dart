import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_link.dart';
import 'remote_control_screen.dart';

/// "Control your computer", the remote side (fork): paired computers,
/// computers found on the network, or a typed address; then the code, then
/// the remote. A scanned pairing link ([link]) opens the code step filled in;
/// the user still confirms it.
class RemoteConnectScreen extends StatefulWidget {
  const RemoteConnectScreen({
    super.key,
    this.connector,
    this.book = const RemoteHostBook(),
    this.link,
  });

  /// Injected in tests; the app uses [remoteLinkConnector].
  final RemoteLinkConnector? connector;
  final RemoteHostBook book;
  final RemotePairingLink? link;

  static Future<void> open(
    BuildContext context, {
    RemoteLinkConnector? connector,
    RemotePairingLink? link,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => RemoteConnectScreen(connector: connector, link: link),
      ),
    );
  }

  @override
  State<RemoteConnectScreen> createState() => _RemoteConnectScreenState();
}

class _RemoteConnectScreenState extends State<RemoteConnectScreen> {
  RemoteLinkConnector get _connector => widget.connector ?? remoteLinkConnector;

  List<SavedRemoteHost> _saved = const [];
  final List<RemoteHostAnnouncement> _found = [];
  StreamSubscription<RemoteHostAnnouncement>? _search;
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    final link = widget.link;
    if (link == null) {
      unawaited(_loadSaved());
    } else {
      unawaited(_openLink(link));
    }
    _startSearch();
  }

  /// A scanned code: a computer paired before opens at its (maybe new)
  /// address, which it must still prove; a new one asks for the code,
  /// already filled in.
  Future<void> _openLink(RemotePairingLink link) async {
    final saved = await widget.book.find(link.hostId);
    await _loadSaved();
    if (!mounted) return;
    if (saved != null) {
      final moved = saved.copyWith(address: link.address, port: link.port);
      await widget.book.moved(link.hostId, link.address, link.port);
      await _loadSaved();
      if (!mounted) return;
      await _openRemote(moved);
      return;
    }
    await _pair(link.address, link.port, link.address, code: link.code);
  }

  @override
  void dispose() {
    unawaited(_search?.cancel());
    super.dispose();
  }

  Future<void> _loadSaved() async {
    final saved = await widget.book.load();
    if (mounted) setState(() => _saved = saved);
  }

  void _startSearch() {
    unawaited(_search?.cancel());
    setState(() {
      _found.clear();
      _searching = true;
    });
    _search = _connector.discover().listen(
      (found) {
        if (!mounted) return;
        setState(() => _found.add(found));
        // A paired computer at a new address: it proves itself on connect,
        // so the saved entry can follow it.
        for (final h in _saved) {
          if (h.hostId == found.hostId &&
              (h.address != found.address || h.port != found.port)) {
            unawaited(
              widget.book
                  .moved(h.hostId, found.address, found.port)
                  .then((_) => _loadSaved()),
            );
          }
        }
      },
      onDone: () {
        if (mounted) setState(() => _searching = false);
      },
      onError: (Object _) {},
    );
  }

  Future<void> _openRemote(SavedRemoteHost host) async {
    unawaited(_search?.cancel());
    final result = await Navigator.of(context).push<RemoteControlExit>(
      MaterialPageRoute(
        builder: (_) =>
            RemoteControlScreen(host: host, connector: widget.connector),
      ),
    );
    if (!mounted) return;
    if (result == RemoteControlExit.pairAgain) {
      await widget.book.forget(host.hostId);
      await _loadSaved();
      if (!mounted) return;
      await _pair(host.address, host.port, host.name);
      return;
    }
    _startSearch();
  }

  Future<void> _pair(
    String address,
    int port,
    String name, {
    String code = '',
  }) async {
    final host = await showDialog<SavedRemoteHost>(
      context: context,
      builder: (_) => _PairDialog(
        connector: _connector,
        address: address,
        port: port,
        name: name,
        code: code,
      ),
    );
    if (host == null || !mounted) return;
    await widget.book.save(host);
    await _loadSaved();
    if (!mounted) return;
    await _openRemote(host);
  }

  Future<void> _enterAddress() async {
    final parsed = await showDialog<({String host, int port})>(
      context: context,
      builder: (_) => const _AddressDialog(),
    );
    if (parsed == null || !mounted) return;
    await _pair(parsed.host, parsed.port, parsed.host);
  }

  Future<void> _forget(SavedRemoteHost host) async {
    await widget.book.forget(host.hostId);
    await _loadSaved();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final small = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    // A paired computer is listed under Paired, even when it answers from a
    // new address: it has to prove it knows the shared key before anything
    // is sent, so a faked announcement gets nowhere.
    final known = {for (final h in _saved) h.hostId};
    final fresh = _found.where((f) => !known.contains(f.hostId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(l.remoteControlAnother),
        actions: [
          IconButton(
            tooltip: l.remoteConnectSearchAgain,
            onPressed: _searching ? null : _startSearch,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              l.remoteConnectIntro,
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
          ),
          if (_saved.isNotEmpty) ...[
            _header(context, l.remoteConnectPaired),
            for (final host in _saved)
              ListTile(
                key: Key('remote-saved-${host.hostId}'),
                leading: Icon(Icons.computer_rounded, color: cs.primary),
                title: Text(host.name.isEmpty ? host.address : host.name),
                subtitle: Text('${host.address}:${host.port}', style: small),
                trailing: IconButton(
                  tooltip: l.remoteConnectForget,
                  icon: Icon(Icons.close_rounded, color: cs.onSurfaceVariant),
                  onPressed: () => _forget(host),
                ),
                onTap: () => _openRemote(host),
              ),
          ],
          _header(context, l.remoteConnectFound),
          if (_searching && fresh.isEmpty)
            ListTile(
              leading: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              title: Text(l.remoteConnectSearching, style: small),
            )
          else if (fresh.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Text(l.remoteConnectNoneFound, style: small),
            ),
          for (final found in fresh)
            ListTile(
              key: Key('remote-found-${found.hostId}'),
              leading: Icon(Icons.computer_rounded, color: cs.onSurfaceVariant),
              title: Text(found.name.isEmpty ? found.address : found.name),
              subtitle: Text('${found.address}:${found.port}', style: small),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: cs.onSurfaceVariant,
              ),
              onTap: () => _pair(
                found.address,
                found.port,
                found.name.isEmpty ? found.address : found.name,
              ),
            ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            leading: Icon(Icons.edit_rounded, color: cs.onSurfaceVariant),
            title: Text(l.remoteConnectEnterAddress),
            onTap: _enterAddress,
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// "address" or "address:port"; pops the parsed address.
class _AddressDialog extends StatefulWidget {
  const _AddressDialog();

  @override
  State<_AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<_AddressDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = parseRemoteAddress(_controller.text);
    if (value == null) {
      setState(
        () =>
            _error = AppLocalizations.of(context)!.remoteConnectAddressInvalid,
      );
      return;
    }
    Navigator.pop(context, value);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l.remoteConnectEnterAddress),
      content: TextField(
        key: const Key('remote-address-field'),
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          hintText: l.remoteConnectAddressHint,
          errorText: _error,
          errorMaxLines: 3,
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.cancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l.remoteConnectNext)),
      ],
    );
  }
}

/// The 6-digit code, then pairing; pops the saved host on success.
class _PairDialog extends StatefulWidget {
  const _PairDialog({
    required this.connector,
    required this.address,
    required this.port,
    required this.name,
    this.code = '',
  });

  final RemoteLinkConnector connector;
  final String address;
  final int port;
  final String name;

  /// From a scanned link: filled in, sent only when the user taps Pair.
  final String code;

  @override
  State<_PairDialog> createState() => _PairDialogState();
}

class _PairDialogState extends State<_PairDialog> {
  late final _code = TextEditingController(text: widget.code);
  bool _busy = false;
  bool _waiting = false;
  String? _error;

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  String _message(AppLocalizations l, String code) => switch (code) {
    RemoteErrorCode.badCode => l.remotePairBadCode,
    RemoteErrorCode.codeExpired => l.remotePairExpired,
    RemoteErrorCode.pairingClosed => l.remotePairClosed,
    RemoteErrorCode.pairDenied => l.remotePairDenied,
    RemoteErrorCode.tooManyDevices => l.remotePairTooManyDevices,
    RemoteErrorCode.tooManyAttempts => l.remotePairTooMany,
    RemoteErrorCode.unsupportedVersion => l.remoteVersionMismatch,
    RemotePairResult.unreachable => l.remotePairUnreachable,
    _ => l.remotePairFailed,
  };

  Future<void> _submit() async {
    final code = _code.text.trim();
    if (_busy || code.length != 6) return;
    final l = AppLocalizations.of(context)!;
    setState(() {
      _busy = true;
      _error = null;
    });
    final name = await widget.connector.deviceName();
    final result = await widget.connector.pair(
      address: widget.address,
      port: widget.port,
      code: code,
      deviceName: name,
      onWaiting: () {
        if (mounted) setState(() => _waiting = true);
      },
    );
    if (!mounted) return;
    if (result.host != null) {
      Navigator.pop(context, result.host);
      return;
    }
    setState(() {
      _busy = false;
      _waiting = false;
      _error = _message(l, result.error ?? RemoteErrorCode.failed);
      _code.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    // Not dismissed mid-pairing: the host would keep a pairing nobody holds.
    return PopScope(
      canPop: !_busy,
      child: AlertDialog(
        title: Text(l.remoteConnectCodeTitle(widget.name)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.remoteConnectCodeHelp, style: tt.bodyMedium),
            const SizedBox(height: 12),
            TextField(
              key: const Key('remote-code-field'),
              controller: _code,
              autofocus: true,
              enabled: !_busy,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: tt.headlineSmall?.copyWith(letterSpacing: 6),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                counterText: '',
                errorText: _error,
                errorMaxLines: 3,
              ),
              onChanged: (v) {
                if (v.length == 6) unawaited(_submit());
              },
              onSubmitted: (_) => _submit(),
            ),
            if (_waiting)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  l.remoteConnectWaiting,
                  key: const Key('remote-pair-waiting'),
                  style: tt.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _busy ? null : () => Navigator.pop(context),
            child: Text(l.cancel),
          ),
          FilledButton(
            onPressed: _busy ? null : _submit,
            child: _busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l.remoteConnectPair),
          ),
        ],
      ),
    );
  }
}

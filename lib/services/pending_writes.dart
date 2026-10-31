import 'dart:async';

import 'package:flutter/widgets.dart';

/// Writes that are held back for a moment (debounced files, buffered history
/// lines, the streaming listening counter) register a flush here, so quitting
/// or backgrounding the app pushes them to disk first (Absorb Plus).
///
/// - Windows: the runner's quit flow calls `WindowsShell.prepareToExit`, which
///   awaits [flushAll].
/// - Android and the rest: [installLifecycleFlush] flushes when the app is
///   hidden, paused or detached.
abstract final class PendingWrites {
  static final Map<Object, Future<void> Function()> _flushers = {};
  static bool _observing = false;

  /// Registers [flush] under [owner]; a second call for the same owner
  /// replaces it.
  static void register(Object owner, Future<void> Function() flush) =>
      _flushers[owner] = flush;

  static void unregister(Object owner) => _flushers.remove(owner);

  @visibleForTesting
  static int get registeredCount => _flushers.length;

  /// Runs every registered flush and waits for them, at most [timeout]. A
  /// failing flush is logged and does not stop the others.
  static Future<void> flushAll({
    Duration timeout = const Duration(seconds: 3),
  }) async {
    final running = [
      for (final entry in _flushers.entries.toList())
        Future.sync(entry.value).catchError((Object e) {
          debugPrint(
            '[PendingWrites] flush of ${entry.key.runtimeType} failed: $e',
          );
        }),
    ];
    if (running.isEmpty) return;
    await Future.wait(running).timeout(
      timeout,
      onTimeout: () {
        debugPrint(
          '[PendingWrites] flush still running after $timeout - carrying on',
        );
        return const [];
      },
    );
  }

  /// Flush whenever the app leaves the foreground. Call once after the
  /// binding is initialized.
  static void installLifecycleFlush() {
    if (_observing) return;
    _observing = true;
    WidgetsBinding.instance.addObserver(_FlushOnBackground());
  }
}

class _FlushOnBackground with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        unawaited(PendingWrites.flushAll());
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        break;
    }
  }
}

import 'package:flutter/foundation.dart';

/// Fork: which account a piece of in-flight work belongs to.
///
/// Per-account data is stored under the active scope, resolved when it is
/// written. Work started for one account (a socket event, a slow server
/// answer, a timer) that finishes after the scope moved would land in the
/// next account. The epoch moves *before* the scope does, and the handlers
/// run then, so the old account's live machinery stops while its scope is
/// still the active one.
class AccountEpoch {
  AccountEpoch._();

  static int _value = 0;

  /// The current epoch. Capture it before an await and compare afterwards
  /// with [isCurrent].
  static int get current => _value;

  static bool isCurrent(int epoch) => epoch == _value;

  static final List<Future<void> Function()> _handlers = [];

  /// Runs [handler] each time the account is about to change.
  static void addHandler(Future<void> Function() handler) {
    if (!_handlers.contains(handler)) _handlers.add(handler);
  }

  static void removeHandler(Future<void> Function() handler) {
    _handlers.remove(handler);
  }

  /// Called right before the active account changes. Moves the epoch, then
  /// runs every handler; a failing handler never stops the change.
  static Future<void> advance() async {
    _value++;
    for (final handler in List.of(_handlers)) {
      try {
        await handler();
      } catch (e) {
        debugPrint('[AccountEpoch] handler failed: $e');
      }
    }
  }

  @visibleForTesting
  static void resetForTest() {
    _value = 0;
    _handlers.clear();
  }
}

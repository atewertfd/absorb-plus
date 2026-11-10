// Absorb Plus: one way to handle errors that are expected and safe to skip,
// so they still leave a trace in the log instead of vanishing.
//
// Fork rules (enforced for fork files under lib/ by tool/fork_lints.py):
// - no empty `catch` block: either a comment says why the error doesn't
//   matter (best-effort cleanup of a file that may already be gone), or the
//   block calls [swallow];
// - no silently dropped Future: await it, wrap it in `unawaited(...)` when
//   its own code handles failures, or use [fireAndLog].
import 'dart:async';

import 'package:flutter/foundation.dart';

/// Logs an error that the caller deliberately doesn't act on.
///
/// [tag] is the usual `[Tag]` prefix of the area's log lines.
void swallow(String tag, Object error) {
  debugPrint('[$tag] ignored: $error');
}

/// Starts [future] without waiting for it and logs a failure under [tag]
/// instead of letting it reach the app-wide unhandled-error handler without
/// context. A null future is ignored.
void fireAndLog(Future<Object?>? future, String tag) {
  if (future == null) return;
  unawaited(future.then<void>((_) {}, onError: (Object error) {
    debugPrint('[$tag] failed: $error');
  }));
}

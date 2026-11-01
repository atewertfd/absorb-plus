import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_service.dart';
import 'scoped_prefs.dart';

/// Absorb Plus: what a partly failed local-session replay leaves queued.
///
/// The replay used to drop nothing unless every session went through, so one
/// reading session the server could never place (a book with no progress
/// row: another server's download, or one since deleted) kept every other
/// session queued and re-uploaded on each flush, forever. Now each session
/// is settled on its own: taken ones leave, and a reading session that has
/// found no progress row [maxNoRowTries] times is given up on.
@immutable
class ReplayOutcome {
  /// Raw queue entries to remove.
  final List<String> drop;

  /// Raw queue entries to rewrite (old raw -> new raw), to count tries.
  final Map<String, String> replace;

  const ReplayOutcome(this.drop, this.replace);
}

const maxNoRowTries = 10;

/// [sessionRaw] and [sessions] are the queued entries in the order they were
/// sent (any in-progress active session comes after them and is ignored).
/// [alsoDrop] are entries already known to be done with (unreadable ones).
ReplayOutcome settleReplay(
  List<String> sessionRaw,
  List<Map<String, dynamic>> sessions,
  LocalSessionResult result, {
  List<String> alsoDrop = const [],
}) {
  final drop = <String>[...alsoDrop];
  final replace = <String, String>{};
  for (var i = 0; i < sessionRaw.length; i++) {
    if (result.settled.contains(i)) {
      drop.add(sessionRaw[i]);
    } else if (result.withoutRow.contains(i)) {
      final tries = ((sessions[i]['noRowTries'] as num?)?.toInt() ?? 0) + 1;
      if (tries >= maxNoRowTries) {
        debugPrint('[LocalSession] Giving up on reading session ${sessions[i]['id']} '
            'for ${sessions[i]['libraryItemId']}: the server has no progress row for it');
        drop.add(sessionRaw[i]);
      } else {
        replace[sessionRaw[i]] =
            jsonEncode({...sessions[i], 'noRowTries': tries});
      }
    }
  }
  return ReplayOutcome(drop, replace);
}

/// Apply [outcome] to the queue at [key] in one write, leaving anything
/// queued since the replay started.
Future<void> applyReplayOutcome(String key, ReplayOutcome outcome) async {
  if (outcome.drop.isEmpty && outcome.replace.isEmpty) return;
  final pending = await ScopedPrefs.getStringList(key);
  for (final raw in outcome.drop) {
    pending.remove(raw);
  }
  outcome.replace.forEach((from, to) {
    final i = pending.indexOf(from);
    if (i >= 0) pending[i] = to;
  });
  await ScopedPrefs.setStringList(key, pending);
}

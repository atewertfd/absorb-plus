import 'dart:async';
import 'dart:convert';

import 'package:absorb/services/audio_player_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// Session syncs run one at a time, so two POSTs on the same session can't
/// land out of order. Run on the real service with no engine behind it and
/// a fake server.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  late List<double> posted;
  late List<int> listened;
  late int inFlight;
  late int maxInFlight;
  late List<Completer<void>> replies;

  setUp(() {
    posted = [];
    listened = [];
    inFlight = 0;
    maxInFlight = 0;
    replies = [];
  });

  AudioPlayerService loadWithSession() {
    final api = mockApi((request) async {
      if (!request.url.path.endsWith('/sync')) return http.Response('{}', 200);
      final body = jsonDecode(request.body) as Map<String, dynamic>;
      posted.add((body['currentTime'] as num).toDouble());
      listened.add((body['timeListened'] as num).toInt());
      inFlight++;
      if (inFlight > maxInFlight) maxInFlight = inFlight;
      final reply = Completer<void>();
      replies.add(reply);
      await reply.future;
      inFlight--;
      return http.Response('{}', 200);
    });
    final player = AudioPlayerService();
    player.debugSetLoadedItem('book-1', api);
    player.debugPlaybackSessionId = 'session-1';
    addTearDown(() {
      player.debugPlaybackSessionId = null;
      player.debugSetLoadedItem(null, null);
    });
    return player;
  }

  Future<void> settle() async {
    for (var i = 0; i < 20; i++) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  Future<void> answerAll() async {
    while (true) {
      await settle();
      final open = replies.where((r) => !r.isCompleted).toList();
      if (open.isEmpty) return;
      for (final r in open) {
        r.complete();
      }
    }
  }

  test('syncs asked for while one runs wait, then run once with the latest',
      () async {
    final player = loadWithSession();

    final first = player.debugSyncToServer(const Duration(seconds: 10));
    await settle();
    final second = player.debugSyncToServer(const Duration(seconds: 20));
    final third = player.debugSyncToServer(const Duration(seconds: 30));
    await settle();

    expect(posted, [10.0], reason: 'the others wait for the first');

    await answerAll();
    await Future.wait([first, second, third]);

    expect(maxInFlight, 1);
    expect(posted, [10.0, 30.0],
        reason: 'one follow-up, with the newest position');
  });

  test('a queued sync for a book that is no longer loaded is dropped',
      () async {
    final player = loadWithSession();

    final first = player.debugSyncToServer(const Duration(seconds: 10));
    await settle();
    final queued = player.debugSyncToServer(const Duration(seconds: 20));
    await settle();
    // Another book was started meanwhile.
    player.debugSetLoadedItem('book-2', null);

    await answerAll();
    await Future.wait([first, queued]);

    expect(posted, [10.0]);
  });

  test('a merged request keeps a pause or stop saying nothing was listened',
      () async {
    final player = loadWithSession();

    final first = player.debugSyncToServer(const Duration(seconds: 10));
    await settle();
    // Two minutes since the last sync by the wall clock...
    final now = DateTime.now();
    player.debugListeningClocks = (
      accrual: now,
      serverSync: now.subtract(const Duration(minutes: 2)),
    );
    // ...but a stop while paused says none of it was listening, and a tick
    // queued after it must not undo that.
    final stop = player.debugSyncToServer(const Duration(seconds: 20),
        timeListenedOverride: 0);
    final tick = player.debugSyncToServer(const Duration(seconds: 30));

    await answerAll();
    await Future.wait([first, stop, tick]);

    expect(posted, [10.0, 30.0]);
    expect(listened.last, 0);
  });
}

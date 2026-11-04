import 'dart:convert';

import 'package:absorb/services/audio_player_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// The stream's retry through server transcoding goes through the normal
/// streamed start, so a retry that can't start ends cleared like any failed
/// start, instead of half-cleared with the old item still "loaded". Run on
/// the real service with no engine behind it and a fake server.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  late List<String> requests;
  setUp(() => requests = []);

  AudioPlayerService loadWith(http.Response Function(http.Request) play) {
    final api = mockApi((request) async {
      requests.add('${request.method} ${request.url.path}');
      if (request.url.path.endsWith('/play')) return play(request);
      return http.Response('{}', 200);
    });
    final player = AudioPlayerService();
    player.debugSetLoadedItem('book-1', api);
    player.debugPlaybackSessionId = 'failed-session';
    addTearDown(() {
      player.debugPlaybackSessionId = null;
      player.debugSetLoadedItem(null, null);
    });
    return player;
  }

  test('no transcoded session: the player ends cleared, the failed session '
      'closed', () async {
    final player = loadWith((_) => http.Response('unavailable', 503));

    await player.debugRetryWithTranscode();

    expect(requests, contains('POST /api/session/failed-session/close'));
    expect(requests.where((r) => r.endsWith('/play')), isNotEmpty);
    expect(player.currentItemId, isNull, reason: 'not left half-loaded');
    expect(player.hasBook, isFalse);
    expect(player.debugPlaybackSessionId, isNull);
  });

  test('a transcoded session with no tracks: cleared too, no session kept',
      () async {
    final player = loadWith((_) => http.Response(
        jsonEncode({'id': 'empty-session', 'audioTracks': <Object>[]}), 200));

    await player.debugRetryWithTranscode();

    expect(player.currentItemId, isNull);
    expect(player.debugPlaybackSessionId, isNull,
        reason: 'the empty session is not adopted');
  });
}

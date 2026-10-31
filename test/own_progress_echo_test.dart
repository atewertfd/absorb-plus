import 'package:absorb/services/own_progress_echo.dart';
import 'package:absorb/utils/cover_decode_size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isOwnPlayingProgressEcho', () {
    final echo = {'libraryItemId': 'li_1', 'currentTime': 120.0, 'fromSession': 'ses_1'};

    test('our own session while playing is an echo', () {
      expect(
        isOwnPlayingProgressEcho(echo, playbackSessionId: 'ses_1', playing: true),
        isTrue,
      );
    });

    test('our own session while paused is not (the paused path decides)', () {
      expect(
        isOwnPlayingProgressEcho(echo, playbackSessionId: 'ses_1', playing: false),
        isFalse,
      );
    });

    test('another session or device is not', () {
      expect(
        isOwnPlayingProgressEcho(echo, playbackSessionId: 'ses_2', playing: true),
        isFalse,
      );
      expect(
        isOwnPlayingProgressEcho(
          {'libraryItemId': 'li_1', 'currentTime': 120.0},
          playbackSessionId: 'ses_1',
          playing: true,
        ),
        isFalse,
        reason: 'no fromSession: an older server or a poll',
      );
    });

    test('no playback session here is not', () {
      expect(
        isOwnPlayingProgressEcho(echo, playbackSessionId: null, playing: true),
        isFalse,
      );
    });
  });

  group('coverDecodeWidth', () {
    test('decodes at the drawn size, rounded up', () {
      expect(coverDecodeWidth(300, 300, 3), 960); // 900 -> 960
      expect(coverDecodeWidth(400, 400, 1), 448);
      expect(coverDecodeWidth(256, 256, 1), 256);
    });

    test('uses the longer side (a square cover filling a tall box)', () {
      expect(coverDecodeWidth(200, 300, 2), 640);
    });

    test('no finite size decodes at full size', () {
      expect(coverDecodeWidth(double.infinity, 300, 2), isNull);
    });
  });
}

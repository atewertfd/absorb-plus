import 'dart:io';

import 'package:absorb/services/desktop_audio_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('exclusive audio is off by default', () async {
    expect(await desktopExclusiveAudio(), isFalse);
  });

  test('turning it on is saved and adds audio-exclusive on Windows only',
      () async {
    await setDesktopExclusiveAudio(true);
    expect(await desktopExclusiveAudio(), Platform.isWindows);
    expect(JustAudioMediaKit.mpvProperties['audio-buffer'], '1.0');
    expect(JustAudioMediaKit.mpvProperties['audio-exclusive'],
        Platform.isWindows ? 'yes' : isNull);

    await setDesktopExclusiveAudio(false);
    expect(await desktopExclusiveAudio(), isFalse);
    expect(JustAudioMediaKit.mpvProperties.containsKey('audio-exclusive'),
        isFalse);
  });
}

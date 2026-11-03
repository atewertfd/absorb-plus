import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/exclusive_audio_fallback.dart';
import 'package:absorb/widgets/exclusive_audio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _refused = 'Could not open/initialize audio device -> no sound.';

void main() {
  group('isAudioOutputFailure', () {
    test("matches mpv's failed audio output line", () {
      expect(
        ExclusiveAudioFallback.isAudioOutputFailure(
          'error',
          'cplayer',
          _refused,
        ),
        isTrue,
      );
      expect(
        ExclusiveAudioFallback.isAudioOutputFailure(
          'fatal',
          'cplayer',
          _refused,
        ),
        isTrue,
      );
    });

    test('ignores other lines', () {
      for (final (level, prefix, text) in [
        ('warn', 'cplayer', _refused),
        ('error', 'ao', "Failed to initialize audio driver 'wasapi'"),
        ('error', 'ao/wasapi', 'Unable to find a supported format'),
        ('error', 'cplayer', 'Failed to open https://host/file.'),
        ('error', 'ffmpeg', 'tcp: Connection refused'),
      ]) {
        expect(
          ExclusiveAudioFallback.isAudioOutputFailure(level, prefix, text),
          isFalse,
          reason: '$level $prefix $text',
        );
      }
    });
  });

  group('decide', () {
    late ExclusiveAudioFallback fallback;
    late int fellBack;

    setUp(() {
      fallback = ExclusiveAudioFallback();
      fellBack = 0;
      fallback.onFallBack = () => fellBack++;
    });

    test('in shared mode a failure is left to the player', () {
      expect(fallback.decide('error', 'cplayer', _refused), isNull);
      expect(fellBack, 0);
      expect(fallback.notice.value, isFalse);
    });

    test('an exclusive-mode failure switches to shared mode once', () {
      fallback.exclusiveRequested = true;
      expect(fallback.decide('warn', 'ao/wasapi', 'device in use'), isNull);
      expect(fallback.decide('error', 'cplayer', _refused), {
        'audio-exclusive': 'no',
      });
      expect(fellBack, 1);
      expect(fallback.notice.value, isTrue);
      expect(fallback.fellBack, isTrue);
      expect(fallback.exclusiveRequested, isFalse);

      // Shared mode failing too is a real problem: reported as usual.
      fallback.exclusiveRequested = true;
      expect(fallback.decide('error', 'cplayer', _refused), isNull);
      expect(fellBack, 1);
    });

    test('turning the setting on again allows another fallback', () {
      fallback.exclusiveRequested = true;
      fallback.decide('error', 'cplayer', _refused);
      fallback.reset();
      expect(fallback.notice.value, isFalse);
      fallback.exclusiveRequested = true;
      expect(fallback.decide('error', 'cplayer', _refused), isNotNull);
      expect(fellBack, 2);
    });
  });

  testWidgets('the user is told once, with a toast', (tester) async {
    final navigator = GlobalKey<NavigatorState>();
    final fallback = ExclusiveAudioFallback()..exclusiveRequested = true;
    installExclusiveAudioFallbackNotice(navigator, fallback: fallback);
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigator,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: SizedBox()),
      ),
    );

    fallback.decide('error', 'cplayer', _refused);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('refused exclusive audio'), findsOneWidget);

    // Let the toast time out.
    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();
  });
}

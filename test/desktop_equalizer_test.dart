import 'package:absorb/services/desktop_equalizer.dart';
import 'package:absorb/services/equalizer_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _freqs = [60, 230, 910, 3600, 14000];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('buildAudioFilter', () {
    test('off is no filter at all, whatever the bands say', () {
      expect(
        DesktopEqualizer.buildAudioFilter(
          enabled: false,
          bandLevels: [2, 4, 5, 3, 1],
          bandFrequencies: _freqs,
        ),
        '',
      );
    });

    test('on but flat is no filter at all', () {
      expect(
        DesktopEqualizer.buildAudioFilter(
          enabled: true,
          bandLevels: [0, 0, 0.04, -0.04, 0],
          bandFrequencies: _freqs,
        ),
        '',
      );
    });

    test('the Voice boost preset becomes one peaking band per level', () {
      final levels = EqualizerService.presets['voice boost']!;
      expect(
        DesktopEqualizer.buildAudioFilter(
          enabled: true,
          bandLevels: levels,
          bandFrequencies: _freqs,
        ),
        'format=format=floatp,lavfi=['
        'equalizer=f=60:t=o:w=2:g=2.0,'
        'equalizer=f=230:t=o:w=2:g=4.0,'
        'equalizer=f=910:t=o:w=2:g=5.0,'
        'equalizer=f=3600:t=o:w=2:g=3.0,'
        'equalizer=f=14000:t=o:w=2:g=1.0]',
      );
    });

    test('skips 0 dB bands, clamps gains and ignores unmatched bands', () {
      expect(
        DesktopEqualizer.buildAudioFilter(
          enabled: true,
          bandLevels: [-3, 0, 40, double.nan, -2.26, 7],
          bandFrequencies: [100, 200, 0, 400, 500],
        ),
        'format=format=floatp,lavfi=['
        'equalizer=f=100:t=o:w=2:g=-3.0,'
        'equalizer=f=500:t=o:w=2:g=-2.3]',
      );
    });
  });

  group('DesktopEqualizerBinding', () {
    late EqualizerService eq;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      eq = EqualizerService();
      // No platform channel in tests: same software fallback as desktop.
      await eq.reloadForActiveAccount();
      await eq.init();
      await eq.resetAll();
      await eq.setEnabled(false);
    });

    test('never touches mpv while the equalizer stays off', () {
      fakeAsync((async) {
        final applied = <String>[];
        final b = DesktopEqualizerBinding(
          eq,
          apply: (af) async => applied.add(af),
        )..start();
        eq.applyPreset('voice boost'); // presets don't apply while off
        async.elapse(const Duration(seconds: 1));
        expect(applied, isEmpty);
        expect(b.applied, '');
        b.dispose();
      });
    });

    test('follows on, preset and off, applying only the settled value', () {
      fakeAsync((async) {
        final applied = <String>[];
        final b = DesktopEqualizerBinding(
          eq,
          apply: (af) async => applied.add(af),
        )..start();
        eq.setEnabled(true);
        eq.applyPreset('voice boost');
        async.elapse(const Duration(milliseconds: 100));
        expect(applied, isEmpty, reason: 'debounced');
        async.elapse(const Duration(seconds: 1));
        expect(applied, hasLength(1));
        expect(
          applied.single,
          startsWith('format=format=floatp,lavfi=[equalizer=f=60'),
        );

        // Dragging a band: many changes, one rebuild.
        for (var i = 0; i < 10; i++) {
          eq.setBandLevel(2, i.toDouble());
          async.elapse(const Duration(milliseconds: 20));
        }
        async.elapse(const Duration(seconds: 1));
        expect(applied, hasLength(2));
        expect(applied.last, contains('equalizer=f=910:t=o:w=2:g=9.0'));

        eq.setEnabled(false);
        async.elapse(const Duration(seconds: 1));
        expect(applied.last, '');
        b.dispose();
      });
    });

    test(
      'a saved equalizer applies at start, before any player exists',
      () async {
        await eq.setEnabled(true);
        await eq.applyPreset('voice boost');
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('eq_enabled'), isTrue);
        expect(prefs.getString('eq_bands'), '2.0,4.0,5.0,3.0,1.0');

        // Next app start: settings come back from prefs.
        await eq.reloadForActiveAccount();
        final applied = <String>[];
        final b = DesktopEqualizerBinding(
          eq,
          apply: (af) async => applied.add(af),
        )..start();
        expect(applied, [
          DesktopEqualizer.buildAudioFilter(
            enabled: true,
            bandLevels: [2, 4, 5, 3, 1],
            bandFrequencies: _freqs,
          ),
        ]);
        b.dispose();
      },
    );

    test('per-book equalizer: switching books switches the filter', () {
      fakeAsync((async) {
        final applied = <String>[];
        final b = DesktopEqualizerBinding(
          eq,
          apply: (af) async => applied.add(af),
        )..start();
        eq.setPerItem(true);
        eq.switchItem('book-a');
        async.flushMicrotasks();
        eq.setEnabled(true);
        eq.applyPreset('podcast');
        async.elapse(const Duration(seconds: 1));
        final podcast = applied.last;
        expect(podcast, contains('equalizer=f=230:t=o:w=2:g=5.0'));

        eq.switchItem('book-b'); // never set: off
        async.elapse(const Duration(seconds: 1));
        expect(applied.last, '');

        eq.switchItem('book-a');
        async.elapse(const Duration(seconds: 1));
        expect(applied.last, podcast);

        eq.setPerItem(false);
        async.flushMicrotasks();
        b.dispose();
      });
    });
  });
}

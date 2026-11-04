import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/remote_control_screen.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_layout.dart';
import 'package:absorb/widgets/absorb_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The phone remote's customizable layout, edit mode, landscape and
/// display-mode options, against a fake link.

Future<RemoteLayout> _saved() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(RemoteLayoutStore.layoutKey);
  return RemoteLayout.fromJson(raw == null ? null : jsonDecode(raw));
}

Future<RemoteDisplayOptions> _savedDisplay() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(RemoteLayoutStore.displayKey);
  return RemoteDisplayOptions.fromJson(raw == null ? null : jsonDecode(raw));
}

const _phone = Size(1080, 2400);
const _landscape = Size(1600, 900); // 640 x 360 at 2.5x

Future<FakeClient> _open(
  WidgetTester tester, {
  Size size = _phone,
  double textScale = 1.0,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 2.5;
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  addTearDown(tester.view.reset);
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
  final client = FakeClient(state: fakePlaying)..cover = null;
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RemoteControlScreen(host: fakeSavedHost, client: client),
    ),
  );
  await tester.pumpAndSettle();
  return client;
}

double _y(WidgetTester tester, Finder f) => tester.getCenter(f).dy;

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('the default portrait screen keeps its order and rows', (
    tester,
  ) async {
    await _open(tester);
    final order = [
      find.text('The Book'),
      find.text('Writer'),
      find.byKey(const Key('remote-chapter-title')),
      find.byType(AbsorbSlider).first,
      find.byKey(const Key('remote-play-pause')),
      find.byKey(const Key('remote-speed')),
      find.byKey(const Key('remote-chapters')),
      find.byKey(const Key('remote-volume')),
    ];
    for (var i = 1; i < order.length; i++) {
      expect(_y(tester, order[i]), greaterThan(_y(tester, order[i - 1])));
    }
    // Speed and sleep share a row; chapters, bookmark and stop the next.
    Finder row(String key) =>
        find.ancestor(of: find.byKey(Key(key)), matching: find.byType(Wrap));
    final speedRow = tester.widget(row('remote-speed'));
    final actionRow = tester.widget(row('remote-chapters'));
    expect(speedRow, isNot(same(actionRow)));
    expect(tester.widget(row('remote-sleep')), same(speedRow));
    expect(tester.widget(row('remote-bookmark')), same(actionRow));
    expect(tester.widget(row('remote-stop')), same(actionRow));
    expect(find.byKey(const Key('remote-clock')), findsNothing);
    expect(find.byKey(const Key('remote-time-left')), findsNothing);
  });

  testWidgets('a saved layout is used; unknown blocks are skipped', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      RemoteLayoutStore.layoutKey: jsonEncode({
        'version': 1,
        'portrait': [
          {'block': 'teleporter'},
          {'block': 'titleAuthor'},
          {'block': 'timeLeft'},
          {'block': 'transport', 'size': 'compact'},
        ],
      }),
    });
    final client = await _open(tester);
    expect(find.text('The Book'), findsOneWidget);
    expect(find.text('03:20 left in the chapter'), findsOneWidget);
    expect(find.byKey(const Key('remote-speed')), findsNothing);
    expect(find.byKey(const Key('remote-volume')), findsNothing);
    expect(find.byType(AbsorbSlider), findsNothing);
    final play = tester.getSize(find.byKey(const Key('remote-play-pause')));
    expect(play.width, lessThan(68));
    await tester.tap(find.byKey(const Key('remote-play-pause')));
    expect(client.sent.single, isA<ToggleCommand>());
  });

  group('edit mode', () {
    Future<void> edit(WidgetTester tester) async {
      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
    }

    testWidgets('disables the controls and says what is being edited', (
      tester,
    ) async {
      final client = await _open(tester);
      await edit(tester);
      expect(find.textContaining('portrait layout'), findsOneWidget);
      expect(find.byKey(const Key('remote-continue')), findsNothing);
      for (final k in ['remote-play-pause', 'remote-stop', 'remote-mute']) {
        await tester.ensureVisible(find.byKey(Key(k)));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Key(k)), warnIfMissed: false);
        await tester.pump();
      }
      expect(client.sent, isEmpty);

      await tester.tap(find.byKey(const Key('remote-customize-done')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-play-pause')));
      expect(client.sent.single, isA<ToggleCommand>());
    });

    testWidgets('remove, add, size, preset and reset are saved', (
      tester,
    ) async {
      await _open(tester);
      await edit(tester);

      await tester.ensureVisible(
        find.byKey(const Key('remote-block-remove-stop')),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-block-remove-stop')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-stop')), findsNothing);
      expect(
        (await _saved()).portrait.map((e) => e.block),
        isNot(contains(RemoteBlock.stop)),
      );

      await tester.tap(find.byKey(const Key('remote-customize-add')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-add-cover')), findsNothing);
      await tester.tap(find.byKey(const Key('remote-add-clock')));
      await tester.pumpAndSettle();
      expect((await _saved()).portrait.last.block, RemoteBlock.clock);

      await tester.ensureVisible(
        find.byKey(const Key('remote-block-size-transport')),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-block-size-transport')));
      await tester.pumpAndSettle();
      expect(
        (await _saved()).portrait
            .firstWhere((e) => e.block == RemoteBlock.transport)
            .size,
        RemoteBlockSize.compact,
      );

      await tester.tap(find.byKey(const Key('remote-customize-presets')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-preset-nightstand')));
      await tester.pumpAndSettle();
      expect(
        (await _saved()).portrait,
        RemoteLayout.preset(RemotePreset.nightstand).portrait,
      );

      await tester.tap(find.byKey(const Key('remote-customize-reset')));
      await tester.pumpAndSettle();
      expect((await _saved()).portrait, RemoteLayout.defaults().portrait);

      await tester.tap(find.byKey(const Key('remote-customize-done')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-stop')), findsOneWidget);
    });

    testWidgets('dragging a handle moves the block', (tester) async {
      await _open(tester);
      await edit(tester);
      final handle = find.byKey(const Key('remote-block-handle-chapterTitle'));
      final target = find.byKey(const Key('remote-block-handle-titleAuthor'));
      final gesture = await tester.startGesture(tester.getCenter(handle));
      await tester.pump();
      final to = tester.getTopLeft(target) - const Offset(0, 4);
      for (var i = 0; i < 10; i++) {
        await gesture.moveTo(
          Offset.lerp(tester.getCenter(handle), to, (i + 1) / 10)!,
        );
        await tester.pump();
      }
      expect(find.byKey(const Key('remote-layout-drop')), findsOneWidget);
      await gesture.up();
      await tester.pumpAndSettle();
      expect((await _saved()).portrait.take(3).map((e) => e.block), [
        RemoteBlock.cover,
        RemoteBlock.chapterTitle,
        RemoteBlock.titleAuthor,
      ]);
    });

    testWidgets('landscape: blocks move between the columns', (tester) async {
      await _open(tester, size: _landscape);
      await edit(tester);
      expect(find.textContaining('landscape layout'), findsOneWidget);
      final handle = find.byKey(const Key('remote-block-handle-titleAuthor'));
      final cover = find.byKey(const Key('remote-block-handle-cover'));
      final start = tester.getCenter(handle);
      final to = tester.getTopLeft(cover) - const Offset(0, 4);
      final gesture = await tester.startGesture(start);
      await tester.pump();
      for (var i = 0; i < 10; i++) {
        await gesture.moveTo(Offset.lerp(start, to, (i + 1) / 10)!);
        await tester.pump();
      }
      await gesture.up();
      await tester.pumpAndSettle();
      final saved = await _saved();
      expect(saved.left.map((e) => e.block), [
        RemoteBlock.titleAuthor,
        RemoteBlock.cover,
      ]);
      expect(saved.right.first.block, RemoteBlock.chapterTitle);
      // Portrait untouched.
      expect(saved.portrait, RemoteLayout.defaults().portrait);
    });
  });

  group('landscape 640 x 360', () {
    for (final scale in [1.0, 1.3]) {
      for (final preset in RemotePreset.values) {
        testWidgets('${preset.name} at ${scale}x text has no overflow', (
          tester,
        ) async {
          SharedPreferences.setMockInitialValues({
            RemoteLayoutStore.layoutKey: jsonEncode(
              RemoteLayout.preset(preset).toJson(),
            ),
          });
          await _open(tester, size: _landscape, textScale: scale);
          expect(tester.takeException(), isNull);
          await tester.tap(find.byKey(const Key('remote-customize')));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          await tester.pumpWidget(const SizedBox());
        });
      }

      testWidgets('two columns and display mode at ${scale}x text', (
        tester,
      ) async {
        await _open(tester, size: _landscape, textScale: scale);
        final title = tester.getCenter(find.text('The Book'));
        final play = tester.getCenter(
          find.byKey(const Key('remote-play-pause')),
        );
        // The right column holds the controls; the cover is on the left.
        expect(title.dx, greaterThan(640 * 0.45));
        expect(play.dx, greaterThan(640 * 0.45));
        expect(tester.takeException(), isNull);

        await tester.tap(find.byKey(const Key('remote-display-mode')));
        await tester.pump();
        expect(tester.takeException(), isNull);
        expect(
          tester.getCenter(find.byKey(const Key('remote-display-clock'))).dx,
          greaterThan(640 * 0.45),
        );
        await tester.pumpWidget(const SizedBox());
      });
    }
  });

  group('display mode options', () {
    testWidgets('set in Customize: no clock, black, dims after 5 min', (
      tester,
    ) async {
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-customize-display')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-display-show-clock')));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(Key('remote-display-bg-${RemoteDisplayBackground.black}')),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('remote-display-dim-5')));
      await tester.tap(find.byKey(const Key('remote-display-dim-5')));
      await tester.pumpAndSettle();
      expect(
        await _savedDisplay(),
        const RemoteDisplayOptions(
          background: RemoteDisplayBackground.black,
          showClock: false,
          dimAfterMinutes: 5,
        ),
      );
      Navigator.of(tester.element(find.text('Background'))).pop();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-customize-done')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('remote-display-mode')));
      await tester.pump();
      expect(find.byKey(const Key('remote-display-clock')), findsNothing);
      expect(find.byKey(const Key('remote-display-dim')), findsNothing);
      await tester.pump(const Duration(minutes: 5));
      expect(find.byKey(const Key('remote-display-dim')), findsOneWidget);
      // The first tap only wakes it.
      await tester.tap(find.byKey(const Key('remote-display')));
      await tester.pump();
      expect(find.byKey(const Key('remote-display-dim')), findsNothing);
      expect(find.byKey(const Key('remote-display')), findsOneWidget);
      await tester.tap(find.byKey(const Key('remote-display')));
      await tester.pump();
      expect(find.byKey(const Key('remote-display')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('huge text in portrait has no overflow', (tester) async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.displayKey: jsonEncode(
          const RemoteDisplayOptions(
            textSize: RemoteDisplayTextSize.huge,
            use24Hour: true,
            background: RemoteDisplayBackground.cover,
          ).toJson(),
        ),
      });
      await _open(tester, textScale: 1.3);
      await tester.tap(find.byKey(const Key('remote-display-mode')));
      await tester.pump();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('remote-display-clock')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });
}

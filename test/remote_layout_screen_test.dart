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

/// The phone remote's customizable layout, block options, edit mode,
/// landscape, full screen and the Look, against a fake link.

Future<RemoteLayout> _saved() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(RemoteLayoutStore.layoutKey);
  return RemoteLayout.fromJson(raw == null ? null : jsonDecode(raw));
}

Future<RemoteLook> _savedLook() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(RemoteLayoutStore.lookKey);
  return RemoteLook.fromJson(raw == null ? null : jsonDecode(raw));
}

const _phone = Size(1080, 2400);
const _landscape = Size(1600, 900); // 640 x 360 at 2.5x
const _small = Size(900, 1600); // 360 x 640 at 2.5x

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
        await tester.pumpAndSettle();
        // The tap opened the block's options instead.
        expect(
          find.byType(SwitchListTile).evaluate().isNotEmpty ||
              find.byType(ChoiceChip).evaluate().isNotEmpty,
          isTrue,
        );
        await tester.binding.handlePopRoute();
        await tester.pumpAndSettle();
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

      testWidgets('two columns, also in full screen, at ${scale}x text', (
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

        await tester.tap(find.byKey(const Key('remote-full-screen-button')));
        await tester.pump();
        expect(tester.takeException(), isNull);
        expect(find.byType(AppBar), findsNothing);
        expect(
          tester.getCenter(find.byKey(const Key('remote-play-pause'))).dx,
          greaterThan(640 * 0.45),
        );
        await tester.pumpWidget(const SizedBox());
      });
    }
  });

  group('block options', () {
    Future<void> edit(WidgetTester tester) async {
      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
    }

    Future<void> openOptions(WidgetTester tester, String block) async {
      final gear = find.byKey(Key('remote-block-options-$block'));
      await tester.ensureVisible(gear);
      await tester.pumpAndSettle();
      await tester.tap(gear);
      await tester.pumpAndSettle();
    }

    Future<void> tapOption(WidgetTester tester, String key) async {
      final f = find.byKey(Key(key));
      await tester.ensureVisible(f);
      await tester.pumpAndSettle();
      await tester.tap(f);
      await tester.pumpAndSettle();
    }

    Future<void> closeSheetAndFinish(WidgetTester tester) async {
      Navigator.of(tester.element(find.byType(ListView).last)).pop();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-customize-done')));
      await tester.pumpAndSettle();
    }

    testWidgets('hidden playback buttons are not drawn; saved live', (
      tester,
    ) async {
      final client = await _open(tester);
      await edit(tester);
      await openOptions(tester, 'transport');
      await tapOption(tester, 'remote-opt-buttons-prev');
      await tapOption(tester, 'remote-opt-buttons-next');
      // Applied at once, behind the sheet, and saved.
      final transport = (await _saved()).portrait.firstWhere(
        (e) => e.block == RemoteBlock.transport,
      );
      expect(transport.picked('buttons'), ['back', 'play', 'forward']);
      await tapOption(tester, 'remote-opt-skipSeconds');
      await closeSheetAndFinish(tester);

      expect(find.byKey(const Key('remote-prev-chapter')), findsNothing);
      expect(find.byKey(const Key('remote-next-chapter')), findsNothing);
      expect(find.byKey(const Key('remote-skip-back')), findsOneWidget);
      await tester.tap(find.byKey(const Key('remote-play-pause')));
      expect(client.sent.single, isA<ToggleCommand>());
    });

    testWidgets('the last shown button cannot be hidden', (tester) async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.layoutKey: jsonEncode({
          'version': 2,
          'portrait': [
            {
              'block': 'transport',
              'options': {
                'buttons': ['play'],
              },
            },
          ],
        }),
      });
      await _open(tester);
      await edit(tester);
      await openOptions(tester, 'transport');
      final chip = tester.widget<FilterChip>(
        find.byKey(const Key('remote-opt-buttons-play')),
      );
      expect(chip.onSelected, isNull);
    });

    testWidgets('tapping a block opens its options: total time, book span', (
      tester,
    ) async {
      await _open(tester);
      await edit(tester);
      final body = find.byKey(const Key('remote-block-body-progress'));
      await tester.ensureVisible(body);
      await tester.pumpAndSettle();
      await tester.tap(body);
      await tester.pumpAndSettle();
      await tapOption(tester, 'remote-opt-time-total');
      await closeSheetAndFinish(tester);
      // The chapter runs 100-400 s.
      expect(
        tester
            .widget<Text>(find.byKey(const Key('remote-progress-right')))
            .data,
        '05:00',
      );
    });

    testWidgets('saved options: cover, title, speed and sleep choices', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.layoutKey: jsonEncode({
          'version': 2,
          'portrait': [
            {
              'block': 'cover',
              'options': {'corners': 'circle', 'shadow': true},
            },
            {
              'block': 'titleAuthor',
              'options': {'align': 'left'},
            },
            {
              'block': 'timeLeft',
              'options': {'span': 'book'},
            },
            {
              'block': 'speed',
              'options': {
                'presets': ['1', '2'],
              },
            },
            {
              'block': 'sleep',
              'options': {
                'presets': ['5', 'chapter'],
              },
            },
            {
              'block': 'volume',
              'options': {'style': 'buttons'},
            },
          ],
        }),
      });
      final client = await _open(tester);
      expect(find.byType(ClipOval), findsOneWidget);
      expect(find.byKey(const Key('remote-cover-shadow')), findsOneWidget);
      // Left-aligned title: it starts at the left padding.
      expect(tester.getTopLeft(find.text('The Book')).dx, lessThan(40));
      // (3600 - 150) s at 1.25x.
      expect(find.text('46:00 left'), findsOneWidget);

      await tester.tap(find.byKey(const Key('remote-speed')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-speed-preset-1')), findsOneWidget);
      expect(find.byKey(const Key('remote-speed-preset-2')), findsOneWidget);
      expect(find.byKey(const Key('remote-speed-preset-1.5')), findsNothing);
      await tester.tap(find.byKey(const Key('remote-speed-preset-2')));
      await tester.pumpAndSettle();
      expect(client.sent.last, isA<SpeedCommand>());

      await tester.tap(find.byKey(const Key('remote-sleep')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-sleep-preset-5')), findsOneWidget);
      expect(find.byKey(const Key('remote-sleep-preset-15')), findsNothing);
      expect(
        find.byKey(const Key('remote-sleep-preset-chapter')),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const Key('remote-sleep-preset-5')));
      await tester.pumpAndSettle();
      expect(client.sent.last, isA<SleepCommand>());

      // − and + volume buttons: 80% -> 90%.
      expect(find.byKey(const Key('remote-volume')), findsNothing);
      expect(find.text('80%'), findsOneWidget);
      await tester.tap(find.byKey(const Key('remote-volume-up')));
      await tester.pump();
      expect((client.sent.last as VolumeCommand).value, closeTo(0.9, 1e-9));
      expect(find.text('90%'), findsOneWidget);
    });
  });

  group('full screen', () {
    // Left padding of the layout: empty space, no control.
    const empty = Offset(4, 300);

    testWidgets('the same layout without the app bar; a tap on empty space '
        'enters and leaves, a tap on a control does not', (tester) async {
      final client = await _open(tester);
      expect(find.byType(AppBar), findsOneWidget);
      await tester.tapAt(empty);
      await tester.pump();
      expect(find.byType(AppBar), findsNothing);
      expect(find.byKey(const Key('remote-full-screen')), findsOneWidget);
      // Same blocks as the normal screen.
      expect(find.text('The Book'), findsOneWidget);
      expect(find.byKey(const Key('remote-volume')), findsOneWidget);
      // The first time, a hint says how to leave; it's remembered.
      expect(find.text('Tap empty space to exit full screen'), findsOneWidget);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(RemoteLayoutStore.hintKey), isTrue);
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump(const Duration(seconds: 4));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('remote-play-pause')));
      await tester.pump();
      expect(client.sent.single, isA<ToggleCommand>());
      expect(find.byType(AppBar), findsNothing);

      await tester.tapAt(empty);
      await tester.pumpAndSettle();
      expect(find.byType(AppBar), findsOneWidget);

      // The button enters too; no hint the second time.
      await tester.tap(find.byKey(const Key('remote-full-screen-button')));
      await tester.pump();
      expect(find.byType(AppBar), findsNothing);
      expect(find.text('Tap empty space to exit full screen'), findsNothing);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('Back leaves full screen, not the screen', (tester) async {
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-full-screen-button')));
      await tester.pump();
      expect(find.byType(AppBar), findsNothing);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(RemoteControlScreen), findsOneWidget);
    });

    testWidgets('no edit mode in full screen; a tap in edit mode stays', (
      tester,
    ) async {
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-full-screen-button')));
      await tester.pump();
      expect(find.byKey(const Key('remote-customize')), findsNothing);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(4, 400));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('remote-customize-done')), findsOneWidget);
      expect(find.byKey(const Key('remote-full-screen')), findsNothing);
    });

    testWidgets('dims after the Look\'s minutes; the first tap only wakes', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.lookKey: jsonEncode(
          const RemoteLook(dimAfterMinutes: 5).toJson(),
        ),
      });
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-full-screen-button')));
      await tester.pump();
      const dim = Key('remote-full-screen-dim');
      expect(find.byKey(dim), findsNothing);
      await tester.pump(const Duration(minutes: 5));
      expect(find.byKey(dim), findsOneWidget);
      await tester.tap(find.byKey(dim));
      await tester.pump();
      expect(find.byKey(dim), findsNothing);
      expect(find.byKey(const Key('remote-full-screen')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('look', () {
    testWidgets('set from the edit toolbar, applied live, reset', (
      tester,
    ) async {
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-customize-look')));
      await tester.pumpAndSettle();

      Future<void> pick(String key) async {
        final f = find.byKey(Key(key));
        await tester.ensureVisible(f);
        await tester.pumpAndSettle();
        await tester.tap(f);
        await tester.pumpAndSettle();
      }

      await pick('remote-look-accent-p2');
      await pick('remote-look-bg-black');
      await pick('remote-look-buttons-outlined');
      await pick('remote-look-text-huge');
      await pick('remote-look-dim-10');
      expect(
        await _savedLook(),
        const RemoteLook(
          accent: 'p2',
          background: RemoteLookBackground.black,
          buttons: RemoteButtonStyle.outlined,
          textSize: RemoteTextSize.huge,
          dimAfterMinutes: 10,
        ),
      );
      // Live behind the sheet: the edited layout uses the look.
      final play = find.byKey(const Key('remote-play-pause'));
      final cs = Theme.of(tester.element(play)).colorScheme;
      expect(cs.primary, RemoteLook.palette[2]);
      expect(cs.surface, Colors.black);
      expect(MediaQuery.textScalerOf(tester.element(play)).scale(10), 15);

      await pick('remote-look-reset');
      expect(await _savedLook(), const RemoteLook());
      expect(
        Theme.of(tester.element(play)).colorScheme.primary,
        isNot(RemoteLook.palette[2]),
      );
    });

    testWidgets('outlined buttons and no circle behind plain play', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.lookKey: jsonEncode(
          const RemoteLook(buttons: RemoteButtonStyle.outlined).toJson(),
        ),
      });
      await _open(tester);
      expect(find.byWidgetPredicate((w) => w is OutlinedButton), findsWidgets);
      await tester.pumpWidget(const SizedBox());

      SharedPreferences.setMockInitialValues({
        RemoteLayoutStore.lookKey: jsonEncode(
          const RemoteLook(buttons: RemoteButtonStyle.plain).toJson(),
        ),
      });
      await _open(tester);
      final box = tester.widget<Container>(
        find
            .descendant(
              of: find.byKey(const Key('remote-play-pause')),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(box.decoration, isNull);
    });

    testWidgets('Nightstand also darkens and dims the look', (tester) async {
      await _open(tester);
      await tester.tap(find.byKey(const Key('remote-customize')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-customize-presets')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-preset-nightstand')));
      await tester.pumpAndSettle();
      final look = await _savedLook();
      expect(look.background, RemoteLookBackground.black);
      expect(look.dimAfterMinutes, 10);
    });
  });

  group('no overflow with 1.3x text', () {
    for (final (name, size) in [
      ('360 x 640', _small),
      ('640 x 360', _landscape),
    ]) {
      for (final preset in RemotePreset.values) {
        testWidgets('$name ${preset.name}: full screen and edit mode', (
          tester,
        ) async {
          SharedPreferences.setMockInitialValues({
            RemoteLayoutStore.layoutKey: jsonEncode(
              RemoteLayout.preset(preset).toJson(),
            ),
          });
          await _open(tester, size: size, textScale: 1.3);
          expect(tester.takeException(), isNull);
          await tester.tap(find.byKey(const Key('remote-full-screen-button')));
          await tester.pump(const Duration(milliseconds: 500));
          await tester.pump(const Duration(seconds: 4));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          await tester.binding.handlePopRoute();
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('remote-customize')));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          // The options and look sheets fit too.
          final gear = find.byKey(
            Key(
              'remote-block-options-${RemoteLayout.preset(preset).shown(landscape: size.width > size.height).first.block.name}',
            ),
          );
          if (gear.evaluate().isNotEmpty) {
            await tester.ensureVisible(gear.first);
            await tester.pumpAndSettle();
            await tester.tap(gear.first);
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
            expect(find.byType(ChoiceChip), findsWidgets);
            Navigator.of(tester.element(find.byType(ListView).last)).pop();
            await tester.pumpAndSettle();
          }
          final look = find.byKey(const Key('remote-customize-look'));
          await tester.ensureVisible(look);
          await tester.pumpAndSettle();
          await tester.tap(look);
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          expect(find.byKey(const Key('remote-look-accent-theme')), findsOneWidget);
          await tester.pumpWidget(const SizedBox());
        });
      }
    }

    testWidgets('huge look text in full screen, both orientations', (
      tester,
    ) async {
      for (final size in [_small, _landscape]) {
        SharedPreferences.setMockInitialValues({
          RemoteLayoutStore.lookKey: jsonEncode(
            const RemoteLook(
              textSize: RemoteTextSize.huge,
              background: RemoteLookBackground.cover,
            ).toJson(),
          ),
        });
        await _open(tester, size: size, textScale: 1.3);
        await tester.tap(find.byKey(const Key('remote-full-screen-button')));
        await tester.pump(const Duration(milliseconds: 500));
        await tester.pump(const Duration(seconds: 4));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      }
    });
  });
}

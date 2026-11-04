import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/main.dart'
    show coverSchemeNotifier, einkModeNotifier, flatNotifier;
import 'package:absorb/services/player_settings.dart';
import 'package:absorb/ui_themes/app_background_tile.dart';
import 'package:absorb/ui_themes/app_backdrop.dart';
import 'package:absorb/ui_themes/frosted.dart';
import 'package:absorb/ui_themes/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The app background (Settings > Appearance > Background): storage, the
/// mapping from Flat background and the looks, and what each page paints.

const _darkPage = Color(0xFF0E0E0E);
const _lightPage = Color(0xFFF6F6F6);

/// The app like main.dart builds it: the look as a theme extension and
/// [absorbLookBuilder] above the navigator. Returns a context on the page.
Future<BuildContext> _pumpApp(
  WidgetTester tester, {
  AppUiTheme look = AppUiTheme.plus,
  Brightness brightness = Brightness.dark,
  Widget? page,
}) async {
  late BuildContext captured;
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF7C6FBF),
    brightness: brightness,
  );
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: scheme,
        scaffoldBackgroundColor: brightness == Brightness.dark
            ? _darkPage
            : _lightPage,
        extensions: [look.lookFor(brightness)],
      ),
      builder: absorbLookBuilder,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            captured = context;
            return page ?? const SizedBox.expand();
          },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return captured;
}

AppBackdropSpec _spec(BuildContext context) => AppBackdrop.specOf(context)!;

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    appBackgroundNotifier.value = null;
    flatNotifier.value = false;
    einkModeNotifier.value = false;
    coverSchemeNotifier.value = null;
  });

  tearDown(() {
    appBackgroundNotifier.value = null;
    flatNotifier.value = false;
    einkModeNotifier.value = false;
    coverSchemeNotifier.value = null;
  });

  group('storage and mapping', () {
    test('the choice persists under a fork key and loads back', () async {
      await AppBackgroundStore.load();
      expect(appBackgroundNotifier.value, isNull);

      await AppBackgroundStore.choose(AppBackground.gradient);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(AppBackgroundStore.prefKey), 'gradient');
      expect(AppBackgroundStore.prefKey, 'fork_app_background');

      appBackgroundNotifier.value = null;
      await AppBackgroundStore.load();
      expect(appBackgroundNotifier.value, AppBackground.gradient);

      await prefs.setString(AppBackgroundStore.prefKey, 'sparkles');
      await AppBackgroundStore.load();
      expect(appBackgroundNotifier.value, isNull, reason: 'unknown id');
    });

    test('Flat background and e-ink are Plain, Midnight defaults to Plain', () {
      final plus = AppUiTheme.plus.lookFor(Brightness.dark);
      final frosted = AppUiTheme.frosted.lookFor(Brightness.dark);
      final midnight = AppUiTheme.midnight.lookFor(Brightness.dark);
      AppBackground r(
        AbsorbLook look, {
        AppBackground? choice,
        bool flat = false,
        bool eink = false,
      }) => resolveAppBackground(
        choice: choice,
        flat: flat,
        eink: eink,
        look: look,
      );

      expect(r(plus), AppBackground.glow);
      expect(r(frosted), AppBackground.glow);
      expect(r(midnight), AppBackground.plain);
      // The old Flat background switch maps to Plain, whatever was picked.
      expect(r(plus, flat: true), AppBackground.plain);
      expect(
        r(plus, choice: AppBackground.gradient, flat: true),
        AppBackground.plain,
      );
      expect(
        r(plus, choice: AppBackground.cover, eink: true),
        AppBackground.plain,
      );
      // An explicit pick wins over Midnight's default.
      expect(
        r(midnight, choice: AppBackground.gradient),
        AppBackground.gradient,
      );
      expect(r(midnight, choice: AppBackground.glow), AppBackground.glow);
    });
  });

  group('the Background control', () {
    Future<void> pumpTile(WidgetTester tester, ValueNotifier<bool> flat) =>
        tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: ValueListenableBuilder<bool>(
                valueListenable: flat,
                builder: (context, value, _) => AppBackgroundTile(
                  flat: value,
                  onFlatChanged: (v) => flat.value = v,
                ),
              ),
            ),
          ),
        );

    testWidgets('Plain turns Flat background on, other picks turn it off', (
      tester,
    ) async {
      final flat = ValueNotifier(false);
      await pumpTile(tester, flat);

      await tester.tap(find.text('Plain'));
      await tester.pumpAndSettle();
      expect(flat.value, isTrue);
      expect(flatNotifier.value, isTrue);
      expect(await PlayerSettings.getFlatBackground(), isTrue);
      expect(appBackgroundNotifier.value, AppBackground.plain);

      await tester.tap(find.text('Gradient'));
      await tester.pumpAndSettle();
      expect(flat.value, isFalse);
      expect(flatNotifier.value, isFalse);
      expect(await PlayerSettings.getFlatBackground(), isFalse);
      expect(appBackgroundNotifier.value, AppBackground.gradient);
    });

    testWidgets('shows Plain while the Flat background switch is on', (
      tester,
    ) async {
      appBackgroundNotifier.value = AppBackground.gradient;
      flatNotifier.value = true;
      await pumpTile(tester, ValueNotifier(true));
      final button = tester.widget<SegmentedButton<AppBackground>>(
        find.byType(SegmentedButton<AppBackground>),
      );
      expect(button.selected, {AppBackground.plain});
    });

    testWidgets('Book colors explains itself; e-ink disables the control', (
      tester,
    ) async {
      appBackgroundNotifier.value = AppBackground.cover;
      await pumpTile(tester, ValueNotifier(false));
      expect(find.textContaining('Follows the cover'), findsOneWidget);

      einkModeNotifier.value = true;
      await tester.pump();
      final button = tester.widget<SegmentedButton<AppBackground>>(
        find.byType(SegmentedButton<AppBackground>),
      );
      expect(button.onSelectionChanged, isNull);
      expect(button.selected, {AppBackground.plain});
    });
  });

  group('what a page paints', () {
    testWidgets('Soft glow by default: the accent at the top, plain below', (
      tester,
    ) async {
      final page = await _pumpApp(tester);
      final spec = _spec(page);
      expect(spec.kind, AppBackground.glow);
      expect(spec.plain, _darkPage);
      final g = spec.gradient! as LinearGradient;
      expect(g.begin, Alignment.topCenter);
      expect(g.colors.first, isNot(_darkPage));
      expect(g.colors.last, _darkPage);
      for (final c in g.colors) {
        expect(c.a, 1, reason: 'opaque stops');
      }
      // Pages are see-through so the backdrop shows.
      expect(Theme.of(page).scaffoldBackgroundColor, Colors.transparent);
      expect(pageSurfaceColor(page), _darkPage);
    });

    testWidgets('Plain is today\'s flat page color, no glow', (tester) async {
      appBackgroundNotifier.value = AppBackground.plain;
      final page = await _pumpApp(tester);
      expect(_spec(page).kind, AppBackground.plain);
      expect(_spec(page).gradient, isNull);
      expect(_spec(page).plain, _darkPage);

      // Light mode keeps its own page color.
      final light = await _pumpApp(tester, brightness: Brightness.light);
      expect(_spec(light).gradient, isNull);
      expect(_spec(light).plain, _lightPage);
    });

    testWidgets('Gradient is a diagonal two-color blend', (tester) async {
      appBackgroundNotifier.value = AppBackground.gradient;
      for (final b in Brightness.values) {
        final page = await _pumpApp(tester, brightness: b);
        final g = _spec(page).gradient! as LinearGradient;
        expect(_spec(page).kind, AppBackground.gradient);
        expect(g.begin, Alignment.topLeft);
        expect(g.end, Alignment.bottomRight);
        expect(g.colors.first, isNot(g.colors.last));
      }
    });

    testWidgets('Book colors falls back to Soft glow with nothing playing', (
      tester,
    ) async {
      appBackgroundNotifier.value = AppBackground.cover;
      final page = await _pumpApp(tester);
      expect(_spec(page).kind, AppBackground.glow);

      final cover = ColorScheme.fromSeed(seedColor: const Color(0xFFD84315));
      coverSchemeNotifier.value = cover;
      await tester.pump();
      expect(_spec(page).kind, AppBackground.cover);
      final first = (_spec(page).gradient! as LinearGradient).colors.first;
      // Tinted toward the cover's color, not the app accent.
      expect(first.r, greaterThan(first.b));

      coverSchemeNotifier.value = null;
      await tester.pump();
      expect(_spec(page).kind, AppBackground.glow);
    });

    testWidgets('Midnight stays true black unless picked otherwise', (
      tester,
    ) async {
      final page = await _pumpApp(tester, look: AppUiTheme.midnight);
      expect(_spec(page).kind, AppBackground.plain);
      expect(_spec(page).plain, const Color(0xFF000000));

      appBackgroundNotifier.value = AppBackground.glow;
      await tester.pump();
      expect(_spec(page).kind, AppBackground.glow);
      expect(_spec(page).gradient, isNotNull);
    });

    testWidgets('Flat background on is Plain even with a pick', (tester) async {
      appBackgroundNotifier.value = AppBackground.gradient;
      final page = await _pumpApp(tester);
      expect(_spec(page).kind, AppBackground.gradient);
      flatNotifier.value = true;
      await tester.pump();
      expect(_spec(page).kind, AppBackground.plain);
      expect(_spec(page).gradient, isNull);
    });

    testWidgets('pushed pages get it too, nested navigators share it', (
      tester,
    ) async {
      final page = await _pumpApp(tester);
      late BuildContext pushed;
      Navigator.of(page).push(
        MaterialPageRoute<void>(
          builder: (context) {
            pushed = context;
            return Scaffold(
              body: Navigator(
                onGenerateRoute: (_) => MaterialPageRoute<void>(
                  builder: (_) => const Scaffold(body: Text('inner')),
                ),
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(AppBackdrop.specOf(pushed)?.kind, AppBackground.glow);
      expect(find.text('inner'), findsOneWidget);
      // The home page, the pushed page and the nested page each get one; the
      // nested one paints nothing and the pushed page's shows through.
      expect(find.byType(AppBackdrop, skipOffstage: false), findsNWidgets(3));
      final inner = tester.element(find.text('inner'));
      expect(AppBackdrop.isActive(inner), isTrue);
      expect(AppBackdrop.specOf(inner), AppBackdrop.specOf(pushed));
      final innerBackdrop = tester.widget<AppBackdrop>(
        find
            .ancestor(
              of: find.text('inner'),
              matching: find.byType(AppBackdrop),
            )
            .first,
      );
      expect(
        find.descendant(
          of: find.byWidget(innerBackdrop),
          matching: find.byWidgetPredicate(
            (w) => w.runtimeType.toString() == '_BackdropPaint',
          ),
        ),
        findsNothing,
        reason: 'the nested page paints no backdrop of its own',
      );
    });

    testWidgets('Library-style header slice paints without errors', (
      tester,
    ) async {
      appBackgroundNotifier.value = AppBackground.gradient;
      await _pumpApp(
        tester,
        page: const Column(
          children: [
            SizedBox(height: 120, child: AppBackdropSlice()),
            Expanded(child: SizedBox.expand()),
          ],
        ),
      );
      expect(find.byType(AppBackdropSlice), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}

import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

import '../main.dart'
    show
        coverSchemeNotifier,
        einkModeNotifier,
        flatNotifier,
        gradientIntensityNotifier;
import '../services/scoped_prefs.dart';
import 'ui_theme.dart';
import 'ui_theme_hooks.dart';

/// The app-wide background (Settings > Appearance > Background), drawn once
/// behind every page instead of each screen painting its own glow.
///
/// How it is wired:
/// * [appBackdropThemeData] (applied by `absorbLookBuilder` above the
///   navigator) makes scaffolds and app bars transparent and wraps the page
///   transitions, so every opaque page route gets an [AppBackdrop] behind its
///   content. Painting it per route (not once under the navigator) keeps
///   transitions clean: a page sliding in covers the one below.
/// * [AppBackdropScope] (also above the navigator) holds the opaque page
///   color; sheets that used `scaffoldBackgroundColor` as their fill read it
///   through [pageSurfaceColor].
/// * Screens that drew their own glow skip it under a backdrop
///   ([AppBackdrop.isActive]); Library's floating header paints its slice of
///   the backdrop ([AppBackdropSlice]) so content scrolling under it is hidden.
///
/// Static: a gradient or a flat color in its own repaint boundary, repainted
/// only when a setting, the theme or the playing book's colors change.

/// The background choices.
enum AppBackground {
  /// The accent glow at the top (the look's own glow strength).
  glow('glow'),

  /// A soft gradient from the playing book's cover colors.
  cover('cover'),

  /// A fixed two-color diagonal blend from the app color.
  gradient('gradient'),

  /// A flat color: today's Flat background.
  plain('plain');

  const AppBackground(this.id);

  /// Stable id stored in preferences.
  final String id;

  /// The background stored under [id], or null for a missing or unknown id.
  static AppBackground? fromId(String? id) {
    for (final b in values) {
      if (b.id == id) return b;
    }
    return null;
  }
}

/// The background picked in Settings for the active account; null until one
/// is picked (the look's default then applies, see [resolveAppBackground]).
final ValueNotifier<AppBackground?> appBackgroundNotifier = ValueNotifier(null);

/// Per-account storage, like the other appearance settings.
abstract final class AppBackgroundStore {
  static const prefKey = 'fork_app_background';

  /// Loads the active account's choice into [appBackgroundNotifier].
  static Future<void> load() async {
    appBackgroundNotifier.value = AppBackground.fromId(
      await ScopedPrefs.getString(prefKey),
    );
  }

  /// Applies [background] right away and saves it.
  static Future<void> choose(AppBackground background) async {
    appBackgroundNotifier.value = background;
    await ScopedPrefs.setString(prefKey, background.id);
  }
}

/// The background in effect. E-ink and Flat background are always [plain]
/// (Flat background on is what picking Plain saves). Otherwise the picked
/// one wins; with none picked, Midnight (a look without a glow) stays plain
/// true black and the other looks get the glow.
AppBackground resolveAppBackground({
  required AppBackground? choice,
  required bool flat,
  required bool eink,
  required AbsorbLook look,
}) {
  if (eink || flat) return AppBackground.plain;
  if (choice != null) return choice;
  return look.glowStrength == 0 ? AppBackground.plain : AppBackground.glow;
}

/// The background in effect for [context]'s look and the current settings.
AppBackground currentAppBackground(BuildContext context) =>
    resolveAppBackground(
      choice: appBackgroundNotifier.value,
      flat: flatNotifier.value,
      eink: einkModeNotifier.value,
      look: AbsorbLook.of(context),
    );

/// What a backdrop paints: [plain] alone, or [gradient] (opaque colors).
@immutable
class AppBackdropSpec {
  const AppBackdropSpec({
    required this.kind,
    required this.plain,
    this.gradient,
  });

  /// The background actually drawn (Book colors falls back to [glow]).
  final AppBackground kind;

  /// The opaque page color.
  final Color plain;

  /// The gradient over the whole page, or null for [plain].
  final Gradient? gradient;

  @override
  bool operator ==(Object other) =>
      other is AppBackdropSpec &&
      other.kind == kind &&
      other.plain == plain &&
      other.gradient == gradient;

  @override
  int get hashCode => Object.hash(kind, plain, gradient);
}

/// [color] at [alpha] over [base], as an opaque color.
Color _tint(Color color, double alpha, Color base) =>
    Color.alphaBlend(color.withValues(alpha: alpha.clamp(0.0, 1.0)), base);

/// The backdrop for [context]: its theme, look and the current settings.
AppBackdropSpec appBackdropSpec(BuildContext context) {
  final look = AbsorbLook.of(context);
  final cs = Theme.of(context).colorScheme;
  final plain = pageSurfaceColor(context);
  final intensity = gradientIntensityNotifier.value;
  var kind = currentAppBackground(context);
  final cover = coverSchemeNotifier.value;
  if (kind == AppBackground.cover && cover == null) kind = AppBackground.glow;

  switch (kind) {
    case AppBackground.plain:
      return AppBackdropSpec(kind: kind, plain: plain);
    case AppBackground.glow:
      // The screens' original glow: accent at the top fading out by 22%.
      // Midnight has no glow of its own, so an explicit pick there uses the
      // intensity setting.
      final midnight = look.glowStrength == 0;
      final alpha = midnight ? intensity : lookGlow(context, intensity);
      final base = [cs.primary.withValues(alpha: alpha), plain, plain, plain];
      final colors = midnight ? base : lookBackdrop(context, base);
      return AppBackdropSpec(
        kind: kind,
        plain: plain,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.22, 0.72, 1.0],
          colors: [for (final c in colors) Color.alphaBlend(c, plain)],
        ),
      );
    case AppBackground.gradient:
      final a = intensity * 2.5;
      return AppBackdropSpec(
        kind: kind,
        plain: plain,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 0.55, 1.0],
          colors: [
            _tint(cs.primary, a, plain),
            _tint(Color.lerp(cs.primary, cs.tertiary, 0.5)!, a * 0.35, plain),
            _tint(cs.tertiary, a, plain),
          ],
        ),
      );
    case AppBackground.cover:
      final a = intensity * 3;
      return AppBackdropSpec(
        kind: kind,
        plain: plain,
        gradient: LinearGradient(
          begin: const Alignment(-0.6, -1),
          end: const Alignment(0.6, 1),
          stops: const [0.0, 0.5, 1.0],
          colors: [
            _tint(cover!.primary, a, plain),
            _tint(cover.secondary, a * 0.4, plain),
            _tint(cover.tertiary, a * 0.8, plain),
          ],
        ),
      );
  }
}

/// Holds the opaque page color above the navigator, for everything that
/// used `scaffoldBackgroundColor` as a solid fill (it is transparent now).
class AppBackdropScope extends InheritedWidget {
  const AppBackdropScope({
    super.key,
    required this.plain,
    required super.child,
  });

  /// The page color the theme had before scaffolds turned transparent.
  final Color plain;

  @override
  bool updateShouldNotify(AppBackdropScope oldWidget) =>
      oldWidget.plain != plain;
}

/// The opaque page color: [AppBackdropScope]'s, else the theme's scaffold
/// color (outside the app's builder, e.g. in tests), else the surface.
Color pageSurfaceColor(BuildContext context) {
  final scope = context.dependOnInheritedWidgetOfExactType<AppBackdropScope>();
  if (scope != null) return scope.plain;
  final theme = Theme.of(context);
  final scaffold = theme.scaffoldBackgroundColor;
  return scaffold.a < 1 ? theme.colorScheme.surface : scaffold;
}

/// [themed] with transparent scaffolds and app bars (the backdrop shows
/// through) and page transitions that put an [AppBackdrop] behind every
/// opaque page. Used by `absorbLookBuilder` with [AppBackdropScope].
ThemeData appBackdropThemeData(ThemeData themed) {
  final source = themed.pageTransitionsTheme.builders;
  return themed.copyWith(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: themed.appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        for (final p in TargetPlatform.values)
          p: _BackdropPageTransitions(source[p] ?? _platformDefault(p)),
      },
    ),
  );
}

/// What Flutter falls back to for a platform missing from the theme.
PageTransitionsBuilder _platformDefault(TargetPlatform p) => switch (p) {
  TargetPlatform.iOS ||
  TargetPlatform.macOS => const CupertinoPageTransitionsBuilder(),
  _ => const ZoomPageTransitionsBuilder(),
};

/// [inner]'s transition with an [AppBackdrop] behind the page.
class _BackdropPageTransitions extends PageTransitionsBuilder {
  const _BackdropPageTransitions(this.inner);

  final PageTransitionsBuilder inner;

  @override
  Duration get transitionDuration => inner.transitionDuration;

  @override
  Duration get reverseTransitionDuration => inner.reverseTransitionDuration;

  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      inner.delegatedTransition;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => inner.buildTransitions(
    route,
    context,
    animation,
    secondaryAnimation,
    route.opaque ? AppBackdrop(child: child) : child,
  );

  @override
  bool operator ==(Object other) =>
      other is _BackdropPageTransitions && other.inner == inner;

  @override
  int get hashCode => inner.hashCode;
}

/// Paints the app background behind [child] (a whole page). Inside another
/// backdrop (a nested navigator's page) it paints nothing: the outer one
/// already shows through. Screens that paint their own glow skip it when
/// [isActive] (`flatNotifier.value || AppBackdrop.isActive(context)`), so
/// the glow never doubles up.
class AppBackdrop extends StatefulWidget {
  const AppBackdrop({super.key, required this.child});

  final Widget child;

  /// Whether [context] is inside a page with the app background.
  static bool isActive(BuildContext context) =>
      context.getInheritedWidgetOfExactType<_BackdropMarker>() != null;

  /// The backdrop [context] is drawn over, or null outside one.
  static AppBackdropSpec? specOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_BackdropMarker>()?.spec;

  @override
  State<AppBackdrop> createState() => _AppBackdropState();
}

final Listenable _backdropInputs = Listenable.merge([
  appBackgroundNotifier,
  flatNotifier,
  einkModeNotifier,
  gradientIntensityNotifier,
  coverSchemeNotifier,
]);

class _AppBackdropState extends State<AppBackdrop> {
  final GlobalKey _fillKey = GlobalKey(debugLabel: 'AppBackdrop');

  @override
  Widget build(BuildContext context) {
    // Nesting never changes for a page, so the tree shape stays stable.
    if (AppBackdrop.isActive(context)) return widget.child;
    return ListenableBuilder(
      listenable: _backdropInputs,
      child: widget.child,
      builder: (context, child) {
        final spec = appBackdropSpec(context);
        return _BackdropMarker(
          spec: spec,
          fillKey: _fillKey,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned.fill(
                child: RepaintBoundary(
                  child: _BackdropPaint(key: _fillKey, spec: spec),
                ),
              ),
              child!,
            ],
          ),
        );
      },
    );
  }
}

class _BackdropMarker extends InheritedWidget {
  const _BackdropMarker({
    required this.spec,
    required this.fillKey,
    required super.child,
  });

  final AppBackdropSpec spec;
  final GlobalKey fillKey;

  @override
  bool updateShouldNotify(_BackdropMarker oldWidget) =>
      oldWidget.spec != spec || oldWidget.fillKey != fillKey;
}

/// The part of the page's backdrop under this box, lined up with the full
/// backdrop: an opaque background for a header that content scrolls under
/// (Library's floating header). Outside a backdrop it paints the page color.
class AppBackdropSlice extends StatelessWidget {
  const AppBackdropSlice({super.key});

  @override
  Widget build(BuildContext context) {
    final marker = context
        .dependOnInheritedWidgetOfExactType<_BackdropMarker>();
    return _BackdropPaint(
      spec:
          marker?.spec ??
          AppBackdropSpec(
            kind: AppBackground.plain,
            plain: pageSurfaceColor(context),
          ),
      anchorKey: marker?.fillKey,
    );
  }
}

/// Paints a spec over its own box, or (with [anchorKey]) over the anchor's
/// box, clipped to its own.
class _BackdropPaint extends LeafRenderObjectWidget {
  const _BackdropPaint({super.key, required this.spec, this.anchorKey});

  final AppBackdropSpec spec;
  final GlobalKey? anchorKey;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderBackdropPaint(spec, anchorKey);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderBackdropPaint renderObject,
  ) {
    renderObject
      ..spec = spec
      ..anchorKey = anchorKey;
  }
}

class _RenderBackdropPaint extends RenderBox {
  _RenderBackdropPaint(this._spec, this._anchorKey);

  AppBackdropSpec _spec;
  AppBackdropSpec get spec => _spec;
  set spec(AppBackdropSpec value) {
    if (value == _spec) return;
    _spec = value;
    markNeedsPaint();
  }

  GlobalKey? _anchorKey;
  set anchorKey(GlobalKey? value) {
    if (value == _anchorKey) return;
    _anchorKey = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) => constraints.biggest;

  @override
  bool hitTestSelf(Offset position) => false;

  /// The anchor's box in this box's coordinates, or null to use our own.
  Rect? _anchorRect() {
    final anchor = _anchorKey?.currentContext?.findRenderObject();
    if (anchor is! RenderBox || !anchor.attached || !anchor.hasSize) {
      return null;
    }
    if (identical(anchor, this)) return null;
    final origin = MatrixUtils.transformPoint(
      anchor.getTransformTo(this),
      Offset.zero,
    );
    return origin & anchor.size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final box = offset & size;
    final gradient = _spec.gradient;
    if (gradient == null) {
      canvas.drawRect(box, Paint()..color = _spec.plain);
      return;
    }
    final area = (_anchorRect() ?? Offset.zero & size).shift(offset);
    canvas.drawRect(box, Paint()..shader = gradient.createShader(area));
  }
}

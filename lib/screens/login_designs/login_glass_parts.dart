import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../main.dart' show einkModeNotifier, flatNotifier;
import '../../ui_themes/app_backdrop.dart';
import '../../ui_themes/frosted.dart' show frostBlurSupported;
import '../../ui_themes/ui_theme.dart';
import '../../ui_themes/ui_theme_hooks.dart';
import '../../utils/cover_cache.dart';
import '../../utils/fork_errors.dart';

// The glass pieces of the B2-B4 sign-in designs: a soft, static background
// (recent covers blurred once, or the accent's gradient) and a see-through
// frosted panel over it.

/// A blurred collage of the covers used most recently on this device, read
/// from the on-disk cover cache (never the network) and drawn once into a
/// small image. Null when no covers are cached (web keeps none).
abstract final class LoginCoverCollage {
  /// Reads up to [maxCovers] cached cover files, most recent first. Tests
  /// replace it.
  static Future<List<Uint8List>> Function() readCovers = _readCoverCache;

  static const maxCovers = 12;

  static Future<ui.Image?>? _image;

  /// The collage, built once per run.
  static Future<ui.Image?> image() => _image ??= _build();

  @visibleForTesting
  static void debugReset() {
    _image = null;
    readCovers = _readCoverCache;
  }

  static Future<List<Uint8List>> _readCoverCache() async {
    if (kIsWeb) return const [];
    final config = coverCacheManager.config;
    final repo = config.repo;
    await repo.open();
    try {
      final objects = await repo.getAllObjects();
      final never = DateTime.fromMillisecondsSinceEpoch(0);
      objects.sort(
        (a, b) => (b.touched ?? never).compareTo(a.touched ?? never),
      );
      final covers = <Uint8List>[];
      for (final o in objects) {
        if (covers.length >= maxCovers) break;
        if ((o.length ?? 0) > 6 << 20) continue;
        final file = await config.fileSystem.createFile(o.relativePath);
        if (!await file.exists()) continue;
        covers.add(await file.readAsBytes());
      }
      return covers;
    } finally {
      await repo.close();
    }
  }

  static Future<ui.Image?> _build() async {
    try {
      final covers = await readCovers();
      final images = <ui.Image>[];
      for (final bytes in covers) {
        try {
          final codec = await ui.instantiateImageCodec(bytes, targetWidth: 96);
          final frame = await codec.getNextFrame();
          codec.dispose();
          images.add(frame.image);
        } catch (e) {
          swallow('LoginCovers', e);
        }
      }
      if (images.isEmpty) return null;
      return await _compose(images);
    } catch (e) {
      swallow('LoginCovers', e);
      return null;
    }
  }

  /// Square-cropped covers in a 4×3 grid, blurred, as one 384×288 image.
  static Future<ui.Image> _compose(List<ui.Image> covers) async {
    const cols = 4, rows = 3, cell = 96.0;
    const bounds = Rect.fromLTWH(0, 0, cols * cell, rows * cell);
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, bounds);
    canvas.saveLayer(
      bounds,
      Paint()
        ..imageFilter = ui.ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
          tileMode: TileMode.clamp,
        ),
    );
    final paint = Paint()..filterQuality = FilterQuality.medium;
    for (var i = 0; i < cols * rows; i++) {
      // Each row starts one cover further on, so repeats don't line up.
      final cover = covers[(i + i ~/ cols) % covers.length];
      final side = math.min(cover.width, cover.height).toDouble();
      final src = Rect.fromCenter(
        center: Offset(cover.width / 2, cover.height / 2),
        width: side,
        height: side,
      );
      final dst = Rect.fromLTWH(
        (i % cols) * cell,
        (i ~/ cols) * cell,
        cell,
        cell,
      );
      canvas.drawImageRect(cover, src, dst, paint);
    }
    canvas.restore();
    final picture = recorder.endRecording();
    try {
      return await picture.toImage(bounds.width.toInt(), bounds.height.toInt());
    } finally {
      picture.dispose();
      for (final c in covers) {
        c.dispose();
      }
    }
  }
}

/// Whether the glass panels may blur what is behind them: not on web (tint
/// only there, as everywhere in the app), in e-ink mode or with Flat
/// background.
bool loginGlassBlurs() =>
    frostBlurSupported() && !einkModeNotifier.value && !flatNotifier.value;

/// The B2-B4 sign-in screen: [child] over a static, soft background (see
/// [LoginAmbientBackground]); a plain background with Flat background on.
class LoginGlassBackdrop extends StatelessWidget {
  const LoginGlassBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final look = AbsorbLook.of(context);
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // Over the app background when there is one (its art layers on top).
      backgroundColor: AppBackdrop.isActive(context)
          ? Colors.transparent
          : look.canvasColor ?? cs.surface,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (!flatNotifier.value)
            const RepaintBoundary(child: LoginAmbientBackground()),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

/// Soft blobs of the theme's accent colours, or the [LoginCoverCollage]
/// under a scrim once it is ready. Static: nothing moves.
class LoginAmbientBackground extends StatefulWidget {
  const LoginAmbientBackground({super.key});

  @override
  State<LoginAmbientBackground> createState() => _LoginAmbientBackgroundState();
}

class _LoginAmbientBackgroundState extends State<LoginAmbientBackground> {
  ui.Image? _covers;

  @override
  void initState() {
    super.initState();
    unawaited(
      LoginCoverCollage.image().then((image) {
        if (mounted && image != null) setState(() => _covers = image);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final look = AbsorbLook.of(context);
    final cs = Theme.of(context).colorScheme;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final base = look.canvasColor ?? cs.surface;
    // Midnight keeps its backgrounds near-plain: everything half as strong.
    final quiet = look.glowStrength == 0;
    final strength = quiet ? 0.45 : 1.0;

    Widget blob(Alignment center, Color color, double alpha, double radius) =>
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: center,
              radius: radius,
              colors: [
                color.withValues(alpha: alpha * strength),
                color.withValues(alpha: 0),
              ],
            ),
          ),
        );

    final covers = _covers;
    if (covers != null) {
      return Stack(
        key: const Key('login-glass-covers'),
        fit: StackFit.expand,
        children: [
          RawImage(
            image: covers,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
          ColoredBox(
            color: base.withValues(alpha: quiet ? 0.72 : (dark ? 0.55 : 0.5)),
          ),
          blob(const Alignment(-0.9, -0.9), cs.primary, 0.22, 1.2),
        ],
      );
    }
    return Stack(
      key: const Key('login-glass-gradient'),
      fit: StackFit.expand,
      children: [
        blob(const Alignment(-0.9, -0.8), cs.primary, dark ? 0.42 : 0.30, 1.2),
        blob(const Alignment(1.0, -0.1), cs.tertiary, dark ? 0.30 : 0.22, 1.0),
        blob(const Alignment(-0.2, 1.1), cs.secondary, dark ? 0.24 : 0.18, 1.0),
      ],
    );
  }
}

/// A see-through frosted panel: the background blurred behind a light
/// glass fill (the Frosted look's own glass when it is on), or a tint
/// where blur is off. Panels inside it turn to faint glass too.
class LoginGlassPanel extends StatelessWidget {
  const LoginGlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final look = AbsorbLook.of(context);
    final cs = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    final blur = loginGlassBlurs();
    final glass = look.frostedPanels
        ? look.panelFillAlpha!
        : (dark ? 0.08 : 0.5);
    final fill = blur
        ? Colors.white.withValues(alpha: glass)
        : dark
        ? cs.surfaceContainerHigh.withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.82);
    final edge = look.themedPanels
        ? look.panelEdge(theme.brightness)
        : (dark ? Colors.white : Colors.black).withValues(
            alpha: dark ? 0.14 : 0.08,
          );
    final sigma = look.panelBlurSigma > 0 ? look.panelBlurSigma : 22.0;
    final radius = BorderRadius.circular(lookRadius(context, 24));
    final inner = theme.copyWith(
      extensions: [
        for (final e in theme.extensions.values)
          if (e is! AbsorbLook) e,
        look.copyWith(
          panelFillAlpha: dark ? 0.05 : 0.35,
          panelBorderAlpha: dark ? 0.12 : 0.08,
        ),
      ],
    );
    return ClipRRect(
      key: const Key('login-glass-panel'),
      borderRadius: radius,
      child: BackdropFilter(
        enabled: blur,
        filter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fill,
            borderRadius: radius,
            border: Border.all(color: edge),
          ),
          child: Theme(
            data: inner,
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}

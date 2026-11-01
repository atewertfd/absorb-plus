// Absorb Plus: static placeholder cards shown while Home and the library grid
// load for the first time. They take the size and shape of the real cards
// (Home's shelves and big Continue cards, the library grid's tiles at the
// current cover size), so nothing jumps when the real content arrives.
//
// One gentle opacity pulse per placeholder group, never per card, and none at
// all when the system asks for reduced motion.
import 'package:flutter/material.dart';

import '../screens/library_screen.dart' show libraryGridBottomPadding;
import '../ui_themes/ui_theme_hooks.dart' show classicShelfCardHeight;
import 'books_sheet_shared.dart';
import 'text_scale_room.dart';

/// Placeholder fill: the surface tone the app's cards sit on.
Color placeholderColor(BuildContext context) =>
    Theme.of(context).colorScheme.surfaceContainerHighest;

class _PlaceholderBlock extends StatelessWidget {
  const _PlaceholderBlock({this.width, this.height, this.radius = 10});

  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: placeholderColor(context),
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}

/// Drives the one pulse a placeholder group shares. Stops (and stays fully
/// opaque) while animations are disabled.
mixin _PlaceholderPulse<T extends StatefulWidget>
    on State<T>, SingleTickerProviderStateMixin<T> {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
    value: 1,
  );

  /// Opacity between 0.55 and 1.
  late final Animation<double> pulse = Tween<double>(begin: 0.55, end: 1)
      .animate(CurvedAnimation(parent: _pulse, curve: Curves.easeInOut));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final still = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (still) {
      _pulse
        ..stop()
        ..value = 1;
    } else if (!_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }
}

/// Home while its shelves load: a Continue shelf of big cards, then two cover
/// shelves, laid out like the real ones.
class HomeShelvesPlaceholder extends StatefulWidget {
  const HomeShelvesPlaceholder({
    super.key,
    required this.rectangleCovers,
    required this.showSubtitles,
    this.shelves = 2,
  });

  final bool rectangleCovers;
  final bool showSubtitles;
  final int shelves;

  @override
  State<HomeShelvesPlaceholder> createState() => _HomeShelvesPlaceholderState();
}

class _HomeShelvesPlaceholderState extends State<HomeShelvesPlaceholder>
    with SingleTickerProviderStateMixin, _PlaceholderPulse {
  Widget _header() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          const _PlaceholderBlock(width: 16, height: 16, radius: 8),
          const SizedBox(width: 8),
          const _PlaceholderBlock(width: 120, height: 14, radius: 6),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 0.5,
              color: Theme.of(context)
                  .colorScheme
                  .outlineVariant
                  .withValues(alpha: 0.2),
            ),
          ),
        ]),
      );

  Widget _row({
    required double height,
    required double spacing,
    required Widget Function() card,
  }) =>
      SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 8,
          separatorBuilder: (_, __) => SizedBox(width: spacing),
          itemBuilder: (_, __) => card(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final rect = widget.rectangleCovers;
    final aspect = rect ? 2 / 3 : 1.0;

    // Continue shelf: the same row height and card width as Home's.
    final heroHeight = (rect ? 320 : 250) + textScaleRoom(context, 58);

    // Cover shelves: the same sizing as HomeSection's book shelves.
    final cardWidth = 140 * coverSizeScale();
    final scaler = MediaQuery.textScalerOf(context);
    double lineHeight(TextStyle? s) =>
        scaler.scale((s?.fontSize ?? 12) * (s?.height ?? 1.4));
    final textBlock = 6 +
        lineHeight(tt.labelMedium) * (rect ? 1 : 2) +
        lineHeight(tt.labelSmall) * (widget.showSubtitles ? 2 : 1) +
        6;
    final shelfHeight = classicShelfCardHeight(
            context, rect, cardWidth, aspect, widget.showSubtitles) ??
        cardWidth / aspect + textBlock;

    Widget coverCard() => SizedBox(
          width: cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PlaceholderBlock(width: cardWidth, height: cardWidth / aspect),
              const SizedBox(height: 8),
              _PlaceholderBlock(width: cardWidth * 0.8, height: 10, radius: 4),
              const SizedBox(height: 6),
              _PlaceholderBlock(width: cardWidth * 0.5, height: 8, radius: 4),
            ],
          ),
        );

    return FadeTransition(
      opacity: pulse,
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            _header(),
            const SizedBox(height: 12),
            _row(
              height: heroHeight,
              spacing: 10,
              card: () =>
                  const _PlaceholderBlock(width: 150, radius: 14),
            ),
            for (var i = 0; i < widget.shelves; i++) ...[
              const SizedBox(height: 24),
              _header(),
              const SizedBox(height: 12),
              _row(height: shelfHeight, spacing: 12, card: coverCard),
            ],
          ],
        ),
      ),
    );
  }
}

/// The library grid while its first page loads: a sliver of tiles with the
/// grid's own columns, spacing and cell size.
class LibraryGridPlaceholder extends StatefulWidget {
  const LibraryGridPlaceholder({
    super.key,
    required this.columns,
    required this.rectangleCovers,
    required this.showSubtitles,
    required this.coverAspectRatio,
    this.rows = 6,
  });

  final int columns;
  final bool rectangleCovers;
  final bool showSubtitles;
  final double coverAspectRatio;
  final int rows;

  @override
  State<LibraryGridPlaceholder> createState() => _LibraryGridPlaceholderState();
}

class _LibraryGridPlaceholderState extends State<LibraryGridPlaceholder>
    with SingleTickerProviderStateMixin, _PlaceholderPulse {
  @override
  Widget build(BuildContext context) {
    final ratio = widget.rectangleCovers ? 0.48 : 0.68;
    // Mirrors LibraryBooksTab's grid delegate so the real tiles land exactly
    // where the placeholders were.
    final delegate = LabelRoomGridDelegate(
      labelRoom: textScaleRoom(context, 30),
      crossAxisCount: widget.columns,
      childAspectRatio: ratio,
      mainAxisExtent: widget.showSubtitles
          ? coverGridTileWidth(context) / ratio +
              coverGridSubtitleHeight(context)
          : null,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    );
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, libraryGridBottomPadding),
      sliver: SliverFadeTransition(
        opacity: pulse,
        sliver: SliverGrid(
          gridDelegate: delegate,
          delegate: SliverChildBuilderDelegate(
            (context, _) => ExcludeSemantics(
              child: LayoutBuilder(
                // Clipped rather than overflowing if a very dense grid
                // leaves less room under the cover than the two bars take.
                builder: (context, box) => ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.topCenter,
                    maxHeight: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: widget.coverAspectRatio,
                          child: const _PlaceholderBlock(),
                        ),
                        const SizedBox(height: 7),
                        _PlaceholderBlock(
                            width: box.maxWidth * 0.8, height: 9, radius: 4),
                        const SizedBox(height: 5),
                        _PlaceholderBlock(
                            width: box.maxWidth * 0.5, height: 7, radius: 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            childCount: widget.columns * widget.rows,
          ),
        ),
      ),
    );
  }
}

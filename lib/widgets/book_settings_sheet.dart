import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/audio_player_service.dart';
import '../services/book_settings_service.dart';
import '../services/chromecast_service.dart';
import 'overlay_toast.dart';

/// Absorb Plus: the book page's "Book settings" sheet. One screen: speed for
/// this book, intro / outro skip, "Use for the whole series" and Reset.
/// Every change saves at once (like the speed sheet).
Future<void> showBookSettingsSheet(
  BuildContext context, {
  required String itemId,
  Map<String, dynamic>? item,
  required Color accent,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) =>
        BookSettingsSheet(itemId: itemId, item: item, accent: accent),
  );
}

class BookSettingsSheet extends StatefulWidget {
  final String itemId;
  final Map<String, dynamic>? item;
  final Color accent;

  const BookSettingsSheet({
    super.key,
    required this.itemId,
    this.item,
    required this.accent,
  });

  @override
  State<BookSettingsSheet> createState() => _BookSettingsSheetState();
}

class _BookSettingsSheetState extends State<BookSettingsSheet> {
  static const _skipStep = 5;
  static const _speedStep = 0.05;
  static const _minSpeed = 0.5;
  static const _maxSpeed = 5.0;

  bool _loaded = false;
  BookSeries? _series;
  double _speed = 1.0;
  bool _speedFromSeries = false;
  BookSkip _skip = BookSkip.none;
  bool _wholeSeries = false;

  String get _itemId => widget.itemId;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    var series = BookSettingsService.seriesOf(widget.item);
    if (series != null) {
      await BookSettingsService.rememberSeries(_itemId, series);
    } else {
      final id = await BookSettingsService.seriesIdFor(_itemId);
      if (id != null && id.isNotEmpty) {
        series = (
          id: id,
          name: await BookSettingsService.seriesNameFor(id) ?? '',
        );
      }
    }
    final own = await BookSettingsService.ownSpeed(_itemId);
    final fromSeries = own == null
        ? await BookSettingsService.seriesSpeedFor(_itemId)
        : null;
    final speed = own ?? fromSeries ?? await PlayerSettings.getDefaultSpeed();
    final ownSkip = await BookSettingsService.ownSkip(_itemId);
    final seriesSkip = series != null
        ? await BookSettingsService.seriesSkip(series.id)
        : null;
    if (!mounted) return;
    setState(() {
      _series = series;
      _speed = _roundSpeed(speed);
      _speedFromSeries = fromSeries != null;
      _wholeSeries = ownSkip == null && seriesSkip != null;
      _skip = ownSkip ?? seriesSkip ?? BookSkip.none;
      _loaded = true;
    });
  }

  static double _roundSpeed(double v) =>
      ((v * 20).round() / 20.0).clamp(_minSpeed, _maxSpeed);

  bool get _isLoadedBook {
    final player = AudioPlayerService();
    return player.currentItemId == _itemId && player.currentEpisodeId == null;
  }

  bool get _isCastBook {
    final cast = ChromecastService();
    return cast.isCasting && cast.castingItemId == _itemId;
  }

  /// Apply [speed] to whatever is playing this book now.
  Future<void> _applyLiveSpeed(double speed) async {
    if (_isCastBook) {
      await ChromecastService().setSpeed(speed);
    } else if (_isLoadedBook) {
      await AudioPlayerService().setSpeed(speed);
    }
  }

  Future<void> _setSpeed(double v) async {
    final s = _roundSpeed(v);
    if (s == _speed && !_speedFromSeries) return;
    setState(() {
      _speed = s;
      _speedFromSeries = false;
    });
    await _applyLiveSpeed(s);
    await PlayerSettings.setBookSpeed(_itemId, s);
    PlayerSettings.notifySettingsChanged();
  }

  Future<void> _saveSkip() async {
    final series = _series;
    if (_wholeSeries && series != null) {
      await BookSettingsService.setSeriesSkip(series.id, _itemId, _skip);
    } else {
      await BookSettingsService.setBookSkip(_itemId, _skip);
    }
    BookPlaybackRules.instance.updateLive(_itemId, _skip);
  }

  void _setSkip(BookSkip skip) {
    if (skip == _skip) return;
    setState(() => _skip = skip);
    _saveSkip();
  }

  Future<void> _setWholeSeries(bool on) async {
    final series = _series;
    if (series == null) return;
    setState(() => _wholeSeries = on);
    if (on) {
      await BookSettingsService.setSeriesSkip(series.id, _itemId, _skip);
    } else {
      // Back to this book only: it keeps the values, the series stops using them.
      await BookSettingsService.setBookSkip(
        _itemId,
        _skip,
        clearSeriesId: series.id,
      );
    }
    BookPlaybackRules.instance.updateLive(_itemId, _skip);
  }

  Future<void> _reset() async {
    final l = AppLocalizations.of(context)!;
    final includeSeriesSkip = _wholeSeries;
    final def = await PlayerSettings.getDefaultSpeed();
    // The live change saves a speed of its own; it is queued before the reset
    // below, so the reset still wins.
    await _applyLiveSpeed(def);
    await BookSettingsService.reset(
      _itemId,
      includeSeriesSkip: includeSeriesSkip,
    );
    // A series skip left in place still applies to this book.
    BookPlaybackRules.instance.updateLive(
      _itemId,
      await BookSettingsService.skipFor(_itemId),
    );
    PlayerSettings.notifySettingsChanged();
    if (!mounted) return;
    await _load();
    if (!mounted) return;
    showOverlayToast(
      context,
      l.bookSettingsResetDone,
      icon: Icons.restart_alt_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final navBarPad = MediaQuery.of(context).viewPadding.bottom;
    final series = _series;
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 24, 16 + navBarPad),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(
          top: BorderSide(
            color: widget.accent.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: cs.onSurface.withValues(alpha: 0.24),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l.bookSettingsTitle,
              textAlign: TextAlign.center,
              style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            if (series != null && series.name.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                l.bookSettingsSeries(series.name),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
            const SizedBox(height: 16),
            AnimatedOpacity(
              opacity: _loaded ? 1 : 0,
              duration: const Duration(milliseconds: 150),
              child: IgnorePointer(
                ignoring: !_loaded,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _StepperRow(
                      label: l.bookSettingsSpeed,
                      hint: _speedFromSeries
                          ? l.bookSettingsSpeedFromSeries
                          : null,
                      value: '${_speed.toStringAsFixed(2)}x',
                      accent: widget.accent,
                      onMinus: _speed > _minSpeed
                          ? () => _setSpeed(_speed - _speedStep)
                          : null,
                      onPlus: _speed < _maxSpeed
                          ? () => _setSpeed(_speed + _speedStep)
                          : null,
                    ),
                    _StepperRow(
                      label: l.bookSettingsSkipIntro,
                      hint: l.bookSettingsSkipIntroHint,
                      value: _skipLabel(l, _skip.intro),
                      accent: widget.accent,
                      onMinus: _skip.intro > 0
                          ? () => _setSkip(
                              _skip.copyWith(
                                intro: (_skip.intro - _skipStep).clamp(
                                  0,
                                  BookSettingsService.maxSkipSeconds,
                                ),
                              ),
                            )
                          : null,
                      onPlus: _skip.intro < BookSettingsService.maxSkipSeconds
                          ? () => _setSkip(
                              _skip.copyWith(
                                intro: (_skip.intro + _skipStep).clamp(
                                  0,
                                  BookSettingsService.maxSkipSeconds,
                                ),
                              ),
                            )
                          : null,
                    ),
                    _StepperRow(
                      label: l.bookSettingsSkipOutro,
                      hint: l.bookSettingsSkipOutroHint,
                      value: _skipLabel(l, _skip.outro),
                      accent: widget.accent,
                      onMinus: _skip.outro > 0
                          ? () => _setSkip(
                              _skip.copyWith(
                                outro: (_skip.outro - _skipStep).clamp(
                                  0,
                                  BookSettingsService.maxSkipSeconds,
                                ),
                              ),
                            )
                          : null,
                      onPlus: _skip.outro < BookSettingsService.maxSkipSeconds
                          ? () => _setSkip(
                              _skip.copyWith(
                                outro: (_skip.outro + _skipStep).clamp(
                                  0,
                                  BookSettingsService.maxSkipSeconds,
                                ),
                              ),
                            )
                          : null,
                    ),
                    if (series != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.bookSettingsWholeSeries,
                                    style: tt.bodyLarge,
                                  ),
                                  Text(
                                    l.bookSettingsWholeSeriesHint,
                                    style: tt.bodySmall?.copyWith(
                                      color: cs.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Switch(
                              value: _wholeSeries,
                              activeThumbColor: widget.accent,
                              onChanged: _setWholeSeries,
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 8),
                    Center(
                      child: TextButton.icon(
                        onPressed: _reset,
                        icon: const Icon(Icons.restart_alt_rounded, size: 18),
                        label: Text(l.bookSettingsReset),
                        style: TextButton.styleFrom(
                          foregroundColor: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _skipLabel(AppLocalizations l, int seconds) =>
      seconds <= 0 ? l.bookSettingsSkipOff : l.bookSettingsSeconds(seconds);
}

/// Label (+ optional hint) on the left, a −  value  + stepper on the right.
class _StepperRow extends StatelessWidget {
  final String label;
  final String? hint;
  final String value;
  final Color accent;
  final VoidCallback? onMinus;
  final VoidCallback? onPlus;

  const _StepperRow({
    required this.label,
    this.hint,
    required this.value,
    required this.accent,
    this.onMinus,
    this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: tt.bodyLarge),
                if (hint != null)
                  Text(
                    hint!,
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _RoundButton(icon: Icons.remove_rounded, onTap: onMinus),
          SizedBox(
            width: 64,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: tt.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
          ),
          _RoundButton(icon: Icons.add_rounded, onTap: onPlus),
        ],
      ),
    );
  }
}

/// The speed sheet's round − / + button.
class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _RoundButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final on = Theme.of(context).colorScheme.onSurface;
    final enabled = onTap != null;
    return Semantics(
      button: true,
      enabled: enabled,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: on.withValues(alpha: enabled ? 0.08 : 0.04),
          ),
          child: Icon(
            icon,
            size: 20,
            color: on.withValues(alpha: enabled ? 0.7 : 0.25),
          ),
        ),
      ),
    );
  }
}

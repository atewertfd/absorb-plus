import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';

import 'equalizer_service.dart';

/// Absorb Plus: the equalizer's bands and presets (Voice boost, Podcast,
/// Audiobook, ...) on Windows and Linux.
///
/// Upstream drives the equalizer through Android's audio effects; on the
/// desktop that channel is missing, so the sheet used to change nothing.
/// Here the same settings (global or per book, as the sheet stores them)
/// become an mpv audio filter chain, one peaking `equalizer` per band.
///
/// Why `equalizer` and not a leveller such as `dynaudnorm`: the libmpv
/// shipped for Windows (media_kit_libs_windows_audio) is built with almost
/// no FFmpeg filters. `equalizer` exists; `dynaudnorm`, `loudnorm`,
/// `acompressor`, `alimiter`, `volume` and `aresample` don't, and mpv ends
/// the file when a filter it was given can't be created. `equalizer` can't
/// convert sample formats on its own (no `aresample`), so mpv's own
/// `format` filter feeds it planar float first. In a book sampled below
/// about 28 kHz the 14 kHz band lies above what the file can hold; FFmpeg
/// logs "Invalid frequency" and passes that band through unchanged, and
/// the other bands still apply.
///
/// Changing mpv's `af` property rebuilds only the filter chain: playback
/// keeps going and the position doesn't move. With the equalizer off, or
/// on with every band at 0 dB, the chain is empty: the `af` property is
/// never touched unless a band was boosted or cut, so playback is exactly
/// as before.
abstract final class DesktopEqualizer {
  /// Width of each peaking band in octaves. The five bands sit about two
  /// octaves apart (60, 230, 910, 3600, 14000 Hz), so neighbours overlap
  /// gently, like a graphic equalizer.
  static const bandWidthOctaves = 2;

  /// Gains are clamped to the sheet's range.
  static const maxGainDb = 15.0;

  /// The mpv `af` value for these settings, or '' for no filter at all.
  static String buildAudioFilter({
    required bool enabled,
    required List<double> bandLevels,
    required List<int> bandFrequencies,
  }) {
    if (!enabled) return '';
    final bands = <String>[];
    final count = math.min(bandLevels.length, bandFrequencies.length);
    for (var i = 0; i < count; i++) {
      final hz = bandFrequencies[i];
      final level = bandLevels[i];
      if (hz <= 0 || level.isNaN) continue;
      final gain = level.clamp(-maxGainDb, maxGainDb);
      final text = gain.toStringAsFixed(1);
      if (text == '0.0' || text == '-0.0') continue;
      bands.add('equalizer=f=$hz:t=o:w=$bandWidthOctaves:g=$text');
    }
    if (bands.isEmpty) return '';
    return 'format=format=floatp,lavfi=[${bands.join(',')}]';
  }

  static DesktopEqualizerBinding? _binding;

  /// Follows [EqualizerService] on Windows and Linux from now on. Called
  /// once by `initializeDesktopAudio`, before the first player is created,
  /// so a saved equalizer applies from the first second of playback.
  static void attach() {
    _binding ??= DesktopEqualizerBinding(EqualizerService())..start();
  }
}

/// Keeps mpv's `af` property in step with an [EqualizerService].
class DesktopEqualizerBinding {
  DesktopEqualizerBinding(
    this._eq, {
    Future<void> Function(String af)? apply,
    this.debounce = const Duration(milliseconds: 250),
  }) : _apply = apply ?? _setMpvAudioFilter;

  final EqualizerService _eq;
  final Future<void> Function(String af) _apply;

  /// Dragging a band slider changes the level many times a second; each
  /// change of `af` rebuilds mpv's filter chain, so only the settled value
  /// is applied.
  final Duration debounce;

  /// '' is mpv's default (no user filters), what a fresh player has.
  String _applied = '';
  Timer? _timer;
  bool _started = false;

  @visibleForTesting
  String get applied => _applied;

  static Future<void> _setMpvAudioFilter(String af) =>
      JustAudioMediaKit.setLiveMpvProperty('af', af);

  void start() {
    if (_started) return;
    _started = true;
    _eq.addListener(_onChanged);
    // Right away: players created from now on pick it up at creation.
    _sync();
  }

  void dispose() {
    _timer?.cancel();
    if (_started) _eq.removeListener(_onChanged);
    _started = false;
  }

  void _onChanged() {
    _timer?.cancel();
    _timer = Timer(debounce, _sync);
  }

  void _sync() {
    final af = DesktopEqualizer.buildAudioFilter(
      enabled: _eq.enabled,
      bandLevels: _eq.bandLevels,
      bandFrequencies: _eq.bandFrequencies,
    );
    if (af == _applied) return;
    _applied = af;
    debugPrint('[EQ] Desktop filter ${af.isEmpty ? 'off' : 'on: $af'}');
    unawaited(_apply(af).catchError((Object e) {
      debugPrint('[EQ] Desktop filter not applied: $e');
    }));
  }
}

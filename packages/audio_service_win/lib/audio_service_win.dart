import 'dart:developer';

import 'package:audio_service_platform_interface/audio_service_platform_interface.dart';
import 'package:flutter/services.dart';

import 'smtc_timeline.dart';

class AudioServiceWin extends AudioServicePlatform {
  AudioHandlerCallbacks? _handlerCallbacks;
  final methodChannel = const MethodChannel('audio_service_win');
  bool _methodCallHandlerSet = false;

  /// Throttles the flyout's timeline (position and length).
  final SmtcTimeline timeline;

  AudioServiceWin({SmtcTimeline? timeline})
      : timeline = timeline ?? SmtcTimeline();

  static void registerWith() {
    final instance = AudioServiceWin();
    AudioServicePlatform.instance = instance;
  }

  @override
  Future<void> configure(ConfigureRequest request) async {
    log('Configure AudioServiceWin.', name: 'audio_service_win');
    assert(request.config.androidNotificationChannelId != null,
        "androidNotificationChannelId is required for registering DBus object. e.g com.ryanheise.myapp.channel.audio");

    // Set up method call handler if not already done
    if (!_methodCallHandlerSet) {
      await _setupMethodCallHandler();
      _methodCallHandlerSet = true;
    }

    await methodChannel.invokeMethod<String>('initializeSMTC',
        {'appid': request.config.androidNotificationChannelId});
  }

  @override
  Future<void> setMediaItem(SetMediaItemRequest request) async {
    log('Set Media Item in AudioServiceWin.', name: 'audio_service_win');

    await methodChannel.invokeMethod('setMediaItem', {
      'title': request.mediaItem.title,
      'artist': request.mediaItem.artist,
      'album': request.mediaItem.album,
      'artUri': request.mediaItem.extras?['artCacheFile'] ??
          request.mediaItem.artUri?.toString() ?? '',
    });
    await _sendTimeline(timeline.onMediaItem(request.mediaItem));
  }

  @override
  Future<void> setState(SetStateRequest request) async {
    /* States:
    0: Playing
    1: Paused
    2: Stopped
    */
    int state = 0;
    switch (request.state.playing) {
      case true:
        state = 0; // Playing
        break;
      case false:
        state = 1; // Paused
        break;
    }
    await methodChannel.invokeMethod('updateState', {'state': state});
    await _sendTimeline(timeline.onState(request.state));
  }

  /// Sends a timeline update. A failure is logged and swallowed: the flyout's
  /// seek bar must never get in the way of playback.
  Future<void> _sendTimeline(SmtcTimelineUpdate? update) async {
    if (update == null) return;
    try {
      await methodChannel.invokeMethod('updateTimeline', update.toArguments());
    } catch (e) {
      log('SMTC timeline update failed: $e', name: 'audio_service_win');
    }
  }

  @override
  Future<void> setQueue(SetQueueRequest request) async {
    log('setQueue() has not been implemented for Windows.',
        name: 'audio_service_win');
  }

  @override
  Future<void> stopService(StopServiceRequest request) async {
    timeline.reset();
    await methodChannel.invokeMethod('updateState', {'state': 2});
  }

  Future<void> _setupMethodCallHandler() async {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'onSMTCSeek') {
        await handleSeekRequest(call.arguments);
        return;
      }
      if (call.method == 'onSMTCButtonPressed') {
        final button = call.arguments;
        log('SMTC Button Pressed: $button', name: 'audio_service_win');

        // Handle button presses using callbacks if available
        if (_handlerCallbacks != null) {
          switch (button) {
            case 'play':
              _handlerCallbacks!.play(const PlayRequest());
              break;
            case 'pause':
              _handlerCallbacks!.pause(const PauseRequest());
              break;
            case 'stop':
              _handlerCallbacks!.stop(const StopRequest());
              break;
            case 'next':
              _handlerCallbacks!.skipToNext(const SkipToNextRequest());
              break;
            case 'previous':
              _handlerCallbacks!.skipToPrevious(const SkipToPreviousRequest());
              break;
            case 'fastForward':
              _handlerCallbacks!.fastForward(const FastForwardRequest());
              break;
            case 'rewind':
              _handlerCallbacks!.rewind(const RewindRequest());
              break;
            default:
              log('Unhandled button: $button', name: 'audio_service_win');
              break;
          }
        }
      }
    });
  }

  /// The flyout's timeline was dragged to [positionMs] (milliseconds on the
  /// timeline last sent). Ignored while the app has the seek bar locked.
  Future<void> handleSeekRequest(Object? positionMs) async {
    final callbacks = _handlerCallbacks;
    if (callbacks == null || positionMs is! int || !timeline.seekable) return;
    timeline.forceNext();
    final ms = positionMs < 0 ? 0 : positionMs;
    try {
      await callbacks.seek(SeekRequest(position: Duration(milliseconds: ms)));
    } catch (e) {
      log('SMTC seek failed: $e', name: 'audio_service_win');
    }
  }

  @override
  void setHandlerCallbacks(AudioHandlerCallbacks callbacks) {
    _handlerCallbacks = callbacks;
  }
}

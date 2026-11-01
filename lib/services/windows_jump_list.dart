import 'dart:async';
import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/library_provider.dart';
import 'audio_player_service.dart';

/// Item ids go on a command line: letters, digits, '.', '_' and '-' only.
/// The runner checks the same rule (windows/runner/jump_list.cpp).
final RegExp _itemIdPattern = RegExp(r'^[A-Za-z0-9._-]{1,128}$');

bool isValidJumpListItemId(String? id) =>
    id != null && _itemIdPattern.hasMatch(id);

/// One book in the jump list.
@immutable
class JumpListBook {
  const JumpListBook(this.id, this.title);

  final String id;
  final String title;

  /// Usable in the list: a safe id and a title with something in it.
  bool get isUsable => isValidJumpListItemId(id) && cleanTitle.isNotEmpty;

  String get cleanTitle =>
      title.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), ' ').replaceAll(
          RegExp(r'\s+'), ' ').trim();

  Map<String, Object?> toMap() => {'id': id, 'title': cleanTitle};

  @override
  bool operator ==(Object other) =>
      other is JumpListBook && other.id == id && other.title == title;

  @override
  int get hashCode => Object.hash(id, title);

  @override
  String toString() => 'JumpListBook($id, $title)';
}

/// What a jump list entry asked for: `--open-item=<id>`, plus `--resume`
/// for the Resume task.
@immutable
class JumpListLaunch {
  const JumpListLaunch(this.itemId, {this.resume = false});

  final String itemId;
  final bool resume;

  /// The launch in [arguments], or null when they hold no valid item.
  static JumpListLaunch? parse(Iterable<String> arguments) {
    const prefix = '--open-item=';
    String? itemId;
    var resume = false;
    for (final argument in arguments) {
      if (argument.startsWith(prefix)) {
        itemId = argument.substring(prefix.length);
      } else if (argument == '--resume') {
        resume = true;
      }
    }
    if (!isValidJumpListItemId(itemId)) return null;
    return JumpListLaunch(itemId!, resume: resume);
  }

  @override
  bool operator ==(Object other) =>
      other is JumpListLaunch &&
      other.itemId == itemId &&
      other.resume == resume;

  @override
  int get hashCode => Object.hash(itemId, resume);

  @override
  String toString() => 'JumpListLaunch($itemId, resume: $resume)';
}

/// Where the jump list's books come from; the app's player and library by
/// default, a fake in tests.
abstract class WindowsJumpListSource implements Listenable {
  bool get signedIn;

  /// The book loaded in the player, if any (books only, not episodes).
  JumpListBook? get current;

  /// The Continue Listening shelf, front first (books only).
  List<JumpListBook> get continueListening;
}

/// What the jump list shows: the Resume task and up to four other books.
@immutable
class JumpListContent {
  const JumpListContent({this.resume, this.recent = const []});

  factory JumpListContent.from(WindowsJumpListSource source) {
    if (!source.signedIn) return const JumpListContent();
    final shelf = source.continueListening.where((b) => b.isUsable).toList();
    final current = source.current;
    final resume = current != null && current.isUsable
        ? current
        : (shelf.isEmpty ? null : shelf.first);
    final seen = <String>{if (resume != null) resume.id};
    final recent = <JumpListBook>[
      for (final book in shelf)
        if (seen.add(book.id)) book,
    ];
    return JumpListContent(
      resume: resume,
      recent: recent.take(WindowsJumpList.maxRecent).toList(),
    );
  }

  final JumpListBook? resume;
  final List<JumpListBook> recent;

  bool get isEmpty => resume == null && recent.isEmpty;

  @override
  bool operator ==(Object other) =>
      other is JumpListContent &&
      other.resume == resume &&
      listEquals(other.recent, recent);

  @override
  int get hashCode => Object.hash(resume, Object.hashAll(recent));
}

/// Windows taskbar jump list (fork-owned): "Resume <book>" and a Continue
/// listening category. The runner side is windows/runner/jump_list.cpp over
/// the `absorb/windows_jump_list` channel. Updates are coalesced (at most one
/// per [debounce]) and only sent when the entries change; signing out clears
/// the list at once. Entries carry item ids only. A no-op off Windows.
class WindowsJumpList {
  WindowsJumpList._()
      : _channel = const MethodChannel('absorb/windows_jump_list'),
        _enabled = !kIsWeb && defaultTargetPlatform == TargetPlatform.windows,
        debounce = defaultDebounce,
        _localizations = null;

  /// Tests: a fake channel, a short debounce and fixed strings.
  @visibleForTesting
  WindowsJumpList.withChannel(
    this._channel, {
    this.debounce = defaultDebounce,
    Future<AppLocalizations> Function()? localizations,
  })  : _enabled = true,
        _localizations = localizations;

  static final WindowsJumpList instance = WindowsJumpList._();

  static const maxRecent = 4;
  static const defaultDebounce = Duration(seconds: 3);

  final MethodChannel _channel;
  final bool _enabled;
  final Duration debounce;
  final Future<AppLocalizations> Function()? _localizations;

  bool get isSupported => _enabled;

  WindowsJumpListSource? _source;
  void Function(JumpListLaunch launch)? _onLaunch;
  JumpListLaunch? _pending;
  Timer? _timer;
  JumpListContent? _sent;
  bool _sending = false;
  JumpListContent? _queued;

  /// Starts following [source] (once; later calls only swap the launch
  /// handler) and picks up this launch's own jump list arguments.
  Future<void> start({
    required WindowsJumpListSource source,
    void Function(JumpListLaunch launch)? onLaunch,
  }) async {
    if (!_enabled) return;
    if (onLaunch != null) _onLaunch = onLaunch;
    if (_source != null) {
      _deliverPending();
      return;
    }
    _source = source;
    _channel.setMethodCallHandler(_onNativeCall);
    source.addListener(_onSourceChanged);
    _onSourceChanged();
    try {
      final arguments =
          await _channel.invokeListMethod<Object?>('initialArguments');
      final launch =
          JumpListLaunch.parse(arguments?.whereType<String>() ?? const []);
      if (launch != null) _deliver(launch);
    } on MissingPluginException {
      // Older runner without the jump list channel.
    } catch (e) {
      debugPrint('[JumpList] initialArguments failed: $e');
    }
  }

  /// The screen that opens books went away; launches wait for the next one.
  void detachLaunchHandler(void Function(JumpListLaunch launch) onLaunch) {
    if (_onLaunch == onLaunch) _onLaunch = null;
  }

  @visibleForTesting
  void stop() {
    _timer?.cancel();
    _timer = null;
    _source?.removeListener(_onSourceChanged);
    _source = null;
    _onLaunch = null;
    _pending = null;
    _sent = null;
    _queued = null;
    _channel.setMethodCallHandler(null);
  }

  Future<dynamic> _onNativeCall(MethodCall call) async {
    if (call.method == 'launch') {
      final arguments = call.arguments;
      final launch = arguments is List
          ? JumpListLaunch.parse(arguments.whereType<String>())
          : null;
      if (launch != null) _deliver(launch);
      return null;
    }
    throw MissingPluginException('WindowsJumpList: ${call.method}');
  }

  void _deliver(JumpListLaunch launch) {
    _pending = launch;
    _deliverPending();
  }

  void _deliverPending() {
    final launch = _pending;
    final handler = _onLaunch;
    if (launch == null || handler == null) return;
    // Not signed in: keep it for after sign-in.
    if (!(_source?.signedIn ?? false)) return;
    _pending = null;
    handler(launch);
  }

  void _onSourceChanged() {
    final source = _source;
    if (source == null) return;
    if (!source.signedIn) {
      _timer?.cancel();
      _timer = null;
      unawaited(_send(const JumpListContent()));
      return;
    }
    _deliverPending();
    // Coalesce: the player notifies every second while playing.
    _timer ??= Timer(debounce, () {
      _timer = null;
      final current = _source;
      if (current != null) unawaited(_send(JumpListContent.from(current)));
    });
  }

  Future<void> _send(JumpListContent content) async {
    if (_sending) {
      _queued = content;
      return;
    }
    if (content == _sent) return;
    _sending = true;
    try {
      if (content.isEmpty) {
        await _channel.invokeMethod<bool>('clear');
      } else {
        final l = await _strings();
        final resume = content.resume;
        await _channel.invokeMethod<bool>('update', {
          'resume': resume == null
              ? null
              : {
                  ...resume.toMap(),
                  'label': l.windowsJumpListResume(resume.cleanTitle),
                },
          'category': l.continueListening,
          'recent': [for (final book in content.recent) book.toMap()],
        });
      }
      _sent = content;
    } on MissingPluginException {
      _sent = content;
    } catch (e) {
      debugPrint('[JumpList] update failed: $e');
    } finally {
      _sending = false;
    }
    final next = _queued;
    _queued = null;
    if (next != null) await _send(next);
  }

  Future<AppLocalizations> _strings() async {
    final custom = _localizations;
    if (custom != null) return custom();
    try {
      final saved = await PlayerSettings.getLanguage();
      final locale =
          saved.isNotEmpty ? Locale(saved) : PlatformDispatcher.instance.locale;
      return lookupAppLocalizations(locale);
    } catch (_) {
      return lookupAppLocalizations(const Locale('en'));
    }
  }
}

/// The app's player, sign-in and Continue Listening shelf.
class AppJumpListSource extends ChangeNotifier
    implements WindowsJumpListSource {
  AppJumpListSource(this._auth, this._library) {
    _auth.addListener(notifyListeners);
    _library.addListener(notifyListeners);
    _player.addListener(notifyListeners);
  }

  final AuthProvider _auth;
  final LibraryProvider _library;
  final AudioPlayerService _player = AudioPlayerService();

  @override
  bool get signedIn => _auth.isAuthenticated;

  @override
  JumpListBook? get current {
    final id = _player.currentItemId;
    if (!_player.hasBook || id == null || _player.currentEpisodeId != null) {
      return null;
    }
    return JumpListBook(id, _player.currentTitle ?? '');
  }

  @override
  List<JumpListBook> get continueListening {
    final books = <JumpListBook>[];
    for (final section in _library.personalizedSections) {
      if (section is! Map || section['id'] != 'continue-listening') continue;
      for (final entity in (section['entities'] as List? ?? const [])) {
        if (entity is! Map || entity['recentEpisode'] != null) continue;
        if (entity['mediaType'] == 'podcast') continue;
        final id = entity['id'];
        final media = entity['media'];
        final metadata = media is Map ? media['metadata'] : null;
        final title = metadata is Map ? metadata['title'] : null;
        if (id is String && title is String) books.add(JumpListBook(id, title));
      }
    }
    return books;
  }

  @override
  void dispose() {
    _auth.removeListener(notifyListeners);
    _library.removeListener(notifyListeners);
    _player.removeListener(notifyListeners);
    super.dispose();
  }
}

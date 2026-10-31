import 'dart:async';

/// Startup requests that used to wait for each other and now overlap,
/// without changing what the app decides from their answers.

/// What a launch learned about the saved account's server.
typedef RestoreProbe = ({bool reachable, Map<String, dynamic>? auth});

/// Sends `/api/authorize` alongside the reachability ping instead of after it.
///
/// - Authorize answering with the account proves the server is reachable, so
///   the launch goes on without waiting for the ping.
/// - Otherwise the ping decides, exactly as before: unreachable opens offline,
///   reachable goes on with authorize's (empty) answer and the caller falls
///   back to `/api/me`.
///
/// [ping] and [authorize] are already running when this is called. An error
/// from [ping] counts as unreachable, one from [authorize] as no answer.
Future<RestoreProbe> authorizeWhilePinging({
  required Future<bool> ping,
  required Future<Map<String, dynamic>?> authorize,
}) {
  final done = Completer<RestoreProbe>();
  void finish(RestoreProbe probe) {
    if (!done.isCompleted) done.complete(probe);
  }

  final answer = authorize.then<Map<String, dynamic>?>(
    (auth) => auth,
    onError: (Object _) => null,
  );
  answer.then((auth) {
    if (auth != null) finish((reachable: true, auth: auth));
  });
  ping.then((reachable) async {
    if (!reachable) return finish((reachable: false, auth: null));
    finish((reachable: true, auth: await answer));
  }, onError: (Object _) => finish((reachable: false, auth: null)));
  return done.future;
}

/// Home's shelves for the library picked last time, loading while the
/// library list is still on its way at launch.
class EarlyShelves {
  EarlyShelves._(this.libraryId, this._done);

  /// The library the shelves were asked for.
  final String libraryId;
  final Future<void> _done;

  /// Starts [load] now when the libraries on screen came from the saved copy
  /// and one of them is selected (a cold start); otherwise returns null and
  /// the shelves load after the list, as before.
  static EarlyShelves? start({
    required bool librariesFromCache,
    required String? selectedLibraryId,
    required Future<void> Function() load,
  }) {
    if (!librariesFromCache || selectedLibraryId == null) return null;
    final done = Future<void>.sync(load).catchError((Object _) {});
    return EarlyShelves._(selectedLibraryId, done);
  }

  /// Waits for the early load, then says whether it was for the library that
  /// is selected now. False means that library is gone from the fresh list
  /// and the caller loads the shelves again.
  Future<bool> covers(String? Function() selectedLibraryId) async {
    await _done;
    return selectedLibraryId() == libraryId;
  }

  /// Waits for the early load without using it.
  Future<void> settle() => _done;
}

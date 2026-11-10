import 'package:flutter_test/flutter_test.dart';

import 'package:absorb/services/socket_service.dart';

// Absorb Plus: an auth failure on the live-sync socket must never turn live
// sync off for the session (upstream disconnects; see _onAuthFailed). With
// Audiobookshelf 2.37's "Token expired" it asks once for a new token.
void main() {
  final socket = SocketService();

  setUp(() {
    socket.debugAuthenticated(); // fresh sign-in: may ask for a token again
    socket.onTokenExpired = null;
    socket.onProgressUpdated = (_) {};
  });

  tearDown(() {
    socket.onTokenExpired = null;
    socket.onProgressUpdated = null;
  });

  test('token expired: asks once for a new token and stays connected even if that fails', () async {
    var asked = 0;
    socket.onTokenExpired = () async {
      asked++;
      return false; // e.g. a brief network failure during the refresh
    };

    socket.debugAuthFailed({'message': 'Token expired'});
    await Future<void>.delayed(Duration.zero);
    socket.debugAuthFailed({'message': 'Token expired'});
    await Future<void>.delayed(Duration.zero);

    expect(asked, 1);
    expect(socket.onProgressUpdated, isNotNull, reason: 'callbacks survive, so live sync resumes');
  });

  test('a failed refresh that throws also keeps live sync callbacks', () async {
    socket.onTokenExpired = () async => throw Exception('offline');

    socket.debugAuthFailed({'message': 'Token expired'});
    await Future<void>.delayed(Duration.zero);

    expect(socket.onProgressUpdated, isNotNull);
  });

  test('other auth failures wait for a refreshed token instead of disconnecting', () {
    socket.debugAuthFailed({'message': 'Invalid token'});
    socket.debugAuthFailed(null);

    expect(socket.onProgressUpdated, isNotNull);
  });

  test('a new sign-in may ask for a token again', () async {
    var asked = 0;
    socket.onTokenExpired = () async {
      asked++;
      return true;
    };

    socket.debugAuthFailed({'message': 'Token expired'});
    socket.debugAuthenticated();
    socket.debugAuthFailed({'message': 'Token expired'});
    await Future<void>.delayed(Duration.zero);

    expect(asked, 2);
  });
}

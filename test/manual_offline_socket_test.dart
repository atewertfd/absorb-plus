import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/socket_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeAuth extends AuthProvider {
  final api = ApiService(baseUrl: 'http://127.0.0.1:9', token: 'fixture-token');

  @override
  bool get isAuthenticated => false;

  @override
  bool get isSignedOut => false;

  @override
  ApiService? get apiService => api;
}

/// Manual offline mode holds no live server connection.
void main() {
  tearDown(() => SocketService().disconnect());

  test('connect without opening keeps the details for a later reconnect', () {
    final socket = SocketService();
    // Nothing listens on the discard port; nothing here needs a server.
    socket.connect('http://127.0.0.1:9', 'fixture-token', open: false);
    expect(socket.hasSocket, isFalse);

    socket.softReconnect();
    expect(socket.hasSocket, isTrue);
  });

  test('turning manual offline on closes the socket', () async {
    SharedPreferences.setMockInitialValues({});
    final lib = LibraryProvider()..updateAuth(_FakeAuth());
    addTearDown(lib.dispose);
    final socket = SocketService();
    socket.connect('http://127.0.0.1:9', 'fixture-token');
    expect(socket.hasSocket, isTrue);

    await lib.setManualOffline(true);

    expect(lib.isOffline, isTrue);
    expect(socket.hasSocket, isFalse);
  });
}

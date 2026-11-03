import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LocalServerAuth extends AuthProvider {
  @override
  bool get isAuthenticated => false;

  @override
  bool get isSignedOut => false;

  @override
  bool get localServerEnabled => true;

  // Nothing listens on the discard port; the probe timer never fires here.
  @override
  String get localServerUrl => 'http://127.0.0.1:9';
}

/// C14: the away-from-home backoff of the local server checks is reset by
/// network changes, not by every playback start or foreground.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LibraryProvider lib;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    lib = LibraryProvider()..updateAuth(_LocalServerAuth());
    addTearDown(lib.dispose);
  });

  test('a playback start keeps the spread-out checks', () {
    final later = DateTime.now().add(const Duration(minutes: 5));
    lib.debugSetRemoteProbeBackoff(9, later);

    lib.onPlaybackStarted();

    expect(lib.debugRemoteProbeBackoff.misses, 9);
    expect(lib.debugRemoteProbeBackoff.nextAt, later);
  });

  test('a network change starts the fast checks again', () {
    lib.debugSetRemoteProbeBackoff(9, DateTime.now());

    lib.debugStartLocalProbeTimer(networkChanged: true);

    expect(lib.debugRemoteProbeBackoff.misses, 0);
    expect(lib.debugRemoteProbeBackoff.nextAt, isNull);
  });

  test('the local server answering elsewhere resets it too', () {
    lib.debugSetRemoteProbeBackoff(9, DateTime.now());

    lib.notifyServerReachable('http://127.0.0.1:9');

    expect(lib.debugRemoteProbeBackoff.misses, 0);
  });
}

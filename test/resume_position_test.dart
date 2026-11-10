import 'package:absorb/services/sync_logic.dart';
import 'package:flutter_test/flutter_test.dart';

// BUG-006: a cast start compared the phone's save time with the new playback
// session's own updatedAt, so an unsynced newer spot on the phone lost to the
// server's older one. Cast and local starts now share this rule.
void main() {
  double pick({
    required double local,
    int localTs = 1000,
    bool pending = false,
    required double server,
    int serverTs = 500,
  }) =>
      SyncLogic.resumePosition(
        local: local,
        localTimestamp: localTs,
        hasPendingSync: pending,
        server: server,
        serverLastUpdate: serverTs,
      );

  test('an unsynced spot on the phone wins even against a newer server row', () {
    expect(pick(local: 3600, pending: true, server: 3590, serverTs: 9999), 3600);
  });

  test('local wins when the server row is older than the local save', () {
    expect(pick(local: 3600, server: 3590, serverTs: 500, localTs: 1000), 3600);
  });

  test('a synced local spot loses to a newer server row nearby', () {
    expect(pick(local: 3600, server: 3590, serverTs: 2000, localTs: 1000), 3590);
  });

  test('local far ahead is kept whatever the timestamps say', () {
    expect(pick(local: 3600, server: 100, serverTs: 9999), 3600);
  });

  test('a server spot ahead wins; no local spot takes the server', () {
    expect(pick(local: 100, server: 200, pending: true), 200);
    expect(pick(local: 0, server: 50), 50);
    expect(pick(local: 0, server: 0), 0);
  });
}

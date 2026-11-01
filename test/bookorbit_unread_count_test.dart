import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/bookorbit_notification_socket.dart';
import 'package:flutter_test/flutter_test.dart';

/// The live unread count is matched by account: `auth.apiService` hands out
/// a new instance on every read, so matching instances never found it.
void main() {
  ApiService api(String baseUrl) =>
      ApiService(baseUrl: baseUrl, token: 'fixture-token');

  final feed = BookOrbitNotificationSocket.instance;
  tearDown(() => feed.unread.value = null);

  test('another instance for the same account sees the count', () {
    feed.unread.value = (api: api('https://bo.example'), count: 4);

    expect(feed.unreadFor(api('https://bo.example')), 4);
  });

  test('another server does not', () {
    feed.unread.value = (api: api('https://bo.example'), count: 4);

    expect(feed.unreadFor(api('https://other.example')), isNull);
    expect(feed.unreadFor(null), isNull);
  });
}

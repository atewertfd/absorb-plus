import 'dart:convert';

import 'package:absorb/services/bookmark_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

// BUG-003: an edit made offline (or refused by the server) was never queued,
// and the next sync put the server's old text back because it compared
// creation times.
void main() {
  const item = '11111111-1111-1111-1111-111111111111';
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('an offline edit survives the next sync and is sent then', () async {
    final service = BookmarkService();
    final patches = <String>[];
    var serverTitle = 'Old';
    final api = mockApi((req) async {
      if (req.method == 'POST') return http.Response('{}', 200);
      if (req.method == 'PATCH') {
        final body = jsonDecode(req.body) as Map<String, dynamic>;
        patches.add(body['title'] as String);
        serverTitle = body['title'] as String;
        return http.Response('{}', 200);
      }
      return http.Response('', 404);
    });

    final bm = await service.addBookmark(
        itemId: item, positionSeconds: 120, title: 'Old', api: api);

    // Offline: no api.
    await service.updateBookmark(itemId: item, bookmarkId: bm.id, title: 'New');

    // The server's copy still says "Old" and was stamped after the local add.
    final later = DateTime.now().millisecondsSinceEpoch + 5000;
    await service.syncBookmarks(item, api, preloadedServerBookmarks: [
      {'libraryItemId': item, 'time': 120.0, 'title': serverTitle, 'createdAt': later},
    ]);

    final local = await service.getBookmarks(item);
    expect(local.single.title, 'New');
    expect(patches, ['New']);

    // Once sent, the server's text is taken again.
    await service.syncBookmarks(item, api, preloadedServerBookmarks: [
      {'libraryItemId': item, 'time': 120.0, 'title': 'Edited elsewhere', 'createdAt': later},
    ]);
    expect((await service.getBookmarks(item)).single.title, 'Edited elsewhere');
  });
}

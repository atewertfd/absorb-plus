import 'dart:convert';

import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/download_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// Offline Home is built from the downloads and must follow them.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('offline Home drops a deleted download and shows a new one', () async {
    SharedPreferences.setMockInitialValues({});
    final downloads = DownloadService();
    downloads.debugPutDownload(DownloadInfo(
      itemId: 'fixture-book-1',
      status: DownloadStatus.downloaded,
      title: 'Fixture Book One',
      author: 'Fixture Author',
    ));
    addTearDown(() {
      downloads.debugRemoveDownload('fixture-book-1');
      downloads.debugRemoveDownload('fixture-book-2');
    });

    final lib = LibraryProvider()..updateAuth(FakeAuth());
    addTearDown(lib.dispose);
    await lib.setManualOffline(true);
    String shelves() => jsonEncode(lib.personalizedSections);
    expect(shelves(), contains('fixture-book-1'));

    downloads.debugRemoveDownload('fixture-book-1');
    downloads.debugPutDownload(DownloadInfo(
      itemId: 'fixture-book-2',
      status: DownloadStatus.downloaded,
      title: 'Fixture Book Two',
      author: 'Fixture Author',
    ));
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    downloads.notifyListeners();

    expect(shelves(), isNot(contains('fixture-book-1')));
    expect(shelves(), contains('fixture-book-2'));
  });
}

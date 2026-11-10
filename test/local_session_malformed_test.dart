import 'dart:convert';

import 'package:absorb/services/local_session_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A saved active session that decodes but lacks the numbers accrue reads
/// (a corrupt or hand-edited prefs file) used to throw on every listening
/// tick. It is dropped once instead, and the next start logs normally.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LocalSessionService().debugReset();
  });
  tearDown(() => LocalSessionService().debugReset());

  Future<void> saveActive(Map<String, dynamic> record) =>
      ScopedPrefs.setString('local_session_active', jsonEncode(record));

  Future<void> accrue() => LocalSessionService()
      .accrue(progressKey: 'book-1', seconds: 20, currentTime: 120);

  for (final bad in <String, Map<String, dynamic>>{
    'updatedAt is a string': {
      'id': 'old',
      'progressKey': 'book-1',
      'timeListening': 60,
      'updatedAt': '2026-11-01',
      'date': '2026-11-01',
    },
    'timeListening is missing': {
      'id': 'old',
      'progressKey': 'book-1',
      'updatedAt': 1,
      'date': '2026-11-01',
    },
  }.entries) {
    test('a malformed active session (${bad.key}) is dropped, not thrown on',
        () async {
      await saveActive(bad.value);

      await accrue();
      await accrue();

      expect(await ScopedPrefs.getString('local_session_active'), isNull);
    });
  }

  test('after a malformed one is dropped, a new start logs listening',
      () async {
    await saveActive({'id': 'old', 'progressKey': 'book-1', 'updatedAt': 'x'});
    await accrue();

    await LocalSessionService().beginSession(
      progressKey: 'book-1',
      libraryItemId: 'book-1',
      mediaType: 'book',
      duration: 3600,
      startTime: 0,
    );
    await accrue();

    final saved = jsonDecode(
            (await ScopedPrefs.getString('local_session_active'))!)
        as Map<String, dynamic>;
    expect(saved['id'], isNot('old'));
    expect(saved['timeListening'], 20);
  });
}

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:absorb/utils/fork_errors.dart';

void main() {
  late List<String> logged;
  late DebugPrintCallback original;

  setUp(() {
    logged = [];
    original = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) => logged.add(message ?? '');
  });

  tearDown(() => debugPrint = original);

  test('swallow logs the ignored error under its tag', () {
    swallow('Downloads', StateError('disk gone'));
    expect(logged, ['[Downloads] ignored: Bad state: disk gone']);
  });

  test('fireAndLog logs a failure instead of leaving it unhandled', () async {
    fireAndLog(Future<void>.error(Exception('offline')), 'Sync');
    await Future<void>.delayed(Duration.zero);
    expect(logged, ['[Sync] failed: Exception: offline']);
  });

  test('fireAndLog stays quiet on success and ignores a null future', () async {
    fireAndLog(Future.value(42), 'Sync');
    fireAndLog(null, 'Sync');
    await Future<void>.delayed(Duration.zero);
    expect(logged, isEmpty);
  });
}

import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/json_file_store.dart';
import 'package:absorb/services/pending_writes.dart';
import 'package:flutter_test/flutter_test.dart';

// The small file store behind the download list and stats cache: atomic,
// coalesced, skips unchanged data, survives a corrupt or missing main file.
void main() {
  late Directory tmp;
  late JsonFileStore store;

  File main() => File('${tmp.path}${Platform.pathSeparator}doc.json');
  File backup() => File('${main().path}.bak');

  JsonFileStore newStore({
    Duration debounce = const Duration(milliseconds: 10),
  }) {
    final s = JsonFileStore(
      'doc.json',
      directory: () async => tmp,
      debounce: debounce,
    );
    addTearDown(s.dispose);
    return s;
  }

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('absorb_json_store_');
    store = newStore();
  });

  tearDown(() {
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  test('writeNow lands the document and leaves no temp file', () async {
    expect(await store.writeNow({'a': 1}), isTrue);
    expect(jsonDecode(main().readAsStringSync()), {'a': 1});
    expect(
      tmp
          .listSync()
          .map((e) => e.uri.pathSegments.last)
          .where((n) => n.endsWith('.tmp')),
      isEmpty,
    );
  });

  test(
    'a burst of scheduled snapshots costs one write of the newest',
    () async {
      var value = 0;
      for (var i = 1; i <= 5; i++) {
        value = i;
        store.schedule(() => {'v': value});
      }
      expect(store.writeCount, 0, reason: 'nothing is written synchronously');
      await store.flush();
      expect(store.writeCount, 1);
      expect(jsonDecode(main().readAsStringSync()), {'v': 5});
    },
  );

  test('the debounce timer writes without an explicit flush', () async {
    store.schedule(() => {'x': true});
    await Future<void>.delayed(const Duration(milliseconds: 80));
    await store.flush();
    expect(store.writeCount, 1);
    expect(jsonDecode(main().readAsStringSync()), {'x': true});
  });

  test('unchanged data is not rewritten', () async {
    await store.writeNow({'same': 1});
    store.schedule(() => {'same': 1});
    await store.flush();
    expect(store.writeCount, 1);

    // A fresh store that read the file also skips an identical write.
    final again = newStore();
    await again.read();
    again.schedule(() => {'same': 1});
    await again.flush();
    expect(again.writeCount, 0);
  });

  test('the previous version is kept as a backup', () async {
    await store.writeNow({'n': 1});
    await store.writeNow({'n': 2});
    expect(jsonDecode(backup().readAsStringSync()), {'n': 1});
    expect(jsonDecode(main().readAsStringSync()), {'n': 2});
  });

  test(
    'a corrupt main file falls back to the backup and is kept aside',
    () async {
      await store.writeNow({'n': 1});
      await store.writeNow({'n': 2});
      main().writeAsStringSync('{"n": 2, broken');

      final reader = newStore();
      final read = await reader.read();
      expect(read.source, JsonFileSource.backup);
      expect(read.hadCorruptCopy, isTrue);
      expect(read.value, {'n': 1});
      expect(File('${main().path}.corrupt').existsSync(), isTrue);

      // The next write must not copy the broken file over the good backup.
      await reader.writeNow({'n': 3});
      expect(jsonDecode(backup().readAsStringSync()), {'n': 1});
      expect(jsonDecode(main().readAsStringSync()), {'n': 3});
    },
  );

  test('nothing readable reports none', () async {
    main().writeAsStringSync('not json');
    final read = await store.read();
    expect(read.source, JsonFileSource.none);
    expect(read.value, isNull);
    expect(read.hadCorruptCopy, isTrue);

    // Reading leaves the broken file where it is (only copies it aside).
    expect(main().readAsStringSync(), 'not json');
  });

  test(
    'a missing main file with a backup (killed mid-write) reads the backup',
    () async {
      backup().writeAsStringSync(jsonEncode({'from': 'backup'}));
      File('${main().path}.123-0.tmp').writeAsStringSync('{"half');
      final read = await store.read();
      expect(read.source, JsonFileSource.backup);
      expect(read.value, {'from': 'backup'});
    },
  );

  test(
    'PendingWrites.flushAll writes a scheduled snapshot (quit flow)',
    () async {
      final slow = newStore(debounce: const Duration(hours: 1));
      slow.schedule(() => {'saved': 'on exit'});
      expect(main().existsSync(), isFalse);
      await PendingWrites.flushAll();
      expect(jsonDecode(main().readAsStringSync()), {'saved': 'on exit'});
    },
  );

  test('a write that cannot reach the disk reports false', () async {
    final broken = JsonFileStore(
      'doc.json',
      directory: () async => throw const FileSystemException('no folder'),
      flushOnExit: false,
    );
    addTearDown(broken.dispose);
    expect(await broken.writeNow({'a': 1}), isFalse);
    expect((await broken.read()).source, JsonFileSource.none);
  });

  test('a failed write is kept and lands on the next attempt', () async {
    var diskOk = false;
    final flaky = JsonFileStore(
      'doc.json',
      directory: () async =>
          diskOk ? tmp : throw const FileSystemException('disk full'),
      flushOnExit: false,
    );
    addTearDown(flaky.dispose);
    flaky.schedule(() => {'kept': true});
    await flaky.flush();
    expect(main().existsSync(), isFalse);

    diskOk = true;
    await flaky.flush(); // what the retry timer (or exit) runs
    expect(jsonDecode(main().readAsStringSync()), {'kept': true});
  });

  test('a main file of the wrong shape counts as corrupt', () async {
    final checked = JsonFileStore(
      'doc.json',
      directory: () async => tmp,
      validate: (v) => v is Map && v.containsKey('ok'),
      flushOnExit: false,
    );
    addTearDown(checked.dispose);
    backup().writeAsStringSync(jsonEncode({'ok': 'backup'}));
    main().writeAsStringSync(jsonEncode(['valid json, wrong shape']));

    final read = await checked.read();
    expect(read.source, JsonFileSource.backup);
    expect(read.value, {'ok': 'backup'});

    await checked.writeNow({'ok': 'new'});
    expect(jsonDecode(backup().readAsStringSync()), {
      'ok': 'backup',
    }, reason: 'the bad main file must not replace the good backup');
  });
}

import 'dart:async';

import 'package:absorb/services/startup_overlap.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('authorizeWhilePinging', () {
    const account = {
      'user': {'id': 'u1'},
    };

    test('an authorize answer goes on without waiting for the ping', () async {
      final ping = Completer<bool>();
      final result = await authorizeWhilePinging(
        ping: ping.future,
        authorize: Future.value(account),
      );
      expect(result.reachable, isTrue);
      expect(result.auth, account);
      ping.complete(false); // a late "unreachable" changes nothing
    });

    test(
      'an unreachable ping opens offline without waiting for authorize',
      () async {
        final authorize = Completer<Map<String, dynamic>?>();
        final result = await authorizeWhilePinging(
          ping: Future.value(false),
          authorize: authorize.future,
        );
        expect(result.reachable, isFalse);
        expect(result.auth, isNull);
        authorize.complete(account);
      },
    );

    test('a ping error counts as unreachable', () async {
      final result = await authorizeWhilePinging(
        ping: Future.error(StateError('network')),
        authorize: Completer<Map<String, dynamic>?>().future,
      );
      expect(result, (reachable: false, auth: null));
    });

    test(
      'no authorize answer: the ping decides, reachable with no account',
      () async {
        final ping = Completer<bool>();
        final future = authorizeWhilePinging(
          ping: ping.future,
          authorize: Future.value(null),
        );
        var done = false;
        unawaited(future.then((_) => done = true));
        await pumpEventQueue();
        expect(
          done,
          isFalse,
          reason: 'waits for the ping when authorize fails',
        );
        ping.complete(true);
        expect(await future, (reachable: true, auth: null));
      },
    );

    test('an authorize error is no answer, not unreachable', () async {
      final result = await authorizeWhilePinging(
        ping: Future.value(true),
        authorize: Future.error(StateError('bad json')),
      );
      expect(result, (reachable: true, auth: null));
    });

    test(
      'a reachable ping first still waits for the authorize answer',
      () async {
        final authorize = Completer<Map<String, dynamic>?>();
        final future = authorizeWhilePinging(
          ping: Future.value(true),
          authorize: authorize.future,
        );
        await pumpEventQueue();
        authorize.complete(account);
        expect(await future, (reachable: true, auth: account));
      },
    );
  });

  group('EarlyShelves', () {
    test('starts only on a cold start with a selected library', () {
      var calls = 0;
      Future<void> load() async => calls++;
      expect(
        EarlyShelves.start(
          librariesFromCache: false,
          selectedLibraryId: 'a',
          load: load,
        ),
        isNull,
      );
      expect(
        EarlyShelves.start(
          librariesFromCache: true,
          selectedLibraryId: null,
          load: load,
        ),
        isNull,
      );
      expect(calls, 0);
      final early = EarlyShelves.start(
        librariesFromCache: true,
        selectedLibraryId: 'a',
        load: load,
      );
      expect(early?.libraryId, 'a');
      expect(calls, 1, reason: 'the load starts straight away');
    });

    test('covers the same library once its load is done', () async {
      final load = Completer<void>();
      final early = EarlyShelves.start(
        librariesFromCache: true,
        selectedLibraryId: 'a',
        load: () => load.future,
      )!;
      var answered = false;
      final covers = early.covers(() => 'a').then((v) {
        answered = true;
        return v;
      });
      await pumpEventQueue();
      expect(answered, isFalse, reason: 'waits for the early load');
      load.complete();
      expect(await covers, isTrue);
    });

    test('a library gone from the fresh list is not covered', () async {
      final early = EarlyShelves.start(
        librariesFromCache: true,
        selectedLibraryId: 'gone',
        load: () async {},
      )!;
      expect(await early.covers(() => 'b'), isFalse);
    });

    test('a failed early load does not throw', () async {
      final early = EarlyShelves.start(
        librariesFromCache: true,
        selectedLibraryId: 'a',
        load: () => Future.error(StateError('offline')),
      )!;
      await early.settle();
      expect(await early.covers(() => 'a'), isTrue);
    });
  });
}

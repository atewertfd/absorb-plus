import 'dart:io';

import 'package:absorb/utils/cover_cache.dart';
import 'package:absorb/widgets/stable_cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';

/// The cover disk cache and the key it is paired with: together they fetch a
/// cover once until the book's cover changes.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Building the manager opens its index under the app support folder; point
  // that at a throwaway folder so the test never touches real app data.
  late Directory support;
  const pathProvider = MethodChannel('plugins.flutter.io/path_provider');
  setUpAll(() {
    support = Directory.systemTemp.createTempSync('cover_cache_test_');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProvider, (_) async => support.path);
  });
  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProvider, null);
    try {
      support.deleteSync(recursive: true);
    } catch (_) {}
  });

  group('coverCacheManager', () {
    test('is one shared instance', () {
      expect(identical(coverCacheManager, coverCacheManager), isTrue);
    });

    test('uses its own store, not the default 200-file cache', () {
      final config = coverCacheManager.config;
      expect(config.cacheKey, 'absorbCovers');
      expect(config.cacheKey, isNot(DefaultCacheManager.key));
    });

    test('keeps enough covers for a few hundred books, for 60 days', () {
      final config = coverCacheManager.config;
      expect(config.maxNrOfCacheObjects, 3000);
      expect(config.stalePeriod, const Duration(days: 60));
    });
  });

  group('stableCoverCacheKey', () {
    const base = 'https://abs.example/api/items/li_1/cover';

    test('drops the rotating token from a cover URL', () {
      expect(
        stableCoverCacheKey('$base?token=abc&width=400'),
        '$base?width=400',
      );
    });

    test('two tokens for the same cover share one key', () {
      expect(
        stableCoverCacheKey('$base?token=first&ts=5'),
        stableCoverCacheKey('$base?token=second&ts=5'),
      );
    });

    test('a changed cover revision gives a new key', () {
      expect(
        stableCoverCacheKey('$base?token=t&ts=5'),
        isNot(stableCoverCacheKey('$base?token=t&ts=6')),
      );
    });

    test('updatedAt wins over the URL revision', () {
      expect(
        stableCoverCacheKey('$base?token=t&ts=5', updatedAt: 9),
        '$base?ts=9',
      );
      expect(stableCoverCacheKey(base, updatedAt: 9), '$base?ts=9');
    });

    test('a cover URL with only a token keeps it (current behavior)', () {
      // uri.replace(queryParameters: null) keeps the old query, so the
      // token survives when nothing else is left. getCoverUrl(width: null)
      // without updatedAt builds exactly this URL (edit_metadata_sheet).
      expect(stableCoverCacheKey('$base?token=t'), '$base?token=t');
      expect(
        stableCoverCacheKey('$base?token=a'),
        isNot(stableCoverCacheKey('$base?token=b')),
      );
    });

    test('URLs that are not item covers are left alone', () {
      const other = 'https://abs.example/api/authors/a1/image?token=t';
      expect(stableCoverCacheKey(other), other);
      const local = '/data/covers/li_1.jpg';
      expect(stableCoverCacheKey(local), local);
      const notCover = 'https://abs.example/api/items/li_1/cover/extra?token=t';
      expect(stableCoverCacheKey(notCover), notCover);
    });

    test('an unparsable URL is returned as is', () {
      const bad = 'http://[::1';
      expect(stableCoverCacheKey(bad), bad);
    });
  });
}

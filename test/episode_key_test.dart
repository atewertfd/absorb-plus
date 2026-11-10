import 'package:absorb/services/download_key.dart';
import 'package:absorb/utils/episode_key.dart';
import 'package:flutter_test/flutter_test.dart';

const _show = '0123abcd-0123-4567-89ab-0123456789ab';
const _ep = 'fedcba98-7654-3210-fedc-ba9876543210';

void main() {
  group('UUID ids (unchanged rule)', () {
    test('a plain 36-character id is a book', () {
      expect(isEpisodeKey(_show), isFalse);
      expect(splitEpisodeKey(_show), (itemId: _show, episodeId: null));
      expect(itemIdOfKey(_show), _show);
      expect(episodeIdOfKey(_show), isNull);
    });

    test('show uuid + dash + episode id splits at 36', () {
      const key = '$_show-$_ep';
      expect(isEpisodeKey(key), isTrue);
      expect(splitEpisodeKey(key), (itemId: _show, episodeId: _ep));
      expect(itemIdOfKey(key), _show);
      expect(episodeIdOfKey(key), _ep);
    });

    test('the episode part may itself be a legacy ep_ id', () {
      const key = '$_show-ep_abc123';
      expect(splitEpisodeKey(key), (itemId: _show, episodeId: 'ep_abc123'));
    });

    test('upper-case UUIDs split the same way', () {
      final key = '${_show.toUpperCase()}-$_ep';
      expect(itemIdOfKey(key), _show.toUpperCase());
      expect(episodeIdOfKey(key), _ep);
    });

    test('episodeKeyFor round-trips', () {
      expect(splitEpisodeKey(episodeKeyFor(_show, _ep)), (
        itemId: _show,
        episodeId: _ep,
      ));
      expect(episodeKeyFor(_show, null), _show);
      expect(episodeKeyFor(_show, ''), _show);
    });
  });

  group('pre-2.3 li_/ep_ ids', () {
    test('a short legacy key is still an episode key', () {
      const key = 'li_abc-ep_xyz';
      expect(isEpisodeKey(key), isTrue);
      expect(splitEpisodeKey(key), (itemId: 'li_abc', episodeId: 'ep_xyz'));
    });

    test('a long legacy key splits at the dash, not at 36', () {
      const key = 'li_8gch9ve09orgn4fdz8-ep_lh6ko39pumnrma3dhv';
      expect(key.length, greaterThan(36));
      expect(splitEpisodeKey(key), (
        itemId: 'li_8gch9ve09orgn4fdz8',
        episodeId: 'ep_lh6ko39pumnrma3dhv',
      ));
    });

    test('a legacy book id is a book', () {
      expect(isEpisodeKey('li_8gch9ve09orgn4fdz8'), isFalse);
    });
  });

  group('other id shapes are plain items', () {
    test('BookOrbit numeric ids', () {
      expect(isEpisodeKey('42'), isFalse);
      expect(itemIdOfKey('42'), '42');
    });

    test('book-dock ids longer than a UUID are not split', () {
      const key = 'dock-$_ep';
      expect(key.length, greaterThan(36));
      expect(isEpisodeKey(key), isFalse);
      expect(itemIdOfKey(key), key);
      expect(episodeIdOfKey(key), isNull);
    });

    test('a long non-UUID id without ep_ is a book', () {
      const key = 'li_00000000-0000-0000-0000-000000000001';
      expect(isEpisodeKey(key), isFalse);
    });

    test('empty and dash-only keys', () {
      expect(isEpisodeKey(''), isFalse);
      expect(isEpisodeKey('-ep_x'), isFalse);
      expect(splitEpisodeKey('-ep_x'), (itemId: '-ep_x', episodeId: null));
    });
  });

  group('downloadKeyParts fallback uses the shared rule', () {
    test('uuid keys', () {
      expect(downloadKeyParts('$_show-$_ep'), (itemId: _show, episodeId: _ep));
      expect(downloadKeyParts(_show), (itemId: _show, episodeId: null));
      expect(downloadKeyParts('$_show-'), (itemId: '$_show-', episodeId: null));
    });

    test('legacy keys', () {
      expect(downloadKeyParts('li_abc-ep_xyz'), (
        itemId: 'li_abc',
        episodeId: 'ep_xyz',
      ));
    });
  });
}

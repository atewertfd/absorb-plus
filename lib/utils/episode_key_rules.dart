// Absorb Plus: how a "showId-episodeId" storage key splits (IMP-007).
//
// Current Audiobookshelf ids are 36-character UUIDs, so a key longer than
// that which starts with a UUID is "<uuid>-<episode id>". Servers older than
// 2.3 used dash-free `li_…` / `ep_…` ids of any length, so "<id>-ep_…" is an
// episode key too. Anything else (BookOrbit ids, book-dock items) is a plain
// item id, whatever its length. `episode_key.dart` delegates here.
library;

import 'episode_key.dart';

final _uuidPrefix = RegExp(
  r'^[0-9A-Za-z]{8}-[0-9A-Za-z]{4}-[0-9A-Za-z]{4}-[0-9A-Za-z]{4}-[0-9A-Za-z]{12}',
);

/// The item id and, for an episode key, the episode id behind [key].
({String itemId, String? episodeId}) forkSplitEpisodeKey(String key) {
  if (key.length > 36 && _uuidPrefix.hasMatch(key)) {
    return (itemId: key.substring(0, 36), episodeId: key.substring(37));
  }
  final dash = key.indexOf('-');
  if (dash > 0 && key.startsWith('ep_', dash + 1)) {
    return (itemId: key.substring(0, dash), episodeId: key.substring(dash + 1));
  }
  return (itemId: key, episodeId: null);
}

/// The id the server knows for [key]: the show id of an episode key, or
/// [key] itself for a book.
String itemIdOfKey(String key) => splitEpisodeKey(key).itemId;

/// The episode id inside episode key [key], or null for a book.
String? episodeIdOfKey(String key) => splitEpisodeKey(key).episodeId;

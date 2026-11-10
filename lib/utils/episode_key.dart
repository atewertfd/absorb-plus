/// Podcast episodes are addressed by a compound "showId-episodeId" key
/// wherever the app stores per-item state - downloads, progress, bookmarks.
/// Books keep their plain 36-character item id. These three helpers put the
/// substring arithmetic in one place.
library;

// Absorb Plus imports, kept in one block for clean upstream merges.
import 'episode_key_rules.dart';

export 'episode_key_rules.dart' show itemIdOfKey, episodeIdOfKey;

bool isEpisodeKey(String key) => forkSplitEpisodeKey(key).episodeId != null; // Absorb Plus: IMP-007

String episodeKeyFor(String itemId, String? episodeId) =>
    (episodeId != null && episodeId.isNotEmpty) ? '$itemId-$episodeId' : itemId;

/// Split a storage key back into the item id the server knows and, for a
/// podcast, the episode inside it.
({String itemId, String? episodeId}) splitEpisodeKey(String key) =>
    forkSplitEpisodeKey(key); // Absorb Plus: IMP-007

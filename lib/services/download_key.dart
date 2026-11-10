// Absorb Plus: splitting a download key back into the ids the server needs.
//
// Downloads are keyed by the library item id, or "<show id>-<episode id>"
// for a podcast episode. The split used to assume a 36-character UUID show
// id, which picks the wrong ids for any other shape (audit D17). Records now
// keep the episode id; older ones still fall back to the UUID rule.

import '../utils/episode_key.dart';

/// The library item id and episode id behind download key [key].
/// [episodeId] is the one stored with the record, when there is one.
({String itemId, String? episodeId}) downloadKeyParts(
  String key, {
  String? episodeId,
}) {
  if (episodeId != null &&
      episodeId.isNotEmpty &&
      key.length > episodeId.length + 1 &&
      key.endsWith('-$episodeId')) {
    return (
      itemId: key.substring(0, key.length - episodeId.length - 1),
      episodeId: episodeId,
    );
  }
  // Older records: the shared key rule (a UUID show id, or a pre-2.3
  // `li_…-ep_…` key).
  final parts = splitEpisodeKey(key);
  if (parts.episodeId?.isNotEmpty ?? false) return parts;
  return (itemId: key, episodeId: null);
}

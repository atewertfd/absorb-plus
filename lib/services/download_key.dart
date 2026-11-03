// Absorb Plus: splitting a download key back into the ids the server needs.
//
// Downloads are keyed by the library item id, or "<show id>-<episode id>"
// for a podcast episode. The split used to assume a 36-character UUID show
// id, which picks the wrong ids for any other shape (audit D17). Records now
// keep the episode id; older ones still fall back to the UUID rule.

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
  // Older records: a UUID show id, a dash, then the episode id.
  if (key.length > 37 && key[36] == '-') {
    return (itemId: key.substring(0, 36), episodeId: key.substring(37));
  }
  return (itemId: key, episodeId: null);
}

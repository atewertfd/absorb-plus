// Absorb Plus: decode large server JSON bodies off the UI isolate.
//
// Personalized shelves, series pages, playlists, collections, listening
// sessions and podcast items can run to several hundred KB. Decoding that on
// the UI isolate costs a visible frame drop, so bodies above
// [kOffThreadJsonBytes] are decoded with `Isolate.run`. Small bodies stay
// inline (spawning costs more than it saves), and web always decodes inline
// because it has no isolates.
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

/// Bodies at least this long (in UTF-16 code units, roughly bytes for JSON)
/// are decoded on a background isolate.
const int kOffThreadJsonBytes = 200 * 1024;

/// Whether [decodeJsonBody] would move a body of [length] off the UI isolate.
@visibleForTesting
bool decodesOffThread(int length, {bool isWeb = kIsWeb}) =>
    !isWeb && length >= kOffThreadJsonBytes;

/// `jsonDecode(body)`, on a background isolate when the body is large.
/// Throws the same [FormatException] as [jsonDecode] on bad input.
Future<dynamic> decodeJsonBody(String body) async {
  if (!decodesOffThread(body.length)) return jsonDecode(body);
  return Isolate.run(() => jsonDecode(body), debugName: 'jsonDecode');
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Bodies at least this long (in UTF-16 code units, roughly bytes for JSON)
/// are decoded on a background isolate; smaller ones aren't worth the spawn.
const int kOffThreadJsonThreshold = 200 * 1024;

/// Decodes [body] as JSON, off the UI isolate when it is large.
///
/// `compute` runs the work through `Isolate.run` on native platforms and
/// inline on the web, where there are no isolates.
Future<dynamic> decodeJsonOffThread(
  String body, {
  int threshold = kOffThreadJsonThreshold,
}) {
  if (body.length < threshold) return Future.value(jsonDecode(body));
  return compute(jsonDecode, body);
}

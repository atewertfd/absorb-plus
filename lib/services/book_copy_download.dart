import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/fork_platform.dart';

/// Absorb Plus: "Save a copy…" of a book on desktop (audit C8).
///
/// Streams `GET /api/items/:id/download` to `<dest>.part` and renames it to
/// the chosen path only once the stream completed, so a failed or cancelled
/// copy never leaves a partial file nor replaces an existing one. Errors never
/// carry the URL (it holds the token).
class BookCopyDownload {
  BookCopyDownload([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;
  bool _cancelled = false;

  bool get isCancelled => _cancelled;

  /// Desktop only, Audiobookshelf only, and only when the user may download.
  static bool available({
    required Map<String, dynamic>? userJson,
    required bool isBookOrbit,
    required bool offline,
  }) {
    if (!(ForkPlatform.isWindows || ForkPlatform.isLinux)) return false;
    if (isBookOrbit || offline) return false;
    final perms = userJson?['permissions'];
    return perms is Map && perms['download'] == true;
  }

  /// The suggested file name: the title plus `.zip`, or the file's own
  /// extension when the item is a single file (the server sends it as is).
  static String suggestedFileName(String title, Map<String, dynamic>? item) {
    var safe = title.replaceAll(RegExp(r'[^\w\s-]'), '').trim();
    if (safe.isEmpty) safe = 'book';
    if (item?['isFile'] == true) {
      final rel = (item?['relPath'] ?? item?['path'] ?? '') as String;
      final dot = rel.lastIndexOf('.');
      if (dot > 0 && dot > rel.lastIndexOf(RegExp(r'[\\/]'))) {
        return '$safe${rel.substring(dot)}';
      }
    }
    return '$safe.zip';
  }

  void cancel() {
    _cancelled = true;
    _client.close();
  }

  /// Downloads [url] into [destPath]. Throws [BookCopyCancelled] on cancel
  /// and [BookCopyFailed] on any other failure.
  Future<File> run(
    Uri url,
    Map<String, String> headers,
    String destPath,
    void Function(int received, int? total) onProgress,
  ) async {
    final part = File('$destPath.part');
    try {
      if (_cancelled) throw const BookCopyCancelled();
      var response = await _send(url, headers);
      // Follow redirects by hand so the sign-in headers come along.
      var target = url;
      for (var i = 0;
          i < 5 && const {301, 302, 303, 307, 308}.contains(response.statusCode);
          i++) {
        final location = response.headers['location'];
        if (location == null) break;
        await response.stream.drain<void>().catchError((_) {});
        target = target.resolve(location);
        response = await _send(target, headers);
      }
      if (response.statusCode != 200) {
        throw BookCopyFailed('HTTP ${response.statusCode}');
      }
      final type = response.headers['content-type'] ?? '';
      if (type.contains('text/html')) {
        throw const BookCopyFailed('server returned a web page');
      }
      final total = response.contentLength;
      var received = 0;
      final sink = part.openWrite();
      try {
        await for (final chunk in response.stream) {
          if (_cancelled) throw const BookCopyCancelled();
          sink.add(chunk);
          received += chunk.length;
          onProgress(received, total);
        }
        await sink.flush();
      } finally {
        await sink.close();
      }
      if (_cancelled) throw const BookCopyCancelled();
      if (total != null && total > 0 && received != total) {
        throw const BookCopyFailed('incomplete download');
      }
      final dest = File(destPath);
      if (await dest.exists()) await dest.delete();
      return await part.rename(destPath);
    } catch (e) {
      try {
        if (await part.exists()) await part.delete();
      } catch (_) {
        debugPrint('[BookCopy] Could not delete the partial file');
      }
      if (_cancelled) throw const BookCopyCancelled();
      if (e is BookCopyFailed) rethrow;
      // Never pass the original error on: http errors include the URL.
      throw BookCopyFailed(e.runtimeType.toString());
    } finally {
      _client.close();
    }
  }

  Future<http.StreamedResponse> _send(Uri url, Map<String, String> headers) {
    final request = http.Request('GET', url)
      ..followRedirects = false
      ..headers.addAll(headers);
    return _client.send(request);
  }
}

class BookCopyCancelled implements Exception {
  const BookCopyCancelled();
}

class BookCopyFailed implements Exception {
  const BookCopyFailed(this.reason);
  final String reason;
  @override
  String toString() => 'BookCopyFailed: $reason';
}

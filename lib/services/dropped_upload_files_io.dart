// Absorb Plus: dart:io side of dropped_upload_files.dart.

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'api_service.dart' show MediaUploadFile;
import 'dropped_upload_files.dart' show isIgnoredDropFile;

/// Folders deeper than this are not walked (guards against junction loops).
const _maxDepth = 8;

Future<List<MediaUploadFile>> expandDroppedPaths(List<String> paths) async {
  final out = <MediaUploadFile>[];
  for (final path in paths) {
    try {
      final type = await FileSystemEntity.type(path, followLinks: true);
      if (type == FileSystemEntityType.directory) {
        final files = <File>[];
        await _collect(Directory(path), files, 0);
        files.sort(
          (a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()),
        );
        for (final f in files) {
          final file = await _toUpload(f);
          if (file != null) out.add(file);
        }
      } else if (type == FileSystemEntityType.file) {
        final file = await _toUpload(File(path));
        if (file != null) out.add(file);
      }
    } catch (e) {
      debugPrint('[Drop] Skipped a dropped item: $e');
    }
  }
  return out;
}

Future<void> _collect(Directory dir, List<File> into, int depth) async {
  if (depth > _maxDepth) return;
  await for (final entity in dir.list(followLinks: false)) {
    final name = _basename(entity.path);
    if (isIgnoredDropFile(name)) continue;
    if (entity is File) {
      into.add(entity);
    } else if (entity is Directory) {
      await _collect(entity, into, depth + 1);
    }
  }
}

Future<MediaUploadFile?> _toUpload(File file) async {
  final name = _basename(file.path);
  if (isIgnoredDropFile(name)) return null;
  try {
    return MediaUploadFile(
      name: name,
      size: await file.length(),
      path: file.path,
    );
  } catch (e) {
    debugPrint('[Drop] Could not read a dropped file: $e');
    return null;
  }
}

String _basename(String path) {
  final cut = path.lastIndexOf(RegExp(r'[/\\]'));
  return cut < 0 ? path : path.substring(cut + 1);
}

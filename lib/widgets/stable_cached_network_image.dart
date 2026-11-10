import 'package:cached_network_image/cached_network_image.dart';

String stableCoverCacheKey(String imageUrl, {int? updatedAt}) {
  final uri = Uri.tryParse(imageUrl);
  if (uri == null ||
      !uri.path.contains('/api/items/') ||
      !uri.path.endsWith('/cover')) {
    return imageUrl;
  }

  final query = Map<String, String>.from(uri.queryParameters);
  final revision = updatedAt?.toString() ?? query['ts'];
  query.remove('token');
  query.remove('ts');
  if (revision != null) query['ts'] = revision;

  // Absorb Plus: replace(queryParameters: null) kept the old query (and its
  // token); an empty map clears it but leaves a bare '?', dropped here.
  final key = uri.replace(queryParameters: query).toString();
  return query.isEmpty && key.endsWith('?') ? key.substring(0, key.length - 1) : key;
}

class StableCachedNetworkImage extends CachedNetworkImage {
  StableCachedNetworkImage({
    super.key,
    required super.imageUrl,
    required super.cacheKey,
    super.fit,
    super.httpHeaders,
    super.cacheManager,
    super.imageBuilder,
    super.placeholder,
    super.errorWidget,
    super.memCacheWidth,
  }) : super(useOldImageOnUrlChange: true);
}

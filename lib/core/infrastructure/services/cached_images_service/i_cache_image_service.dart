import 'package:astra_curator/core/infrastructure/services/cached_images_service/cached_file_image.dart';

/// Describe service for caching network images.
abstract class ICacheImageService {
  /// Get compressed file images.
  ///
  /// Downloads image from `url` and then return `Future<File>`
  Future<CachedFileImage> getFileImage(String imgUrl);
}

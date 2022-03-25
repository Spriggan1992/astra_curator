import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'cached_file_image.freezed.dart';

/// Defines cached images as file on device.
@freezed
class CachedFileImage with _$CachedFileImage {
  const CachedFileImage._();
  const factory CachedFileImage({
    /// Full image of current user.
    required File fullImage,

    /// Thumbnail image of current user.
    required File thumbnailImage,
  }) = _CachedFileImage;

// Convert DTO to domain.
  CachedFileImage toDomain() => CachedFileImage(
        fullImage: fullImage,
        thumbnailImage: thumbnailImage,
      );
}

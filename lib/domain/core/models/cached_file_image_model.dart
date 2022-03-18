import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'cached_file_image_model.freezed.dart';

/// Defines cached images as file on device.
@freezed
class CachedFileImageModel with _$CachedFileImageModel {
  const CachedFileImageModel._();
  const factory CachedFileImageModel({
    /// Full image of current user for display.
    File? fullImage,

    /// Thumbnail image of current user for display.
    File? thumbnailImage,
  }) = _CachedFileImageModel;

  /// Empty .
  factory CachedFileImageModel.empty() => const CachedFileImageModel();
}

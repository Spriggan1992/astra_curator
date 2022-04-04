import 'dart:io';

import 'package:astra_curator/core/domain/models/cached_file_image_model.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';

// const fullImageFile = File('fullImagePath');
class MockImageModel {
  static ImageModel imageModel = ImageModel(
    imageUrl: 'imgUrl',
    cachedImage: MockCachedImages.cachedImages,
  );
}

final fullImageFile = File('fullImagePath');
final thumbnailFile = File('thumbnailPath');

class MockCachedImages {
  static final CachedFileImageModel cachedImages = CachedFileImageModel(
    fullImage: fullImageFile,
    thumbnailImage: thumbnailFile,
  );
}

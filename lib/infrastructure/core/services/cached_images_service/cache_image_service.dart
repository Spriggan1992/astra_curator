// import 'dart:io';

// import 'package:astra_curator/infrastructure/core/services/cached_images_service/cached_file_image.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:injectable/injectable.dart';

// import 'i_cache_image_service.dart';

// /// Represents service for caching network images.
// @LazySingleton(as: ICacheImageService)
// class CacheImageService implements ICacheImageService {
//   /// Manager for caching images.
//   final DefaultCacheManager _defaultCacheManager;

//   CacheImageService(
//     this._defaultCacheManager,
//   );

//   @override
//   Future<CachedFileImage> getFileImage(String imgUrl) async {
//     final compressedImages = await _defaultCacheManager
//         .getSingleFile(imgUrl)
//         .then((value) => _compressImage(value));
//     return compressedImages;
//   }

//   Future<CachedFileImage> _compressImage(File file) async {
//     final filePath = file.absolute.path;
//     const pattern = '.png';
//     String outPath = '';
//     if (filePath.contains(pattern)) {
//       outPath = filePath.replaceAll(RegExp(r'.png'), 'thumbnail.jpg');
//     } else {
//       outPath = filePath.replaceAll(RegExp(r'.jpg'), 'thumbnail.jpg');
//     }

//     final compressedImage = await FlutterImageCompress.compressAndGetFile(
//       filePath,
//       outPath,
//       minWidth: 500,
//       minHeight: 500,
//       format: CompressFormat.jpeg,
//       quality: 50,
//     );
//     return CachedFileImage(
//       fullImage: file,
//       thumbnailImage: compressedImage!,
//     );
//   }
// }

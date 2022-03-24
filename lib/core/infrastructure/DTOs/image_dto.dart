// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/cached_file_image_model.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

/// Represent image data transfer object.
@freezed
class ImageDTO with _$ImageDTO {
  const ImageDTO._();
  const factory ImageDTO({
    /// Image identifier.
    @JsonKey(name: 'id') int? id,

    /// Image url.
    @JsonKey(name: 'url') String? imageUrl,

    /// Image bytes for sending to back-end.
    @JsonKey(name: 'images') String? imagePath,
  }) = _ImageDTO;

  /// Return converted DTO from json.
  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);

  /// Convert object to json.
  factory ImageDTO.toJson() {
    return ImageDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory ImageDTO.fromDomain(ImageModel _) {
    return ImageDTO(imagePath: _.cachedImage?.fullImage!.path);
  }

  /// Convert DTO to domain.
  ImageModel toDomain() => ImageModel(
        id: id,
        imageUrl: "${Endpoints.imageAddress}$imageUrl",
        cachedImage: CachedFileImageModel.empty(),
      );
}

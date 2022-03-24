// ignore_for_file: invalid_annotation_target


import 'package:astra_curator/domain/core/models/image_model.dart';
import 'package:astra_curator/infrastructure/core/http/endpoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_image_dto.freezed.dart';
part 'client_image_dto.g.dart';

/// Represent image data transfer object.
@freezed
class ClientImageDTO with _$ClientImageDTO {
  const ClientImageDTO._();
  const factory ClientImageDTO({
    /// Image identifier.
    @JsonKey(name: 'id') int? id,

    /// Image url.
    @JsonKey(name: 'url') String? imageUrl,

  }) = _ClientImageDTO;

  /// Return converted DTO from json.
  factory ClientImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ClientImageDTOFromJson(json);

  /// Convert object to json.
  factory ClientImageDTO.toJson() {
    return ClientImageDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory ClientImageDTO.fromDomain(ImageModel _) {
    return ClientImageDTO(id: _.id, imageUrl: _.imageUrl);
  }

  /// Convert DTO to domain.
  ImageModel toDomain() => ImageModel(
        id: id,
        imageUrl: "${Endpoints.imageAddress}$imageUrl",
       
      );
}

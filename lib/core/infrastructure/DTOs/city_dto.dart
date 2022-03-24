// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_dto.freezed.dart';
part 'city_dto.g.dart';

/// Defines city data transfer object.
@freezed
class CityDTO with _$CityDTO {
  const CityDTO._();
  const factory CityDTO({
    /// City identifier.
    @JsonKey(name: 'id') required int id,

    /// City name.
    @JsonKey(name: 'label') required String name,
  }) = _CityDTO;

  /// Convert DTO to domain.
  CityModel toDomain() => CityModel(
        value: id,
        title: name,
      );

  /// Return converted DTO from json.
  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);

  /// Convert object to json.
  factory CityDTO.toJson() {
    return CityDTO.toJson();
  }
}

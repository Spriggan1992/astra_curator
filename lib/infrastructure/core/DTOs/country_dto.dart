// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/domain/core/models/country_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_dto.freezed.dart';
part 'country_dto.g.dart';

/// Defines country data transfer object.
@freezed
class CountryDTO with _$CountryDTO {
  const CountryDTO._();
  const factory CountryDTO({
    /// Country identifier.
    @JsonKey(name: 'id') required int id,

    /// Country name.
    @JsonKey(name: 'label') required String name,
  }) = _CountryDTO;

// Convert DTO to domain.
  CountryModel toDomain() => CountryModel(
        value: id,
        title: name,
      );
// Return converted DTO from json.
  factory CountryDTO.fromJson(Map<String, dynamic> json) =>
      _$CountryDTOFromJson(json);
// Convert object to json.
  factory CountryDTO.toJson() {
    return CountryDTO.toJson();
  }
}

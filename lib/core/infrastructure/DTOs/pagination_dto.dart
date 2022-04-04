// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/json_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

/// Defines pagination data transfer object.
@freezed
class PaginationDTO<T> with _$PaginationDTO<T> {
  const PaginationDTO._();
  const factory PaginationDTO({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') required String? next,
    @JsonKey(name: 'previous') required String? previous,
    @JsonKey(name: 'results') required List<dynamic> items,
  }) = _PaginationDTO<T>;

  /// Return converted DTO from json.
  factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);

  /// Convert object to json.
  factory PaginationDTO.toJson() => PaginationDTO.toJson();

  /// Returns pagination data model.
  PaginationDataModel<T> toDomain() => PaginationDataModel(
        count: count,
        next: next ?? '',
        previous: previous ?? '',
        items: JsonParser<T>().parseJson(items),
      );
}

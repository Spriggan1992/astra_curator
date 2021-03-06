// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_client_detailed_info_dto.freezed.dart';
part 'new_client_detailed_info_dto.g.dart';

///Defines
@freezed
class NewClientDetailedInfoDTO with _$NewClientDetailedInfoDTO {
  const NewClientDetailedInfoDTO._();
  const factory NewClientDetailedInfoDTO({
    /// User's character.
    @JsonKey(name: 'character') required String? character,

    /// User's skills.
    @JsonKey(name: 'skills') required String? skills,

    /// User's orientation.
    @JsonKey(name: 'orientation') required String? orientation,

    /// User's emotionality.
    @JsonKey(name: 'emotionality') required String? emotionality,

    /// User's intellectuality.
    @JsonKey(name: 'intellectuality') required String? intellectuality,

    /// User's sociability.
    @JsonKey(name: 'sociability') required String? sociability,

    /// User's selfRating.
    @JsonKey(name: 'self_rating') required String? selfRating,

    /// User's volitionally.
    @JsonKey(name: 'volitionality') required String? volitionally,

    /// User's selfControl.
    @JsonKey(name: 'self_control') required String? selfControl,
  }) = _NewClientDetailedInfoDTO;

  factory NewClientDetailedInfoDTO.fromDomain(ClientDetailedInfoModel _) {
    return NewClientDetailedInfoDTO(
      character: _.character,
      skills: _.skills,
      orientation: _.orientation,
      emotionality: _.emotionality,
      intellectuality: _.intellectuality,
      sociability: _.sociability,
      selfRating: _.selfRating,
      volitionally: _.volitionally,
      selfControl: _.selfControl,
    );
  }

// Convert DTO to domain.
  ClientDetailedInfoModel toDomain() => ClientDetailedInfoModel(
        character: character,
        skills: skills,
        orientation: orientation,
        emotionality: emotionality,
        intellectuality: intellectuality,
        sociability: sociability,
        selfRating: selfRating,
        volitionally: volitionally,
        selfControl: selfControl,
      );
// Return converted DTO from json.
  factory NewClientDetailedInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$NewClientDetailedInfoDTOFromJson(json);

// Convert object to json.
  factory NewClientDetailedInfoDTO.toJson() {
    return NewClientDetailedInfoDTO.toJson();
  }
}

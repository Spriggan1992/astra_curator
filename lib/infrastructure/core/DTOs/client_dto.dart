// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/domain/core/models/client_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'client_dto.freezed.dart';
part 'client_dto.g.dart';

///Defines
@freezed
class ClientDTO with _$ClientDTO {
  const ClientDTO._();
  const factory ClientDTO({
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'firstname') required String firstName,
    @JsonKey(name: 'lastname') required String lastName,
    @JsonKey(name: 'birthday') required String birthday,
    @JsonKey(name: 'gender') required int gender,
    // @JsonKey(name: 'age') required int age,
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'have_child') required bool haveChild,
    @JsonKey(name: 'country') required int country,
    @JsonKey(name: 'martial_status') required int martialStatus,
    @JsonKey(name: 'city') required int city,
    @JsonKey(name: 'description') required String shortDescription,
  }) = _ClientDTO;

  factory ClientDTO.fromDomain(ClientModel _) {
    return ClientDTO(
      phoneNumber: _.phoneNumber,
      firstName: _.firstName,
      lastName: _.lastName,
      birthday: _.birthday.toString(),
      gender: _.gender.value,
      // age: _.age,
      height: int.parse(_.height),
      status: _.status.value,
      haveChild: _.haveChild.value,
      country: _.country.value,
      martialStatus: _.martialStatus.value,
      city: _.city.value,
      shortDescription: _.shortDescription,
    );
  }

// Return converted DTO from json.
  factory ClientDTO.fromJson(Map<String, dynamic> json) =>
      _$ClientDTOFromJson(json);
//// Convert object to json.
  factory ClientDTO.toJson() {
    return ClientDTO.toJson();
  }
}

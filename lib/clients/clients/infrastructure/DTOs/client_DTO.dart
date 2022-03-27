// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/infrastructure/DTOs/image_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'client_DTO.freezed.dart';
part 'client_DTO.g.dart';

/// Represents Client_DTO model.
@freezed
class ClientDTO with _$ClientDTO {
  const ClientDTO._();
  const factory ClientDTO({
    // Client's id.
    @JsonKey(name: 'id') required int id,

    // Curator's id.
    @JsonKey(name: 'curator_id') required int curatorId,

    /// Client's phone number.
    @JsonKey(name: 'phone_number') required String phoneNumber,

    /// Client's first name.
    @JsonKey(name: 'firstname') required String firstName,

    /// Client's last name.
    @JsonKey(name: 'lastname') required String lastName,

    /// Client's age.
    @JsonKey(name: 'age', nullable: true) required int? age,

    /// Client's birthday.
    @JsonKey(name: 'birthday', defaultValue: '', nullable: true)
        String? birthday,

    /// Client's height.
    @JsonKey(name: 'height') required int height,

    /// Client's gender.
    @JsonKey(name: 'gender') required String gender,

    /// Client's status.
    @JsonKey(name: 'status') required String status,

    /// A flag showing client's has child or not.
    @JsonKey(name: 'have_child') required bool haveChild,

    /// Client's country.
    @JsonKey(name: 'country') required String country,

    /// Client's city.
    @JsonKey(name: 'city') required String city,

    /// Client's profile info.
    @JsonKey(name: 'profile_info') required String profileInfo,

    /// A date time that client was created.
    @JsonKey(name: 'created_at') required String createdAt,

    /// A date time that client was saved at.
    @JsonKey(name: 'saved_at') required String savedAt,

    /// A flag shows that client is active or not active.
    @JsonKey(name: 'is_active') required bool isActive,

    /// A flag shows that client is draft or not.
    @JsonKey(name: 'draft') required bool draft,

    /// A flag shows that client is hidden or not.
    @JsonKey(name: 'is_hidden') required bool isHidden,

    /// A flag shows that client is show info or not.
    @JsonKey(name: 'show_info') required bool showInfo,

    /// A flag shows that client is mutual like or not.

    @JsonKey(name: 'is_mutual_like', defaultValue: false, nullable: true)
        bool? isMutualLike,

    /// Client's curator first name.
    @JsonKey(name: 'curator_firstname') required String curatorFirstname,

    /// Client's curator last name.
    @JsonKey(name: 'curator_lastname') required String curatorLastname,

    /// A flag shows that client is online or not.
    @JsonKey(name: 'is_online', defaultValue: false, nullable: true)
        bool? isOnline,

    /// Client's like amount.
    @JsonKey(name: 'likes_amount') required int likesAmount,

    /// Client's profile images.
    @JsonKey(name: 'profile_photos') required List<ImageDTO> profilePhotos,

    /// Client's curator images.
    @JsonKey(name: 'curator_photos') required List<ImageDTO> curatorPhotos,
  }) = _ClientDTO;

  /// Return converted DTO from json.
  factory ClientDTO.fromJson(Map<String, dynamic> json) =>
      _$ClientDTOFromJson(json);

  /// Converted to client model.
  ClientModel toDomain() => ClientModel(
        id: id,
        age: age,
        birthday: birthday,
        city: city,
        country: country,
        createdAt: createdAt,
        curatorFirstname: curatorFirstname,
        curatorId: curatorId,
        curatorLastname: curatorLastname,
        curatorPhotos: curatorPhotos.map((e) => e.toDomain()).toList(),
        profilePhotos: profilePhotos.map((e) => e.toDomain()).toList(),
        draft: draft,
        firstName: firstName,
        gender: gender,
        haveChild: haveChild,
        height: height,
        isActive: isActive,
        isHidden: isHidden,
        isMutualLike: isMutualLike,
        isOnline: isOnline,
        lastName: lastName,
        likesAmount: likesAmount,
        phoneNumber: phoneNumber,
        profileInfo: profileInfo,
        savedAt: savedAt,
        showInfo: showInfo,
        status: status,
      );
}

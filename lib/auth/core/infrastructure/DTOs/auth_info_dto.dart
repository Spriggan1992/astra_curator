// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/auth/core/domain/models/auth_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info_dto.freezed.dart';
part 'auth_info_dto.g.dart';

/// Represent data transfer object.
@freezed
class AuthInfoDTO with _$AuthInfoDTO {
  const AuthInfoDTO._();
  const factory AuthInfoDTO({
    /// Phone number for sending to server.
    @JsonKey(name: 'phone_number') required String phoneNumber,

    /// Password for sending to server.
    @JsonKey(name: 'code') required String password,
  }) = _AuthInfoDTO;

  /// Return converted DTO from json.
  factory AuthInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoDTOFromJson(json);

  /// Return converted DTO from from domain.
  factory AuthInfoDTO.fromDomain(AuthInfo _) {
    return AuthInfoDTO(phoneNumber: _.phoneNumber, password: _.password);
  }

  AuthInfo toDomain() => AuthInfo(
        phoneNumber: phoneNumber,
        password: password,
      );
}

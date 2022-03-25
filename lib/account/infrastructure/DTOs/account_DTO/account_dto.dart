// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/account/domain/models/account/account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

/// Represent data transfer object.
@freezed
class AccountDTO with _$AccountDTO {
  const AccountDTO._();

  const factory AccountDTO({
    /// Cashback id.
    @JsonKey(name: 'id') required int id,

    /// Cashback amount.
    @JsonKey(name: 'amount') required double amount,

    /// Cashback rate.
    @JsonKey(name: 'rate') required int rate,

    /// Curator id.
    @JsonKey(name: 'curator_id') required int curatorId,
  }) = _AccountDTO;

  /// Return converted DTO from json.
  factory AccountDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountDTOFromJson(json);

  /// Return converted DTO from from domain.
  factory AccountDTO.fromDomain(Account _) => AccountDTO(
        id: _.id,
        amount: _.amount,
        rate: _.rate,
        curatorId: _.curatorId,
      );

  /// Returns account from AccountDTO.
  Account toDomain() => Account(
        id: id,
        amount: amount,
        rate: rate,
        curatorId: curatorId,
      );
}

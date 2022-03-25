// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/account/domain/models/account_history/account_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history_DTO.freezed.dart';
part 'account_history_DTO.g.dart';

/// DTO for [AccountHistory] entity.
@freezed
class AccountHistoryDTO with _$AccountHistoryDTO {
  const AccountHistoryDTO._();

  const factory AccountHistoryDTO({
    /// History id.
    @JsonKey(name: 'id') required int id,

    /// History packet.
    @JsonKey(name: 'paket') required String packet,

    /// History amount.
    @JsonKey(name: 'amount') required double amount,

    /// History status.
    @JsonKey(name: 'status') required String status,

    /// History date time.
    @JsonKey(name: 'datetime') required String dateTime,

    /// History profile.
    @JsonKey(name: 'profile') required String profile,

    /// Address
    @JsonKey(name: 'address') required int address,
  }) = _AccountHistoryDTO;

  /// Return converted DTO from json.
  factory AccountHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$_AccountHistoryDTO.fromJson(json);

  /// Returns converted DTO from domain.
  factory AccountHistoryDTO.fromDomain(AccountHistory _) => AccountHistoryDTO(
        id: _.id,
        amount: _.amount,
        status: _.status,
        dateTime: _.dateTime,
        address: _.address,
        packet: _.packet,
        profile: _.profile,
      );

  /// Returns converted [AccountHistory] from domain.
  AccountHistory toAccountHistory() => AccountHistory(
        id: id,
        amount: amount,
        status: status,
        dateTime: dateTime,
        address: address,
        packet: packet,
        profile: profile,
      );
}

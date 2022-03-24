// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/account/domain/models/account_history/account_history.dart';
import 'package:astra_curator/account/domain/models/withdraw/withdraw_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_history_DTO.freezed.dart';
part 'withdraw_history_DTO.g.dart';

/// DTO for withdraw entity.
@freezed
class WithdrawHistoryDTO with _$WithdrawHistoryDTO {
  const WithdrawHistoryDTO._();

  const factory WithdrawHistoryDTO({
    /// History id.
    @JsonKey(name: 'id') required int id,

    /// History amount.
    @JsonKey(name: 'amount') required double amount,

    /// History status.
    @JsonKey(name: 'status') required String status,

    /// History date time.
    @JsonKey(name: 'datetime') required String dateTime,

    /// Address
    @JsonKey(name: 'address') required int address,
  }) = _WithdrawHistoryDTO;

  /// Return converted DTO from json.
  factory WithdrawHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$_WithdrawHistoryDTO.fromJson(json);

  /// Returns converted DTO from domain.
  factory WithdrawHistoryDTO.fromDomain(AccountHistory _) => WithdrawHistoryDTO(
        id: _.id,
        amount: _.amount,
        status: _.status,
        dateTime: _.dateTime,
        address: _.address,
      );

  /// Returns converted [WithdrawHistory] from domain.
  WithdrawHistory toWithdrawHistory() => WithdrawHistory(
        id: id,
        amount: amount,
        status: status,
        dateTime: dateTime,
        address: address,
      );
}

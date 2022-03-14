import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_history.freezed.dart';

/// Represents information about an account history.
@freezed
class WithdrawHistory with _$WithdrawHistory {
  const WithdrawHistory._();

  const factory WithdrawHistory({
    /// History id.
    required int id,

    /// History amount.
    required double amount,

    /// History status. F.e replenishment.
    required String status,

    /// Date time, when was a replenishment.
    required String dateTime,

    /// Address code of history.
    required int address,
  }) = _WithdrawHistory;

  /// Get converted date time from String.
  DateTime get convertedDateTime {
    try {
      return DateTime.parse(dateTime);
    } catch (e) {
      return DateTime(0, 0, 0);
    }
  }

  /// Get formatted amount.
  String get formattedAmount {
    if (amount.isNegative) {
      return '$amount';
    } else {
      return '+$amount';
    }
  }
}

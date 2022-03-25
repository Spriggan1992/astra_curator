import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history.freezed.dart';

/// Represents information about an account history.
@freezed
class AccountHistory with _$AccountHistory {
  const AccountHistory._();

  const factory AccountHistory({
    /// History id.
    required int id,

    /// History amount.
    required String packet,

    /// History amount.
    required double amount,

    /// History status. F.e replenishment.
    required String status,

    /// Date time, when was a replenishment.
    required String dateTime,

    /// Payer name.
    required String profile,

    /// Address code of history.
    required int address,
  }) = _AccountHistory;

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

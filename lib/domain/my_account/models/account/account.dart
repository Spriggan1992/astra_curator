import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

/// Represents information about an account.
@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    /// Cashback id.
    required int id,

    /// Cashback amount.
    required double amount,

    /// Cashback rate.
    required int rate,

    /// Curator id.
    required int curatorId,
  }) = _Account;

  factory Account.empty() => const Account(
        id: 0,
        amount: 0,
        rate: 0,
        curatorId: 0,
      );
}

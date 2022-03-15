part of 'withdraw_bloc.dart';

@freezed
class WithdrawEvent with _$WithdrawEvent {
  /// Withdraw event.
  const factory WithdrawEvent.withdraw(double amount) = _Withdraw;
}
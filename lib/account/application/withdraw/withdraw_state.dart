part of 'withdraw_bloc.dart';

@freezed
class WithdrawState with _$WithdrawState {
  /// Initial state.
  const factory WithdrawState.initial() = WithdrawInitial;

  /// No connection state.
  const factory WithdrawState.noConnection() = WithdrawNoConnection;

  /// Unexpected error.
  const factory WithdrawState.unExpectedError() = WithdrawError;

  /// Success withdraw.
  const factory WithdrawState.success() = WithdrawSuccess;
}

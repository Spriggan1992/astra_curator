part of 'withdraw_history_bloc.dart';

@freezed
class WithdrawHistoryState with _$WithdrawHistoryState {
  const factory WithdrawHistoryState({
    /// List of histories fetched from server.
    required List<WithdrawHistory> histories,

    /// A flag that responsible that data fetched successfully.
    required bool isSuccess,

    /// A flag responsible for show snackbar with no unexpected error.
    required bool isUnExpectedError,

    /// A flag responsible for show snackbar with no connection error.
    required bool isNoConnection,

    /// A flag responsible fo loading data.
    required bool isLoading,

   }) = _WithdrawHistoryState;

  factory WithdrawHistoryState.initial() => const WithdrawHistoryState(
        histories: [],
        isLoading: true,
        isNoConnection: false,
        isSuccess: false,
        isUnExpectedError: false,
        
      );
}

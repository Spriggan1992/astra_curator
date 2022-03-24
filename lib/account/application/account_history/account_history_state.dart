part of 'account_history_bloc.dart';

@freezed
class AccountHistoryState with _$AccountHistoryState {
  const factory AccountHistoryState({
    /// List of histories fetched from server.
    required List<AccountHistory> histories,

    /// A flag that responsible data fetched successfully.
    required bool isSuccess,

    /// A flag responsible for show snackbar with no unexpected error.
    required bool isUnExpectedError,

    /// A flag responsible for show snackbar with no connection error.
    required bool isNoConnection,

    /// A flag responsible fo loading data.
    required bool isLoading,

    required bool isFetchingByPeriod, 
  }) = _AccountHistoryState;

  factory AccountHistoryState.initial() => const AccountHistoryState(
        histories: [],
        isLoading: true,
        isNoConnection: false,
        isSuccess: false,
        isUnExpectedError: false,
        isFetchingByPeriod: false,
      );
}

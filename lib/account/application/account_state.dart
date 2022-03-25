part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    /// Account data fetched from server.
    required Account account,

    /// A flag responsible for show snackbar with no connection error.
    required bool isNoConnection,

    /// A flag that responsible that data fetched successfully.
    required bool isSuccess,

    /// A flag responsible for show snackbar with no unexpected error.
    required bool isUnexpectedError,

    /// A flag responsible fo loading data.
    required bool isLoading,
  }) = _AccountState;

  /// Initial state.
  factory AccountState.initial() => AccountState(
        account: Account.empty(),
        isNoConnection: false,
        isSuccess: false,
        isUnexpectedError: false,
        isLoading: true,
      );
}

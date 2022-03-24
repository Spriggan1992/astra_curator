part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    /// Input phone number.
    required String phoneNumber,

    /// Input password
    required String password,

    /// A flag that responsible for enable/disable button.
    required bool isEnableBtn,

    /// A flag that responsible for displaying error message.
    required String errorMessage,

    /// A flag responsible for condition if user already was signed in system or not.
    required bool isSignIn,

    /// A flag that responsible that user successfully signed in.
    required bool isSuccessfullySignIn,

    /// A flag that responsible for redirect to [ConfirmPasswordScreen].
    required bool redirectToConfirmPassword,

    /// A flag responsible fo loading data.
    required bool isLoading,

    /// A flag responsible for show snackbar with no connection error.
    required bool isNoConnection,

    /// Sms code.
    ///
    /// Can be [null], if the user already had been registered before.
    String? code,
  }) = _PasswordState;
  factory PasswordState.initial() => const PasswordState(
        phoneNumber: '',
        password: '',
        isEnableBtn: false,
        errorMessage: '',
        isSignIn: false,
        isSuccessfullySignIn: false,
        redirectToConfirmPassword: false,
        isLoading: false,
        isNoConnection: false,
      );
}

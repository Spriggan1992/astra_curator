part of 'confirm_password_bloc.dart';

@freezed
class ConfirmPasswordState with _$ConfirmPasswordState {
  const factory ConfirmPasswordState({
    /// Phone number.
    required String phoneNumber,

    /// Password for comparison with input value.
    required String confirmePassword,

    /// Flag that responsible for enable/disable button.
    required bool isEnableBtn,

    /// Flag that responsible for displaying error message.
    required bool isShowError,

    /// Flag that responsible for successfully submited password or not.
    required bool isSuccessfullySubmitted,
  }) = _ConfirmPasswordState;
  factory ConfirmPasswordState.initial() => const ConfirmPasswordState(
        phoneNumber: '',
        confirmePassword: '',
        isEnableBtn: false,
        isShowError: false,
        isSuccessfullySubmitted: false,
      );
}

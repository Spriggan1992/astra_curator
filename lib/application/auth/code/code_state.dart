part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState({
    /// Phone number.
    required String phoneNumber,

    /// Sms-code.
    required String code,

    /// Code for comparison with input value.
    required String validatedCode,

    /// Flag that responsible for displaying error message.
    required bool isShowErrorMessage,

    /// Flag that responsible for enable/disable button.
    required bool isEnableBtn,

    /// Flag that responsible for code that pass validation or not.
    required bool isValid,
  }) = _CodeState;

  factory CodeState.initial() => const CodeState(
        code: '',
        phoneNumber: '',
        validatedCode: "1234",
        isShowErrorMessage: false,
        isEnableBtn: false,
        isValid: false,
      );
}

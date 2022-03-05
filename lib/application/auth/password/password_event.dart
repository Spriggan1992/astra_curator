part of 'password_bloc.dart';

@freezed
class PasswordEvent with _$PasswordEvent {
  /// Screen initialization event.
  const factory PasswordEvent.initialized(String phoneNumber, String? code) =
      _Initialized;

  /// Password change event.
  const factory PasswordEvent.changedPassword(String password) =
      _ChangedPassword;

  /// Button click event.
  const factory PasswordEvent.pressedButton() = _PressedButton;
}

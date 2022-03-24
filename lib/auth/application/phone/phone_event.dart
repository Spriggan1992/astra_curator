part of 'phone_bloc.dart';

@freezed
class PhoneEvent with _$PhoneEvent {
  /// Screen initialoization event.
  const factory PhoneEvent.initialized() = _Initialized;

  /// Text value change event.
  const factory PhoneEvent.changedTextValue(String value) = _ChangedTextValue;

  /// Button click event.
  const factory PhoneEvent.pressedBtn() = _PressedBtn;
}

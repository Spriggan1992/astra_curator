part of 'code_bloc.dart';

@freezed
class CodeEvent with _$CodeEvent {
  /// Screen initialoization event.
  const factory CodeEvent.initialized(String phoneNumber) = _Initialized;

  /// Code change event.
  const factory CodeEvent.changeCodeValue(String code) = _ChangeCodeValue;

  /// Submit code event.
  const factory CodeEvent.onSubmitCode(String code) = _OnSubmitCode;
}

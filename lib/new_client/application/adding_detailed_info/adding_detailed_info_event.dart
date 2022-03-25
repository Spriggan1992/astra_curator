part of 'adding_detailed_info_bloc.dart';

@freezed
class AddingDetailedInfoEvent with _$AddingDetailedInfoEvent {
  /// The character changed event.
  const factory AddingDetailedInfoEvent.characterChanged(String value) =
      _CharacterChanged;

  /// Skills changed event.
  const factory AddingDetailedInfoEvent.skillsChanged(String value) =
      _SkillsChanged;

  /// The orientation changed event.
  const factory AddingDetailedInfoEvent.orientationChanged(String value) =
      _OrientationChanged;

  /// The emotionality changed event.
  const factory AddingDetailedInfoEvent.emotionalityChanged(String value) =
      _EmotionalityChanged;

  /// The intellectuality changed event.
  const factory AddingDetailedInfoEvent.intellectualityChanged(String value) =
      _IntellectualityChanged;

  /// The sociability changed event.
  const factory AddingDetailedInfoEvent.sociabilityChanged(String value) =
      _SociabilityChanged;

  /// The self rating changed event.
  const factory AddingDetailedInfoEvent.selfRatingChanged(String value) =
      _SelfRatingChanged;

  /// The volitionally changed event.
  const factory AddingDetailedInfoEvent.volitionallyChanged(String value) =
      _VolitionallyChanged;

  /// The self control changed event.
  const factory AddingDetailedInfoEvent.selfControlChanged(String value) =
      _SelfControlChanged;

  /// Fields validation event.
  const factory AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked() =
      _AnyFieldIsNotEmptyChecked;

  /// The button pressed event.
  const factory AddingDetailedInfoEvent.buttonPressed() = _ButtonPressed;
}

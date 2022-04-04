part of 'editing_detailed_client_info_actor_bloc.dart';

@freezed
class EditingDetailedClientInfoActorEvent
    with _$EditingDetailedClientInfoActorEvent {
  /// Initialized editing client event.
  const factory EditingDetailedClientInfoActorEvent.initialized(
    ClientDetailedInfoModel detailedInfoModel,
    int userId,
  ) = _Initialized;

  /// The character changed event.
  const factory EditingDetailedClientInfoActorEvent.characterChanged(
    String value,
  ) = _CharacterChanged;

  /// Skills changed event.
  const factory EditingDetailedClientInfoActorEvent.skillsChanged(
    String value,
  ) = _SkillsChanged;

  /// The orientation changed event.
  const factory EditingDetailedClientInfoActorEvent.orientationChanged(
    String value,
  ) = _OrientationChanged;

  /// The emotionality changed event.
  const factory EditingDetailedClientInfoActorEvent.emotionalityChanged(
    String value,
  ) = _EmotionalityChanged;

  /// The intellectuality changed event.
  const factory EditingDetailedClientInfoActorEvent.intellectualityChanged(
    String value,
  ) = _IntellectualityChanged;

  /// The sociability changed event.
  const factory EditingDetailedClientInfoActorEvent.sociabilityChanged(
    String value,
  ) = _SociabilityChanged;

  /// The self rating changed event.
  const factory EditingDetailedClientInfoActorEvent.selfRatingChanged(
    String value,
  ) = _SelfRatingChanged;

  /// The volitionally changed event.
  const factory EditingDetailedClientInfoActorEvent.volitionallyChanged(
    String value,
  ) = _VolitionallyChanged;

  /// The self control changed event.
  const factory EditingDetailedClientInfoActorEvent.selfControlChanged(
    String value,
  ) = _SelfControlChanged;

  /// The button pressed event.
  const factory EditingDetailedClientInfoActorEvent.buttonPressed() =
      _ButtonPressed;
}

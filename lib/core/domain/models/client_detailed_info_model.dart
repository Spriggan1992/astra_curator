import 'package:freezed_annotation/freezed_annotation.dart';
part 'client_detailed_info_model.freezed.dart';

/// Defines detailed information about client
@freezed
class ClientDetailedInfoModel with _$ClientDetailedInfoModel {
  const ClientDetailedInfoModel._();
  const factory ClientDetailedInfoModel({
    /// User's character.
    required String? character,

    /// User's skills.
    required String? skills,

    /// User's orientation.
    required String? orientation,

    /// User's emotionality.
    required String? emotionality,

    /// User's intellectuality.
    required String? intellectuality,

    /// User's sociability.
    required String? sociability,

    /// User's selfRating.
    required String? selfRating,

    /// User's volitionally.
    required String? volitionally,

    /// User's selfControl.
    required String? selfControl,
  }) = _ClientDetailedInfoModel;

  /// Empty client detailed info model.
  factory ClientDetailedInfoModel.empty() {
    return const ClientDetailedInfoModel(
      character: '',
      skills: '',
      orientation: '',
      emotionality: '',
      intellectuality: '',
      sociability: '',
      selfRating: '',
      volitionally: '',
      selfControl: '',
    );
  }
  bool get anyFieldIsNotEmpty {
    return character!.isNotEmpty ||
        skills!.isNotEmpty ||
        orientation!.isNotEmpty ||
        emotionality!.isNotEmpty ||
        intellectuality!.isNotEmpty ||
        sociability!.isNotEmpty ||
        selfRating!.isNotEmpty ||
        volitionally!.isNotEmpty ||
        selfControl!.isNotEmpty;
  }
}

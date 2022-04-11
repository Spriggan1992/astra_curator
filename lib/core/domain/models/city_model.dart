import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';

// Defines city model where the user is living.
@freezed
class CityModel with _$CityModel {
  const CityModel._();
  const factory CityModel({
    /// City id.
    required int value,

    /// City name to display.
    required String title,
  }) = _CityModel;

  /// Empty city model.
  factory CityModel.empty() => const CityModel(
        value: 0,
        title: '',
      );
}

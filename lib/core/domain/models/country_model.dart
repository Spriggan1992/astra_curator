import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_model.freezed.dart';

/// Defines country model where the user is living.
@freezed
class CountryModel with _$CountryModel {
  const CountryModel._();
  const factory CountryModel({
    /// Country identifier.
    required int value,

    /// Country name to display.
    required String title,
  }) = _CountryModel;

  /// Empty country model.
  factory CountryModel.empty() => const CountryModel(
        value: 0,
        title: '',
      );
}

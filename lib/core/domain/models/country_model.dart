import 'package:astra_curator/core/presentation/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_model.freezed.dart';

/// Defines country model where the user is living.
@freezed
class CountryModel with _$CountryModel implements TextFieldPopUpMenuItem<int> {
  const CountryModel._();
  const factory CountryModel({
    /// Country identifier.
    @override required int value,

    /// Country name to display.
    @override required String title,
  }) = _CountryModel;

  /// Empty country model.
  factory CountryModel.empty() => const CountryModel(
        value: 0,
        title: '',
      );
}

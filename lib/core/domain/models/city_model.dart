import 'package:astra_curator/core/presentation/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';

// Defines city model where the user is living.
@freezed
class CityModel with _$CityModel implements TextFieldPopUpMenuItem<int> {
  const CityModel._();
  const factory CityModel({
    /// City id.
    @override required int value,

    /// City name to display.
    @override required String title,
  }) = _CityModel;

  /// Empty city model.
  factory CityModel.empty() => const CityModel(
        value: 0,
        title: '',
      );
}

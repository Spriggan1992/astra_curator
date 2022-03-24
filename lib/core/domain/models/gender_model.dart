import 'package:astra_curator/core/presentation/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'gender_model.freezed.dart';

/// Defines client's gender model.
@freezed
class GenderModel with _$GenderModel implements TextFieldPopUpMenuItem<int> {
  const GenderModel._();
  const factory GenderModel({
    /// Status value.
    @override required int value,

    /// Status title.
    @override required String title,
  }) = _GenderModel;

  /// Empty gender model .
  factory GenderModel.empty() => const GenderModel(
        title: '',
        value: 0,
      );
}

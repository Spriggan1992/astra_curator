import 'package:astra_curator/core/presentation/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'martial_status_model.freezed.dart';

/// Defines clients martial status model.
@freezed
class MartialStatusModel
    with _$MartialStatusModel
    implements TextFieldPopUpMenuItem<int> {
  const MartialStatusModel._();
  const factory MartialStatusModel({
    /// Status value.
    @override required int value,

    /// Status title.
    @override required String title,
  }) = _MartialStatus;

  /// Empty .
  factory MartialStatusModel.empty() =>
      const MartialStatusModel(title: '', value: 0);
}

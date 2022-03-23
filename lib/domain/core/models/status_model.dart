import 'package:astra_curator/presentation/core/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'status_model.freezed.dart';

/// Defines clients status model.
@freezed
class StatusModel with _$StatusModel implements TextFieldPopUpMenuItem<int> {
  const StatusModel._();
  const factory StatusModel({
    /// Status value.
    @override required int value,

    /// Status title.
    @override required String title,
  }) = _StatusModel;

  /// Empty status model.
  factory StatusModel.empty() => const StatusModel(
        title: '',
        value: 0,
      );
}

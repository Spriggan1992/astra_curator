import 'package:astra_curator/presentation/core/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'child_status_model.freezed.dart';

/// Defines child status model.
@freezed
class ChildStatusModel
    with _$ChildStatusModel
    implements TextFieldPopUpMenuItem<bool> {
  const ChildStatusModel._();
  const factory ChildStatusModel({
    /// Whether the client has child or not.
    @override required bool value,

    /// The title of displaying status.
    @override required String title,
  }) = _ChildStatusMode;

  /// Empty child status.
  factory ChildStatusModel.empty() => const ChildStatusModel(
        title: '',
        value: false,
      );
}

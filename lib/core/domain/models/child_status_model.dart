import 'package:freezed_annotation/freezed_annotation.dart';
part 'child_status_model.freezed.dart';

/// Defines child status model.
@freezed
class ChildStatusModel with _$ChildStatusModel {
  const ChildStatusModel._();
  const factory ChildStatusModel({
    /// Whether the client has child or not.
    required bool value,

    /// The title of displaying status.
    required String title,
  }) = _ChildStatusMode;

  /// Empty child status.
  factory ChildStatusModel.empty() => const ChildStatusModel(
        title: '',
        value: false,
      );
}

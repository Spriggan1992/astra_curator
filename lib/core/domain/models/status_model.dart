import 'package:freezed_annotation/freezed_annotation.dart';
part 'status_model.freezed.dart';

/// Defines clients status model.
@freezed
class StatusModel with _$StatusModel {
  const StatusModel._();
  const factory StatusModel({
    /// Status value.
    required int value,

    /// Status title.
    required String title,
  }) = _StatusModel;

  /// Empty status model.
  factory StatusModel.empty() => const StatusModel(
        title: '',
        value: 0,
      );
}

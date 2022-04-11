import 'package:freezed_annotation/freezed_annotation.dart';
part 'martial_status_model.freezed.dart';

/// Defines clients martial status model.
@freezed
class MartialStatusModel with _$MartialStatusModel {
  const MartialStatusModel._();
  const factory MartialStatusModel({
    /// Status value.
    required int value,

    /// Status title.
    required String title,
  }) = _MartialStatus;

  /// Empty .
  factory MartialStatusModel.empty() =>
      const MartialStatusModel(title: '', value: 0);
}

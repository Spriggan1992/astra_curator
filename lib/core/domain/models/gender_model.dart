import 'package:freezed_annotation/freezed_annotation.dart';
part 'gender_model.freezed.dart';

/// Defines client's gender model.
@freezed
class GenderModel with _$GenderModel {
  const GenderModel._();
  const factory GenderModel({
    /// Status value.
    required int value,

    /// Status title.
    required String title,
  }) = _GenderModel;

  /// Empty gender model .
  factory GenderModel.empty() => const GenderModel(
        title: '',
        value: 0,
      );
}

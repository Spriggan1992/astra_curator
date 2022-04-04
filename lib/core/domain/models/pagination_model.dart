import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_model.freezed.dart';

/// Defines pagination data model.
@freezed
class PaginationDataModel<T> with _$PaginationDataModel<T> {
  const PaginationDataModel._();
  const factory PaginationDataModel({
    /// Total number of items that can be loaded.
    required int count,

    /// The link for loading next link.
    required String next,

    /// The previous for loading next link.
    required String previous,

    /// Loaded items.
    T? items,
  }) = _PaginationModel<T>;

  /// Empty .
  factory PaginationDataModel.empty() => const PaginationDataModel(
        count: 0,
        next: '',
        previous: '',
      );
}

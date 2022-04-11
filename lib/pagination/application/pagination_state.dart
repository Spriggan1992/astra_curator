part of 'pagination_bloc.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState({
    /// List of clients fetched from server.
    required PaginationDataModel<List<T>> paginationModel,

    /// A sort type of clients.
    // required SortTypes sortTypes,

    /// Loading state, will be success, initial, error.
    required LoadingStatesWithFailure loadingStates,
    required bool isAvailableToLoad,
  }) = _PaginationState<T>;

  /// Clients initial state.
  factory PaginationState.initial() => PaginationState(
        paginationModel: PaginationDataModel.empty(),
        // sortTypes: SortTypes.initial,
        loadingStates: LoadingStatesWithFailure.initial,
        isAvailableToLoad: true,
      );
}

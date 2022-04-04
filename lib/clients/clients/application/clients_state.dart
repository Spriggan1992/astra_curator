part of 'clients_bloc.dart';

/// Client's state.
@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState({
    /// List of clients fetched from server.
    required PaginationDataModel<List<ClientModel>> paginationModel,

    /// A sort type of clients.
    required SortTypes sortTypes,

    /// Loading state, will be success, initial, error.
    required LoadingStatesWithFailure loadingStates,
    required bool isAvailableToLoad,
  }) = _ClientsState;

  /// Clients initial state.
  factory ClientsState.initial() => ClientsState(
        paginationModel: PaginationDataModel.empty(),
        sortTypes: SortTypes.initial,
        loadingStates: LoadingStatesWithFailure.initial,
        isAvailableToLoad: true,
      );
}

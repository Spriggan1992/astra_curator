part of 'clients_bloc.dart';

/// Client's state.
@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState({
    /// List of clients fetched from server.
    required List<ClientModel> clients,

    /// A sort type of clients.
    required SortTypes sortTypes,

    /// Loading state, will be success, initial, error.
    required LoadingStatesWithFailure loadingStates,
  }) = _ClientsState;

  /// Clients initial state.
  factory ClientsState.initial() => const ClientsState(
        clients: [],
        sortTypes: SortTypes.initial,
        loadingStates: LoadingStatesWithFailure.initial,
      );
}

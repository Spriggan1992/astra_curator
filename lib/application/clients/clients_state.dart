part of 'clients_bloc.dart';

/// Client's state.
@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState({
    /// List of clients fetched from server.
    required List<Client> clients,

    /// A sort type of clients.
    required SortTypes sortTypes, 

    /// A flag that responsible that data fetched successfully.
    required bool isSuccess,

    /// A flag responsible for show snackbar with no unexpected error.
    required bool isUnExpectedError,

    /// A flag responsible for show snackbar with no connection error.
    required bool isNoConnection,

    /// A flag responsible fo loading data.
    required bool isLoading,
  }) = _ClientsState;

  /// Clients initial state.
  factory ClientsState.initial() => const ClientsState(
        clients: [],
        sortTypes: SortTypes.initial,
        isSuccess: false,
        isUnExpectedError: false,
        isNoConnection: false,
        isLoading: true,
      );
}

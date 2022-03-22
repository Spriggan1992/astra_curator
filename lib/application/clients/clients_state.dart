part of 'clients_bloc.dart';

@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState({
    /// List of clients fetched from server.
    required List<Client> clients,

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
        isSuccess: false,
        isUnExpectedError: false,
        isNoConnection: false,
        isLoading: true,
      );
}

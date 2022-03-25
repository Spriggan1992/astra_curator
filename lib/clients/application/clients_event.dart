part of 'clients_bloc.dart';

/// Clients event.
@freezed
class ClientsEvent with _$ClientsEvent {
  /// Load clients from server.
  const factory ClientsEvent.loadClients() = _LoadClients;
  /// Sorting clients event.
  const factory ClientsEvent.sortClients(SortTypes sortTypes) = _SortClients;
}

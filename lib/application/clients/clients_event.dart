part of 'clients_bloc.dart';

@freezed
class ClientsEvent with _$ClientsEvent {
  const factory ClientsEvent.loadClients() = _LoadClients;
}
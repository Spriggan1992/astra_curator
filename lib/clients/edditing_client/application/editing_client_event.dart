part of 'editing_client_bloc.dart';

@freezed
class EditingClientEvent with _$EditingClientEvent {
  /// Initialized editing client event.
  const factory EditingClientEvent.initialized(ClientModel client) =
      _Initialized;
}

part of 'adding_client_bloc.dart';

@freezed
class AddingClientEvent with _$AddingClientEvent {
  const factory AddingClientEvent.started() = _Started;
}
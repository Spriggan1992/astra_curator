part of 'editing_client_bloc.dart';

@freezed
class EditingClientState with _$EditingClientState {
  /// State of initial loading.
  const factory EditingClientState.initial() = _Initial;

  /// Progress loading states.
  const factory EditingClientState.loading() = _Loading;

  /// Successfully loaded data state.
  const factory EditingClientState.success(
    NewClientModel client,
    List<CityModel> cities,
    List<CountryModel> countries,
  ) = Success;

  /// Unsuccessfully loaded data state.
  const factory EditingClientState.failure(Failure failure) = _Failure;
}

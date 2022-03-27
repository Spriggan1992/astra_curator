part of 'adding_client_bloc.dart';

@freezed
class AddingClientState with _$AddingClientState {
  const factory AddingClientState({
    /// States of loading data.
    required LoadingStates loadingState,
    required AstraFailures astraFailure,

    /// Available countries to display.
    required List<CountryModel> countries,

    /// Available cities to display.
    required List<CityModel> cities,

    /// Whether all fields is filled or not.
    required bool formIsFilled,

    /// Client's information for register.
    required NewClientModel client,

    /// Client's photos.
    required List<ImageModel> photos,

    /// Register new user state.
    required LoadingStatesWithFailure registerLoadingStates,
  }) = _AddingClientState;

  factory AddingClientState.initial() => AddingClientState(
        loadingState: LoadingStates.initial,
        astraFailure: AstraFailures.initial,
        countries: [],
        cities: [],
        formIsFilled: false,
        client: NewClientModel.empty(),
        photos: [],
        registerLoadingStates: LoadingStatesWithFailure.initial,
      );
}

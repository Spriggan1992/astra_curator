part of 'editing_client_actor_bloc.dart';

@freezed
class EditingClientActorState with _$EditingClientActorState {
  const factory EditingClientActorState({
    /// Client information to display.
    required NewClientModel client,

    /// Updated client information.
    required NewClientModel updatedClient,

    /// Whether the successfully submitted client information.
    required bool isSuccessSubmitted,

    /// Whether the form is valid.
    required bool formIsValid,

    /// Available countries to display.
    required List<CountryModel> countries,

    /// Available cities to display.
    required List<CityModel> cities,

    /// State of loading data.
    required LoadingStates loadingState,

    /// Whether can submit updated client information.
    required bool canSubmit,

    /// Client's information for register.
  }) = _EditingClientActorState;
  factory EditingClientActorState.initial() => EditingClientActorState(
        loadingState: LoadingStates.initial,
        isSuccessSubmitted: false,
        formIsValid: true,
        client: NewClientModel.empty(),
        updatedClient: NewClientModel.empty(),
        canSubmit: false,
        countries: [],
        cities: [],
      );
}

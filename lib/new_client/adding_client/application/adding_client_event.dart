part of 'adding_client_bloc.dart';

@freezed
class AddingClientEvent with _$AddingClientEvent {
  /// Initialized adding clients event.
  const factory AddingClientEvent.initialized() = _Initialized;

  /// Cities loaded event.
  const factory AddingClientEvent.citiesLoaded() = _CitiesLoaded;

  /// countries loaded event.
  const factory AddingClientEvent.countriesLoaded(
    List<CityModel> cities,
  ) = _CountriesLoaded;

  /// The phone number changed event.
  const factory AddingClientEvent.phoneNumberChanged(String phoneNumber) =
      _PhoneNumberChanged;

  /// The first name changed event.
  const factory AddingClientEvent.firstNameChanged(String firstName) =
      _FirstNameChanged;

  /// The last name changed event.
  const factory AddingClientEvent.lastNameChanged(String lastName) =
      _LastNameChanged;

  /// The birthday changed event.
  const factory AddingClientEvent.birthdayChanged(DateTime birthday) =
      _BirthdayChanged;

  /// The city changed event.
  const factory AddingClientEvent.cityChanged(CityModel city) = _CityChanged;

  /// The country  changed event.
  const factory AddingClientEvent.countryChanged(CountryModel country) =
      _CountryChanged;

  /// The gender changed event.
  const factory AddingClientEvent.genderChanged(GenderModel gender) =
      _GenderChanged;

  /// The height changed event.
  const factory AddingClientEvent.heightChanged(String height) = _HeightChanged;

  /// The martial status changed event.
  const factory AddingClientEvent.martialStatusChanged(
    MartialStatusModel martialStatus,
  ) = _MartialStatusChanged;

  /// The child status changed event.
  const factory AddingClientEvent.childStatusChanged(
    ChildStatusModel haveChild,
  ) = _ChildStatusChanged;

  /// The short description changed event.
  const factory AddingClientEvent.shortDescriptionChanged(
    String shortDescription,
  ) = _ShortDescriptionChanged;

  /// Photos  added  event.
  const factory AddingClientEvent.photosAdded() = _PhotosAdded;

  /// Photos updated event.
  const factory AddingClientEvent.photosUpdated(
    List<ImageModel> updatedImages,
  ) = _PhotosUpdated;

  /// Form validation event.
  const factory AddingClientEvent.formIsFilled() = _FormIsFilled;

  /// Button pressed event.
  const factory AddingClientEvent.buttonPressed() = _ButtonPressed;
}

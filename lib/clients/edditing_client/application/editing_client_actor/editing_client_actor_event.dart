part of 'editing_client_actor_bloc.dart';

@freezed
class EditingClientActorEvent with _$EditingClientActorEvent {
  /// The phone number changed event.
  const factory EditingClientActorEvent.initialized(NewClientModel client) =
      _Initialized;

  /// The phone number changed event.
  const factory EditingClientActorEvent.phoneNumberChanged(String phoneNumber) =
      _PhoneNumberChanged;

  /// The first name changed event.
  const factory EditingClientActorEvent.firstNameChanged(String firstName) =
      _FirstNameChanged;

  /// The last name changed event.
  const factory EditingClientActorEvent.lastNameChanged(String lastName) =
      _LastNameChanged;

  /// The birthday changed event.
  const factory EditingClientActorEvent.birthdayChanged(DateTime birthday) =
      _BirthdayChanged;

  /// The city changed event.
  const factory EditingClientActorEvent.cityChanged(CityModel city) =
      _CityChanged;

  /// The country  changed event.
  const factory EditingClientActorEvent.countryChanged(CountryModel country) =
      _CountryChanged;

  /// The gender changed event.
  const factory EditingClientActorEvent.genderChanged(GenderModel gender) =
      _GenderChanged;

  /// The height changed event.
  const factory EditingClientActorEvent.heightChanged(String height) =
      _HeightChanged;

  /// The martial status changed event.
  const factory EditingClientActorEvent.martialStatusChanged(
    MartialStatusModel martialStatus,
  ) = _MartialStatusChanged;

  /// The child status changed event.
  const factory EditingClientActorEvent.childStatusChanged(
    ChildStatusModel haveChild,
  ) = _ChildStatusChanged;

  /// The short description changed event.
  const factory EditingClientActorEvent.shortDescriptionChanged(
    String shortDescription,
  ) = _ShortDescriptionChanged;

  /// Photos added event.
  const factory EditingClientActorEvent.photosAdded() = _PhotosAdded;

  /// Photos updated event.
  const factory EditingClientActorEvent.photosUpdated(
    List<ImageModel> updatedImages,
  ) = _PhotosUpdated;

  /// Editing mode toggled event.
  const factory EditingClientActorEvent.editingModeToggled() =
      _EditingModeToggled;

  /// Form validation event.
  const factory EditingClientActorEvent.formValidated() = _FormValidated;

  /// Updated client submitted event.
  const factory EditingClientActorEvent.updatedClientSubmitted() =
      _UpdatedClientSubmitted;
}

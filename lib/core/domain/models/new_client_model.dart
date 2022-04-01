import 'dart:developer';

import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/models/child_status_model.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/gender_model.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/domain/models/martial_status_model.dart';
import 'package:astra_curator/core/domain/models/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_client_model.freezed.dart';

/// Defines client model.
@freezed
class NewClientModel with _$NewClientModel {
  const NewClientModel._();
  const factory NewClientModel({
    /// Clients's phone number.
    required String phoneNumber,

    /// Clients's first name.
    required String firstName,

    /// Clients's last name.
    required String lastName,

    /// Clients's birthday.
    ///
    /// By default is `null`.
    DateTime? birthday,

    /// Clients's gender.
    required GenderModel gender,

    /// Clients's height.
    required String height,

    /// Clients's status.
    required StatusModel status,

    /// Clients's have child status.
    required ChildStatusModel haveChild,

    /// Clients's martial status.
    required MartialStatusModel martialStatus,

    /// The country where clients is living.
    required CountryModel country,

    /// The city where clients is living.
    required CityModel city,

    /// Clients's sort description.
    required String shortDescription,
    required List<ImageModel> photos,
  }) = _NewClientModel;

  /// Empty .
  factory NewClientModel.empty() => NewClientModel(
        phoneNumber: '',
        firstName: '',
        lastName: '',
        // age: 0,
        city: CityModel.empty(),
        country: CountryModel.empty(),
        haveChild: ChildStatusModel.empty(),
        martialStatus: MartialStatusModel.empty(),
        gender: GenderModel.empty(),
        status: StatusModel.empty(),
        shortDescription: '',
        height: '',
        photos: [],
      );

  /// Whether all fields is not empty.
  bool get allFieldIsFilled {
    return phoneNumber.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        birthday != null &&
        city != CityModel.empty() &&
        martialStatus != MartialStatusModel.empty() &&
        country != CountryModel.empty() &&
        gender != GenderModel.empty() &&
        haveChild != ChildStatusModel.empty() &&
        height.isNotEmpty &&
        shortDescription.isNotEmpty &&
        status != StatusModel.empty() &&
        photos.length >= 3;
  }

  /// Whether all fields is not empty.
  bool get formIsValid {
    return phoneNumber.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        birthday != null &&
        city != CityModel.empty() &&
        martialStatus != MartialStatusModel.empty() &&
        country != CountryModel.empty() &&
        gender != GenderModel.empty() &&
        haveChild != ChildStatusModel.empty() &&
        height.isNotEmpty &&
        shortDescription.length >= 80 &&
        status != StatusModel.empty() &&
        photos.length >= 3;
  }

  factory NewClientModel.fromClient(
    ClientModel client,
    List<CityModel> cities,
    List<CountryModel> countries,
  ) {
    final city = cities.firstWhere((element) => element.title == client.city);
    final country =
        countries.firstWhere((element) => element.title == client.country);
    final _gender = GenderModel(
      value: client.gender == 'M' ? 1 : 2,
      title: client.gender,
    );
    final _status = StatusModel(
      value: client.status == 'В активном поиске' ? 1 : 0,
      title: client.status,
    );
    final _haveChild = ChildStatusModel(
      value: client.haveChild,
      title: client.haveChild == true ? 'Дети есть' : 'Детей нет',
    );
    const _martialStatus = MartialStatusModel(
      value: 0,
      title: 'Холост',
    );
    return NewClientModel(
      phoneNumber: client.phoneNumber,
      firstName: client.firstName,
      lastName: client.lastName,
      gender: _gender,
      height: client.height.toString(),
      status: _status,
      haveChild: _haveChild,
      martialStatus: _martialStatus,
      birthday: client.birthday == null || client.birthday!.isEmpty
          ? DateTime.now()
          : DateTime.parse(client.birthday!),
      country: country,
      city: city,
      shortDescription: client.profileInfo,
      photos: client.profilePhotos,
    );
  }
}

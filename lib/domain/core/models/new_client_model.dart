import 'package:astra_curator/domain/core/models/child_status_model.dart';
import 'package:astra_curator/domain/core/models/city_model.dart';
import 'package:astra_curator/domain/core/models/country_model.dart';
import 'package:astra_curator/domain/core/models/gender_model.dart';
import 'package:astra_curator/domain/core/models/martial_status_model.dart';
import 'package:astra_curator/domain/core/models/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'client_model.freezed.dart';

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
        status != StatusModel.empty();
  }
}

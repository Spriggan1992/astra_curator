import 'package:astra_curator/domain/core/failure/failure.dart';
import 'package:astra_curator/domain/core/models/city_model.dart';
import 'package:astra_curator/domain/core/models/new_client_model.dart';
import 'package:astra_curator/domain/core/models/country_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to [AddingCLientRepository].
abstract class IAddingClientRepository {
  /// Gets cities.
  Future<Either<Failure, List<CityModel>>> getCities();

  /// Gets countries.
  Future<Either<Failure, List<CountryModel>>> getCountries();

  /// Register new user.
  Future<Either<Failure, Unit>> registerNewUser(NewClientModel model);
}

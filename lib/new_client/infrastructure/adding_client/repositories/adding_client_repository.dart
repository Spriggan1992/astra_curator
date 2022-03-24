import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/core/infrastructure/DTOs/city_dto.dart';
import 'package:astra_curator/core/infrastructure/DTOs/country_dto.dart';
import 'package:astra_curator/core/infrastructure/http/api_client.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:astra_curator/new_client/domain/adding_client/i_adding_client_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Defines repository to Adding clients module.
@LazySingleton(as: IAddingClientRepository)
class AddingClientRepository implements IAddingClientRepository {
  final ApiClient _apiClient;

  AddingClientRepository(this._apiClient);

  @override
  Future<Either<Failure, List<CityModel>>> getCities() async {
    return _apiClient.get(
      Endpoints.regions.cities,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => CityDTO.fromJson(e as Map<String, dynamic>).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() async {
    return _apiClient.get(
      Endpoints.regions.countries,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => CountryDTO.fromJson(e as Map<String, dynamic>).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<Failure, Unit>> registerNewUser(NewClientModel model) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(unit);
  }
}

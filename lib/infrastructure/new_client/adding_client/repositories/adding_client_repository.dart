import 'package:astra_curator/domain/adding_client/i_adding_client_repository.dart';
import 'package:astra_curator/domain/core/failure/failure.dart';
import 'package:astra_curator/domain/core/models/city_model.dart';
import 'package:astra_curator/domain/core/models/client_model.dart';
import 'package:astra_curator/domain/core/models/country_model.dart';
import 'package:astra_curator/infrastructure/core/DTOs/city_dto.dart';
import 'package:astra_curator/infrastructure/core/DTOs/country_dto.dart';
import 'package:astra_curator/infrastructure/core/http/endpoints.dart';
import 'package:astra_curator/infrastructure/core/http/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines repository to Adding clients module.
@LazySingleton(as: IAddingClientRepository)
class AddingClientRepository implements IAddingClientRepository {
  // Dio client.
  final Dio _dio;

  AddingClientRepository(this._dio);

  @override
  Future<Either<Failure, List<CityModel>>> getCities() async {
    return makeRequest<List<CityModel>>(() async {
      final response = await _dio.get(Endpoints.regions.cities);
      return (response.data as List<dynamic>)
          .map((e) => CityDTO.fromJson(e as Map<String, dynamic>).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() async {
    return makeRequest<List<CountryModel>>(() async {
      final response = await _dio.get(Endpoints.regions.countries);
      return (response.data as List<dynamic>)
          .map((e) => CountryDTO.fromJson(e as Map<String, dynamic>).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<Failure, Unit>> registerNewUser(ClientModel model) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(unit);
  }
}

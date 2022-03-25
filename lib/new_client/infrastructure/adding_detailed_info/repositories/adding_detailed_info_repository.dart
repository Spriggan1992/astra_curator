import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/new_client_detailed_info_model.dart';
import 'package:astra_curator/new_client/domain/adiing_detailed_info/i_adding_detailed_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines the repository for adding detailed info.
@LazySingleton(as: IAddingDetailedInfoRepository)
class AddingDetailedInfoRepository implements IAddingDetailedInfoRepository {
  // Dio client.
  final Dio _dio;

  AddingDetailedInfoRepository(this._dio);

  @override
  Future<Either<Failure, Unit>> addClientDetailedInfo(
    NewClientDetailedInfoModel model,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(unit);
  }
}
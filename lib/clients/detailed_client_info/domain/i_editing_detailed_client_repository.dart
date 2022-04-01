import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:dartz/dartz.dart';

/// Describe editing detailed client info repository.
abstract class IEditingDetailedClientRepository {
  /// Fetch detailed information about client.
  Future<Either<Failure, ClientDetailedInfoModel>> fetchClientDetailedInfo(
    int id,
  );

  /// Fetch detailed information about client.
  Future<Either<Failure, Unit>> updateClientDetailedInfo(
    int id,
  );
}

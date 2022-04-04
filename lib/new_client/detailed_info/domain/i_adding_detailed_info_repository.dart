import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to [AddingDetailedInfoRepository].
abstract class IAddingDetailedInfoRepository {
  /// Adds detailed information about client to the server.
  ///
  /// The [model] passed to the server.
  Future<Either<Failure, Unit>> addClientDetailedInfo(
    ClientDetailedInfoModel model,
  );
}

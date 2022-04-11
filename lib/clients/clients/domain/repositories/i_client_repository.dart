import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:dartz/dartz.dart';

/// Describe client repository.
abstract class IClientRepository {
  /// Load data from server.
  Future<Either<Failure, PaginationDataModel<List<ClientModel>>?>> getClients(
    PaginationDataModel<List<ClientModel>> model,
  );
}

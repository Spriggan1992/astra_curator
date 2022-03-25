import 'package:astra_curator/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// Interface client repository.
/// Loads data from server methods.
abstract class IClientRepository {
  /// Load data from server.
  Future<Either<Failure, List<ClientModel>>> getClients();

  /// Sort clients by types.
  Future<List<ClientModel>> sortClients(
      SortTypes sortTypes, List<ClientModel> clients);
}

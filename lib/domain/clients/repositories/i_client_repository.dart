import 'package:astra_curator/application/clients/clients_sort_types.dart';
import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// Interface client repository.
/// Loads data from server methods.
abstract class IClientRepository {
  /// Load data from server.
  Future<Either<Failure, List<Client>>> getClients();

  /// Sort clients by types.
  Future<List<Client>> sortClients(SortTypes sortTypes, List<Client> clients);
}

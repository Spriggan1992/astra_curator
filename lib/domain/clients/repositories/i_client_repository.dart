import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// Interface client repository.
/// Loads data from server methods.
abstract class IClientRepository {
  Future<Either<Failure, List<Client>>> getClients();
}

import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Interface client repository.
abstract class IClientRepository {
  Future<Either<AstraFailure, List<Client>>> getClients();
}
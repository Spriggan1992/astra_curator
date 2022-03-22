import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/clients/repositories/i_client_repository.dart';
import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/infrastructure/clients/DTOs/client_DTO.dart';
import 'package:astra_curator/infrastructure/core/http/endpoints.dart';
import 'package:astra_curator/infrastructure/core/http/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Service of clients api methods.
@LazySingleton(as: IClientRepository)
class ClientRepository implements IClientRepository {
  const ClientRepository(this._dio);

  /// Instance ot the dio client.
  final Dio _dio;

  @override
  Future<Either<AstraFailure, List<Client>>> getClients() async {
    return makeRequest<List<Client>>(
      () async {
        /// Repair endpoint.
        final response = await _dio.get(Endpoints.account.cashback as String);

        final _body = response.data as List<dynamic>;

        final _clients = _body.map(
          (client) =>
              ClientDTO.fromJson(client as Map<String, dynamic>).toDomain(),
        );

        return _clients.toList();
      },
    );
  }
}

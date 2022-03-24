import 'package:astra_curator/application/clients/clients_sort_types.dart';
import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/clients/repositories/i_client_repository.dart';
import 'package:astra_curator/domain/core/failure/failure.dart';
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
  Future<Either<Failure, List<ClientModel>>> getClients() async {
    return makeRequest<List<ClientModel>>(
      () async {
        final response = await _dio.get(Endpoints.clients.profiles);
        final _body = response.data as List<dynamic>;
        return _body
            .map(
              (client) =>
                  ClientDTO.fromJson(client as Map<String, dynamic>).toDomain(),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<ClientModel>> sortClients(
      SortTypes sortTypes, List<ClientModel> clients) async {
    if (sortTypes == SortTypes.sortByDate) {
      /// TODO finish when API will be ready.
      return clients;
    } else if (sortTypes == SortTypes.sortById) {
      clients.sort((a, b) => a.id.compareTo(b.id));
      return clients;
    } else if (sortTypes == SortTypes.sortByNameAscending) {
      clients.sort((a, b) => a.firstName.compareTo(b.firstName));
      return clients;
    } else if (sortTypes == SortTypes.sortByNameDescending) {
       clients.sort((a, b) => b.firstName.compareTo(a.firstName));
      return clients;
    } else {
      return clients;
    }
  }
}

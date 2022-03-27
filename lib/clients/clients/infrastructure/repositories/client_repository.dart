import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/clients/clients/domain/repositories/i_client_repository.dart';
import 'package:astra_curator/clients/clients/infrastructure/DTOs/client_DTO.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/infrastructure/http/api_client.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Service of clients api methods.
@LazySingleton(as: IClientRepository)
class ClientRepository implements IClientRepository {
  /// Instance ot the dio client.
  final ApiClient _client;

  const ClientRepository(this._client);

  @override
  Future<Either<Failure, List<ClientModel>>> getClients() async {
    return _client.get(
      Endpoints.clients.profiles,
      responseParser: (response) => (response.data as List<dynamic>)
          .map(
            (client) =>
                ClientDTO.fromJson(client as Map<String, dynamic>).toDomain(),
          )
          .toList(),
    );
  }

  @override
  Future<List<ClientModel>> sortClients(
    SortTypes sortTypes,
    List<ClientModel> clients,
  ) async {
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

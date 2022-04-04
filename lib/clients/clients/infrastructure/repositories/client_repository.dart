import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/clients/clients/domain/repositories/i_client_repository.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/domain/services/i_pagination_service.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_config.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Service of clients api methods.
@LazySingleton(as: IClientRepository)
class ClientRepository implements IClientRepository {
  /// Pagination service.
  final IPaginationService _paginationService;

  ClientRepository(this._paginationService);

  @override
  Future<Either<Failure, PaginationDataModel<List<ClientModel>>?>> getClients(
    PaginationDataModel<List<ClientModel>> model,
  ) {
    return _paginationService.fetchData<ClientModel>(
      model,
      PaginationConfig(url: Endpoints.clients.profiles),
    );
  }
}

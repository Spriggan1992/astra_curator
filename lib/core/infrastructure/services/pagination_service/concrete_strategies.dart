import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/clients/clients/infrastructure/DTOs/client_DTO.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/i_pagination_strategy.dart';

/// Represent realization of pagination strategy for [ClientModel].
class ClientPagination<T> implements IPaginationStrategy {
  @override
  List<ClientModel> parseJson(List<dynamic> jsons) => jsons
      .map((e) => ClientDTO.fromJson(e as Map<String, dynamic>).toDomain())
      .toList();
}

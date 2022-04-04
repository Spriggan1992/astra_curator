import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_config.dart';

import 'mock_client_model.dart';

class MockPaginationDataClient {
  static final PaginationDataModel<List<ClientModel>> paginationModel =
      PaginationDataModel(
    count: 10,
    next: 'next link',
    previous: 'previous link',
    items: [
      MockClientData.client,
    ],
  );

  static const PaginationDataModel<List<ClientModel>> paginationModelEmpty =
      PaginationDataModel(
    count: 0,
    next: '',
    previous: '',
    items: [],
  );
  static final paginationConfig = PaginationConfig(url: 'url');
  static const Failure mockApiFailure = Failure.api();
  static const Failure mockNoConnectionFailure = Failure.noConnection();
}

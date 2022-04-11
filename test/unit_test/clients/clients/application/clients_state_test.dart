import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/mock_data/mock_pagination_data_client.dart';

void main() {
  group('ClientsState', () {
    test('ClientsState ', () {
      expect(
        ClientsState(
          paginationModel: MockPaginationDataClient.paginationModel,
          sortTypes: SortTypes.sortByDate,
          loadingStates: LoadingStatesWithFailure.loading,
          isAvailableToLoad: false,
        ),
        ClientsState(
          paginationModel: MockPaginationDataClient.paginationModel,
          sortTypes: SortTypes.sortByDate,
          loadingStates: LoadingStatesWithFailure.loading,
          isAvailableToLoad: false,
        ),
      );
    });
  });
}

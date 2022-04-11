import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';

import '../../../mock/mock_data/mock_client_model.dart';
import '../../../mock/mock_data/mock_pagination_data_client.dart';

class MockClientStateData {
  static ClientsState state = ClientsState(
    paginationModel: MockPaginationDataClient.paginationModel,
    sortTypes: SortTypes.sortByDate,
    loadingStates: LoadingStatesWithFailure.loading,
    isAvailableToLoad: true,
  );
  static ClientsState initialState = const ClientsState(
    paginationModel: MockPaginationDataClient.paginationModelEmpty,
    sortTypes: SortTypes.initial,
    loadingStates: LoadingStatesWithFailure.initial,
    isAvailableToLoad: true,
  );

  static final ClientsState expectedState = ClientsState(
    paginationModel: MockClientStateData.state.paginationModel.copyWith(
      items: [
        MockClientData.client,
        MockClientData.client,
      ],
    ),
    sortTypes: SortTypes.sortByDate,
    loadingStates: LoadingStatesWithFailure.success,
    isAvailableToLoad: true,
  );

  static final ClientsState expectedStateSortedById = ClientsState(
    paginationModel: MockClientStateData.state.paginationModel.copyWith(
      items: [
        MockClientData.client,
        MockClientData.client,
      ],
    ),
    sortTypes: SortTypes.sortById,
    loadingStates: LoadingStatesWithFailure.success,
    isAvailableToLoad: false,
  );
}

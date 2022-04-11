import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/mock_data/mock_pagination_data_client.dart';
import '../../../../mock/mocks/mock_repositories.dart';
import '../../mock_data/mock_client_state_data.dart';

void main() {
  late MockClientsRepository mockClientsRepository;
  late ClientsBloc clientsBloc;

  setUp(
    () {
      mockClientsRepository = MockClientsRepository();
      clientsBloc = ClientsBloc(mockClientsRepository);
      when(
        () => mockClientsRepository.getClients(
          MockPaginationDataClient.paginationModel,
        ),
      ).thenAnswer(
        (invocation) =>
            Future.value(right(MockPaginationDataClient.paginationModel)),
      );
    },
  );

  tearDown(() {
    clientsBloc.close();
  });

  group('ClientsBloc', () {
    test(
      'initial state is correct',
      () {
        expect(
          clientsBloc.state,
          ClientsState.initial(),
        );
      },
    );

    blocTest<ClientsBloc, ClientsState>(
      'emits ClientsState  when loadClients event is added.',
      seed: () => MockClientStateData.state,
      build: () => clientsBloc,
      act: (bloc) =>
          bloc.add(const ClientsEvent.loadClients(isRefreshItems: false)),
      expect: () => [
        MockClientStateData.state.copyWith(
          sortTypes: SortTypes.sortByDate,
          loadingStates: LoadingStatesWithFailure.loading,
          isAvailableToLoad: false,
        ),
        MockClientStateData.expectedState,
      ],
    );
    blocTest<ClientsBloc, ClientsState>(
      'emits ClientsState when sortClients event is added.',
      setUp: () {},
      wait: const Duration(milliseconds: 200),
      build: () => clientsBloc,
      seed: () => MockClientStateData.expectedStateSortedById.copyWith(
        loadingStates: LoadingStatesWithFailure.initial,
        sortTypes: SortTypes.initial,
      ),
      act: (bloc) =>
          bloc.add(const ClientsEvent.sortClients(SortTypes.sortById)),
      expect: () => [
        MockClientStateData.expectedStateSortedById,
      ],
    );
  });
}

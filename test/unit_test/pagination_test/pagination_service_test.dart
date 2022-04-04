import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_data/mock_pagination_data_client.dart';
import '../../mock/mocks/mock_services.dart';

void main() {
  late MockPaginationService mockPaginationService;

  setUp(() {
    mockPaginationService = MockPaginationService();
  });

  group('PaginationService', () {
    test(
        'fetch pagination model with positive result as `Either right` with correct model',
        () async {
      when(
        () => mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
      ).thenAnswer(
        (invocation) async => right(MockPaginationDataClient.paginationModel),
      );
      expect(
        await mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
        right(MockPaginationDataClient.paginationModel),
      );
    });
    test(
        'fetch pagination model with negative result as a left(no connection failure)',
        () async {
      when(
        () => mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
      ).thenAnswer(
        (invocation) async =>
            left(MockPaginationDataClient.mockNoConnectionFailure),
      );
      expect(
        await mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
        left(MockPaginationDataClient.mockNoConnectionFailure),
      );
    });
    test(
        'fetch pagination model with negative result as a left(unexpected failure)',
        () async {
      when(
        () => mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
      ).thenAnswer(
        (invocation) async => left(MockPaginationDataClient.mockApiFailure),
      );
      expect(
        await mockPaginationService.fetchData(
          MockPaginationDataClient.paginationModel,
          MockPaginationDataClient.paginationConfig,
        ),
        left(MockPaginationDataClient.mockApiFailure),
      );
    });
  });
}

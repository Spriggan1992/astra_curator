import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_config.dart';
import 'package:dartz/dartz.dart';

/// Describe pagination service.
abstract class IPaginationService {
  /// Initialize pagination service variables.
  ///
  /// The initial [url] for loading data.
  /// The pagination configurations.
  // void init(String url, [PaginationConfig? paginationConfig]);

  /// Get pagination data.
  Future<Either<Failure, PaginationDataModel<List<T>>?>> fetchData<T>(
    PaginationDataModel model,
    PaginationConfig paginationConfig,
  );
}

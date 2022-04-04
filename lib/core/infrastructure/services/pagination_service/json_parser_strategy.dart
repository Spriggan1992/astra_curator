import 'package:astra_curator/core/infrastructure/services/pagination_service/i_pagination_strategy.dart';

/// Represent strategy of pagination.
class JsonParserStrategy<T> {
  /// Pagination strategy.
  final IPaginationStrategy strategy;

  JsonParserStrategy(this.strategy);

  /// Execute strategy.
  T executeStrategy(List<dynamic> jsons) => strategy.parseJson(jsons) as T;
}

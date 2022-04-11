import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/concrete_strategies.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/json_parser_strategy.dart';

const _exceptionMessage =
    "Probably you forgot to create concrete a realization of JsonParserStrategy. And also don't forget to add the validation of type to JsonParser class";

/// Represent object that contains the realization of pagination strategy.
class JsonParser<T> {
  /// Pagination strategy.
  late JsonParserStrategy<T> _strategy;

  T parseJson(List<dynamic> jsons) {
    try {
      return _strategy.executeStrategy(jsons);
    } catch (_) {
      throw _exceptionMessage;
    }
  }

  JsonParser() {
    if (T == List<ClientModel>) {
      _strategy = JsonParserStrategy<T>(ClientPagination<T>());
    }
  }
}

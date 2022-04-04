// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/domain/services/i_pagination_service.dart';
import 'package:astra_curator/core/infrastructure/DTOs/pagination_dto.dart';
import 'package:astra_curator/core/infrastructure/http/make_request.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Represent pagination service for loading items.
///
/// Be sure to use method `init` for initialized necessary variables.
@LazySingleton(as: IPaginationService)
class PaginationService implements IPaginationService {
  // Dio client.
  final Dio _dio;
  PaginationService(this._dio);

  bool _isAvailableToLoad = true;

  /// Gets the data from server.
  ///
  /// The [model] that contains information about pagination.
  @override
  Future<Either<Failure, PaginationDataModel<List<T>>?>> fetchData<T>(
    PaginationDataModel model,
    PaginationConfig paginationConfig,
  ) async {
    if (!_isAvailableToLoad) {
      return right(null);
    } else {
      _isAvailableToLoad = false;
      if (model == PaginationDataModel.empty()) {
        // final _paginationConfig = paginationConfig;
        final initialUrl =
            '${paginationConfig.url}${paginationConfig.queryParameters}';
        return _getItemsOrFailure<T>(initialUrl);
      } else {
        final isCannotLoadNextItems =
            (model.next.isEmpty && model.previous.isEmpty) ||
                model.next.isEmpty ||
                (model.items as List).length == model.count;
        if (isCannotLoadNextItems) {
          _isAvailableToLoad = true;
          return right(null);
        } else {
          return _getItemsOrFailure<T>(model.next);
        }
      }
    }
  }

  Future<Either<Failure, PaginationDataModel<List<T>>>> _getItemsOrFailure<T>(
    String url,
  ) async {
    final response = await makeRequest<Response<dynamic>>(() async {
      return _dio.get(url);
    });
    return _parseResponse<T>(response);
  }

  Either<Failure, PaginationDataModel<List<T>>> _parseResponse<T>(
    Either<Failure, Response<dynamic>> responseOrFailure,
  ) {
    _isAvailableToLoad = true;
    return responseOrFailure.fold(
      (failure) => left(failure),
      (response) => right(
        PaginationDTO<List<T>>.fromJson(response.data as Map<String, dynamic>)
            .toDomain(),
      ),
    );
  }
}

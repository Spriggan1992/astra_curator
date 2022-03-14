import 'dart:developer';

import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/infrastructure/auth/extentions/dio_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// The callback request
typedef CallBackRequest<T> = Future<T> Function();

/// Make http request.
///
/// Returns [Either] there left is [AstraFailure] and right is [T].
Future<Either<AstraFailure, T>> makeRequest<T>(
  CallBackRequest callback,
) async {
  try {
    final response = await callback();
    log("$response", name: "success_response");
    return right(response as T);
  } on DioError catch (e) {
    log("${e.message}: ${e.type}; response: ${e.response}", level: 2);
    if (e.isNoConnectionError) {
      log("${e.message}: ${e.type}", level: 2);
      return left(const AstraFailure.noConnection());
    } else {
      log("${e.message}: ${e.type}", level: 2);
      return left(const AstraFailure.api());
    }
  } catch (e) {
    log(e.toString(), level: 2);
    return left(const AstraFailure.api());
  }
}
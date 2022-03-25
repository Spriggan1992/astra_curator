import 'package:astra_curator/auth/infrastructure/repositories/authenticator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Dio interceptor for intercepting request.
@LazySingleton()
class DioInterceptor extends Interceptor {
  /// Service for authentication.
  final Authenticator _authenticator;

  /// Dio client.
  final Dio _dio;

  DioInterceptor(this._dio, this._authenticator);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _authenticator.getSignedToken();
    final modifiedOptions = options
      ..headers.addAll(
        token == null ? {} : {'Authorization': 'Bearer ${token.access}'},
      );

    handler.next(modifiedOptions);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;
    //todo: workaround until backing is ready
    final invalidToken = errorResponse != null;

    if (invalidToken && errorResponse.statusCode == 401) {
      final token = await _authenticator.getSignedToken();

      token != null
          ? await _authenticator.refresh(token.refresh)
          : await _authenticator.clearSecureStorage();

      final refreshedToken = await _authenticator.getSignedToken();
      if (refreshedToken != null) {
        handler.resolve(
          await _dio.fetch(
            errorResponse.requestOptions
              ..headers['Authorization'] = 'bearer $refreshedToken',
          ),
        );
      }
      if (errorResponse.statusCode == 401) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}

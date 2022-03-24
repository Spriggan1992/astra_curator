import 'dart:developer';

import 'package:astra_curator/auth/domain/failures/auth_failure.dart';
import 'package:astra_curator/auth/domain/models/auth_info.dart';
import 'package:astra_curator/auth/domain/repositories/i_auth_api_service.dart';
import 'package:astra_curator/auth/infrastructure/DTOs/auth_info_dto.dart';
import 'package:astra_curator/auth/infrastructure/DTOs/token.dart';
import 'package:astra_curator/auth/infrastructure/extentions/dio_extensions.dart';
import 'package:astra_curator/auth/infrastructure/repositories/authenticator.dart';
import 'package:astra_curator/core/infrastructure/database/secure_strorage/i_secure_storage.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

/// The callback request
typedef CallBackRequest<T> = Future<T> Function();

/// Service of authorization api methods.
@LazySingleton(as: IAuthApiService)
class AuthApiService implements IAuthApiService {
  /// Instance of the authorization service.
  final Authenticator _authenticator;

  /// Instance ot the local storage.
  final ISecureStorage _secureStorage;

  /// Instance ot the dio client.
  final Dio _dio;
  AuthApiService(this._dio, this._secureStorage, this._authenticator);

  @override
  Future<Either<AuthFailure, Unit>> signIn(AuthInfo authInfo) async {
    final result = await _makeRequest<Unit>(() async {
      final response = await _dio.post(
        Endpoints.auth.login,
        data: AuthInfoDTO.fromDomain(authInfo),
      );
      await _secureStorage
          .save(Token.fromJson(response.data as Map<String, dynamic>));
      return unit;
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authInfo) async {
    /// TODO implement when back will be ready.
    return right(unit);
  }

  @override
  Future<bool> isSignIn() async => await _authenticator.isSignedIn();

  @override
  Future<void> signOut() async {
    _secureStorage.clear();
  }

  @override
  Future<Either<AuthFailure, bool>> checkPhoneNumber(String phone) async {
    final result = await _makeRequest<bool>(() async {
      return _dio.post(
        Endpoints.auth.checkPhone,
        data: {"phone_number": phone},
      ).then((value) {
        return value.data['success'];
      });
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  /// Make http request.
  ///
  /// Returns [Either] there left is [AuthFailure] and right is [T].
  Future<Either<AuthFailure, T>> _makeRequest<T>(
    CallBackRequest callback,
  ) async {
    try {
      final callBack = await callback();
      return right(callBack as T);
    } on FormatException catch (e) {
      log("${e.message}: ${e.source}", level: 2);
      return left(const AuthFailure.server("что то пошло не так..."));
    } on PlatformException catch (e) {
      log("${e.message}: ${e.code}", level: 2);
      return left(const AuthFailure.storage());
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return left(const AuthFailure.noConnection());
      }
      log("${e.message}: ${e.type}", level: 2, name: "DioException");
      return left(const AuthFailure.server());
    } catch (e) {
      return left(const AuthFailure.server());
    }
  }
}

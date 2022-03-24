import 'dart:convert';
import 'package:astra_curator/auth/domain/failures/auth_failure.dart';
import 'package:astra_curator/auth/infrastructure/DTOs/token.dart';
import 'package:astra_curator/auth/infrastructure/extentions/dio_extensions.dart';
import 'package:astra_curator/core/infrastructure/database/secure_strorage/i_secure_storage.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

const _access = 'access';
const _refresh = 'refresh';

/// Authorization service.
@lazySingleton
class Authenticator {
  /// Secure storage instance.
  final ISecureStorage _secureStorage;

  Authenticator(this._secureStorage);

  /// Get signed in token.
  ///
  /// Return null if will be thrown [PlatformException] and [FormatException].
  Future<Token?> getSignedToken() async {
    try {
      final token = await _secureStorage.read();
      if (token != null) {
        if (JwtDecoder.isExpired(token.access)) {
          final failureOrToken = await refresh(token.refresh);
          return failureOrToken.fold((l) => null, (r) => r);
        }
      }
      return token;
    } on PlatformException {
      return null;
    } on FormatException {
      return null;
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      }
    }
  }

  /// Check if user already signed in.
  Future<bool> isSignedIn() => getSignedToken().then((token) {
        return token != null;
      });

  Future<Either<AuthFailure, Unit>> clearSecureStorage() async {
    try {
      await _secureStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  /// Refresh access token by refresh token.
  Future<Either<AuthFailure, Token>> refresh(
    String refreshToken,
  ) async {
    try {
      final token = await _getTokenOrNull(refreshToken);
      if (token != null) {
        await _secureStorage.save(token);
        return right(token);
      } else {
        return left(const AuthFailure.server());
      }
    } on FormatException {
      return left(const AuthFailure.server());
    } on DioError catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.message}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Token?> _getTokenOrNull(String refreshToken) async {
    final request =
        http.MultipartRequest("POST", Uri.parse(Endpoints.auth.refreshToken))
          ..fields[_refresh] = refreshToken;
    final http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 401) {
      return null;
    } else {
      final Map<String, dynamic> jsonData =
          json.decode(response.body) as Map<String, dynamic>;
      return Token(access: jsonData[_access] as String, refresh: refreshToken);
    }
  }
}

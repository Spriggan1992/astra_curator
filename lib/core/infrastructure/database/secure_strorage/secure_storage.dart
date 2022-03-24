import 'package:astra_curator/auth/infrastructure/DTOs/token.dart';
import 'package:astra_curator/core/infrastructure/database/secure_strorage/i_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Defines secure storage for saving token.
@LazySingleton(as: ISecureStorage)
class SecureStorage implements ISecureStorage {
  /// Secure storage instance.
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  static const _refreshToken = 'refreshToken';
  static const _accessToken = 'accessToeken';

  @override
  Future<Token?> read() async {
    final acessToken = await _storage.read(key: _accessToken);
    final refreshToken = await _storage.read(key: _refreshToken);
    if (refreshToken == null || acessToken == null) {
      return null;
    } else {
      return Token(access: acessToken, refresh: refreshToken);
    }
  }

  @override
  Future<void> save(Token token) async {
    await _storage.write(key: _accessToken, value: token.access);
    await _storage.write(key: _refreshToken, value: token.refresh);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

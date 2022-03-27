import 'package:astra_curator/auth/core/infrastructure/DTOs/token.dart';
import 'package:astra_curator/auth/core/infrastructure/secure_strorage/i_secure_storage.dart';
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
    final acesToken = await _storage.read(key: _accessToken);
    final refreshToken = await _storage.read(key: _refreshToken);
    if (refreshToken == null || acesToken == null) {
      return null;
    } else {
      return Token(access: acesToken, refresh: refreshToken);
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

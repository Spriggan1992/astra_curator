import 'package:astra_curator/auth/core/infrastructure/DTOs/token.dart';

/// Describe method of secure storage.

abstract class ISecureStorage {
  /// Get token.
  Future<Token?> read();

  /// Save token.
  Future<void> save(Token token);

  /// Clear storage.
  Future<void> clear();
}

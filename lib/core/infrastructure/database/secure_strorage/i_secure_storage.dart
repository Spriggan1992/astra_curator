/// Describe method of secure storage.
import 'package:astra_curator/auth/infrastructure/DTOs/token.dart';

abstract class ISecureStorage {
  /// Get token.
  Future<Token?> read();

  /// Save token.
  Future<void> save(Token token);

  /// Clear storage.
  Future<void> clear();
}

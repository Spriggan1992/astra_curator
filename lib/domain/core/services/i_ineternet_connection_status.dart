/// Describe service for getting information about an internet connection.
abstract class IInternetConnectionService {
  /// Subscribe to listen stream if there has internet connection.
  Stream<bool> subscribeConnection();

  /// Get true if hase internet connection.
  bool get hasConnection;

  /// Dispose [InternetConnectionChecker].
  Future<void> dispose();
}

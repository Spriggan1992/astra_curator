/// Enumeration of loading client states.
enum ClientUpdatedLoadingState {
  /// Nothing happened yet.
  initial,

  /// Data in progress loading.
  loading,

  ///  The [Failure.api] is happened;
  noConnection,

  /// The [Failure.noConnection] is happened;
  unexpected,

  /// Data successfully loaded.
  success,
}

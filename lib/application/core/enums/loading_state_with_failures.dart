/// Enumeration of loading data statuses with failure.
enum LoadingStatesWithFailure {
  /// Nothing happened yet.
  initial,

  /// Data in progress loading.
  loading,

  ///  The [Failure.api] is happened;
  noConnectionFailure,

  /// The [Failure.noConnection] is happened;
  unexpectedFailure,

  /// Data successfully loaded.
  success,
}

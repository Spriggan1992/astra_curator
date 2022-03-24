/// Represent enumeration statuses of loading chats.
enum ChatLoadingStatuses {
  /// Initial status.
  initial,

  /// Status of loading chats.
  loading,

  /// Unexpected status failure.
  unexpectedFailure,

  /// Status of lack internet connection.
  connectionFailure,

  /// Status of successfully deleted chats.
  success,
}

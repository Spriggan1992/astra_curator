/// Represents chat open statuses.
enum ChatOpeningStatuses {
  /// Initial state of opening chat.
  initial,

  /// In the process of opening a chat.
  loading,

  /// Failed to open chat.
  failure,

  /// Successfully opened chat.
  success,
}

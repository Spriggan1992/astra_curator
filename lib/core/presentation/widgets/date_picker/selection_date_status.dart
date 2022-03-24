/// Represent  enumeration of selection date statuses.
enum SelectionDateStatus {
  /// Initial status.
  ///
  /// Indicates that the user has not yet selected date.
  initial,

  /// Failure status.
  ///
  /// Indicates that the date has not been selected.
  failure,

  /// Success status.
  ///
  /// Indicates that the date has  been selected.
  success,
}

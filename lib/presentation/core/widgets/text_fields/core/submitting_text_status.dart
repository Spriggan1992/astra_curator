/// Represent  enumeration of submitting statuses.
enum SubmittingTextStatus {
  /// Initial status.
  ///
  /// Indicates that the user has not yet entered a value from the keyboard.
  initial,

  /// Failure status.
  ///
  /// Indicates that the input value has not been  successfully validated.
  failure,

  /// Success status.
  ///
  /// Indicates that the input value has been successfully validated.
  success,
}

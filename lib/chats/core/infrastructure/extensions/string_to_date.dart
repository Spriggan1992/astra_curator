// Represent date time converter.
extension DateTimeConverter on String {
  /// Convert date time as string from server to [DateTime].
  DateTime get stringToDateTime => DateTime.parse(this);
}

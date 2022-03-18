import 'package:astra_curator/domain/core/failure/failure.dart';

/// Enumeration of failures.
enum AstraFailures {
  /// Failure is not happened yet.
  initial,

  /// The [Failure.api] is happened;
  unexpected,

  /// The [Failure.noConnection] is happened;
  noConnection,
}

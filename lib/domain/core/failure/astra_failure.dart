import 'package:freezed_annotation/freezed_annotation.dart';
part 'astra_failure.freezed.dart';

/// Represent union of astra failure.
@freezed
class AstraFailure with _$AstraFailure {
  const AstraFailure._();
  const factory AstraFailure.api([int? errorCode]) = _Api;
  const factory AstraFailure.noConnection() = _NoConnection;
}

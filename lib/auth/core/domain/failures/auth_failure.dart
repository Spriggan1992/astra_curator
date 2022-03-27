import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Represent union of authorization failures.
@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  /// Returns server error.
  const factory AuthFailure.server([String? message]) = _Server;

  /// Returns storage error.
  const factory AuthFailure.storage() = _Storage;

  /// Returns no connection error.
  const factory AuthFailure.noConnection() = _NoConnection;
}

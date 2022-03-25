part of 'auth_bloc.dart';

/// Describe event authorization.
@freezed
abstract class AuthEvent with _$AuthEvent {
  /// Check authorization event.
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;

  /// Sign out event.
  const factory AuthEvent.signedOut() = SignedOut;
}

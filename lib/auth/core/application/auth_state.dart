part of 'auth_bloc.dart';

/// State of authentication.
@freezed
class AuthState with _$AuthState {
  /// State of initial loading.
  const factory AuthState.initial() = _Initial;

  /// State of authenticated user.
  const factory AuthState.authenticated() = _Authenticated;

  /// State of unauthenticated user.
  const factory AuthState.unauthenticated() = _Unauthenticated;
}

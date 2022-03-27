import 'package:astra_curator/auth/core/domain/failures/auth_failure.dart';
import 'package:astra_curator/auth/core/domain/models/auth_info.dart';
import 'package:dartz/dartz.dart';

/// Describe authorization api methods.
abstract class IAuthApiService {
  /// Sign up user in the system
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authInfo);

  /// Sign in user in the system.
  Future<Either<AuthFailure, Unit>> signIn(AuthInfo authInfo);

  /// Check if user is sign in.
  Future<bool> isSignIn();

  /// Check [phone] if number has already been registered.
  Future<Either<AuthFailure, bool>> checkPhoneNumber(String phone);

  /// Sign out user.
  Future<void> signOut();
}

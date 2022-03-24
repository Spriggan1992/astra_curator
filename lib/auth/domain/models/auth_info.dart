import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';

/// Represents information about a user.
@freezed
class AuthInfo with _$AuthInfo {
  const AuthInfo._();
  const factory AuthInfo({
    /// Phone number.
    required String phoneNumber,

    /// Password.
    required String password,
  }) = _AuthInfo;

  /// Returns an empty user information.
  factory AuthInfo.empty() => const AuthInfo(
        phoneNumber: "",
        password: "",
      );
}

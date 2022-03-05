import 'package:freezed_annotation/freezed_annotation.dart';
part 'token.freezed.dart';
part 'token.g.dart';

/// Represent token model(union).
@freezed
class Token with _$Token {
  const Token._();
  const factory Token({
    /// Access token for a access to app.
    required String access,

    /// Refresh token for exchanging access token.
    required String refresh,
  }) = _Token;

  /// Return converted token from json.
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  /// Return converted token as a json.
  factory Token.toJson() => Token.toJson();
}

import 'package:astra_curator/infrastructure/core/http/server_address.dart';

class Endpoints {
  static get auth => _AuthEndpoints();
}

final String _address = ServerAddress().relevant;
final String relevantAdress = ServerAddress().imageAdress;

class _AuthEndpoints {
  String get checkPhone => _address + "curator/auth/phone/check/";
  String get login => _address + "curator/auth/login/";
  String get passwordReset => _address + "user/auth/reset/create/";
  String get checkSmsCode => _address + "user/auth/reset/check/";
  String get resetPassword => _address + "user/auth/reset/password/";
  String get refreshToken => _address + "users/auth/jwt/refresh/";
}

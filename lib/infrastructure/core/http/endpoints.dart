import 'package:astra_curator/infrastructure/core/http/server_address.dart';

class Endpoints {
  static get auth => _AuthEndpoints();
  static get account => _AccountEndPoints();
}

final String _address = ServerAddress().relevant;
final String relevantAdress = ServerAddress().imageAdress;

class _AuthEndpoints {
  String get checkPhone => _address + "curator/auth/phone/check/";
  String get login => _address + "curator/auth/login/";
  String get refreshToken => _address + "users/auth/jwt/refresh/";
}

class _AccountEndPoints {
  String get cashback => _address + "curator/cashback/";
  String get cashbackHistory => _address + "curator/cashback/history/";
  String get withdraw => _address + "curator/cashback/withdraw/";
  String get withdrawHistory => _address + "curator/cashback/withdraw/history/";
  String historyByPeriod(String beginDate, String endDate) => _address + "curator/cashback/history/?date_from=${beginDate}&date_to=${endDate}";
}

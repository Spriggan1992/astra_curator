import 'package:astra_curator/infrastructure/core/http/server_address.dart';

// ignore: avoid_classes_with_only_static_members
class Endpoints {
  static _AuthEndpoints get auth => _AuthEndpoints();
  static _AccountEndPoints get account => _AccountEndPoints();
  static _AddingClientEndpoints get regions => _AddingClientEndpoints();
  static String get imageAddress => relevantAddress;
}

final String _address = ServerAddress().relevant;
final String relevantAddress = ServerAddress().imageAddress;

class _AuthEndpoints {
  String get checkPhone => "${_address}curator/auth/phone/check/";
  String get login => "${_address}curator/auth/login/";
  String get refreshToken => "${_address}users/auth/jwt/refresh/";
}

class _AccountEndPoints {
  String get cashback => "${_address}curator/cashback/";
  String get cashbackHistory => "${_address}curator/cashback/history/";
  String get withdraw => "${_address}curator/cashback/withdraw/";
  String get withdrawHistory => "${_address}curator/cashback/withdraw/history/";
  String historyByPeriod(String beginDate, String endDate) =>
      "${_address}curator/cashback/history/?date_from=${beginDate}&date_to=${endDate}";
}

class _AddingClientEndpoints {
  String get cities => "${_address}curator/regions/city/";
  String get countries => "${_address}curator/regions/country/";
}

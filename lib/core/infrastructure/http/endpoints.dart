import 'package:astra_curator/core/infrastructure/http/server_address.dart';

// ignore: avoid_classes_with_only_static_members
class Endpoints {
  static _AuthEndpoints get auth => _AuthEndpoints();
  static _AccountEndPoints get account => _AccountEndPoints();
  static _AddingClientEndpoints get regions => _AddingClientEndpoints();
  static _ChatEndpoints get chat => _ChatEndpoints();
  static _SignalsEndpoints get signals => _SignalsEndpoints();
  static String get imageAddress => relevantAddress;
  static _Clients get clients => _Clients();
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
      "${_address}curator/cashback/history/?date_from=$beginDate&date_to=$endDate";
}

class _AddingClientEndpoints {
  String get cities => "${_address}curator/regions/city/";
  String get countries => "${_address}curator/regions/country/";
}

class _Clients {
  String get profiles => "${_address}curator/profiles/";
}

class _ChatEndpoints {
  String get chats => "${_address}curator/chat/";
  String getMessages(int id) => "${_address}curator/chat/$id/";
  String sendMessage(int id) => "${_address}curator/chat/$id/send/";
  String deleteChat(int id) => "${_address}curator/chat/delete/$id/";
  String get curatorChat => "${_address}curator/chat/curator/";
  String read(int id) => "${_address}curator/chat/$id/read/";
  String openChat(int userId) => "${_address}curator/chat/with/$userId/";
}

class _SignalsEndpoints {
  String get users => "${_address}user/signal/topic/profile/";
  String get chats => "${_address}curator/topic/chats/";
  String chat(int chatId) => "${_address}curator/topic/chat/$chatId/";
}

import 'dart:async';
import 'dart:developer';

import 'package:astra_curator/core/domain/services/i_internet_connection_status.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Represent service for getting information about an internet connection.
@LazySingleton(as: IInternetConnectionService)
class InternetConnectionService implements IInternetConnectionService {
  bool _hasConnection = false;

  @override
  get hasConnection => _hasConnection;

  InternetConnectionChecker? checker;

  @override
  Stream<bool> subscribeConnection() async* {
    checker = InternetConnectionChecker();
    yield* checker!.onStatusChange.map(
      (status) {
        _hasConnection = status == InternetConnectionStatus.connected;
        return _hasConnection;
      },
    ).handleError(
      (e) {
        log(e.toString(), name: 'INTERNET_SUBSCRIPTION_ERROR', level: 2);
        return false;
      },
    );
  }

  @override
  Future<void> dispose() async {
    checker = null;
  }
}

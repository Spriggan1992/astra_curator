// ignore_for_file: avoid_classes_with_only_static_members, avoid_redundant_argument_values

import 'package:dart_amqp/dart_amqp.dart';

const _port = 5672;

/// Represent settings connection for [SubscriptionService].
class SubscriptionConnectionSettings {
  /// Connection settings.
  static final ConnectionSettings settings = ConnectionSettings(
    host: '92.255.108.56',
    port: _port,
    authProvider: const PlainAuthenticator("user", "password"),
  );
}

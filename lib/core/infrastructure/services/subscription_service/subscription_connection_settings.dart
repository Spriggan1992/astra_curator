// ignore_for_file: avoid_classes_with_only_static_members

import 'package:dart_amqp/dart_amqp.dart';

/// Represent settings connection for [SubscriptionService].
class SubscriptionConnectionSettings {
  /// Connection settings.
  static final ConnectionSettings settings = ConnectionSettings(
    host: '92.255.108.56',
    port: 5672,
    authProvider: const PlainAuthenticator("user", "password"),
  );
}

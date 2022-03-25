import 'dart:async';

import 'package:astra_curator/injection.dart';
import 'package:dart_amqp/dart_amqp.dart';

const _exchangeName = 'topic_user';

/// Represent service for subscription and listening signals from server.
///
/// After initialization of this service must to be call `init` method.
class SubscriptionService {
  SubscriptionService(
    this._topics,
  );

  /// Topics for subscription.
  final List<String> _topics;

  /// AMPQ client.
  final Client _client = getIt<Client>();

  /// Consumer.
  Consumer? _consumer;
  // A controller with the stream it controls.
  final StreamController<AmqpMessage> _controller =
      StreamController.broadcast();

  /// Subscription for listening signals.
  Stream<AmqpMessage> get subscription => _controller.stream;

  /// Explicit initialization of [SubscriptionService].
  Future<void> init() async {
    final Channel channel = await _client.channel();
    final Exchange exchange =
        await channel.exchange(_exchangeName, ExchangeType.TOPIC);
    _consumer = await exchange.bindPrivateQueueConsumer(_topics);
    _listenSignals();
  }

  Future<void> _listenSignals() async {
    _consumer!.listen(
      (message) {
        _controller.sink.add(message);
      },
    );
  }

  /// Be sure to call this method when do not need to listen signals anymore.
  Future<void> dispose() async {
    await _consumer?.cancel();
    await _controller.close();
  }
}

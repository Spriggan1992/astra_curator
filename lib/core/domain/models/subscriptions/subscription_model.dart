import 'package:astra_curator/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_model.freezed.dart';

/// Defines subscription model.
@freezed
class SubscriptionModel<T>
    with _$SubscriptionModel<T>
    implements ISubscriptionModel {
  const SubscriptionModel._();
  const factory SubscriptionModel({
    /// The name of topic for listening signal.
    @override required String topicName,

    /// Item what will be obtain by signal.
    T? item,
  }) = _SubscriptionModel<T>;
}

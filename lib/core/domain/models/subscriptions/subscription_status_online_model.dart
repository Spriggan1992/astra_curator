import 'package:astra_curator/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_status_online_model.freezed.dart';

/// Defines subscription user status online model.
@freezed
class SubscriptionStatusOnlineModel
    with _$SubscriptionStatusOnlineModel
    implements ISubscriptionModel {
  const SubscriptionStatusOnlineModel._();
  const factory SubscriptionStatusOnlineModel({
    /// Topic name for listening updates.
    @override required String topicName,

    /// Whether the user online.
    required bool isOnline,
  }) = _SubscriptionStatusOnlineModel;

  /// Empty model.
  factory SubscriptionStatusOnlineModel.empty() =>
      const SubscriptionStatusOnlineModel(
        isOnline: false,
        topicName: '',
      );
}

import 'package:astra_curator/chats/domain/models/message_model.dart';
import 'package:astra_curator/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_message_model.freezed.dart';

/// Defines subscription model that
@freezed
class SubscriptionMessageModel
    with _$SubscriptionMessageModel
    implements ISubscriptionModel {
  const SubscriptionMessageModel._();
  const factory SubscriptionMessageModel({
    /// Topic name for listening updates.
    @override required String topicName,

    /// Message information.
    required MessageModel messageModel,
  }) = _SubscriptionMessageModel;

  /// Empty model.
  factory SubscriptionMessageModel.empty() => SubscriptionMessageModel(
        messageModel: MessageModel.empty(),
        topicName: '',
      );
}

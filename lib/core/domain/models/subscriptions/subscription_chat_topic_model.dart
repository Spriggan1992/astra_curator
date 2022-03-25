import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_chat_topic_model.freezed.dart';

/// Defines subscription model that keep topic for listening signals.
@freezed
class SubscriptionChatTopicModel with _$SubscriptionChatTopicModel {
  const SubscriptionChatTopicModel._();

  const factory SubscriptionChatTopicModel({
    /// Topic for listening signal.
    required String topic,
  }) = _SubscriptionChatTopicModel;

  /// Empty model.
  factory SubscriptionChatTopicModel.empty() =>
      const SubscriptionChatTopicModel(topic: '');
}

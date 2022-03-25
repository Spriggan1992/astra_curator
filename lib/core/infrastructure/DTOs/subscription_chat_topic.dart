// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/subscriptions/subscription_chat_topic_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_chat_topic.freezed.dart';
part 'subscription_chat_topic.g.dart';

///Defines
@freezed
class SubscriptionChatTopicDTO with _$SubscriptionChatTopicDTO {
  const SubscriptionChatTopicDTO._();

  const factory SubscriptionChatTopicDTO({
    @JsonKey(name: 'topics') required String topic,
  }) = _SubscriptionChatTopicDTO;

  /// Return converted DTO from json.
  factory SubscriptionChatTopicDTO.fromDomain(SubscriptionChatTopicModel _) {
    return SubscriptionChatTopicDTO(topic: _.topic);
  }

  // Convert DTO to domain.
  SubscriptionChatTopicModel toDomain() =>
      SubscriptionChatTopicModel(topic: topic);

  // Return converted DTO from json.
  factory SubscriptionChatTopicDTO.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionChatTopicDTOFromJson(json);

  // Convert object to json.
  factory SubscriptionChatTopicDTO.toJson() {
    return SubscriptionChatTopicDTO.toJson();
  }
}

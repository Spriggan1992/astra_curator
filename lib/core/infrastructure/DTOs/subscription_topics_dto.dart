// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_topics_dto.freezed.dart';
part 'subscription_topics_dto.g.dart';

/// Defines subscriptions topics date transfer object.
@freezed
class SubscriptionTopicsDTO with _$SubscriptionTopicsDTO {
  const SubscriptionTopicsDTO._();

  const factory SubscriptionTopicsDTO({
    /// Topics for listening changes.
    @JsonKey(name: 'topics') required List<String> topics,
  }) = _SubscriptionTopicsDTO;

  /// Return converted DTO from json.
  factory SubscriptionTopicsDTO.fromDomain(SubscriptionTopicsModel _) {
    return SubscriptionTopicsDTO(topics: _.topics);
  }

// Convert DTO to domain.
  SubscriptionTopicsModel toDomain() => SubscriptionTopicsModel(topics: topics);

// Return converted DTO from json.
  factory SubscriptionTopicsDTO.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionTopicsDTOFromJson(json);

// Convert object to json.
  factory SubscriptionTopicsDTO.toJson() {
    return SubscriptionTopicsDTO.toJson();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscription_topics_model.freezed.dart';

/// Defines model of subscription topics.
@freezed
class SubscriptionTopicsModel with _$SubscriptionTopicsModel {
  const SubscriptionTopicsModel._();

  const factory SubscriptionTopicsModel({
    /// Topics for listening changes.
    required List<String> topics,
  }) = _SubscriptionTopicsModel;

  /// Empty model of subscription topics.
  factory SubscriptionTopicsModel.empty() => const SubscriptionTopicsModel(
        topics: [],
      );
}

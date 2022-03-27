import 'package:astra_curator/chats/chats/domain/models/chat_model.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_model.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to Chats.
abstract class IChatsRepository {
  /// Get chats for the current user
  Future<Either<Failure, List<ChatModel>>> getChats();

  /// Subscribes to receive changes in chats.
  Stream<Either<Failure, SubscriptionModel<Unit>>> subscribeToChatsUpdates(
    SubscriptionTopicsModel topicsModel,
  );

  /// Deletes chat by [chatId].
  Future<Either<Failure, Unit>> deleteChat(int chatId);

  /// Get topics for subscription.
  Future<Either<Failure, SubscriptionTopicsModel>> getTopics();

  /// Dispose data if service don't use anymore.
  Future<void> dispose();
}

import 'package:astra_curator/chats/domain/models/pagination_chat_model.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:dartz/dartz.dart';

/// Describe chat repository.
abstract class IChatRepository {
  /// Load chat history for the chat with [chatId].
  Future<Either<Failure, PaginationChatModel>> getChatHistory(
    int chatId, [
    int offset,
  ]);

  /// Subscribes to update chats obtaining from server.
  Stream<Either<Failure, ISubscriptionModel>> subscribeToChatsUpdates(
    int chatId,
  );

  /// Read message when get message from server.
  Future<Either<Failure, Unit>> readMessage(int chatId);

  /// Send message to the server.
  Future<Either<Failure, Unit>> sendMessage(int chatId, String message);

  /// Dispose [SubscriptionService] if not use anymore.
  Future<void> dispose();
}

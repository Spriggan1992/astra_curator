import 'dart:developer';

import 'package:astra_curator/chats/domain/models/chats_model.dart';
import 'package:astra_curator/chats/domain/repositories/i_chats_repository.dart';
import 'package:astra_curator/chats/infrastructure/DTOs/chat_dto.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_model.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_topics_model.dart';
import 'package:astra_curator/core/infrastructure/DTOs/subscription_topics_dto.dart';
import 'package:astra_curator/core/infrastructure/http/api_client.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:astra_curator/core/infrastructure/http/make_request.dart';
import 'package:astra_curator/core/infrastructure/services/subscription_service/subscription_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Represent repository for chats.
@LazySingleton(as: IChatsRepository)
class ChatsRepository implements IChatsRepository {
  /// Dio client.
  final ApiClient _client;

  // Service for subscription and listening signals from server.
  SubscriptionService? _subscriptionService;

  ChatsRepository(this._client);
  @override
  Future<Either<Failure, List<ChatModel>>> getChats() async {
    return _client.get(
      Endpoints.chat.chats,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ChatDTO.fromJson(e as Map<String, dynamic>).toDomain())
          .toList(),
    );
  }

  @override
  Stream<Either<Failure, SubscriptionModel<Unit>>> subscribeToChatsUpdates(
    SubscriptionTopicsModel topicsModel,
  ) async* {
    _subscriptionService = SubscriptionService(topicsModel.topics);
    await _subscriptionService!.init();
    yield* _subscriptionService!.subscription.map((snapshot) {
      log(snapshot.payloadAsString, name: 'SNAPSHOT');
      return right(SubscriptionModel<Unit>(topicName: snapshot.routingKey!));
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteChat(int chatId) async {
    return makeRequest<Unit>(() async {
      return _client.delete(
        Endpoints.chat.deleteChat(chatId),
        responseParser: (response) => unit,
      );
    });
  }

  @override
  Future<Either<Failure, SubscriptionTopicsModel>> getTopics() async {
    return _client.post(
      Endpoints.signals.chats,
      responseParser: (response) => SubscriptionTopicsDTO.fromJson(
        response.data as Map<String, dynamic>,
      ).toDomain(),
    );
  }

  @override
  Future<void> dispose() async {
    await _subscriptionService?.dispose();
  }
}

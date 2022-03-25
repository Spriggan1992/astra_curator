import 'dart:async';

import 'package:astra_curator/chats/domain/models/chats_model.dart';
import 'package:astra_curator/chats/domain/models/message_model.dart';
import 'package:astra_curator/chats/domain/models/pagination_chat_model.dart';
import 'package:astra_curator/chats/domain/repositories/i_chat_repository.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/subscriptions/i_subscription_model.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_message_model.dart';
import 'package:astra_curator/core/domain/models/subscriptions/subscription_status_online_model.dart';
import 'package:astra_curator/core/domain/services/i_internet_connection_status.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepo;
  final IInternetConnectionService _internetConnectionService;
  StreamSubscription<Either<Failure, ISubscriptionModel>>? _subscription;
  StreamSubscription<dynamic>? _internetConnectionSubscription;
  ChatBloc(
    this._internetConnectionService,
    this._chatRepo,
  ) : super(ChatState.initial()) {
    on<ChatEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                loadingStates: LoadingStatesWithFailure.loading,
              ),
            );
            final response = await _chatRepo.getChatHistory(e.chatModel.id);
            response.fold(
              (failure) => emit(
                failure.map(
                  api: (_) => state.copyWith(
                    loadingStates: LoadingStatesWithFailure.unexpectedFailure,
                  ),
                  noConnection: (_) => state.copyWith(
                    loadingStates: LoadingStatesWithFailure.noConnectionFailure,
                  ),
                ),
              ),
              (paginationResult) {
                emit(
                  state.copyWith(
                    paginationResult: paginationResult,
                    chatId: e.chatModel.id,
                    isOnline: e.chatModel.isOnline,
                    loadingStates: LoadingStatesWithFailure.success,
                  ),
                );
                add(const ChatEvent.chatRead());
              },
            );

            add(const ChatEvent.internetConnectionStartedWatch());
          },
          chatStartedWatch: (e) async {
            _subscription =
                _chatRepo.subscribeToChatsUpdates(state.chatId).listen(
              (snapshot) {
                snapshot.fold(
                  (failure) => failure.map(
                    api: (_) => state.copyWith(
                      loadingStates: LoadingStatesWithFailure.unexpectedFailure,
                    ),
                    noConnection: (_) => state.copyWith(
                      loadingStates:
                          LoadingStatesWithFailure.noConnectionFailure,
                    ),
                  ),
                  (subscription) {
                    if (subscription is SubscriptionMessageModel) {
                      add(ChatEvent.chatReceived(subscription));
                    }
                    if (subscription is SubscriptionStatusOnlineModel) {
                      add(ChatEvent.statusOnlineReceived(subscription));
                    }
                  },
                );
              },
            );
          },
          internetConnectionStartedWatch: (e) async {
            _internetConnectionSubscription =
                _internetConnectionService.subscribeConnection().listen(
              (hasConnection) async {
                add(
                  ChatEvent.internetConnectionStatusConnectionChanged(
                    hasConnection,
                  ),
                );
                if (hasConnection) {
                  add(const ChatEvent.chatStartedWatch());
                }
              },
            );
          },
          statusOnlineReceived: (e) async {
            emit(state.copyWith(isOnline: e.onlineStatus.isOnline));
          },
          chatReceived: (e) async {
            final updatedMessages = _setMessages(
              state.paginationResult.chatMessages.messages,
              e.message.messageModel,
            );
            emit(
              state.copyWith(
                paginationResult: state.paginationResult.copyWith(
                  chatMessages: state.paginationResult.chatMessages
                      .copyWith(messages: updatedMessages),
                ),
              ),
            );
            add(const ChatEvent.chatRead());
          },
          chatRead: (e) async {
            await _chatRepo.readMessage(state.chatId);
          },
          messageSent: (e) async {
            final response =
                await _chatRepo.sendMessage(state.chatId, e.message);
            response.fold(
              (failure) => failure.map(
                api: (_) => null,
                noConnection: (_) => emit(
                  state.copyWith(hasConnection: false),
                ),
              ),
              (_) => emit(
                state.copyWith(hasConnection: true),
              ),
            );
          },
          internetConnectionStatusConnectionChanged: (e) async {
            emit(state.copyWith(hasConnection: e.hasConnection));
          },
          nextMessagesLoaded: (e) async {
            emit(
              state.copyWith(
                isNextMessagesLoaded: true,
                isAvailableToLoad: false,
              ),
            );
            final offset = await _getOffset(
              state.paginationResult.count,
              state.paginationResult.chatMessages.messages.length,
              state.offset,
            );
            if (offset != 0) {
              final response =
                  await _chatRepo.getChatHistory(state.chatId, offset);
              emit(
                response.fold(
                  (l) => state.copyWith(),
                  (r) {
                    return state.copyWith(
                      paginationResult: state.paginationResult.copyWith(
                        chatMessages:
                            state.paginationResult.chatMessages.copyWith(
                          messages: [
                            ...state.paginationResult.chatMessages.messages,
                            ...r.chatMessages.messages
                          ],
                        ),
                      ),
                      isNextMessagesLoaded: false,
                      isAvailableToLoad: true,
                    );
                  },
                ),
              );
            } else {
              emit(
                state.copyWith(
                  isNextMessagesLoaded: false,
                  isAvailableToLoad: true,
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<int> _getOffset(
    int totalCount,
    int loadedAmountMessages,
    int currentOffset,
  ) async {
    if ((totalCount - loadedAmountMessages) > 20) {
      return loadedAmountMessages + 20;
    } else if (totalCount <= loadedAmountMessages ||
        (totalCount - loadedAmountMessages) == 20) {
      return 0;
    } else {
      return totalCount - loadedAmountMessages;
    }
  }

  List<MessageModel> _setMessages(
    List<MessageModel> initialMessages,
    MessageModel message,
  ) {
    final List<MessageModel> messages = List.from(initialMessages);
    messages.insert(0, message);
    return messages;
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _internetConnectionSubscription?.cancel();
    await _internetConnectionService.dispose();
    return super.close();
  }
}

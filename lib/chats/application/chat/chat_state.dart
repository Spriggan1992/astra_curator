part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    /// Loading states.
    required LoadingStatesWithFailure loadingStates,

    /// Chat messages.
    required PaginationChatModel paginationResult,

    /// Chat id.
    required int chatId,

    /// Flag responsible internet connection state.
    required bool hasConnection,

    /// Flag responsible whether messages already loaded or not.
    required bool isNextMessagesLoaded,

    /// Flag responsible for whether can load next messages or not.
    required bool isAvailableToLoad,

    /// Topic for subscribe to listen change online status.
    required String topicOnlineStatus,

    /// Whether the target user is online or not.
    required bool isOnline,

    /// The parameter of offset of messages loaded.
    required int offset,
  }) = _ChatWatcherState;
  factory ChatState.initial() => ChatState(
        loadingStates: LoadingStatesWithFailure.initial,
        paginationResult: PaginationChatModel.empty(),
        chatId: 0,
        hasConnection: true,
        isNextMessagesLoaded: false,
        isAvailableToLoad: true,
        topicOnlineStatus: '',
        isOnline: false,
        offset: 0,
      );
}

part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({
    /// List of chat models.
    required List<ChatModel> chats,

    /// Statuses of loading chats.
    required LoadingStatesWithFailure loadingStatuses,

    /// Status of deleting chat.
    required DeleteStatus deleteStatus,

    /// Whether to user has new messages.
    required bool hasNewMessage,

    /// Status of opening chat that already had been opened.
    required ChatOpeningStatuses chatOpeningStatuses,

    ///The [ChatModel] for passing to chat screen.
    required ChatModel? chat,
  }) = _ChatsWatcherState;

  /// Initial state when bloc will be initialized.
  factory ChatsState.initial() => ChatsState(
        chats: [],
        deleteStatus: DeleteStatus.initial,
        loadingStatuses: LoadingStatesWithFailure.initial,
        hasNewMessage: false,
        chatOpeningStatuses: ChatOpeningStatuses.initial,
        chat: ChatModel.empty(),
      );
}

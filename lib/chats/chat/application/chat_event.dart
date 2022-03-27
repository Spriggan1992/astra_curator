part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  /// Subscription initialization event.
  const factory ChatEvent.initialized(
    ChatModel chatModel,
  ) = _Initialized;

  /// Starts to watch chats updates event.
  const factory ChatEvent.chatStartedWatch() = _ChatWatched;

  /// Load next messages event.
  const factory ChatEvent.nextMessagesLoaded() = _NextPageLoaded;

  /// Starts to watch internet status connection event.
  const factory ChatEvent.internetConnectionStartedWatch() =
      _InternetConnectionWatchedWatched;

  /// Message send event.
  ///
  /// The [message] that is sent to the server
  const factory ChatEvent.messageSent(String message) = _SendMessage;

  /// Change status internet connection event.
  ///
  /// The [hasConnection] responsible that there has internet connection.
  const factory ChatEvent.internetConnectionStatusConnectionChanged(
      bool hasConnection) = _SubscribeToInternetConnectionStatus;

  /// Received chat event.
  const factory ChatEvent.chatReceived(SubscriptionMessageModel message) =
      _ChatReceived;

  /// Received chat event.
  const factory ChatEvent.chatRead() = _ChatRead;

  /// Received user status online event.
  const factory ChatEvent.statusOnlineReceived(
    SubscriptionStatusOnlineModel onlineStatus,
  ) = _StatusOnlineReceived;
}

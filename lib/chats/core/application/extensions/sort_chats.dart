import 'package:astra_curator/chats/chats/domain/models/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Extensions that apply list of [ChatModel].
extension SortedChats on List<ChatModel> {
  /// Sort chats elements by last message time and amount of messages.
  List<ChatModel> get sortChats {
    return sorted((a, b) {
      if (a.lastMessageTime == null && b.lastMessageTime == null) {
        return -1;
      } else if (a.lastMessageTime != null && b.lastMessageTime == null) {
        return 0;
      } else if (a.lastMessageTime == null && b.lastMessageTime != null) {
        return 1;
      } else {
        return (b.lastMessageTime!).compareTo(a.lastMessageTime!);
      }
    }).sorted((a, b) => b.newMessageCount.compareTo(a.newMessageCount));
  }
}

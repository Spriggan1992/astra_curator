import 'package:astra_curator/chats/chat/domain/models/chat_message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_chat_model.freezed.dart';

///Defines pagination model for chat.
@freezed
class PaginationChatModel with _$PaginationChatModel {
  const PaginationChatModel._();
  const factory PaginationChatModel({
    required int count,
    required ChatMessageModel chatMessages,
  }) = _PaginationChatModel;

  /// Empty .
  factory PaginationChatModel.empty() => PaginationChatModel(
        count: 0,
        chatMessages: ChatMessageModel.empty(),
      );
}

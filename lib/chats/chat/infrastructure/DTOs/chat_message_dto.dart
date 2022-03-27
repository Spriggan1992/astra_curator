// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/chats/chat/infrastructure/DTOs/message_dto.dart';
import 'package:astra_curator/chats/chat/domain/models/chat_message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message_dto.freezed.dart';
part 'chat_message_dto.g.dart';

/// Defines chat message data transfer object for passing between server and client.
@freezed
class ChatMessageDTO with _$ChatMessageDTO {
  const ChatMessageDTO._();

  const factory ChatMessageDTO({
    /// Status of user online or not.
    @JsonKey(name: 'is_online') required bool? isOnline,

    /// Messages.
    @JsonKey(name: 'messages') required List<MessageDTO> messages,
  }) = _ChatMessageDTO;

// Convert DTO to domain.
  ChatMessageModel toDomain() => ChatMessageModel(
        isOnline: isOnline ?? false,
        messages: messages.map((dto) => dto.toDomain()).toList(),
      );
// Return converted DTO from json.
  factory ChatMessageDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDTOFromJson(json);

// Convert object to json.
  factory ChatMessageDTO.toJson() {
    return ChatMessageDTO.toJson();
  }
}

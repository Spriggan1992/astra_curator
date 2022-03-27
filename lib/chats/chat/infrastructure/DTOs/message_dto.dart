// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/chats/chat/domain/models/message_model.dart';
import 'package:astra_curator/chats/core/infrastructure/extensions/string_to_date.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

///Defines message date transfer object.
@freezed
class MessageDTO with _$MessageDTO {
  const MessageDTO._();
  const factory MessageDTO({
    /// The message identifier .
    @JsonKey(name: 'id') required int id,

    /// The chat message text.
    @JsonKey(name: 'message_text') required String messageText,

    /// Date and time when message was posted.
    @JsonKey(name: 'message_time') required String messageTime,

    /// Flag indicating that the message was posted by the current user.
    @JsonKey(name: 'is_me') required bool isMe,
  }) = _MessageDTO;

// Convert DTO to domain.
  MessageModel toDomain() => MessageModel(
        id: id,
        messageText: messageText,
        messageTime: messageTime.stringToDateTime,
        isMe: isMe,
        loadingMessageState: false,
      );

// Return converted DTO from json.
  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);

// Convert object to json.
  factory MessageDTO.toJson() {
    return MessageDTO.toJson();
  }
}

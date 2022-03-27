// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/chats/chats/domain/models/chat_model.dart';
import 'package:astra_curator/chats/core/infrastructure/extensions/string_to_date.dart';
import 'package:astra_curator/core/infrastructure/DTOs/image_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

/// Defines chat data transfer object.
@freezed
class ChatDTO with _$ChatDTO {
  const ChatDTO._();
  const factory ChatDTO({
    /// Identifier of chat.
    @JsonKey(name: 'id') required int id,

    /// Identifier of user.
    @JsonKey(name: 'with_profile_id') required int userId,

    /// The username with which the chat will be established,
    @JsonKey(name: 'with_profile_name') required String userName,

    /// The user photo.
    @JsonKey(name: 'with_profile_photo') required ImageDTO userPhoto,

    /// The last message that was sent to the user.
    @JsonKey(name: 'last_message') required String? lastMessage,

    /// Date and time of the last message sent.
    @JsonKey(name: 'last_message_time') required String? lastMessageTime,

    /// Number of unread messages.
    @JsonKey(name: 'new_message_count') required int newMEssageCount,

    /// The flag responsible for whether the user online or not.
    @JsonKey(name: 'is_online') required bool? isOnline,
  }) = _ChatDTO;

// Convert DTO to domain.
  ChatModel toDomain() => ChatModel(
        id: id,
        userId: userId,
        userName: userName,
        userPhoto: userPhoto.toDomain(),
        lastMessage: lastMessage ?? '',
        lastMessageTime: lastMessageTime?.stringToDateTime,
        newMessageCount: newMEssageCount,
        isOnline: isOnline ?? false,
      );

// Return converted DTO from json.
  factory ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);

// Convert object to json.
  factory ChatDTO.toJson() => ChatDTO.toJson();
}

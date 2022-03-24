// ignore_for_file: invalid_annotation_target

import 'package:astra_curator/chats/domain/models/pagination_chat_model.dart';
import 'package:astra_curator/chats/infrastructure/DTOs/chat_message_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_chat_dto.freezed.dart';
part 'pagination_chat_dto.g.dart';

/// Defines pagination result data transfer object obtaining from server.
@freezed
class PaginationChatDTO with _$PaginationChatDTO {
  const PaginationChatDTO._();

  const factory PaginationChatDTO({
    /// Total number of messages.
    @JsonKey(name: 'count') required int count,

    /// Chat message data transfer object for passing between server and client.
    @JsonKey(name: 'results') required ChatMessageDTO chatMessagesDto,
  }) = _PaginationChatDTO;

// Convert DTO to domain.
  PaginationChatModel toDomain() => PaginationChatModel(
        count: count,
        chatMessages: chatMessagesDto.toDomain(),
      );

// Return converted DTO from json.
  factory PaginationChatDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationChatDTOFromJson(json);

// Convert object to json.
  factory PaginationChatDTO.toJson() {
    return PaginationChatDTO.toJson();
  }
}

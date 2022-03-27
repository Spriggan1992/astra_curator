// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_to_server_dto.freezed.dart';
part 'message_to_server_dto.g.dart';

/// Defines message data transfer object for sending to server.
@freezed
class MessageToServerDTO with _$MessageToServerDTO {
  const MessageToServerDTO._();
  const factory MessageToServerDTO({
    /// Message for sending to server.
    @JsonKey(name: 'message') required String message,
  }) = _MessageToServerDTO;

  /// Return converted DTO from from domain.
  factory MessageToServerDTO.fromDomain(String chatMessage) {
    return MessageToServerDTO(message: chatMessage);
  }
// Return converted DTO from json.
  factory MessageToServerDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageToServerDTOFromJson(json);

// Convert object to json.
  factory MessageToServerDTO.toJson() {
    return MessageToServerDTO.toJson();
  }
}

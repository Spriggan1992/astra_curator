import 'package:astra_curator/core/domain/extensions/date_time_extension.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

/// Defines chat information to display.
@freezed
class ChatModel with _$ChatModel {
  const ChatModel._();
  const factory ChatModel({
    /// Identifier of chat.
    required int id,

    /// Identifier of user.
    required int userId,

    /// The user name to display.
    required String userName,

    /// The user photo to display.
    required ImageModel userPhoto,

    /// The last message to display that was sent to the user.
    required String lastMessage,

    /// Date and time of the last message sent to display.
    required DateTime? lastMessageTime,

    /// Number of unread messages to display.
    required int newMessageCount,

    /// The flag responsible for whether the user online or not.
    required bool isOnline,
  }) = _ChatModel;

  /// Empty .
  factory ChatModel.empty() => ChatModel(
        id: 0,
        userId: 0,
        userName: '',
        userPhoto: ImageModel.empty(),
        lastMessage: '',
        lastMessageTime: null,
        newMessageCount: 0,
        isOnline: false,
      );

  /// Get time as `hour:minute`.
  String get time => lastMessageTime?.dateTimeToStringTime ?? '';

  bool get chatIsNotEmpty => this != ChatModel.empty();
}

import 'package:astra_curator/core/domain/extensions/date_time_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

/// Defines message information to display.
@freezed
class MessageModel with _$MessageModel {
  const MessageModel._();
  const factory MessageModel({
    /// The message identifier.
    required int id,

    /// The chat message text to display.
    required String messageText,

    /// Date and time when message was posted to display.
    required DateTime? messageTime,

    /// Flag indicating that the message was posted by the current user.
    required bool isMe,

    /// Flag responsible for showing indicator of loading message.
    required bool loadingMessageState,
  }) = _MessageModel;

  /// Empty message information.
  factory MessageModel.empty() => const MessageModel(
        id: 0,
        messageText: '',
        messageTime: null,
        isMe: false,
        loadingMessageState: false,
      );

  /// Returns initial posted message.
  factory MessageModel.createInitialMessage(String message) => MessageModel(
        id: 0,
        messageText: message,
        messageTime: DateTime.now(),
        isMe: false,
        loadingMessageState: false,
      );

  /// Get time as `hour:minute`.
  String get time => messageTime?.dateTimeToStringTime ?? '';

  /// Get time when message was posted.
  String get groupedTimePostedMessage {
    if (messageTime!.isToday) {
      return 'Сегодня';
    } else if (messageTime!.isYesterday) {
      return 'Вчера';
    } else {
      return '${messageTime!.day} ${messageTime?.dateTimeTodayAnMounts}';
    }
  }
}

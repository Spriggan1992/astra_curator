import 'package:astra_curator/chats/domain/models/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message_model.freezed.dart';

///Defines
@freezed
class ChatMessageModel with _$ChatMessageModel {
  const ChatMessageModel._();
  const factory ChatMessageModel({
    required bool isOnline,
    required List<MessageModel> messages,
  }) = _ChatMessageModel;

  /// Empty .
  factory ChatMessageModel.empty() =>
      const ChatMessageModel(isOnline: false, messages: []);
}

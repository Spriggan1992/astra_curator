import 'package:astra_curator/chats/chat/domain/models/message_model.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represent message box  that contains message from users.
class MessageBox extends StatelessWidget {
  /// Flag responsible for showing loading message indicator.
  final bool isLoadingMessage;

  /// Flag responsible for displaying message from the current user or the user who sent message to current user.
  final bool isMe;

  /// Message information.
  final MessageModel messageModel;

  const MessageBox({
    Key? key,
    required this.messageModel,
    required this.isMe,
    required this.isLoadingMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isMe ? AstraColors.mainGold : AstraColors.messageBoxColor,
          gradient: isMe
              ? const LinearGradient(
                  colors: Gradients.goldenGradient,
                )
              : null,
        ),
        margin: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: isMe ? screenWidth * 0.2 : 16,
          right: isMe ? 16 : screenWidth * 0.2,
        ),
        padding: const EdgeInsets.only(top: 12, left: 12, right: 8, bottom: 8),
        child: Wrap(
          alignment: WrapAlignment.end,
          children: [
            Text(
              messageModel.messageText,
              style: TextStyle(
                color: isMe ? AstraColors.white : AstraColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 16),
              child: Text(
                messageModel.time,
                style: TextStyle(
                  color: isMe ? AstraColors.white05 : AstraColors.black06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

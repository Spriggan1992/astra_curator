import 'package:astra_curator/chats/application/chats/chats_bloc.dart';
import 'package:astra_curator/chats/domain/models/chats_model.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/images/astra_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent element of chats list.
class ChatListItem extends StatelessWidget {
  const ChatListItem(
    this.chat, {
    Key? key,
    required this.chats,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chat;

  /// Current chats.
  final List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => _navigateToChatScreen(context),
      child: Container(
        color: chat.newMessageCount > 0
            ? AstraColors.hasMessageColor
            : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: AstraNetworkImage(
                height: 56,
                width: 56,
                boxShape: BoxShape.circle,
                fit: BoxFit.cover,
                imageUrl: chat.userPhoto.imageUrl,
              ),
              title: Row(
                children: [
                  Text(
                    chat.userName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AstraColors.black,
                    ),
                  ),
                  Visibility(
                    visible: chat.isOnline,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Text(
                chat.lastMessage,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AstraColors.black06,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    chat.time,
                    style: const TextStyle(fontSize: 10),
                  ),
                  Visibility(
                    visible:
                        chat.lastMessage.isNotEmpty && chat.newMessageCount > 0,
                    child: CircleAvatar(
                      maxRadius: 8,
                      backgroundColor: AstraColors.golden06,
                      child: Text(
                        "${chat.newMessageCount}",
                        style: const TextStyle(
                          color: AstraColors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 1,
              color: AstraColors.dividerColor,
              indent: chat.newMessageCount > 0
                  ? null
                  : MediaQuery.of(context).size.width * 0.22,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToChatScreen(BuildContext context) async {
    context.read<ChatsBloc>().add(const ChatsEvent.chatsUnsubscribed());
    context.router
        .push(
      ChatScreenRoute(chatModel: chat),
    )
        .then((_) {
      context.read<ChatsBloc>().add(const ChatsEvent.chatsUpdated());
      context.read<ChatsBloc>().add(const ChatsEvent.initialized());
    });
  }
}

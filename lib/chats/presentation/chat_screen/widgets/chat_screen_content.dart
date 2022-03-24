import 'package:astra_curator/chats/application/chat/chat_bloc.dart';
import 'package:astra_curator/chats/domain/models/chats_model.dart';
import 'package:astra_curator/chats/domain/models/message_model.dart';
import 'package:astra_curator/chats/presentation/chat_screen/widgets/chat_bottom_bar.dart';
import 'package:astra_curator/chats/presentation/chat_screen/widgets/message_box.dart';
import 'package:astra_curator/chats/presentation/chat_screen/widgets/user_online_status.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/core/presentation/widgets/images/astra_network_image.dart';
import 'package:astra_curator/core/presentation/widgets/lists/grouped_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

/// Represent content of chat screen.
class ChatScreenContent extends StatelessWidget {
  const ChatScreenContent({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                chatModel.userName,
                style: const TextStyle(color: AstraColors.black),
              ),
              BlocBuilder<ChatBloc, ChatState>(
                buildWhen: (p, c) =>
                    p.hasConnection != c.hasConnection ||
                    p.isOnline != c.isOnline,
                builder: (context, state) {
                  return UserOnlineStatus(
                    hasInternet: state.hasConnection,
                    isOnline: state.isOnline,
                  );
                },
              )
            ],
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black87,
              size: 35,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: AstraNetworkImage(
                width: 32,
                boxShape: BoxShape.circle,
                fit: BoxFit.cover,
                imageUrl: chatModel.userPhoto.imageUrl,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state.loadingStates == LoadingStatesWithFailure.loading) {
                  return const Expanded(
                    child: PlatformActivityIndicator(),
                  );
                } else {
                  return Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        final metrics = notification.metrics;
                        final limit = metrics.maxScrollExtent -
                            metrics.viewportDimension / 2;
                        if (metrics.pixels > limit && state.isAvailableToLoad) {
                          context
                              .read<ChatBloc>()
                              .add(const ChatEvent.nextMessagesLoaded());
                        }
                        return false;
                      },
                      child: GroupedListView<MessageModel, String?>(
                        reverse: true,
                        sort: false,
                        elements: state.paginationResult.chatMessages.messages,
                        groupBy: (MessageModel element) =>
                            element.messageTime?.day.toString(),
                        indexedItemBuilder: (_, MessageModel element, index) {
                          return MessageBox(
                            messageModel: element,
                            isMe: element.isMe,
                            isLoadingMessage: element.loadingMessageState,
                          );
                        },
                        groupHeaderBuilder: (MessageModel element, index) {
                          return Column(
                            children: [
                              Visibility(
                                visible: state.paginationResult.chatMessages
                                                .messages.length -
                                            1 ==
                                        index &&
                                    state.isNextMessagesLoaded,
                                child: const CircularProgressIndicator(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  element.groupedTimePostedMessage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AstraColors.black06,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            const ChatBottomBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:astra_curator/chats/application/chats/chats_bloc.dart';
import 'package:astra_curator/chats/presentation/chats_screen/chat_list_item.dart';
import 'package:astra_curator/chats/presentation/chats_screen/constants/chats_text.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_curator/core/presentation/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/empty_data_screen.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsContent extends StatelessWidget {
  final ChatsState state;
  const ChatsContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.loadingStatuses == LoadingStatesWithFailure.loading) {
      return const LoadingScreen();
    } else if (state.loadingStatuses ==
        LoadingStatesWithFailure.noConnectionFailure) {
      return ErrorScreen(
        failure: AstraFailures.noConnection,
        onTryAgain: () {
          context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
        },
      );
    } else if (state.loadingStatuses ==
        LoadingStatesWithFailure.unexpectedFailure) {
      return ErrorScreen(
        failure: AstraFailures.unexpected,
        onTryAgain: () {
          context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
        },
      );
    } else {
      if (state.chats.isNotEmpty) {
        return ListView.builder(
          itemCount: state.chats.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(state.chats[index]),
              background: Container(color: Colors.red),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.delete_outline, color: Colors.white),
                        Text(
                          ChatsTexts.delete,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return DialogTwoActions(
                      content: const Text(
                        ChatsTexts.confirmDeletion,
                        textAlign: TextAlign.center,
                      ),
                      action1: DialogActionButton(
                        onClick: () => context.router.pop(false),
                        title: ChatsTexts.cancel,
                      ),
                      action2: DialogActionButton(
                        onClick: () {
                          context.read<ChatsBloc>().add(
                                ChatsEvent.chatDeleted(state.chats[index].id),
                              );
                          context.router.pop(true);
                        },
                        title: ChatsTexts.delete,
                        buttonStyle:
                            TextButton.styleFrom(primary: AstraColors.red),
                      ),
                    );
                  },
                );
              },
              direction: DismissDirection.endToStart,
              child: ChatListItem(state.chats[index], chats: state.chats),
            );
          },
        );
      } else {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(
                child: EmptyDataScreen(),
              ),
            ),
          ],
        );
      }
    }
  }
}

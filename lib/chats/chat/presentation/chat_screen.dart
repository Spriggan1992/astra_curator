import 'package:astra_curator/chats/chat/application/chat_bloc.dart';
import 'package:astra_curator/chats/chat/presentation/widgets/chat_screen_content.dart';
import 'package:astra_curator/chats/chats/domain/models/chat_model.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_curator/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent chat between two users.
class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  /// Information about chat.
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()
        ..add(
          ChatEvent.initialized(chatModel),
        ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state.loadingStates ==
              LoadingStatesWithFailure.noConnectionFailure) {
            return ErrorScreen(
              failure: AstraFailures.noConnection,
              onTryAgain: () {
                context.read<ChatBloc>().add(ChatEvent.initialized(chatModel));
              },
            );
          } else if (state.loadingStates ==
              LoadingStatesWithFailure.unexpectedFailure) {
            return ErrorScreen(
              failure: AstraFailures.unexpected,
              onTryAgain: () {
                context.read<ChatBloc>().add(ChatEvent.initialized(chatModel));
              },
            );
          } else {
            return ChatScreenContent(chatModel: chatModel);
          }
        },
      ),
    );
  }
}

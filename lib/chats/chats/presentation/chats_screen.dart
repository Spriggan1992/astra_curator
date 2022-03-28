import 'package:astra_curator/chats/chats/application/chats_bloc.dart';
import 'package:astra_curator/chats/chats/application/enums/delete_statuses.dart';
import 'package:astra_curator/chats/chats/presentation/chats_content.dart';
import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent screens with displaying chats.
class ChatsScreen extends StatelessWidget {
  final bool isUpdate;
  const ChatsScreen({
    Key? key,
    this.isUpdate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          AppTexts.messages,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromRGBO(31, 31, 31, 1),
                fontSize: 17,
              ),
        ),
      ),
      body: BlocConsumer<ChatsBloc, ChatsState>(
        listener: (context, state) {
          if (isUpdate) {
            context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded());
          }
          if (state.deleteStatus == DeleteStatus.failure) {
            context.read<ChatsBloc>().add(const ChatsEvent.chatsUpdated());
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<ChatsBloc>().add(const ChatsEvent.chatsLoaded()),
            child: ChatsContent(state: state),
          );
        },
      ),
    );
  }
}

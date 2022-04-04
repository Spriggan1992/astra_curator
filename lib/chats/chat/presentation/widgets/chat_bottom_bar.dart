import 'package:astra_curator/chats/chat/application/chat_bloc.dart';
import 'package:astra_curator/chats/chat/presentation/constants/borders.dart';

import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:astra_curator/core/presentation/widgets/icons/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent bottom bar for chat screen with text field and sending message button.
class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: Gradients.goldenGradient,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocSelector<ChatBloc, ChatState, bool>(
          selector: (state) => state.hasConnection,
          builder: (context, hasConnection) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Form(
                      child: TextFormField(
                        maxLines: null,
                        style: const TextStyle(color: AstraColors.white),
                        readOnly: !hasConnection,
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: AstraColors.grey015,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0,
                          ),
                          hintText: hasConnection
                              ? AppTexts.message
                              : AppTexts.waitingNetwork,
                          hintStyle:
                              const TextStyle(color: AstraColors.white03),
                          focusedBorder: Theme.of(context)
                              .inputDecorationTheme
                              .copyWith(border: bottomBarTextField)
                              .border,
                          enabledBorder: Theme.of(context)
                              .inputDecorationTheme
                              .copyWith(border: bottomBarTextField)
                              .border,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty && hasConnection) {
                      context
                          .read<ChatBloc>()
                          .add(ChatEvent.messageSent(_controller.text));
                      _controller.text = '';
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(251, 251, 251, 0.2),
                      radius: 16,
                      child: SvgIcon(
                        height: 14,
                        asset: 'assets/icons/paper-plane.svg',
                      ),
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
}

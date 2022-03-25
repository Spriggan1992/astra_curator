/// Defines dialog with two actions.
import 'package:astra_curator/core/presentation/widgets/dialogs/base_dialog.dart';
import 'package:flutter/material.dart';

class DialogTwoActions extends BaseDialog {
  /// Dialog title to display.
  final Widget content;

  /// Negative dialog action.
  final Widget action1;

  /// Positive dialog action.
  final Widget action2;
  DialogTwoActions({
    Key? key,
    required this.content,
    required this.action1,
    required this.action2,
  }) : super(
          key,
          content,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: action1,
              ),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  width: 1,
                ),
              ),
              SizedBox(child: action2),
            ],
          ),
        );
}

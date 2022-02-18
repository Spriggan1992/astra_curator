import 'package:astra_curator/presentation/core/widgets/dialogs/base_dialog.dart';
import 'package:flutter/material.dart';

/// Defines dialog with one action.
class DialogOneAction extends BaseDialog {
  /// Dialog content to display.
  final Widget content;

  /// Dialog title to display.
  final String? title;

  /// Dialog action.
  final Widget action;
  const DialogOneAction({
    Key? key,
    this.title,
    required this.content,
    required this.action,
  }) : super(
          key,
          content,
          action,
        );
}

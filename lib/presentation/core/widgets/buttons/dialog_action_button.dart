import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Defines button for dialog.
class DialogActionButton extends StatelessWidget {
  /// Dialog action button title.
  final String title;

  /// Button click event handler.
  final VoidCallback onClick;

  /// The visual properties that most buttons have in common.
  final ButtonStyle? buttonStyle;
  const DialogActionButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: buttonStyle ??
          TextButton.styleFrom(
            primary: AstraColors.black,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
      child: Text(
        title,
      ),
    );
  }
}

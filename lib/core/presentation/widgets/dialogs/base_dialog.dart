import 'package:flutter/material.dart';

/// Base class for dialogs.
class BaseDialog extends StatelessWidget {
  const BaseDialog(Key? key, this.dialogContent, this.dialogAction)
      : super(key: key);

  /// Base dialog content.
  final Widget dialogContent;

  /// Base dialog action.
  final Widget dialogAction;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 1.0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: dialogContent,
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 2),
              child: dialogAction,
            ),
            const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}

import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:flutter/material.dart';

/// Dialog of completion adding client.
class ClientAddingCompletionDialog extends StatelessWidget {
  const ClientAddingCompletionDialog({
    Key? key,
    this.onClose,
  }) : super(key: key);

  /// Button click close dialog event handler.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 1,
      child: Container(
        // padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: Gradients.goldenGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: onClose,
                icon: const Icon(
                  Icons.close,
                  size: 22,
                  color: AstraColors.white,
                ),
              ),
            ),
            const Text(
              'Поздравляем!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            const Text(
              'Пользователь успешно\nзарегистрирован!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

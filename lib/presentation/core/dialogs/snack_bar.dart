import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

/// Show snack bar.
void showSnackBar(
  BuildContext context, {
  String? title,
  Flash? flash,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return flash ??
          Flash(
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            controller: controller,
            backgroundColor: AstraColors.disableBtn,
            position: FlashPosition.bottom,
            behavior: FlashBehavior.floating,
            child: FlashBar(
              padding: const EdgeInsets.all(20),
              content: Text(title ?? 'Отсутствует подключение к интернету',
                  textAlign: TextAlign.center),
            ),
          );
    },
  );
}

import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/base_error_screen.dart';
import 'package:flutter/material.dart';

const _error = 'Попробовать снова';

/// Defines screen, that usually showing she get unexpected failure.
class ErrorScreen extends BaseErrorScreen {
  final AstraFailures failure;

  /// Error title to display.
  final String errorTitle;

  /// Event handler for clicking the "repeat again" button.
  final VoidCallback? onTryAgain;
  ErrorScreen({
    Key? key,
    this.errorTitle = _error,
    required this.failure,
    required this.onTryAgain,
  }) : super(
          key,
          _getErrorMessage(failure),
          GestureDetector(
            onTap: onTryAgain,
            child: const Text(
              'Попробовать снова',
              style: TextStyle(
                color: AstraColors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}

String _getErrorMessage(AstraFailures failure) {
  if (failure == AstraFailures.unexpected) {
    return 'Что то пошло не так...';
  } else {
    return 'Ошибка соединения.\nПроверьте подключение к интернету.';
  }
}

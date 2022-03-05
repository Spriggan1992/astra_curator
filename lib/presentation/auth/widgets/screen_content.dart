import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';

import 'package:flutter/material.dart';

/// Represent content for screens.
class ScreenContent extends StatelessWidget {
  /// A header title of page content to display.
  final String title;

  /// A text field to display.
  final Widget textFieldContent;

  /// Botton widget.
  final Widget button;

  /// App bar backpress click event handler.
  final VoidCallback? onBackPresed;

  /// A notification message to display.
  final Widget? notificationMessageContent;
  final Widget termContent;
  final Widget termsTextButton;

  const ScreenContent({
    Key? key,
    required this.title,
    required this.textFieldContent,
    required this.button,
    this.notificationMessageContent,
    this.onBackPresed,
    required this.termContent,
    required this.termsTextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        elevation: 0,
        onPressed: onBackPresed ?? () {},
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldContent,
                      const SizedBox(height: 20),
                      termContent,
                      termsTextButton,
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: notificationMessageContent,
                      )
                    ],
                  ),
                ],
              ),
            ),
            button
          ],
        ),
      ),
    );
  }
}

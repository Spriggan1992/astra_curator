import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';

/// Represent content for screens.
class ScreenContent extends StatelessWidget {
  /// A header title of page content to display.
  final String title;

  /// A text field to display.
  final Widget textFieldContent;

  /// Button widget.
  final Widget button;

  /// App bar back press click event handler.
  final VoidCallback? onBackPressed;

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
    this.onBackPressed,
    required this.termContent,
    required this.termsTextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        elevation: 0,
        onPressed: onBackPressed ?? () {},
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
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 28),
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

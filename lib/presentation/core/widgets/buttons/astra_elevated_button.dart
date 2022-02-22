import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/global/platform.activity_indicator.dart';
import 'package:flutter/material.dart';

/// Represent main reusable button.
class AstraElevatedButton extends StatelessWidget {
  const AstraElevatedButton({
    Key? key,
    required this.onClick,
    required this.title,
    this.titleColor,
    this.isEnableButton = true,
    this.isLoading = false,
  }) : super(key: key);

  /// Button title to display.
  final String title;

  /// Button click event handler.
  final VoidCallback? onClick;

  /// A flag responsible for enabling button.
  final bool isEnableButton;

  /// A flag responsible for showing progress indicator when loading data.
  final bool isLoading;

  /// A button style.
  /// if  buttonStyle is null, displays style from button themeData
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: isEnableButton ? onClick : null,
        style: ElevatedButton.styleFrom(
          primary: AstraColors.milkColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: isLoading ? 20 : null,
            height: 20,
            child: isLoading
                ? const PlatformActivityIndicator()
                : Text(
                    title,
                    textAlign: TextAlign.center,
                    style: (titleColor == null)
                        ? const TextStyle(
                            color: AstraColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )
                        : TextStyle(
                            color: titleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
          ),
        ),
      ),
    );
  }
}

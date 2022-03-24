import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
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
    this.backgroundColor,
    this.width,
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

  /// Button background color
  final Color? backgroundColor;

  /// Button width.
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Container(
        width: isLoading ? 20 : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ElevatedButton(
          onPressed: isEnableButton ? onClick : null,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: backgroundColor ?? Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: isLoading ? 20 : null,
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
      ),
    );
  }
}

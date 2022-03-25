import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:flutter/material.dart';

/// Represent main reusable button.
class AstraGradientButton extends StatelessWidget {
  const AstraGradientButton({
    Key? key,
    required this.onClick,
    required this.title,
    this.titleColor,
    this.isEnableButton = true,
    this.isLoading = false,
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

  /// Button width.
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Container(
        height: 56,
        width: isLoading ? 20 : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: isEnableButton
              ? const LinearGradient(
                  colors: Gradients.goldenGradient,
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.decal,
                  stops: [0.0, 1.0],
                )
              : null,
        ),
        child: ElevatedButton(
          onPressed: isEnableButton ? onClick : null,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: isLoading ? 20 : null,
              child: isLoading
                  ? const PlatformActivityIndicator(
                      isCupertinoDarkTheme: true,
                      materialIndicatorStrokeWidth: 2,
                      materialIndicatorColor: AstraColors.white,
                    )
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

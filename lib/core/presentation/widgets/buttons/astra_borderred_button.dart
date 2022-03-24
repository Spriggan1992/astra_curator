import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:astra_curator/core/presentation/widgets/global/golden_text.dart';
import 'package:flutter/material.dart';

/// Button with golden-gradient border.
class AstraBorderedButton extends StatelessWidget {
  const AstraBorderedButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isEnableButton = true,
  }) : super(key: key);

  /// Button click event handler.
  final VoidCallback? onTap;

  /// A button title.
  final String title;

  /// A flag responsible for enabling button.
  final bool isEnableButton;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: Gradients.goldenGradient,
          tileMode: TileMode.repeated,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          constraints: const BoxConstraints(
            minHeight: 48,
            minWidth: 135,
          ),
          margin: const EdgeInsets.all(1),
          alignment: Alignment.center,
          child: GoldenText(
            text: title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: AstraColors.mainGold,
                ),
          ),
        ),
      ),
    );
  }
}

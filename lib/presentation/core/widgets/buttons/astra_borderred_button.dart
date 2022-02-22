import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';
/// Button with golden border.
class AstraBorderedButton extends StatelessWidget {
  const AstraBorderedButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);
   
  /// Button click event handler. 
  final VoidCallback? onTap;
  /// A button title.
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: AstraColors.mainDarkGold, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        primary: AstraColors.white,
        onPrimary: AstraColors.white,
        minimumSize: Size(MediaQuery.of(context).size.width / 2.8,
            MediaQuery.of(context).size.height / 15),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              color: AstraColors.mainGold,
            ),
      ),
    );
  }
}

import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/new_client/adding_client/presentation/constants/adding_client_texts.dart';
import 'package:flutter/material.dart';

/// Represents interactive sign to adding photos or just inform user about how many photos he should to add.
class AddingPhotoSign extends StatelessWidget {
  /// Number of photos already submitted.
  final int amount;

  /// Sign click event handler.
  final VoidCallback onTap;

  /// If false the text is "disabled"
  final bool isDisabled;
  const AddingPhotoSign(
    this.amount, {
    Key? key,
    required this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  String _getSign() {
    if (amount == 2) {
      return AddingClientTexts.addingAtLeast1Photo;
    } else if (amount == 1) {
      return AddingClientTexts.addingAtLeast2Photo;
    } else {
      return AddingClientTexts.adding3Photo;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (amount < 3) {
      return Text(
        _getSign(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AstraColors.black04),
      );
    } else {
      return GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: const Text(
          AddingClientTexts.chooseAnotherPhoto,
          textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
    }
  }
}

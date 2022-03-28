import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/new_client/adding_client/application/adding_client_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents interactive sign to adding photos or just inform user about how many photos he should to add.
class AddingPhotoSign extends StatelessWidget {
  /// Number of photos already submitted.
  final int amount;
  const AddingPhotoSign(this.amount, {Key? key}) : super(key: key);

  String _getSign() {
    if (amount == 2) {
      return AppTexts.addingAtLeast1Photo;
    } else if (amount == 1) {
      return AppTexts.addingAtLeast2Photo;
    } else {
      return AppTexts.adding3Photo;
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
        onTap: () => context.read<AddingClientBloc>().add(
              const AddingClientEvent.photosAdded(),
            ),
        child: const Text(
          AppTexts.chooseAnotherPhoto,
          textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
    }
  }
}

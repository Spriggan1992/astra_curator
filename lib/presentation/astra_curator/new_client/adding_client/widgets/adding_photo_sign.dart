import 'package:astra_curator/application/new_client/adding_client/adding_client_bloc.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents interactive sign to adding photos or just inform user about how many photos he should to add.
class AddingPhotoSign extends StatelessWidget {
  /// Number of photos already submitted.
  final int amount;
  const AddingPhotoSign(this.amount, {Key? key}) : super(key: key);

  String _getSign() {
    if (amount == 2) {
      return 'Добавьте еще как минимум 1 фотографии';
    } else if (amount == 1) {
      return 'Добавьте еще как минимум 2 фотографии';
    } else {
      return 'Добавьте от 3 фотографий';
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
          'Выбрать другие фотографии',
          textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
    }
  }
}

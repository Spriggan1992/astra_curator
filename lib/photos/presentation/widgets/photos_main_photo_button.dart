import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/photos/application/photos_bloc.dart';
import 'package:astra_curator/photos/presentation/constants/photos_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines main photos button for photos screen bottom bar.
class PhotosMainPhotoButton extends StatelessWidget {
  /// Whether the current photos is main.
  final bool isMain;

  const PhotosMainPhotoButton({
    Key? key,
    required this.isMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isMain
          ? null
          : () {
              context
                  .read<PhotosBloc>()
                  .add(const PhotosEvent.mainPhotoChanged());
            },
      child: Text(
        isMain ? PhotosTexts.main : PhotosTexts.makeMain,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isMain ? AstraColors.white03 : AstraColors.white,
            ),
      ),
    );
  }
}

import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/images/astra_network_image.dart';
import 'package:flutter/material.dart';

final _border = Border.all(
  color: AstraColors.golden08,
);

/// Represents widget that display image from file.
class AstraFileImage extends StatelessWidget {
  const AstraFileImage({
    Key? key,
    required this.image,
    this.width = 70,
    this.height = 70,
    this.border = true,
  }) : super(key: key);

  /// File where image stored.
  final ImageModel image;

  /// Image container width.
  ///
  /// By default `90px`
  final double width;

  /// Image container height.
  ///
  /// By default `130px`
  final double height;

  /// Whether to show border.
  final bool border;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        key: ValueKey(image.cachedImage?.fullImage ?? image.imageUrl),
        decoration: border
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(height),
                border: _border,
              )
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height),
          child: image.cachedImage?.thumbnailImage == null
              ? AstraNetworkImage(
                  imageUrl: image.imageUrl,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                )
              : Image.file(
                  image.cachedImage!.thumbnailImage!,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                ),
        ),
      ),
    );
  }
}

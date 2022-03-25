import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/containers/gradient_border_container.dart';
import 'package:astra_curator/core/presentation/widgets/icons/svg_icon.dart';
import 'package:astra_curator/core/presentation/widgets/images/astra_file_image.dart';
import 'package:flutter/material.dart';

class Photos extends StatelessWidget {
  const Photos({
    Key? key,
    required this.images,
    this.onPickImage,
    this.onShowImage,
    this.isEditMode = false,
    this.addedImg,
  }) : super(key: key);

  final VoidCallback? onPickImage;
  final VoidCallback? onShowImage;
  final bool isEditMode;
  final List<ImageModel> images;
  final ImageModel? addedImg;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: (images.length < 3)
          ? Padding(
              key: const ValueKey(1),
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: onPickImage,
                child: const GradientBorderContainer(
                  height: 100,
                  width: 100,
                  isCircular: true,
                  background: AstraColors.addPhotoColorPlaceholder,
                  child: SvgIcon(
                    asset: 'assets/icons/ic_add_photo.svg',
                    height: 30,
                  ),
                ),
              ),
            )
          : GestureDetector(
              key: const ValueKey(2),
              onTap: onShowImage,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          child: AstraFileImage(
                            image: images[1],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Align(
                          child: AstraFileImage(
                            image: images[2],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      child: AstraFileImage(
                        image: images.first,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

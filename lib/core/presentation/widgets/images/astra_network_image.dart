import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Represent network image widget.
class AstraNetworkImage extends StatelessWidget {
  /// Image to display.
  final String? imageUrl;

  /// Image height.
  final double? height;

  /// Image width.
  final double? width;

  /// Settings, how image should be fit to the container.
  final BoxFit? fit;

  /// Image shape to display.
  final BoxShape? boxShape;

  /// Image box border.
  final Border? border;

  /// Image background color.
  final Color? backgroundColor;

  /// Image provider. In this case responsible for showing image stored on device.
  final ImageProvider<Object>? fileImage;

  /// An immutable set of radii for each corner of a rectangle.
  final BorderRadius? borderRadius;

  /// Whether to display background overlay on image.
  final bool isOverlayBackground;

  const AstraNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.boxShape,
    this.border,
    this.backgroundColor,
    this.fileImage,
    this.borderRadius,
    this.isOverlayBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: const Color(0xFFEBEBF4),
        highlightColor: const Color(0xFFF4F4F4),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height,
          width: width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: boxShape ?? BoxShape.rectangle,
            borderRadius: borderRadius,
          ),
        ),
      ),
      errorWidget: (context, url, error) => _ImageContainer(
        height: height,
        width: width,
        border: border,
        boxShape: boxShape,
        borderRadius: borderRadius,
        fit: fit,
        isOverlayBackground: isOverlayBackground,
        imageProvider: const AssetImage('assets/no-image.png'),
      ),
      imageBuilder: (context, imageProvider) => _ImageContainer(
        height: height,
        width: width,
        border: border,
        boxShape: boxShape,
        borderRadius: borderRadius,
        fit: fit,
        isOverlayBackground: isOverlayBackground,
        imageProvider: fileImage ?? imageProvider,
      ),
    );
  }
}

///  Image container for displaying network image.
class _ImageContainer extends StatelessWidget {
  /// Image container height.
  final double? height;

  /// Image container width.
  final double? width;

  /// Image container border.
  final Border? border;

  /// Image container box shape.
  final BoxShape? boxShape;

  /// How a box should be inscribed into another box.
  final BoxFit? fit;

  /// Identifies an image without committing to the precise final asset.
  final ImageProvider<Object> imageProvider;

  /// An immutable set of radii for each corner of a rectangle.
  final BorderRadius? borderRadius;

  /// Whether to display background overlay on image.
  final bool isOverlayBackground;

  const _ImageContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.border,
    required this.boxShape,
    required this.fit,
    required this.imageProvider,
    required this.isOverlayBackground,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height ?? MediaQuery.of(context).size.height,
          width: width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
            shape: boxShape ?? BoxShape.rectangle,
            image: DecorationImage(
              fit: fit ?? BoxFit.cover,
              image: imageProvider,
            ),
          ),
        ),
        Visibility(
          visible: isOverlayBackground,
          child: Container(
            color: AstraColors.black07,
          ),
        ),
      ],
    );
  }
}

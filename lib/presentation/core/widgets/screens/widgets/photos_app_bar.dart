import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent appbar of photos screen.
class PhotosAppBar extends StatelessWidget {
  /// Whether the appbar is hidden.
  final bool isHideAppBar;

  /// Current index of displayed photo.
  final int currentImageIndex;

  /// Total amount of photos passed to screen.
  final int totalPhotos;

  const PhotosAppBar({
    Key? key,
    required this.isHideAppBar,
    required this.currentImageIndex,
    required this.totalPhotos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isHideAppBar ? 0 : 1,
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        height: 100,
        child: AppBar(
          centerTitle: true,
          title: Text(
            '${currentImageIndex + 1} из $totalPhotos',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

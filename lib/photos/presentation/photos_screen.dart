import 'dart:developer';

import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/presentation/widgets/images/astra_network_image.dart';
import 'package:astra_curator/photos/application/photos_bloc.dart';
import 'package:astra_curator/photos/presentation/widgets/photos_app_bar.dart';
import 'package:astra_curator/photos/presentation/widgets/photos_bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///  Defines FullImageScreen.
class PhotosScreen extends StatefulWidget {
  /// Images.
  final List<ImageModel> images;
  const PhotosScreen({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    context.read<PhotosBloc>().add(
          PhotosEvent.initialized(widget.images),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosBloc, PhotosState>(
      listener: (context, state) {
        if (state.images.isEmpty) {
          context.popRoute();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context
              .read<PhotosBloc>()
              .add(const PhotosEvent.appBarAndBottomBarHidden()),
          child: Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (value) => context.read<PhotosBloc>().add(
                            PhotosEvent.currentPhotoIndexSet(
                              value,
                            ),
                          ),
                      allowImplicitScrolling: true,
                      itemCount: state.images.length,
                      itemBuilder: (context, index) {
                        return state.images[index].cachedImage?.fullImage ==
                                null
                            ? AstraNetworkImage(
                                imageUrl: state.images[index].imageUrl,
                              )
                            : Image.file(
                                state.images[index].cachedImage!.fullImage!,
                                fit: BoxFit.cover,
                              );
                      },
                    ),
                    PhotosBottomBar(
                      isHideBar: state.isHideAppbarAndBottomBar,
                      onDelete: () {
                        context.read<PhotosBloc>().add(
                              const PhotosEvent.photosDeleted(),
                            );
                      },
                    ),
                  ],
                ),
                PhotosAppBar(
                  isHideAppBar: state.isHideAppbarAndBottomBar,
                  currentImageIndex: state.currentImageIndex,
                  totalPhotos: state.images.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

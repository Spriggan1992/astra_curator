import 'dart:developer';

import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'photos_event.dart';
part 'photos_state.dart';
part 'photos_bloc.freezed.dart';

/// Defines states for FullScreenImage.
@injectable
class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosState.initial()) {
    on<PhotosEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                images: e.images,
                currentImageIndex: 0,
                mainPhoto: 0,
              ),
            );
          },
          photosDeleted: (e) async {
            final updatedImages = state.images.where(
              (element) {
                if (element.cachedImage?.fullImage != null) {
                  return element.cachedImage?.fullImage !=
                      state.images[state.currentImageIndex].cachedImage
                          ?.fullImage;
                } else {
                  return element.id != state.images[state.currentImageIndex].id;
                }
              },
            ).toList();
            emit(
              state.copyWith(
                images: updatedImages,
                isSuccessfullyDeletePhoto: true,
                currentImageIndex: _getCurrentIndex(
                  state.currentImageIndex,
                  updatedImages.length,
                ),
              ),
            );
            await Future.delayed(const Duration(milliseconds: 100));
            emit(state.copyWith(isSuccessfullyDeletePhoto: false));
          },
          currentPhotoIndexSet: (e) async {
            emit(state.copyWith(currentImageIndex: e.index));
          },
          appBarAndBottomBarHidden: (e) async {
            emit(
              state.copyWith(
                isHideAppbarAndBottomBar: !state.isHideAppbarAndBottomBar,
              ),
            );
          },
          mainPhotoChanged: (e) async {
            log(state.mainPhoto.toString());
            final newPhotos = state.images.toList();
            final photo = newPhotos.removeAt(state.currentImageIndex);
            newPhotos.insert(0, photo);
            emit(
              state.copyWith(
                mainPhoto: state.currentImageIndex,
                updatedPhotos: newPhotos,
                isSuccessfullyChangedMainPhoto: true,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 100));
            emit(state.copyWith(isSuccessfullyChangedMainPhoto: false));
          },
        );
      },
    );
  }

  /// Get current index of images.
  int _getCurrentIndex(int deletedIndex, int imageLength) {
    if (imageLength == deletedIndex) {
      return deletedIndex - 1;
    } else {
      return deletedIndex;
    }
  }
}

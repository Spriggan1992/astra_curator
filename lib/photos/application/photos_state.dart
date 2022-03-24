part of 'photos_bloc.dart';

/// Defines states for FullScreenImage.
@freezed
class PhotosState with _$PhotosState {
  const factory PhotosState({
    /// State of images.
    required List<ImageModel> images,

    /// State of current image index.
    required int currentImageIndex,

    /// A flag responsible for hide or show top and bottom bars.
    required bool isHideAppbarAndBottomBar,

    /// Whether to successfully deleted photo or not.
    required bool isSuccessfullyDeletePhoto,

    /// Whether the index of photo match to main photo.
    required int mainPhoto,

    /// Updated photos.
    required List<ImageModel> updatedPhotos,

    /// Whether main photo successfully submit.
    required bool isSuccessfullyChangedMainPhoto,
  }) = _PhotosState;
  factory PhotosState.initial() => const PhotosState(
        images: [],
        currentImageIndex: 0,
        isHideAppbarAndBottomBar: false,
        isSuccessfullyDeletePhoto: false,
        mainPhoto: 0,
        updatedPhotos: [],
        isSuccessfullyChangedMainPhoto: false,
      );
}

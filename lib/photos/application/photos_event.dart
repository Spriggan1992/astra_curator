part of 'photos_bloc.dart';

@freezed
class PhotosEvent with _$PhotosEvent {
  /// Initialized photos event.
  const factory PhotosEvent.initialized(
    List<ImageModel> images,
  ) = _Initialized;

  /// Photos delete event.
  const factory PhotosEvent.photosDeleted() = _ImagesDeleted;

  /// Images delete event.
  const factory PhotosEvent.currentPhotoIndexSet(int index) =
      _CurrentImageIndexSet;

  /// Appbar and bottom bar hide event.
  const factory PhotosEvent.appBarAndBottomBarHidden() =
      _AppBarAndBottomBarHidden;

  /// The main photo changed event.
  const factory PhotosEvent.mainPhotoChanged() = _MainPhotoChanged;
}

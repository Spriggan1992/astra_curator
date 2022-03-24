import 'package:image_picker/image_picker.dart';

/// Describes image picker service.
abstract class IImagePickerService {
  /// Get image.
  Future<XFile?> getImg(ImageSource source);

  /// Get images.
  Future<List<XFile>?> getImages();
}

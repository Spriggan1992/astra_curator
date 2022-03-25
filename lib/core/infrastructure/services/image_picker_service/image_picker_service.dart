import 'package:astra_curator/core/domain/services/i_image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

/// Image picker service.
@LazySingleton(as: IImagePickerService)
class ImagePickerService extends IImagePickerService {
  /// Image picker.
  final ImagePicker _picker;

  ImagePickerService(this._picker);

  @override
  Future<XFile?> getImg(ImageSource source) async {
    return _picker.pickImage(source: source, imageQuality: 50);
  }

  @override
  Future<List<XFile>?> getImages() async {
    return _picker.pickMultiImage(imageQuality: 50);
  }
}

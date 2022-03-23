import 'package:astra_curator/domain/image_picker/i_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

/// Image picker service.
@LazySingleton(as: IImagePickerRepository)
class ImagePickerRepository extends IImagePickerRepository {
  /// Image picker.
  final ImagePicker _picker;

  ImagePickerRepository(this._picker);

  @override
  Future<XFile?> getImg(ImageSource source) async {
    return _picker.pickImage(source: source, imageQuality: 50);
  }

  @override
  Future<List<XFile>?> getImages() async {
    return _picker.pickMultiImage(imageQuality: 50);
  }
}

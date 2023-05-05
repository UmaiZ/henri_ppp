import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Future<String> cameraImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      // throw ImageNotSelectedException();
    }
    return image!.path;
  }

  @override
  Future<XFile> galleryImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      // throw ImageNotSelectedException();
    }
    return image!;
  }

  @override
  gallerVideoMultiple() async {
    final image = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (image == null) {
      // throw ImageNotSelectedException();
    }
    return image!;
  }

  @override
  Future<List> galleryImageMultiple() async {
    List images = [];
    final image = await imagePicker.pickMultiImage();
    if (image == null) {
      // throw ImageNotSelectedException();
    }
    images.addAll(image);

    return images;
  }
}

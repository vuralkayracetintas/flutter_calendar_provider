import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();
  List<File?> image = [];

  Future<XFile?> cameraCapture() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future pickerImageFromGallery() async {
    // final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    // return file;

    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xFilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xFilePick.isNotEmpty) {
      for (var i = 0; i < xFilePick.length; i++) {
        image.add(File(xFilePick[i].path));
      }
    }

    return xFilePick[xFilePick.length - 1];
  }

  Future getImages() async {
    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        image.add(File(xfilePick[i].path));
      }
    }

    return xfilePick;
    // print(pickedFile);
    print(xfilePick.length);
  }
}

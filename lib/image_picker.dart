// image_picker_functions.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  return returnedImage != null ? File(returnedImage.path) : null;
}

Future<File?> pickImageFromCamera() async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.camera);

  return returnedImage != null ? File(returnedImage.path) : null;
}

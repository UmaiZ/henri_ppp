import 'package:flutter/material.dart';
import 'package:henri_ppp/models/user.dart';

class createPostProvider extends ChangeNotifier {
  late UserModel _user;
  UserModel get userdata => _user;
  List _selectedImages = [];
  get images => _selectedImages;

  addImages(images) {
    _selectedImages = images;
    notifyListeners();
  }

  deleteImage(index) {
    _selectedImages.removeAt(index);
    notifyListeners();
  }

  clearImages() {
    _selectedImages = [];
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/services/feed_service.dart';

class createPostController extends ChangeNotifier {
  late UserModel _user;
  UserModel get userdata => _user;
  List _selectedImages = [];
  get images => _selectedImages;

  addImages(images) {
    _selectedImages = images;
    notifyListeners();
  }

  addVideo(video) {
    _selectedImages.add(video);
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

  Future<bool> createPost(data, file) async {
    bool result = false;
    try {
      return await feedService().createPost("createNewsFeed", data, file);
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

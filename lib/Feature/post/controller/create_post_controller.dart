import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/Feature/profile/models/user.dart';
import 'package:henri_ppp/services/feed_service.dart';

class createPostController extends ChangeNotifier {
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
      return await feedService()
          .createPost(ApiUrls().createNewsFeed, data, file);
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/models/status.dart';
import 'package:henri_ppp/services/story_service.dart';

class statusController extends ChangeNotifier {
  List<StatusModel> _status = [];
  List<StatusModel> get statusdata => _status;
  statusController() {
    getStatus();
  }
  Future<bool> createStory(data, file) async {
    bool result = false;
    try {
      return await storyService().createStory(
          ApiUrls().createStatus,
          data,
          file,
          file.path.split('.').last.toString().toUpperCase() == "MOV"
              ? "video"
              : file.path.split('.').last.toString().toUpperCase() == "MP4"
                  ? "video"
                  : "image");
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  Future<bool> getStatus() async {
    print('status call');
    bool result = false;
    try {
      List<StatusModel> status =
          await storyService().getStatus(ApiUrls().getStatus);
      _status = status;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/models/status.dart';
import 'package:henri_ppp/services/api.dart';

class StatusProvider extends ChangeNotifier {
  List<StatusModel> _status = [];
  List<StatusModel> get statusdata => _status;
  // StatusProvider() {
  //   getStatus();
  // }
  Future<bool> createStory(data, file) async {
    bool result = false;
    try {
      return await ApiService().createStory(
          "createStatus",
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
    bool result = false;
    try {
      List<StatusModel> status = await ApiService().getStatus("getStatus");
      _status = status;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/services/auth_service.dart';

String token = "";

class userController extends ChangeNotifier {
  late UserModel _user;
  UserModel get userdata => _user;

  late UserModel _selecteduser;

  UserModel? get userselecteditem => _selecteduser;

  Future<bool> LoginHit(data) async {
    bool result = false;
    try {
      UserModel user = await AuthService().login("login", data);
      _user = user;
      token = _user.userToken.toString();
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  Future<bool> UpdateUser(data) async {
    bool result = false;
    try {
      UserModel user = await AuthService().update("updateUser", data);
      _user = user;

      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  Future<void> fetchselecteduserDetails(String userID) async {
    try {
      UserModel user =
          await AuthService().getUserByID("getUserByUserID/$userID");
      _selecteduser = user;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<bool> updateMedia(data, file, type) async {
    bool result = false;
    try {
      UserModel user =
          await AuthService().updateMedia("updateUser", data, file, type);
      _user = user;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  Future<bool> FollowUnFollow(data) async {
    bool result = false;
    try {
      result = await AuthService().followunfollow(
        "followOrUnfollow",
        data,
      );
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  removefollow(id) {
    _user.userFollowers!.removeWhere((element) => element == id);
    notifyListeners();
  }

  addfollow(id) {
    _user.userFollowers!.add(id);
    notifyListeners();
  }

  removefollowing(id) {
    _user.userFollowing!.removeWhere((element) => element == id);
    notifyListeners();
  }

  addfollowing(id) {
    _user.userFollowing!.add(id);
    notifyListeners();
  }

  removefollowselected(id) {
    _selecteduser.userFollowers!.removeWhere((element) => element == id);
    notifyListeners();
  }

  addfollowselected(id) {
    _selecteduser.userFollowers!.add(id);
    notifyListeners();
  }
}

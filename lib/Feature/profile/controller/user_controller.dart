import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/Feature/profile/models/averagerating.dart';
import 'package:henri_ppp/Feature/profile/models/user.dart';
import 'package:henri_ppp/services/auth_service.dart';
import 'package:henri_ppp/services/user_service.dart';

String token = "";

class userController extends ChangeNotifier {
  late UserModel _user;
  UserModel get userdata => _user;

  late List<UserModel> _userFans;
  List<UserModel> get userFans => _userFans;

  late List<UserModel> _userTeammates;
  List<UserModel> get userTeammates => _userTeammates;

  late UserModel _selecteduser;

  UserModel? get userselecteditem => _selecteduser;

  late AverageRating useraverage;

  Future<bool> LoginHit(data) async {
    bool result = false;
    try {
      UserModel user = await AuthService().login(ApiUrls().login, data);
      _user = user;
      token = _user.userToken.toString();
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  Future<bool> RegisterHit(data) async {
    bool result = false;
    try {
      UserModel user = await AuthService().login(ApiUrls().register, data);
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
      UserModel user =
          await AuthService().update(ApiUrls().updateUserProfile, data);
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
      UserModel user = await AuthService()
          .getUserByID("${ApiUrls().getUserByUserID}/$userID");
      _selecteduser = user;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> getAverage() async {
    try {
      AverageRating user =
          await UserService().getAverage(ApiUrls().getAverageRating);
      useraverage = user;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<bool> updateMedia(data, file, type) async {
    bool result = false;
    try {
      UserModel user = await AuthService()
          .updateMedia(ApiUrls().updateUser, data, file, type);
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
        ApiUrls().followOrUnfollow,
        data,
      );
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  getFans() async {
    bool result = false;
    try {
      List<UserModel> user =
          await UserService().getUserFansandTeammates(ApiUrls().getUsersFans);
      _userFans = user;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  getTeammates() async {
    bool result = false;
    try {
      List<UserModel> user = await UserService()
          .getUserFansandTeammates(ApiUrls().getUserTeamMates);
      _userTeammates = user;
      result = true;
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

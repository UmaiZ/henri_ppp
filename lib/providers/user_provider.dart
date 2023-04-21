import 'package:flutter/material.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/services/api.dart';

String token = "";

class UserProvider extends ChangeNotifier {
  late UserModel _user;
  UserModel get userdata => _user;

  Future<bool> LoginHit(data) async {
    bool result = false;
    try {
      UserModel user = await ApiService().login("login", data);
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
      UserModel user = await ApiService().update("updateUser", data);
      _user = user;

      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

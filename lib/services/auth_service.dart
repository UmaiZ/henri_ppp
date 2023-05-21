import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/models/user.dart';

class AuthService {
  Future<UserModel> login(url, data) async {
    UserModel result;
    logger.d(data);

    try {
      final response = await NetworkHelper().postApi(url, data);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = UserModel.fromJson(response['data']);
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<UserModel> update(url, data) async {
    UserModel result;
    logger.d(data);

    try {
      final response = await NetworkHelper().postApi(url, data);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = UserModel.fromJson(response['data']);
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<UserModel> getUserByID(url) async {
    UserModel result;
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = UserModel.fromJson(response['data']);
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<UserModel> updateMedia(url, data, file, type) async {
    UserModel result;
    try {
      final response =
          await NetworkHelper().mediaFormUpload(url, data, file, type);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      showtoast(response['message']);
      result = UserModel.fromJson(response['data']);
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<bool> followunfollow(url, data) async {
    logger.d(data);
    try {
      final response = await NetworkHelper().postApi(url, data);
      logger.d(response);

      if (!response['success']) {
        showtoast(response['message']);
        return false;
      }
      return true;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

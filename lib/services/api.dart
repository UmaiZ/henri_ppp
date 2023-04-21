import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';

class ApiService {
  static final ApiService _shared = ApiService._internal();

  ApiService._internal();

  factory ApiService() {
    return _shared;
  }

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
}

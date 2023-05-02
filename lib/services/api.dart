import 'package:henri_ppp/models/feed.dart';
import 'package:henri_ppp/models/status.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';

class ApiService {
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

  createPost(url, data, file) async {
    bool result = false;
    try {
      final response = await NetworkHelper().postFormApi(url, data, file);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      showtoast(response['message']);
      result = true;
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  createStory(url, data, file) async {
    bool result = false;
    try {
      final response = await NetworkHelper().storyFormApi(url, data, file);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      showtoast(response['message']);
      result = true;
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<FeedModel>> getFeed(url) async {
    List<FeedModel> result;

    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      // result = response['data'].map((e) => FeedModel.fromJson(e)).toList();
      result = response['data']
          .map<FeedModel>((item) => FeedModel.fromJson(item))
          .toList();
      // result = response['data'].map((e) => FeedModel.fromJson(e)).toList();

      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<StatusModel>> getStatus(url) async {
    List<StatusModel> result;

    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = response['data']
          .map<StatusModel>((item) => StatusModel.fromJson(item))
          .toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

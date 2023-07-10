import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/Feature/homeview/models/comments.dart';
import 'package:henri_ppp/Feature/homeview/models/feed.dart';

class feedService {
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

  Future<List<CommentModel>> getComments(url) async {
    List<CommentModel> result;
    print(url);
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = response['data']
          .map<CommentModel>((item) => CommentModel.fromJson(item))
          .toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<bool> addComment(url, data) async {
    logger.d(url);

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

  addRating(url, data) async {
    logger.d(data);
    logger.d(url);

    try {
      final response = await NetworkHelper().postApi(url, data);
      logger.d(response);

      if (!response['success']) {
        showtoast(response['message']);
        return false;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

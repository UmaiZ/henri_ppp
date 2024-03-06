import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/Feature/homeview/models/comments.dart';
import 'package:henri_ppp/Feature/homeview/models/feed.dart';

import '../Feature/notifications/model/noitification.dart';

class notificationService {
  Future<List<notificationModel>> getNotification(url) async {
    List<notificationModel> result;

    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      // result = response['data'].map((e) => FeedModel.fromJson(e)).toList();
      result = response['data']
          .map<notificationModel>((item) => notificationModel.fromJson(item))
          .toList();
      // result = response['data'].map((e) => FeedModel.fromJson(e)).toList();

      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/models/comments.dart';
import 'package:henri_ppp/models/feed.dart';

class chatService {
  Future<String> openMessage(url, data) async {
    logger.d(data);
    try {
      final response = await NetworkHelper().postApi(url, data);
      logger.d(response);

      if (!response['success']) {
        showtoast(response['message']);
        return response;
      }
      return response['data']['_id'];
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

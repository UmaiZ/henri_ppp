import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/models/chatlist.dart';
import 'package:henri_ppp/models/comments.dart';
import 'package:henri_ppp/models/feed.dart';

class liveService {
  Future<String> createRoomToken(url) async {
    logger.d(url);
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);
      return response['token'];
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

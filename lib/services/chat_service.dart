import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/Feature/messages/models/chatlist.dart';
import 'package:henri_ppp/Feature/homeview/models/comments.dart';
import 'package:henri_ppp/Feature/homeview/models/feed.dart';

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

  Future<List<ChatListModel>> getchatList(url) async {
    List<ChatListModel> result;
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      // result = UserModel.fromJson(response['data']);
      result = response['data']
          .map<ChatListModel>((item) => ChatListModel.fromJson(item))
          .toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

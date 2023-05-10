import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/models/status.dart';

class storyService {
  createStory(url, data, file, type) async {
    bool result = false;
    try {
      final response =
          await NetworkHelper().mediaFormUpload(url, data, file, type);
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

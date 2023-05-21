import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';
import 'package:henri_ppp/models/averagerating.dart';
import 'package:henri_ppp/models/user.dart';

class UserService {
  Future<List<UserModel>> getUserFansandTeammates(url) async {
    List<UserModel> result;
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      // result = UserModel.fromJson(response['data']);
      result = response['data']
          .map<UserModel>((item) => UserModel.fromJson(item))
          .toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<AverageRating> getAverage(url) async {
    AverageRating result;
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);

      if (!response['success']) {
        return showtoast(response['message']);
      }
      result = AverageRating.fromJson(response['data']);
      // result = response['data']
      //     .map<UserModel>((item) => UserModel.fromJson(item))
      //     .toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}

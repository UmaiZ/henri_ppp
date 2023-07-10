import 'package:henri_ppp/Feature/live/models/rooms.dart';
import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/helpers/toast/toast.dart';

class liveService {
  Future createRoomToken(url) async {
    logger.d(url);
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<Rooms>> getRooms(url) async {
    logger.d(url);
    List<Rooms> result;
    try {
      final response = await NetworkHelper().getApi(url);
      logger.d(response);
      if (!response['success']) {
        return showtoast(response['message']);
      }
      // result = UserModel.fromJson(response['data']);
      result =
          response['data'].map<Rooms>((item) => Rooms.fromJson(item)).toList();
      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  //   Future<List<UserModel>> getUserFansandTeammates(url) async {
  //   List<UserModel> result;
  //   try {
  //     final response = await NetworkHelper().getApi(url);
  //     logger.d(response);

  // if (!response['success']) {
  //   return showtoast(response['message']);
  // }
  // // result = UserModel.fromJson(response['data']);
  // result = response['data']
  //     .map<UserModel>((item) => UserModel.fromJson(item))
  //     .toList();
  // return result;
  //   } catch (e) {
  //     logger.e(e);
  //     rethrow;
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/live/models/rooms.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/services/live_service.dart';

class liveController extends ChangeNotifier {
  late List<Rooms> _roomsList;
  List<Rooms> get rooms => _roomsList;

  Future createRoom(data) async {
    try {
      return await liveService().createRoomToken(
          "${ApiUrls().createlivechannel}?channelName=$data&role=publisher");
    } catch (e) {
      notifyListeners();
    }
  }

  // Future getRooms(data) async {
  //   try {
  //     return await liveService().getRooms(ApiUrls().getchannelroom);
  //   } catch (e) {
  //     notifyListeners();
  //   }
  // }

  getRooms() async {
    bool result = false;
    try {
      List<Rooms> rooms =
          await liveService().getRooms(ApiUrls().getchannelroom);
      _roomsList = rooms;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }

  openMessage(Map<String, List> map) {}
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/Feature/messages/models/chatlist.dart';
import 'package:henri_ppp/services/live_service.dart';

class liveController extends ChangeNotifier {
  Future createRoom(data) async {
    try {
      return await liveService().createRoomToken(
          "${ApiUrls().createlivechannel}?channelName=${data}&role=publisher");
    } catch (e) {
      notifyListeners();
    }
  }

  openMessage(Map<String, List> map) {}
}

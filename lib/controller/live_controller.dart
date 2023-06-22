import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/models/chatlist.dart';
import 'package:henri_ppp/services/live_service.dart';

class liveController extends ChangeNotifier {
  List<ChatListModel> _chats = [];
  List<ChatListModel> get chatlistdata => _chats;

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

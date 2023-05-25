import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/models/chatlist.dart';
import 'package:henri_ppp/services/chat_service.dart';

class chatController extends ChangeNotifier {
  List<ChatListModel> _chats = [];
  List<ChatListModel> get chatlistdata => _chats;

  Future openMessage(data) async {
    bool result = false;
    try {
      return await chatService().openMessage(ApiUrls().createChatRoom, data);
    } catch (e) {
      notifyListeners();
    }
  }

  getChatList() async {
    try {
      List<ChatListModel> user =
          await chatService().getChatList(ApiUrls().getChatRooms);
      _chats = user;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}

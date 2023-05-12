import 'package:flutter/material.dart';
import 'package:henri_ppp/services/chat_service.dart';

class chatController extends ChangeNotifier {
  Future openMessage(data) async {
    bool result = false;
    try {
      return await chatService().openMessage("createChatRoom", data);
    } catch (e) {
      notifyListeners();
    }
  }
}

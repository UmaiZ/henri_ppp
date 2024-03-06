import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/notifications/model/noitification.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/Feature/profile/models/user.dart';
import 'package:henri_ppp/services/feed_service.dart';
import 'package:henri_ppp/services/notification_service.dart';

class notificationController extends ChangeNotifier {
  List<notificationModel> _notifications = [];
  List<notificationModel> get notificationdata => _notifications;
  getNotification() async {
    bool result = false;
    try {
      List<notificationModel> user = await notificationService()
          .getNotification(ApiUrls().getNotification);
      _notifications = user;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

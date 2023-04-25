import 'package:flutter/material.dart';
import 'package:henri_ppp/models/feed.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/services/api.dart';

class FeedProvider extends ChangeNotifier {
  List<FeedModel> _feeds = [];
  List<FeedModel> get feeddata => _feeds;

  FeedProvider() {
    getFeed();
  }

  Future<bool> getFeed() async {
    print('call');
    bool result = false;
    try {
      List<FeedModel> user = await ApiService().getFeed("getNewsFeed");
      _feeds = user;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/models/feed.dart';
import 'package:henri_ppp/services/feed_service.dart';

class feedController extends ChangeNotifier {
  List<FeedModel> _feeds = [];
  List<FeedModel> get feeddata => _feeds;

  feedController() {
    getFeed();
  }

  getFeed() async {
    bool result = false;
    try {
      List<FeedModel> user = await feedService().getFeed(ApiUrls().getNewsFeed);
      _feeds = user;
      result = true;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
    return result;
  }
}

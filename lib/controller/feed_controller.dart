import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/models/feed.dart';
import 'package:henri_ppp/models/rating.dart';
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

  createRating(data, newsid, userid) async {
    try {
      var res = await feedService()
          .addRating("${ApiUrls().ratingnewsFeed}/$newsid", data);
      for (var element in _feeds) {
        if (element.sId == newsid) {
          if (element.rating!.any((item) => item.ratingBy == userid)) {
            print('exist');
            print(element.rating!);
            int indexToUpdate =
                element.rating!.indexWhere((item) => item.ratingBy == userid);
            element.rating![indexToUpdate].rating = res['data']['rating'];
          } else {
            print('noexist');
            element.rating!.add(Rating(
                sId: res['_id'],
                newsFeedId: res['newsFeedId'],
                ratingBy: res['ratingBy'],
                rating: res['rating'],
                createdAt: res['createdAt'],
                updatedAt: res['updatedAt']));
          }
          notifyListeners();
        }
      }
    } catch (e) {
      notifyListeners();
    }
  }
}

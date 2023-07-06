import 'package:flutter/widgets.dart';

class TabsController extends ChangeNotifier {
  int tabindex = 0;

  changeIndex(i) {
    tabindex = i;
    notifyListeners();
  }
}

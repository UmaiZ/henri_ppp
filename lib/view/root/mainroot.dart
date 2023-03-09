import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:henri_ppp/view/homeview/home.dart';
import 'package:henri_ppp/view/notifications/notification.dart';
import 'package:henri_ppp/view/post/createpost.dart';
import 'package:henri_ppp/view/profile/profile.dart';

int pageindex = 0;

class MainRoot extends StatefulWidget {
  const MainRoot({super.key});

  @override
  State<MainRoot> createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  var screens = [
    HomeScreen(),
    CreatePostScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      body: screens[pageindex],
    );
  }

  buildMyNavBar(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.11,
      color: Theme.of(context).colorScheme.secondary,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: pageindex == 0 ? size.height * 0.0375 : 5,
            left: size.width * 0.05,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageindex = 0;
                  });
                },
                child: bottomitems(0, Icons.home_outlined)),
          ),
          Positioned(
            bottom: pageindex == 1 ? size.height * 0.037 : 5,
            left: size.width * 0.29,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageindex = 1;
                  });
                },
                child: bottomitems(1, Icons.add_outlined)),
          ),
          Positioned(
            bottom: pageindex == 2 ? size.height * 0.037 : 5,
            right: size.width * 0.29,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageindex = 2;
                  });
                },
                child: bottomitems(2, Icons.notifications_outlined)),
          ),
          Positioned(
            bottom: pageindex == 3 ? size.height * 0.0375 : 5,
            right: size.width * 0.05,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageindex = 3;
                  });
                },
                child: bottomitems(3, Icons.person_outline)),
          ),
        ],
      ),
    );
  }

  Widget bottomitems(index, icon) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
          boxShadow: [
            index == pageindex
                ? BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                : BoxShadow(),
          ],
          borderRadius:
              BorderRadius.all(Radius.circular(index == pageindex ? 20 : 0)),
          color: index == pageindex
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

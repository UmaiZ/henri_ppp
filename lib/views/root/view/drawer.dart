import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/chat_controller.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/views/extra/view/privacy.dart';
import 'package:henri_ppp/views/extra/view/setting.dart';
import 'package:henri_ppp/views/extra/view/terms.dart';
import 'package:henri_ppp/views/live/view/livelist.dart';
import 'package:henri_ppp/views/messages/view/messagelist.dart';
import 'package:henri_ppp/views/profile/view/friendlist.dart';
import 'package:henri_ppp/views/profile/view/teamlist.dart';
import 'package:henri_ppp/views/root/view/mainroot.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // String userName = "";
  // String userEmail = "";
  // bool checkLogin = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context);
    final chatcontroller = Provider.of<chatController>(context);

    double resWidth = MediaQuery.of(context).size.width;
    double resHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              SizedBox(height: resHeight * 0.075),
              Container(
                width: resWidth * 0.85,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: resHeight * 0.035),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: CircleCacheImage(
                              url: usercontroller.userdata.userImage.toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(usercontroller.userdata.userName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(const TextStyle(
                                          color: Colors.white))),
                              Text(
                                usercontroller.userdata.userEmail.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: resHeight * 0.035),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          pageindex = 0;
                        });
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Home",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await chatcontroller.getChatList();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MessageList()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Messages",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          pageindex = 3;
                        });
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Profile",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await usercontroller.getFans();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FriendList()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Fans List",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await usercontroller.getTeammates();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TeamList()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Teammates",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LiveList()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Live Streams",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          pageindex = 2;
                        });
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Notifications",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SettingScreens()));
                            },
                            child: SizedBox(
                                width: resWidth * 0.4,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Settings",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white),
                                    ),
                                  ),
                                )),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TermsScreen()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Terms & Conditions",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacyScreen()));
                      },
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Privacy Policy",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: resWidth * 0.7,
                          height: resHeight * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: SizedBox(
                              width: resWidth * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Logout",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ))),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //     width: res_width * 0.7,
                    //     height: res_height * 0.065,
                    //     decoration: BoxDecoration(
                    //         color: Theme.of(context).colorScheme.primary,
                    //         borderRadius: BorderRadius.only(
                    //             topRight: Radius.circular(10),
                    //             bottomRight: Radius.circular(10))),
                    //     child: Container(
                    //         width: res_width * 0.4,
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(left: 20),
                    //           child: Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text(
                    //               "Help",
                    //               textAlign: TextAlign.left,
                    //               style: TextStyle(
                    //                   fontSize: 19, color: Colors.white),
                    //             ),
                    //           ),
                    //         ))),
                    SizedBox(
                      height: resHeight * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

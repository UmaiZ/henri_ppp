import 'dart:convert';

import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
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
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
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
              SizedBox(height: res_height * 0.075),
              Container(
                width: res_width * 0.85,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: res_height * 0.04),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/imageplaceholder.png',
                            width: 60,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Natasha Joe',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(TextStyle(color: Colors.white))),
                              Text(
                                'natashajoe@gmail.com',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: res_height * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: res_width * 0.7,
                        height: res_height * 0.065,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Container(
                            width: res_width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "My Friends",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                              ),
                            ))),
                    SizedBox(
                      height: 5,
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: res_width * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: res_width * 0.7,
                          height: res_height * 0.065,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                              width: res_width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                      height: res_height * 0.05,
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

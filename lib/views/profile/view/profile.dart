import 'package:flutter/material.dart';
import 'package:henri_ppp/providers/user_provider.dart';
import 'package:henri_ppp/views/post/view/createstory.dart';
import 'package:henri_ppp/views/profile/view/editprofile.dart';
import 'package:henri_ppp/views/root/view/drawer.dart';

import 'package:henri_ppp/widgets/button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int tabindex = 0;
  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<UserProvider>(context);

    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawer: const DrawerScreen(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        title: Text(
          'PROFILE',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                      width: size.width * 0.95,
                      height: size.height * 0.175,
                      child: Image.asset(
                        'assets/images/modelbanner.png',
                        fit: BoxFit.cover,
                      )),
                  FractionalTranslation(
                    translation: const Offset(0.0, 0.6),
                    child: SizedBox(
                      width: size.width * 0.25,
                      height: size.width * 0.25,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child:
                            Image.asset('assets/images/imageplaceholder.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    usercontroller.userdata.userName.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    width: size.width * 0.0125,
                  ),
                  Text(
                    '(Review 4.5)',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .merge(const TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                '${usercontroller.userdata.userCity != "" ? usercontroller.userdata.userCity.toString() : "N/A"} , ${usercontroller.userdata.userCountry != "" ? usercontroller.userdata.userCountry.toString() : "N/A"}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .merge(const TextStyle(
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const FriendList()));
              //   },
              //   child: Text(
              //     '245 Friends',
              //     style: Theme.of(context).textTheme.headlineSmall!.merge(
              //         const TextStyle(
              //             color: Colors.white, fontWeight: FontWeight.bold)),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.0125,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraAppTest()));
                    },
                    child: const btnGlobal(
                      width: 0.375,
                      height: 0.05,
                      text: "Add Highlight",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfile()));
                    },
                    child: const btnGlobal(
                      width: 0.375,
                      height: 0.05,
                      text: "Edit Profile",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width * 0.95,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 0;
                            });
                          },
                          child: TabButtons('Bio', 0)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 1;
                            });
                          },
                          child: TabButtons('Highlights', 1)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 2;
                            });
                          },
                          child: TabButtons('Rankings', 2)),
                      // SizedBox(
                      //   width: size.width * 0.0175,
                      // ),
                      // GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         tabindex = 3;
                      //       });
                      //     },
                      //     child: TabButtons('Detail', 3)),
                      // SizedBox(
                      //   width: size.width * 0.0175,
                      // ),
                      // GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         tabindex = 4;
                      //       });
                      //     },
                      //     child: TabButtons('Videos', 4))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              tabindex == 0
                  ? SizedBox(
                      width: size.width * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BIO',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            usercontroller.userdata.userBio != ""
                                ? usercontroller.userdata.userBio.toString()
                                : "N/A",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'TEAM',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            usercontroller.userdata.userTeam != ""
                                ? usercontroller.userdata.userTeam.toString()
                                : "N/A",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'COACHES',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            usercontroller.userdata.userCoaches != ""
                                ? usercontroller.userdata.userCoaches.toString()
                                : "N/A",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'SCHOOL',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            usercontroller.userdata.userSchool != ""
                                ? usercontroller.userdata.userSchool.toString()
                                : "N/A",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              tabindex == 1
                  ? SizedBox(
                      width: size.width * 0.95,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) => SizedBox(
                            width: size.width * 0.3,
                            height: size.width * 0.3,
                            child: Image.asset(
                              'assets/images/gallery${index + 1}.png',
                              fit: BoxFit.cover,
                            )),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget TabButtons(text, index) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            index == tabindex
                ? const Color(0xff916412)
                : Theme.of(context).colorScheme.secondary,
            index == tabindex
                ? const Color(0xfff1c720)
                : Theme.of(context).colorScheme.secondary,
            index == tabindex
                ? const Color(0xff916412)
                : Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(
                color: index == tabindex ? Colors.black : Colors.grey)),
          ),
        ),
      ),
    );
  }
}

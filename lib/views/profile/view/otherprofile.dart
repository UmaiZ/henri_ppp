import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/chat_controller.dart';
import 'package:henri_ppp/helpers/imagepicker/imagepicker.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/views/messages/view/mesagedetail.dart';
import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/roundcacheimage.dart';

import 'package:provider/provider.dart';

int tabindex = 0;

class OtherProfileScreen extends StatelessWidget {
  final UserModel userdata;
  const OtherProfileScreen({super.key, required this.userdata});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context);
    final chatcontroller = Provider.of<chatController>(context);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          '${userdata.userName}',
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
                  GestureDetector(
                    onTap: () async {},
                    child: SizedBox(
                      height: size.height * 0.175,
                      width: double.infinity,
                      child: userdata.userCover == ""
                          ? Image.asset(
                              'assets/images/modelbanner.png',
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: userdata.userCover.toString(),
                              placeholder: (context, url) => Container(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),

                  // SizedBox(
                  //     width: size.width * 0.95,
                  //     height: size.height * 0.175,
                  //     child: Image.asset(
                  //       'assets/images/modelbanner.png',
                  //       fit: BoxFit.cover,
                  //     )),
                  FractionalTranslation(
                    translation: const Offset(0.0, 0.6),
                    child: GestureDetector(
                      onTap: () async {
                        showLoader(context);

                        var image = await ImagePickerHelper().galleryImage();
                        if (await usercontroller
                            .updateMedia({}, image, 'userimage')) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        child: CircleAvatar(
                            radius: 100,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            child: userdata.userImage == ""
                                ? Image.asset(
                                    'assets/images/imageplaceholder.png')
                                : CircleCacheImage(
                                    userImage: userdata.userImage.toString())),
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
                    userdata.userName.toString(),
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
                '${userdata.userCity != "" ? userdata.userCity.toString() : "N/A"} , ${userdata.userCountry != "" ? userdata.userCountry.toString() : "N/A"}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const FriendList()));
                    },
                    child: Text(
                      '${userdata.userFollowers!.length} Followers',
                      style: Theme.of(context).textTheme.headlineSmall!.merge(
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text(
                    '   |   ',
                    style: Theme.of(context).textTheme.headlineSmall!.merge(
                        const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const FriendList()));
                    },
                    child: Text(
                      '${userdata.userFollowing!.length} Following',
                      style: Theme.of(context).textTheme.headlineSmall!.merge(
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.0125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      showLoader(context);
                      if (usercontroller.userdata.userFollowing!
                          .contains(userdata.sId)) {
                        if (await usercontroller.FollowUnFollow(
                            {'follow_id': userdata.sId})) {
                          usercontroller.removefollowing(userdata.sId);
                          usercontroller.removefollowselected(userdata.sId);

                          Navigator.pop(context);
                        }
                      } else {
                        if (await usercontroller.FollowUnFollow(
                            {'follow_id': userdata.sId})) {
                          usercontroller.addfollowing(userdata.sId);
                          usercontroller.addfollowselected(userdata.sId);

                          Navigator.pop(context);
                        }
                      }
                    },
                    child: btnGlobal(
                      width: 0.375,
                      height: 0.05,
                      text: usercontroller.userdata.userFollowing!
                              .contains(userdata.sId)
                          ? "UnFollow"
                          : "Follow",
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      showLoader(context);
                      await chatcontroller.openMessage({
                        'users': [userdata.sId]
                      }).then((value) {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatDetails(
                                  username: userdata.userName,
                                  userimage: userdata.userImage,
                                  roomid: value,
                                )));
                      });

                      // showLoader(context);
                      // if (await chatcontroller.openMessage({
                      //   'users': [userdata.sId]
                      // })) {
                      //   // usercontroller.addfollowing(userdata.sId);
                      //   // usercontroller.addfollowselected(userdata.sId);
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => MessageDetails()));
                      //   Navigator.pop(context);
                      // }
                    },
                    child: const btnGlobal(
                      width: 0.375,
                      height: 0.05,
                      text: "Message",
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
                            // setState(() {
                            //   tabindex = 0;
                            // });
                          },
                          child: TabButtons('Bio', 0, context)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   tabindex = 1;
                            // });
                          },
                          child: TabButtons('Highlights', 1, context)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   tabindex = 2;
                            // });
                          },
                          child: TabButtons('Rankings', 2, context)),
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
                            userdata.userBio != ""
                                ? userdata.userBio.toString()
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
                            userdata.userTeam != ""
                                ? userdata.userTeam.toString()
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
                            userdata.userCoaches != ""
                                ? userdata.userCoaches.toString()
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
                            userdata.userSchool != ""
                                ? userdata.userSchool.toString()
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

  Widget TabButtons(text, index, context) {
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

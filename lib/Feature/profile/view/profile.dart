import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:henri_ppp/Feature/root/controller/tabs_controller.dart';
import 'package:henri_ppp/helpers/imagepicker/imagepicker.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/Feature/post/view/createstory.dart';
import 'package:henri_ppp/Feature/profile/view/editprofile.dart';
import 'package:henri_ppp/Feature/root/view/drawer.dart';

import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final ucontroller = Provider.of<userController>(context, listen: false);
      ucontroller.getAverage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context);
    final tabcontroller = Provider.of<TabsController>(context);
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
                  GestureDetector(
                    onTap: () async {
                      var image = await ImagePickerHelper().galleryImage();
                      showLoader(context);
                      if (await usercontroller
                          .updateMedia({}, image, 'coverimage')) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: SizedBox(
                      height: size.height * 0.175,
                      width: double.infinity,
                      child: usercontroller.userdata.userCover == ""
                          ? Image.asset(
                              'assets/images/modelbanner.png',
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  usercontroller.userdata.userCover.toString(),
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
                        var image = await ImagePickerHelper().galleryImage();
                        showLoader(context);

                        if (await usercontroller
                            .updateMedia({}, image, 'image')) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        child: CircleCacheImage(
                            url: usercontroller.userdata.userImage.toString()),
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
                    '(Review ${usercontroller.useraverage.averageRating ?? "0.0"})',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CameraAppTest()));
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
                            tabcontroller.changeIndex(0);
                          },
                          child: TabButtons('Bio', 0)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            tabcontroller.changeIndex(1);
                          },
                          child: TabButtons('Highlights', 1)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            tabcontroller.changeIndex(2);
                          },
                          child: TabButtons('Rankings', 2)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              tabcontroller.tabindex == 0
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
              tabcontroller.tabindex == 1
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
                  : const SizedBox(),
              tabcontroller.tabindex == 2
                  ? Consumer<userController>(
                      builder: (context, uprovider, child) {
                        if (uprovider.useraverage.ratings!.isEmpty) {
                          // postProvider.getFeed();
                          return const Center(
                              child: Text('No Ranking Available'));
                        } else {
                          return SizedBox(
                            width: size.width * 0.925,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    uprovider.useraverage.ratings!.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: ListTile(
                                      tileColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      title: Text(
                                        uprovider
                                            .useraverage.ratings![i].description
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .merge(const TextStyle(
                                                color: Colors.white)),
                                      ),
                                      trailing: Wrap(
                                        children: [
                                          RatingBar(
                                            itemSize: 20.0,
                                            initialRating: uprovider
                                                .useraverage.ratings![i].count!
                                                .toDouble(),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            ratingWidget: RatingWidget(
                                              full: Image.asset(
                                                'assets/images/flame.png',
                                              ),
                                              half: Image.asset(
                                                  'assets/images/flame.png'),
                                              empty: Image.asset(
                                                'assets/images/flame.png',
                                                color: Colors.grey,
                                              ),
                                            ),
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            onRatingUpdate: (rating) {
                                              // print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      },
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
    final tabcontroller = Provider.of<TabsController>(context);

    return Container(
      width: size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            index == tabcontroller.tabindex
                ? const Color(0xff916412)
                : Theme.of(context).colorScheme.secondary,
            index == tabcontroller.tabindex
                ? const Color(0xfff1c720)
                : Theme.of(context).colorScheme.secondary,
            index == tabcontroller.tabindex
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
                color: index == tabcontroller.tabindex
                    ? Colors.black
                    : Colors.grey)),
          ),
        ),
      ),
    );
  }
}

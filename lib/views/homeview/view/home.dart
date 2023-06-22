import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/feed_controller.dart';
import 'package:henri_ppp/controller/live_controller.dart';
import 'package:henri_ppp/controller/status_controller.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/views/homeview/view/storydetails.dart';
import 'package:henri_ppp/views/homeview/widget/post.dart';
import 'package:henri_ppp/views/live/view/golive.dart';
import 'package:henri_ppp/views/post/view/createstory.dart';
import 'package:henri_ppp/views/root/view/drawer.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    // final feedController = Provider.of<feedController>(context);
    // final statusController = Provider.of<statusController>(context);

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
        title: Image.asset(
          'assets/images/logoline.png',
          height: size.height * 0.0375,
        ),
        // title: Text(
        //   'HOME',
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () async {
                final livecontroller =
                    Provider.of<liveController>(context, listen: false);
                final usercontroller =
                    Provider.of<userController>(context, listen: false);

                showLoader(context);
                await livecontroller
                    .createRoom(usercontroller.userdata.sId)
                    .then((value) {
                  Navigator.pop(context);
                  print(value);
                });

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => goLiveScreen()));
              },
              child: Image.asset(
                'assets/images/live.png',
                color: Colors.white,
                width: 20,
                height: 20,
              )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CameraAppTest()));
              },
              child: Image.asset(
                'assets/images/story.png',
                color: Colors.white,
                width: 20,
                height: 20,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              storelist(context),
              Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                            height: size.width * 0.1,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              child: Image.asset(
                                  'assets/images/imageplaceholder.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Show how you are training",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .merge(const TextStyle(color: Colors.grey)),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/imageicon.png',
                        color: Colors.grey,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Consumer<feedController>(
                builder: (context, postProvider, child) {
                  if (postProvider.feeddata.isEmpty) {
                    // postProvider.getFeed();
                    return const Center(child: Text('No Post Available'));
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: postProvider.feeddata.length,
                      itemBuilder: (context, index) {
                        return PostWidget(data: postProvider.feeddata[index]);
                      },
                    );
                  }
                },
              ),

              // feedController.feeddata.isNotEmpty
              //     ? SizedBox(
              //         child: ListView.builder(
              //             physics: const NeverScrollableScrollPhysics(),
              //             shrinkWrap: true,
              //             itemCount: feedController.feeddata.length,
              //             itemBuilder: (context, index) {
              //               return PostWidget(
              //                   data: feedController.feeddata[index]);
              //             }),
              //       )
              //     : const SizedBox(),
              SizedBox(
                height: size.height * 0.01,
              ),
              // postbox(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget storelist(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<statusController>(
      builder: (context, statusController, child) {
        if (statusController.statusdata.isEmpty) {
          // statusController.getStatus();
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CameraAppTest()));
                  },
                  child: SizedBox(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.025,
                ),
                const Text('No Highlights Available'),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: size.height * 0.095,
            width: size.width * 0.95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statusController.statusdata.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CameraAppTest()));
                            },
                            child: SizedBox(
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const StoryScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                height: size.height * 0.095,
                                width: size.height * 0.095,
                                child: CircleCacheImage(
                                  url: statusController
                                      .statusdata[index].createdBy.userImage,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: size.height * 0.095,
                          width: size.height * 0.095,
                          child: statusController
                                      .statusdata[index].createdBy.userImage ==
                                  ""
                              ? Image.asset(
                                  'assets/images/imageplaceholder.png')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    imageUrl: statusController
                                        .statusdata[index].createdBy.userImage
                                        .toString(),
                                    placeholder: (context, url) => Container(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      );
              },
            ),
          );
        }
      },
    );
  }
}
  //   return SizedBox(
  //     height: size.height * 0.125,
  //     width: size.width * 0.95,
  //     child: ListView.builder(
  //       itemCount: 6,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, i) {
  //         return i == 0
  //             ? Row(
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       Navigator.of(context).push(MaterialPageRoute(
  //                           builder: (context) => const CameraAppTest()));
  //                     },
  //                     child: SizedBox(
  //                       width: size.width * 0.2,
  //                       height: size.width * 0.2,
  //                       child: CircleAvatar(
  //                         radius: 100,
  //                         backgroundColor:
  //                             Theme.of(context).colorScheme.secondary,
  //                         child: const Icon(
  //                           Icons.add,
  //                           color: Colors.grey,
  //                           size: 30,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: SizedBox(
  //                       width: size.width * 0.2,
  //                       height: size.width * 0.2,
  //                       child: CircleAvatar(
  //                         radius: 100,
  //                         backgroundColor:
  //                             Theme.of(context).colorScheme.secondary,
  //                         child:
  //                             Image.asset('assets/images/imageplaceholder.png'),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               )
  //             : Padding(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 child: SizedBox(
  //                   width: size.width * 0.2,
  //                   height: size.width * 0.2,
  //                   child: CircleAvatar(
  //                     radius: 100,
  //                     backgroundColor: Theme.of(context).colorScheme.secondary,
  //                     child: Image.asset('assets/images/imageplaceholder.png'),
  //                   ),
  //                 ),
  //               );
  //       },
  //     ),
  //   );
  
  
  // }


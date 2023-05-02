import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:henri_ppp/providers/feed_provider.dart';
import 'package:henri_ppp/providers/status_provider.dart';
import 'package:henri_ppp/views/homeview/widget/post.dart';
import 'package:henri_ppp/views/live/view/golive.dart';
import 'package:henri_ppp/views/post/view/createstory.dart';
import 'package:henri_ppp/views/root/view/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    // final feedprovider = Provider.of<FeedProvider>(context);
    // final statusprovider = Provider.of<StatusProvider>(context);

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
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => goLiveScreen()));
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
              Consumer<FeedProvider>(
                builder: (context, postProvider, child) {
                  if (postProvider.feeddata.isEmpty) {
                    postProvider.getFeed();
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
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

              // feedprovider.feeddata.isNotEmpty
              //     ? SizedBox(
              //         child: ListView.builder(
              //             physics: const NeverScrollableScrollPhysics(),
              //             shrinkWrap: true,
              //             itemCount: feedprovider.feeddata.length,
              //             itemBuilder: (context, index) {
              //               return PostWidget(
              //                   data: feedprovider.feeddata[index]);
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
    return Consumer<StatusProvider>(
      builder: (context, statusProvider, child) {
        if (statusProvider.statusdata.isEmpty) {
          statusProvider.getStatus();
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else {
          return SizedBox(
            height: size.height * 0.095,
            width: size.width * 0.95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statusProvider.statusdata.length,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: size.height * 0.095,
                              width: size.height * 0.095,
                              child: statusProvider.statusdata[index].createdBy
                                          .userImage ==
                                      ""
                                  ? Image.asset(
                                      'assets/images/imageplaceholder.png')
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: CachedNetworkImage(
                                        imageUrl: statusProvider
                                            .statusdata[index]
                                            .createdBy
                                            .userImage
                                            .toString(),
                                        placeholder: (context, url) =>
                                            Container(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.fill,
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
                          child: statusProvider
                                      .statusdata[index].createdBy.userImage ==
                                  ""
                              ? Image.asset(
                                  'assets/images/imageplaceholder.png')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    imageUrl: statusProvider
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


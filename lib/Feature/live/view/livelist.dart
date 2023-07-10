import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/live/controller/live_controller.dart';
import 'package:henri_ppp/Feature/live/view/teststream.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';

class LiveList extends StatefulWidget {
  const LiveList({super.key});

  @override
  State<LiveList> createState() => _LiveListState();
}

class _LiveListState extends State<LiveList> {
  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final usercontroller = Provider.of<userController>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'LIVE LIST',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            // SizedBox(
            //   width: size.width * 0.95,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 tabindex = 0;
            //               });
            //             },
            //             child: TabButtons('ALL', 0)),
            //         SizedBox(
            //           width: size.width * 0.0175,
            //         ),
            //         GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 tabindex = 1;
            //               });
            //             },
            //             child: TabButtons('FRIENDS', 1)),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // SizedBox(
            //   width: size.width * 0.925,
            //   child: TextField(
            //     style: Theme.of(context).textTheme.bodyMedium,
            //     decoration: InputDecoration(
            //         hintText: "Search Friends",
            //         hintStyle: Theme.of(context).textTheme.bodySmall,
            //         filled: true,
            //         fillColor: Theme.of(context).colorScheme.secondary,
            //         suffixIcon: const Icon(
            //           Icons.search,
            //           color: Colors.grey,
            //         )),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),
            Consumer<liveController>(
              builder: (context, uprovider, child) {
                if (uprovider.rooms.isEmpty) {
                  // postProvider.getFeed();
                  return const Center(child: Text('No Live Available'));
                } else {
                  return Expanded(
                    child: SizedBox(
                      width: size.width * 0.925,
                      child: ListView.builder(
                          itemCount: uprovider.rooms.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LiveStreamTest(
                                          token: uprovider.rooms[i].token,
                                          channelname:
                                              uprovider.rooms[i].channelName,
                                          isAdmin: usercontroller.userdata.sId
                                                  .toString() ==
                                              uprovider.rooms[i].channelName
                                                  .toString(),
                                        )));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(5),
                                  tileColor:
                                      Theme.of(context).colorScheme.secondary,
                                  leading: SizedBox(
                                    height: size.height * 0.095,
                                    width: size.height * 0.095,
                                    child: CircleCacheImage(
                                      url: uprovider.rooms[i].uid!.userImage
                                          .toString(),
                                    ),
                                  ),
                                  title: Text(
                                    uprovider.rooms[i].uid!.userName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .merge(const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  // subtitle: Text(
                                  //   '17 mutual friends',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodySmall!
                                  //       .merge(
                                  //           const TextStyle(color: Colors.grey)),
                                  // ),
                                  // trailing: const Padding(
                                  //   padding: EdgeInsets.only(right: 5),
                                  //   child: Icon(
                                  //     Icons.more_vert_outlined,
                                  //     color: Colors.white,
                                  //     size: 30,
                                  //   ),
                                  // ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget TabButtons(text, index) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.235,
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

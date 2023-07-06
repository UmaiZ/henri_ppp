import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:provider/provider.dart';

class FriendList extends StatelessWidget {
  FriendList({super.key});

  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'FRIEND LIST',
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
            //             child: TabButtons('RECENT', 1)),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            SizedBox(
              width: size.width * 0.925,
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    hintText: "Search Friends",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Consumer<userController>(
              builder: (context, uprovider, child) {
                if (uprovider.userFans.isEmpty) {
                  // postProvider.getFeed();
                  return const Center(child: Text('No Fans Available'));
                } else {
                  return Expanded(
                    child: SizedBox(
                      width: size.width * 0.925,
                      child: ListView.builder(
                          itemCount: uprovider.userFans.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(5),
                                tileColor:
                                    Theme.of(context).colorScheme.secondary,
                                leading: SizedBox(
                                  width: size.width * 0.2,
                                  height: size.width * 0.2,
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    child: Image.asset(
                                        'assets/images/imageplaceholder.png'),
                                  ),
                                ),
                                title: Text(
                                  uprovider.userFans[i].userName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(
                                          const TextStyle(color: Colors.white)),
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

  // Widget TabButtons(text, index) {
  //   final Size size = MediaQuery.of(context).size;

  //   return Container(
  //     width: size.width * 0.225,
  //     decoration: BoxDecoration(
  //       borderRadius: const BorderRadius.all(Radius.circular(10)),
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: <Color>[
  //           index == tabindex
  //               ? const Color(0xff916412)
  //               : Theme.of(context).colorScheme.secondary,
  //           index == tabindex
  //               ? const Color(0xfff1c720)
  //               : Theme.of(context).colorScheme.secondary,
  //           index == tabindex
  //               ? const Color(0xff916412)
  //               : Theme.of(context).colorScheme.secondary
  //         ],
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(13.0),
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(
  //               color: index == tabindex ? Colors.black : Colors.grey)),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

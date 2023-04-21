import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:henri_ppp/features/live/view/golive.dart';
import 'package:henri_ppp/features/post/view/createstory.dart';
import 'package:henri_ppp/features/root/view/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      drawer: DrawerScreen(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Icon(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CameraAppTest()));
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
                          Container(
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
                                .merge(TextStyle(color: Colors.grey)),
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
              postbox(context),
              SizedBox(
                height: size.height * 0.01,
              ),
              postbox(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget storelist(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.125,
      width: size.width * 0.95,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return i == 0
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CameraAppTest()));
                      },
                      child: Container(
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child:
                              Image.asset('assets/images/imageplaceholder.png'),
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Image.asset('assets/images/imageplaceholder.png'),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget postbox(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                width: size.width * 0.125,
                height: size.width * 0.125,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Image.asset('assets/images/imageplaceholder.png'),
                ),
              ),
              title: Text(
                'John',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Row(
                children: [
                  Text(
                    '@Johnwatts',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .merge(TextStyle(color: Colors.grey)),
                  ),
                  Text(
                    '  Sponsorship',
                    style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w200)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'High Angle View of People on Bicycle',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .merge(TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset(
              'assets/images/postimage1.jpg',
              width: size.width * 0.9,
              height: size.height * 0.25,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 20.0,
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Image.asset(
                            'assets/images/flame.png',
                          ),
                          half: Image.asset('assets/images/flame.png'),
                          empty: Image.asset(
                            'assets/images/flame.png',
                            color: Colors.grey,
                          ),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        '4.5 Rating',
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                            TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Text(
                    '33 Comments',
                    style: Theme.of(context).textTheme.bodyLarge!.merge(
                        TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            Container(
              height: 0.75,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/flame.png',
                      width: size.width * 0.06,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rate',
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                          TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.grey,
                    ),
                    // Image.asset(
                    //   'assets/images/flame.png',
                    //   width: size.width * 0.06,
                    // ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Comments',
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                          TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.grey,
                    ),
                    // Image.asset(
                    //   'assets/images/flame.png',
                    //   width: size.width * 0.06,
                    // ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Share',
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                          TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

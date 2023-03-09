import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/view/post/createstory.dart';
import 'package:henri_ppp/view/profile/editprofile.dart';
import 'package:henri_ppp/view/profile/friendlist.dart';
import 'package:henri_ppp/view/root/drawer.dart';
import 'package:henri_ppp/widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int tabindex = 0;
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
                    child: Container(
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
                    'Sabestian',
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
                        .merge(TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                'Los Angeles , California',
                style:
                    Theme.of(context).textTheme.headlineMedium!.merge(TextStyle(
                          color: Colors.grey,
                        )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FriendList()));
                },
                child: Text(
                  '245 Friends',
                  style: Theme.of(context).textTheme.headlineSmall!.merge(
                      TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: size.height * 0.0125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraAppTest()));
                    },
                    child: btnGlobal(
                      width: 0.375,
                      height: 0.05,
                      text: "Add Story",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfile()));
                    },
                    child: btnGlobal(
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
                          child: TabButtons('About', 0)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 1;
                            });
                          },
                          child: TabButtons('Photos', 1)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 2;
                            });
                          },
                          child: TabButtons('Reviews', 2)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 3;
                            });
                          },
                          child: TabButtons('Detail', 3)),
                      SizedBox(
                        width: size.width * 0.0175,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabindex = 4;
                            });
                          },
                          child: TabButtons('Videos', 4))
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
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              tabindex == 3
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
                            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
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
                            'Tiger',
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
                            'Jack paul, Brain Lara, Chris Rock',
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
                            'ST Patric School',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              tabindex == 0 || tabindex == 1 || tabindex == 4
                  ? SizedBox(
                      width: size.width * 0.95,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                  : SizedBox()
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            index == tabindex
                ? Color(0xff916412)
                : Theme.of(context).colorScheme.secondary,
            index == tabindex
                ? Color(0xfff1c720)
                : Theme.of(context).colorScheme.secondary,
            index == tabindex
                ? Color(0xff916412)
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

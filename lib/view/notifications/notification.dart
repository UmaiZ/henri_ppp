import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
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
          'NOTIFICATIONS',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.025,
            ),
            Expanded(
              child: SizedBox(
                width: size.width * 0.925,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 7),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          tileColor: Theme.of(context).colorScheme.secondary,
                          leading: Container(
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
                            'Julia Anderson',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .merge(TextStyle(color: Colors.white)),
                          ),
                          subtitle: Text(
                            'Rate your post',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .merge(TextStyle(color: Colors.grey)),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

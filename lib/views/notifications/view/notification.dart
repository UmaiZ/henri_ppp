import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/views/root/view/drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawer: DrawerScreen(),
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
                        padding: const EdgeInsets.only(bottom: 7),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          tileColor: Theme.of(context).colorScheme.secondary,
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
                            'Julia Anderson',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .merge(const TextStyle(color: Colors.white)),
                          ),
                          subtitle: Text(
                            'Rate your post',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .merge(const TextStyle(color: Colors.grey)),
                          ),
                          trailing: const Padding(
                            padding: EdgeInsets.only(right: 5),
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

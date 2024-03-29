import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/Feature/notifications/controller/notification.dart';
import 'package:henri_ppp/Feature/root/view/drawer.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    // Use a Future.delayed to ensure that the context is available
    // before calling Provider.of
    Future.delayed(Duration.zero, () {
      final notificationControllerr =
          Provider.of<notificationController>(context, listen: false);
      notificationControllerr.getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationcontroller = Provider.of<notificationController>(context);

    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawer: const DrawerScreen(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
                    itemCount: notificationcontroller.notificationdata.length,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          tileColor: Theme.of(context).colorScheme.secondary,
                          leading: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          title: Text(
                            notificationcontroller
                                .notificationdata[i].notificationTitle
                                .toString(),
                            style: Theme.of(context).textTheme.bodyLarge!.merge(
                                const TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                          // subtitle: Text(
                          //   notificationcontroller
                          //       .notificationdata[i].notificationSubtitle
                          //       .toString(),
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .merge(const TextStyle(color: Colors.grey)),
                          // ),
                          // trailing: const Padding(
                          //   padding: EdgeInsets.only(right: 5),
                          //   child: Icon(
                          //     Icons.notifications_outlined,
                          //     color: Colors.white,
                          //     size: 30,
                          //   ),
                          // ),
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/view/live/livedetails.dart';

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
                        child: TabButtons('ALL', 0)),
                    SizedBox(
                      width: size.width * 0.0175,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tabindex = 1;
                          });
                        },
                        child: TabButtons('FRIENDS', 1)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.925,
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    hintText: "Search Friends",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: SizedBox(
                width: size.width * 0.925,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LiveScreen()));
                        },
                        child: Container(
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
                              '17 mutual friends',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .merge(TextStyle(color: Colors.grey)),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
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

  Widget TabButtons(text, index) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.235,
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/features/messages/view/mesagedetail.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'MESSAGES',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            messagehorizlist(context),
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
                              builder: (context) => MessageDetails()));
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
                            trailing: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.primary),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  '1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .merge(TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
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

  Widget messagehorizlist(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.125,
      width: size.width * 0.95,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: Container(
              width: size.width * 0.15,
              height: size.width * 0.15,
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
}

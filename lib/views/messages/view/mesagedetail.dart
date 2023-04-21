import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessageDetails extends StatelessWidget {
  const MessageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: TextField(
            keyboardType: TextInputType.multiline,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: "Type Message",
              hintStyle: Theme.of(context).textTheme.bodySmall,
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                mainAxisSize: MainAxisSize.min, // added line
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
            messageBox(
                true, 'Hey', 'assets/images/imageplaceholder.png', context),
            messageBox(
                false, 'Hey', 'assets/images/imageplaceholder.png', context),
          ],
        ),
      ),
    );
  }

  Widget messageBox(isMe, message, image, context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: size.width * 0.95,
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            isMe
                ? SizedBox()
                : Container(
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Image.asset('assets/images/imageplaceholder.png'),
                    ),
                  ),
            SizedBox(
              width: !isMe ? 10 : 0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(!isMe ? 0 : 20),
                      topRight: Radius.circular(isMe ? 0 : 20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  'Hey, How Are you ?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .merge(TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              width: isMe ? 10 : 0,
            ),
            isMe
                ? Container(
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Image.asset('assets/images/imageplaceholder.png'),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

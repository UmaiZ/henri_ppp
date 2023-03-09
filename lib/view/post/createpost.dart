import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/view/root/drawer.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

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
          'Create Post',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'Post',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: ListTile(
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
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 15,
                  maxLines: 20,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      hintText: "Whats's in your mind write something",
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.video_call_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.link_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

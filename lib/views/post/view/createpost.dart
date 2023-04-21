import 'dart:io';

import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/imagepicker/imagepicker.dart';
import 'package:henri_ppp/providers/create_post_provider.dart';
import 'package:henri_ppp/views/root/view/drawer.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    final postcontroller = Provider.of<createPostProvider>(context);

    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawer: const DrawerScreen(),
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
          FocusScope.of(context).requestFocus(FocusNode());
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
                  contentPadding: const EdgeInsets.all(0),
                  leading: SizedBox(
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
                height:
                    postcontroller.images.length > 0 ? size.height * 0.1 : 0,
                width: size.width * 0.9,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: postcontroller.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 13),
                        child: Stack(
                          children: [
                            Image.file(
                              File(postcontroller.images[index]!.path),
                              width: size.width * 0.3,
                              height: size.width * 0.3,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    postcontroller.deleteImage(index);
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height:
                    postcontroller.images.length > 0 ? size.height * 0.025 : 0,
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
                      children: [
                        const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.video_call_outlined,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var images = await ImagePickerHelper()
                                .galleryImageMultiple();
                            postcontroller.addImages(images);
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                        ),
                        const Icon(
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

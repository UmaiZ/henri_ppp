import 'dart:io';

import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/homeview/controller/feed_controller.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/helpers/imagepicker/imagepicker.dart';
import 'package:henri_ppp/Feature/post/controller/create_post_controller.dart';
import 'package:henri_ppp/Feature/root/view/drawer.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late VideoPlayerController controller;
  bool controllerinitialise = false;
  @override
  void dispose() {
    if (controllerinitialise) {
      controller.dispose();
    }
    super.dispose();
  }

  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postcontroller = Provider.of<createPostController>(context);
    final usercontroller = Provider.of<userController>(context);
    final postprovider = Provider.of<feedController>(context);

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
          'Create Post',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              showLoader(context);
              var data = {"description": descriptioncontroller.text.toString()};

              if (await postcontroller.createPost(
                  data, postcontroller.images)) {
                Navigator.pop(context);
                postprovider.getFeed();
                postcontroller.clearImages();
                descriptioncontroller.clear();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                'Post',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
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
                      width: size.width * 0.15,
                      child: CircleCacheImage(
                        url: usercontroller.userdata.userImage.toString(),
                      ),
                    ),
                    title: Text(
                      usercontroller.userdata.userName.toString(),
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
                              postcontroller.images[index]!.path
                                              .split('.')
                                              .last
                                              .toString()
                                              .toUpperCase() ==
                                          "MOV" ||
                                      postcontroller.images[index]!.path
                                              .split('.')
                                              .last
                                              .toString()
                                              .toUpperCase() ==
                                          "mp4"
                                  ? Container(
                                      // padding: const EdgeInsets.all(20),
                                      child: AspectRatio(
                                        aspectRatio:
                                            controller.value.aspectRatio,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: <Widget>[
                                            VideoPlayer(controller),
                                            ClosedCaption(
                                                text: controller
                                                    .value.caption.text),
                                            // _ControlsOverlay(controller: _controller),
                                            VideoProgressIndicator(controller,
                                                allowScrubbing: false),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Image.file(
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
                  height: postcontroller.images.length > 0
                      ? size.height * 0.025
                      : 0,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: descriptioncontroller,
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
                      width: size.width * 0.15,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const Icon(
                          //   Icons.emoji_emotions_outlined,
                          //   color: Colors.white,
                          // ),
                          GestureDetector(
                            onTap: () async {
                              var images = await ImagePickerHelper()
                                  .gallerVideoMultiple();
                              postcontroller.addVideo(images);

                              controller = VideoPlayerController.file(
                                File(images.path),
                                // closedCaptionFile: _loadCaptions(),
                                videoPlayerOptions:
                                    VideoPlayerOptions(mixWithOthers: true),
                              );

                              controller.addListener(() {
                                controllerinitialise = true;
                                setState(() {});
                              });
                              controller.setLooping(true);
                              controller.initialize();
                            },
                            child: const Icon(
                              Icons.video_call_outlined,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(
                            width: 10,
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
                          // const Icon(
                          //   Icons.file_copy_outlined,
                          //   color: Colors.white,
                          // ),
                          // const Icon(
                          //   Icons.link_outlined,
                          //   color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

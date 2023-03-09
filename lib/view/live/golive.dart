import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class goLiveScreen extends StatefulWidget {
  @override
  _goLiveScreenState createState() => _goLiveScreenState();
}

class _goLiveScreenState extends State<goLiveScreen> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image
  int counter = 0;
  var postType = 1;
  bool isvideo = false;
  bool showcomments = true;
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![counter], ResolutionPreset.max);
      counter = 1;
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
                height: size.height,
                width: 400,
                child: controller == null
                    ? Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            Positioned(
              left: 20,
              top: size.height * 0.06,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.11,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        'Comments',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .merge(TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Container(
                        width: size.width * 0.75,
                        height: size.height * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: 6,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 7),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(5),
                                    tileColor:
                                        Theme.of(context).colorScheme.secondary,
                                    leading: Container(
                                      width: size.width * 0.1,
                                      height: size.width * 0.1,
                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        child: Image.asset(
                                            'assets/images/imageplaceholder.png'),
                                      ),
                                    ),
                                    title: Text(
                                      'Julia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .merge(
                                              TextStyle(color: Colors.white)),
                                    ),
                                    subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer enim nibh, finibus vitae vehicula id',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .merge(
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showcomments = !showcomments;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            showcomments
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            Text(
                              showcomments ? 'Hide' : 'Comments',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .merge(TextStyle(color: Colors.white)),
                            ),
                            !showcomments
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: size.height * 0.015,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'LIVE',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .merge(TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.225,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Icon(
                      Icons.change_circle,
                      color: Colors.grey,
                      size: 40,
                    )
                  ],
                ))
          ],
        ),
      ),
      // body: Container(
      //     child: Column(children: [
      //   Container(
      //       height: 300,
      //       width: 400,
      //       child: controller == null
      //           ? Center(child: Text("Loading Camera..."))
      //           : !controller!.value.isInitialized
      //               ? Center(
      //                   child: CircularProgressIndicator(),
      //                 )
      //               : CameraPreview(controller!)),
      //   // Container(
      //   //   //show captured image
      //   //   padding: EdgeInsets.all(30),
      //   //   child: image == null
      //   //       ? Text("No image captured")
      //   //       : Image.file(
      //   //           File(image!.path),
      //   //           height: 300,
      //   //         ),
      //   //   //display captured image
      //   // )
      // ])),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     try {
      //       if (controller != null) {
      //         //check if contrller is not null
      //         if (controller!.value.isInitialized) {
      //           //check if controller is initialized
      //           image = await controller!.takePicture(); //capture image
      //           setState(() {
      //             //update UI
      //           });
      //         }
      //       }
      //     } catch (e) {
      //       print(e); //show error
      //     }
      //   },
      //   child: Icon(Icons.camera),
      // ),
    );
  }
}

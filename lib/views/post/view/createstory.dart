import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraAppTest extends StatefulWidget {
  @override
  _CameraAppTestState createState() => _CameraAppTestState();
}

class _CameraAppTestState extends State<CameraAppTest> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image
  int counter = 0;
  var postType = 1;
  bool isvideo = false;

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
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: res_height,
                width: 400,
                child: controller == null
                    ? Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            Positioned(
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: res_width * 0.575,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isvideo = !isvideo;
                            });
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  isvideo
                                      ? Icons.video_call
                                      : Icons.camera_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            cameras = await availableCameras();
                            if (cameras != null) {
                              controller = CameraController(
                                  cameras![counter], ResolutionPreset.max);
                              counter == 0 ? counter = 1 : counter = 0;
                              //cameras[0] = first camera, change to 1 to another camera

                              controller!.initialize().then((_) {
                                if (!mounted) {
                                  return;
                                }
                                setState(
                                  () {},
                                );
                              });
                            } else {
                              print("NO any camera found");
                            }
                            // controller = CameraController(
                            //   cameras![1], // camera![1] means front camera
                            //   ResolutionPreset.medium,
                            // );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.change_circle_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   width: res_width * 0.575,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 postType = 0;
                  //               });
                  //             },
                  //             child: Column(
                  //               children: [
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     // Get.to(() => CreateSpam());
                  //                   },
                  //                   child: Text(
                  //                     'Post',
                  //                     style: TextStyle(
                  //                         color: postType == 0
                  //                             ? Colors.black
                  //                             : Colors.grey,
                  //                         fontSize: postType == 0 ? 16 : 15,
                  //                         fontWeight: postType == 0
                  //                             ? FontWeight.bold
                  //                             : FontWeight.normal),
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: postType == 0 ? 5 : 1,
                  //                 ),
                  //                 postType == 0
                  //                     ? Container(
                  //                         height: 10,
                  //                         width: 10,
                  //                         decoration: BoxDecoration(
                  //                           color: Theme.of(context)
                  //                               .colorScheme
                  //                               .primary,
                  //                           borderRadius: BorderRadius.all(
                  //                             Radius.circular(20),
                  //                           ),
                  //                         ),
                  //                       )
                  //                     : Container()
                  //               ],
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 postType = 1;
                  //               });
                  //             },
                  //             child: Column(
                  //               children: [
                  //                 Text(
                  //                   'Story',
                  //                   style: TextStyle(
                  //                       color: postType == 1
                  //                           ? Colors.black
                  //                           : Colors.grey,
                  //                       fontSize: postType == 1 ? 16 : 15,
                  //                       fontWeight: postType == 1
                  //                           ? FontWeight.bold
                  //                           : FontWeight.normal),
                  //                 ),
                  //                 SizedBox(
                  //                   height: postType == 1 ? 5 : 1,
                  //                 ),
                  //                 postType == 1
                  //                     ? Container(
                  //                         height: 10,
                  //                         width: 10,
                  //                         decoration: BoxDecoration(
                  //                             color: Theme.of(context)
                  //                                 .colorScheme
                  //                                 .primary,
                  //                             borderRadius: BorderRadius.all(
                  //                                 Radius.circular(20))),
                  //                       )
                  //                     : Container()
                  //               ],
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 postType = 1;
                  //               });
                  //             },
                  //             child: Column(
                  //               children: [
                  //                 Text(
                  //                   'Live',
                  //                   style: TextStyle(
                  //                       color: postType == 2
                  //                           ? Colors.black
                  //                           : Colors.grey,
                  //                       fontSize: postType == 2 ? 16 : 15,
                  //                       fontWeight: postType == 2
                  //                           ? FontWeight.bold
                  //                           : FontWeight.normal),
                  //                 ),
                  //                 SizedBox(
                  //                   height: postType == 2 ? 5 : 1,
                  //                 ),
                  //                 postType == 2
                  //                     ? Container(
                  //                         height: 10,
                  //                         width: 10,
                  //                         decoration: BoxDecoration(
                  //                             color: Theme.of(context)
                  //                                 .colorScheme
                  //                                 .primary,
                  //                             borderRadius: BorderRadius.all(
                  //                                 Radius.circular(20))),
                  //                       )
                  //                     : Container()
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )

                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.red,
                  // ),
                ],
              ),
            )
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

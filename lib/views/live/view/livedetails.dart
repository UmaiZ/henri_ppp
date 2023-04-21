import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late VideoPlayerController _controller;
  bool showcomments = true;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/livevideo.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
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
            bottom: 5,
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
                                        .merge(TextStyle(color: Colors.white)),
                                  ),
                                  subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer enim nibh, finibus vitae vehicula id',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .merge(TextStyle(color: Colors.white)),
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
                    )
                  ],
                ),
              ),
            ),
          ),

          // Positioned(
          //     bottom: size.height * 0.015,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: size.width * 0.05,
          //         ),
          //         Row(
          //           children: [
          //             Icon(
          //               Icons.circle,
          //               color: Colors.red,
          //               size: 15,
          //             ),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             Text(
          //               'LIVE',
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyLarge!
          //                   .merge(TextStyle(color: Colors.red)),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           width: size.width * 0.225,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.pop(context);
          //           },
          //           child: Container(
          //             width: 65.0,
          //             height: 65.0,
          //             decoration: BoxDecoration(
          //               color: Colors.red,
          //               borderRadius: BorderRadius.all(Radius.circular(50.0)),
          //               border: Border.all(
          //                 color: Colors.white,
          //                 width: 4.0,
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: size.width * 0.05,
          //         ),
          //         Icon(
          //           Icons.change_circle,
          //           color: Colors.grey,
          //           size: 40,
          //         )
          //       ],
          //     ))
        ],
      ),
    );
  }
}

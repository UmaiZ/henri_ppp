import 'dart:io';

import 'package:flutter/material.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/controller/status_controller.dart';
import 'package:henri_ppp/views/root/view/mainroot.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ViewVideoStory extends StatefulWidget {
  final String path;
  final XFile file;
  final String type;
  const ViewVideoStory(
      {super.key, required this.path, required this.file, required this.type});

  @override
  State<ViewVideoStory> createState() => _ViewVideoStoryState();
}

class _ViewVideoStoryState extends State<ViewVideoStory> {
  late VideoPlayerController _videoPlayerController;
  final TextEditingController _textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.type == "video") {
      _videoPlayerController = VideoPlayerController.file(File(widget.path));
      _videoPlayerController.initialize().then((value) {
        setState(() {
          _videoPlayerController.setLooping(true);

          _videoPlayerController.play();
        });
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statuscontroller = Provider.of<statusController>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'UPLOAD',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              showLoader(context);

              if (await statuscontroller.createStory(
                  {"text": _textcontroller.text.toString()}, widget.file)) {
                Navigator.pop(context);

                statuscontroller.getStatus();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MainRoot()));
              } else {
                Navigator.pop(context);
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.send),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.type == "video"
                ? _videoPlayerController.value.isInitialized
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      )
                    : Container()
                : Container(
                    child: Image.file(
                      File(widget.path),
                      height: MediaQuery.of(context).size.height * 0.75,
                    ),
                  ),
            TextField(
              controller: _textcontroller,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .merge(const TextStyle(color: Colors.white)),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a story',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .merge(const TextStyle(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}

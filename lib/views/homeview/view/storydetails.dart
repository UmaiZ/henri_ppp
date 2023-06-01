import 'dart:async';
import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/status_controller.dart';
import 'package:henri_ppp/views/homeview/widget/videoplayer.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  final List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];
  int _slideDuration = 10;
  final List<Widget> _storyIndicators = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final statuscontroller =
          Provider.of<statusController>(context, listen: false);
// context.read<Auth>()
      setState(() {
        if (_currentPage < statuscontroller.statusdata.length - 1) {
          if (_slideDuration <= 0) {
            _slideDuration = 10;
            _currentPage++;
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            _startTimer();
          } else {
            _slideDuration--;
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _navigateToNextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _slideDuration = 10;
      });
      _resetTimer();
    }
  }

  void _navigateToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _slideDuration = 10;
      });
      _resetTimer();
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  Widget buildPageIndicator() {
    final statuscontroller = Provider.of<statusController>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: statuscontroller.statusdata.length,
      itemBuilder: (context, index) {
        double indicatorWidth = 40.0;
        if (_currentPage == index) {
          double remainingSeconds = _slideDuration.toDouble();
          double maxSeconds = 10.0; // Total duration in seconds
          indicatorWidth = (remainingSeconds / maxSeconds) * 40.0;
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: indicatorWidth,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            color: _currentPage == index
                ? Colors.white
                : Theme.of(context).colorScheme.secondary,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final statuscontroller = Provider.of<statusController>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: GestureDetector(
        onTap: _navigateToNextPage,
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            _navigateToPreviousPage();
          } else if (details.primaryVelocity! < 0) {
            _navigateToNextPage();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _pageController,
              children: [
                for (int i = 0; i < statuscontroller.statusdata.length; i++)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: CircleCacheImage(
                                url: statuscontroller
                                    .statusdata[i].createdBy.userImage,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${statuscontroller.statusdata[i].createdBy.userName}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: size.height * 0.75,
                          width: double.infinity,
                          child: statuscontroller.statusdata[i].statusImage ==
                                  ""
                              ? VideoPlayWidget(
                                  videoUrl: statuscontroller
                                      .statusdata[i].statusVideo,
                                )
                              : Image.network(
                                  statuscontroller.statusdata[i].statusImage,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          statuscontroller.statusdata[i].statusText,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
              ],
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                  _slideDuration = 10;
                });
                _resetTimer();
              },
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 7, width: 300, child: buildPageIndicator()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

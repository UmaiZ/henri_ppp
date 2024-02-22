import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henri_ppp/Feature/homeview/controller/feed_controller.dart';
import 'package:henri_ppp/Feature/homeview/view/videoplayerwidget.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/services/feed_service.dart';
import 'package:henri_ppp/Feature/homeview/widget/commentbox.dart';
import 'package:henri_ppp/Feature/profile/view/otherprofile.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  final data;
  const PostWidget({super.key, required this.data});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final usercontroller = Provider.of<userController>(context);
    print(widget.data.rating);

    return Container(
      width: size.width * 0.95,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await usercontroller
                    .fetchselecteduserDetails(widget.data.createdBy.sId);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OtherProfileScreen(
                          userdata: usercontroller.userselecteditem!,
                        )));
                // print(usercontroller.userselecteditem);
              },
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: SizedBox(
                    height: size.height * 0.07,
                    width: size.height * 0.07,
                    child: CircleCacheImage(
                      url: widget.data.createdBy.userImage,
                    ))
                // ? CachedNetworkImage(
                //     imageUrl: widget.data.createdBy.userImage,
                //     placeholder: (context, url) =>
                //         const CircularProgressIndicator(),
                //     errorWidget: (context, url, error) =>
                //         const Icon(Icons.error),
                //   )
                ,
                title: Text(
                  widget.data.createdBy.userName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Row(
                  children: [
                    Text(
                      '@${widget.data.createdBy.userName}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .merge(const TextStyle(color: Colors.grey)),
                    ),
                    Text(
                      '  Sponsorship',
                      style: Theme.of(context).textTheme.bodySmall!.merge(
                          const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.data.description.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .merge(const TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            widget.data.images.isNotEmpty &&
                    (widget.data.images[0].toString().split('.').last ==
                            "mp4" ||
                        widget.data.images[0].toString().split('.').last ==
                            "MOV")
                ? VideoPlayerWidget(
                    videoUrl: widget.data.images[0].toString(),
                  )
                : SizedBox(
                    height:
                        widget.data.images.length > 0 ? size.height * 0.35 : 0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data.images.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.center,
                            child: CachedNetworkImage(
                              imageUrl: widget.data.images[index],
                              placeholder: (context, url) =>
                                  const SpinKitChasingDots(
                                color: Colors.white,
                                size: 50.0,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          );
                        }),
                  ),
            // Image.asset(
            //   'assets/images/postimage1.jpg',
            //   width: size.width * 0.9,
            //   height: size.height * 0.25,
            //   fit: BoxFit.fill,
            // ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 20.0,
                        initialRating: widget.data.rating.length > 0
                            ? widget.data.rating.length == 1
                                ? widget.data.rating[0].rating.toDouble()
                                : widget.data.rating
                                        .map((m) => m.rating)
                                        .reduce((a, b) => a + b) /
                                    widget.data.rating.length
                            : 0,
                        // initialRating: widget.data.rating.length > 0
                        //     ? widget.data.rating
                        //             .map((m) => m.rating)
                        //             .reduce((a, b) => a + b) /
                        //         widget.data.rating.length
                        //     : 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Image.asset(
                            'assets/images/flame.png',
                          ),
                          half: Image.asset('assets/images/flame.png'),
                          empty: Image.asset(
                            'assets/images/flame.png',
                            color: Colors.grey,
                          ),
                        ),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          // print(rating);
                        },
                      ),
                      Text(
                        widget.data.rating.length > 0
                            ? '${widget.data.rating.map((m) => m.rating).reduce((a, b) => a + b) / widget.data.rating.length} Rating'
                            : '0 Rating',
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                            const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.data.comment.length} Comments',
                    style: Theme.of(context).textTheme.bodyLarge!.merge(
                        const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            Container(
              height: 0.75,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // print(widget.data.rating);
                    // var foundItem = widget.data.rating.firstWhere(
                    //     (item) => item.ratingBy == usercontroller.userdata.sId);
                    // print(foundItem);
                    showModalBottomSheet(
                        clipBehavior: Clip.hardEdge,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(),
                        context: context,
                        builder: (
                          context,
                        ) {
                          return ratePost(
                            ratinggive: !widget.data.rating.any((item) =>
                                    item.ratingBy ==
                                    usercontroller.userdata.sId)
                                ? 0.0
                                : 0.0,
                            feedID: widget.data.sId,
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/flame.png',
                        width: size.width * 0.06,
                        color: !widget.data.rating.any((item) =>
                                item.ratingBy == usercontroller.userdata.sId)
                            ? Colors.grey
                            : null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Rate',
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                            const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await feedService()
                        .getComments(
                            '${ApiUrls().newsFeedComment}/${widget.data.sId}')
                        .then((value) {
                      logger.d(value);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => commentBox(
                                comments: value,
                                newsId: widget.data.sId,
                              )));

                      // showModalBottomSheet(
                      //     clipBehavior: Clip.hardEdge,
                      //     isScrollControlled: true,
                      //     shape: const RoundedRectangleBorder(),
                      //     context: context,
                      //     builder: (
                      //       context,
                      //     ) {
                      //       return commentBox(
                      // comments: value,
                      // newsId: widget.data.sId,
                      //       );
                      //     });
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey,
                      ),
                      // Image.asset(
                      //   'assets/images/flame.png',
                      //   width: size.width * 0.06,
                      // ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Comments',
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                            const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.share_outlined,
                //       color: Colors.grey,
                //     ),

                //     // Image.asset(
                //     //   'assets/images/flame.png',
                //     //   width: size.width * 0.06,
                //     // ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       'Share',
                //       style: Theme.of(context).textTheme.bodyLarge!.merge(
                //           const TextStyle(
                //               color: Colors.grey, fontWeight: FontWeight.w500)),
                //     ),
                //   ],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ratePost extends StatelessWidget {
  final ratinggive;
  final feedID;
  const ratePost({super.key, this.ratinggive, this.feedID});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final feedcontroller = Provider.of<feedController>(context);
    final usercontroller = Provider.of<userController>(context);

    return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: height * 0.2,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Rate',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .merge(const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          RatingBar(
            itemSize: 40.0,
            initialRating: ratinggive,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: Image.asset(
                'assets/images/flame.png',
              ),
              half: Image.asset('assets/images/flame.png'),
              empty: Image.asset(
                'assets/images/flame.png',
                color: Colors.grey,
              ),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) async {
              // print(await feedcontroller.createRating(
              //     {'rating': rating}, feedID, usercontroller.userdata.sId));
              showLoader(context);
              await feedcontroller.createRating({'rating': rating}, feedID,
                  usercontroller.userdata.sId).then((res) {
                Navigator.pop(context);
              });

              // Navigator.pop(context);
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

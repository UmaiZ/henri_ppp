import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

    return Container(
      width: size.width * 0.95,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: widget.data.createdBy.userImage != ""
                  ? CachedNetworkImage(
                      imageUrl: widget.data.createdBy.userImage,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : SizedBox(
                      width: size.width * 0.125,
                      height: size.width * 0.125,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child:
                            Image.asset('assets/images/imageplaceholder.png'),
                      ),
                    ),
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
            SizedBox(
              height: widget.data.images.length > 0 ? size.height * 0.225 : 0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.data.images.length,
                  itemBuilder: (context, index) {
                    print(widget.data.images[index].toString());
                    print(widget.data.images[index].toString().split('.').last);
                    return widget.data.images[index]
                                    .toString()
                                    .split('.')
                                    .last !=
                                "mp4" ||
                            widget.data.images[index]
                                    .toString()
                                    .split('.')
                                    .last !=
                                "MOV"
                        ? CachedNetworkImage(
                            imageUrl: widget.data.images[index],
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Container(
                            width: 20,
                            height: 20,
                            color: Colors.red,
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
                        initialRating: 3,
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
                          print(rating);
                        },
                      ),
                      Text(
                        '4.5 Rating',
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                            const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Text(
                    '33 Comments',
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
                Row(
                  children: [
                    Image.asset(
                      'assets/images/flame.png',
                      width: size.width * 0.06,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rate',
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                          const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Row(
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
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.share_outlined,
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
                      'Share',
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                          const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

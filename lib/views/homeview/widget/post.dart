import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:henri_ppp/helpers/logger/logger.dart';
import 'package:henri_ppp/models/comments.dart';
import 'package:henri_ppp/models/user.dart';
import 'package:henri_ppp/providers/user_provider.dart';
import 'package:henri_ppp/services/api.dart';
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

    return Container(
      width: size.width * 0.95,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: SizedBox(
                height: size.height * 0.07,
                width: size.height * 0.07,
                child: widget.data.createdBy.userImage == ""
                    ? Image.asset('assets/images/imageplaceholder.png')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: CachedNetworkImage(
                          imageUrl: widget.data.createdBy.userImage.toString(),
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
              )
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
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                GestureDetector(
                  onTap: () async {
                    var list = await ApiService()
                        .getComments('newsFeedComment/${widget.data.sId}')
                        .then((value) {
                      logger.d(value);

                      commentboxmodal(value, widget.data.sId, context);
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

commentboxmodal(comments, newsId, context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  TextEditingController chatcontroller = TextEditingController();

  showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(),
      context: context,
      builder: (
        context,
      ) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              color: Theme.of(context).colorScheme.secondary,
              height: height * 0.8,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Comments',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .merge(TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: height * 0.625,
                    child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CachedNetworkImage(
                                    imageUrl:
                                        comments[index].commentBy.userImage,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(
                                    comments[index].commentBy.userName,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    comments[index].commentDetail,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    width: width * 0.95,
                    child: TextFormField(
                      controller: chatcontroller,
                      autocorrect: false,
                      enableSuggestions: false,
                      onChanged: (val) {
                        // playercontroller.changeSearchString(val);
                      },
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Required field';
                      },
                      keyboardType: TextInputType.emailAddress,

                      // controller: username,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                print({
                                  'newsFeedId': newsId,
                                  'commentDetail':
                                      chatcontroller.text.toString()
                                });
                                if (chatcontroller.text.toString() != "") {
                                  ApiService().addComment('commentNewsFeed', {
                                    'newsFeedId': newsId,
                                    'commentDetail':
                                        chatcontroller.text.toString()
                                  }).then((val) {
                                    if (val) {
                                      final playercontroller =
                                          Provider.of<UserProvider>(context,
                                              listen: false);

                                      setState(() {
                                        comments.add(CommentModel(
                                            commentDetail:
                                                chatcontroller.text.toString(),
                                            commentBy: UserModel(
                                                userName: playercontroller
                                                    .userdata.userName,
                                                userImage: playercontroller
                                                    .userdata.userImage)));

                                        // comments.add({
                                        //   'commentDetail':
                                        //       chatcontroller.text.toString(),
                                        //   'commentBy': {
                                        //     'userName': playercontroller
                                        //         .userdata.userName,
                                        //     'userImage': playercontroller
                                        //         .userdata.userImage,
                                        //   }
                                        // });
                                        chatcontroller.clear();
                                      });
                                    }
                                  });
                                } else {
                                  // showToast('Add a comment');
                                }
                              },
                              child: Icon(Icons.send)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          hintText: 'Leave your comment',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          // suffixIcon: inputWidget,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(20)),
                    ),
                  ),
                ],
              ));
        });
      });
}

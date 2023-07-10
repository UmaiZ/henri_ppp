import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/Feature/homeview/models/comments.dart';
import 'package:henri_ppp/Feature/profile/models/user.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/services/feed_service.dart';
import 'package:provider/provider.dart';

class commentBox extends StatefulWidget {
  final comments;
  final newsId;

  const commentBox({super.key, this.comments, this.newsId});

  @override
  State<commentBox> createState() => _commentBoxState();
}

class _commentBoxState extends State<commentBox> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController chatcontroller = TextEditingController();

    return Container(
        color: Theme.of(context).colorScheme.secondary,
        height: height * 0.8,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Comments',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .merge(const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: height * 0.625,
              child: ListView.builder(
                  itemCount: widget.comments.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:
                                  widget.comments[index].commentBy.userImage,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
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
                              widget.comments[index].commentBy.userName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              widget.comments[index].commentDetail,
                              style: Theme.of(context).textTheme.bodySmall,
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
                  return null;
                },
                keyboardType: TextInputType.emailAddress,

                // controller: username,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          if (chatcontroller.text.toString() != "") {
                            feedService().addComment(
                                ApiUrls().commentNewsFeed, {
                              'newsFeedId': widget.newsId,
                              'commentDetail': chatcontroller.text.toString()
                            }).then((val) {
                              if (val) {
                                final playercontroller =
                                    Provider.of<userController>(context,
                                        listen: false);

                                setState(() {
                                  widget.comments.add(CommentModel(
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
                        child: const Icon(Icons.send)),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    hintText: 'Leave your comment',
                    hintStyle: const TextStyle(
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
  }
}

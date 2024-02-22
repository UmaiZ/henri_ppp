import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/Feature/homeview/models/comments.dart';
import 'package:henri_ppp/Feature/profile/models/user.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:henri_ppp/services/feed_service.dart';
import 'package:henri_ppp/widgets/circlecacheimage.dart';
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
    final Size size = MediaQuery.of(context).size;

    TextEditingController chatcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'COMMENTS',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.comments.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: const EdgeInsets.all(0),
                          leading: SizedBox(
                            width: size.width * 0.25,
                            height: size.width * 0.25,
                            child: CircleCacheImage(
                                url:
                                    widget.comments[index].commentBy.userImage),
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

              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Required field';
                return null;
              },
              // controller: username,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        final playercontroller =
                            Provider.of<userController>(context, listen: false);

                        if (chatcontroller.text.toString() != "") {
                          feedService().addComment(ApiUrls().commentNewsFeed, {
                            'newsFeedId': widget.newsId,
                            'commentDetail': chatcontroller.text.toString()
                          }).then((val) {
                            if (val) {
                              setState(() {
                                widget.comments.add(CommentModel(
                                    commentDetail:
                                        chatcontroller.text.toString(),
                                    commentBy: UserModel(
                                        userName:
                                            playercontroller.userdata.userName,
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
      ),
    );
  }
}

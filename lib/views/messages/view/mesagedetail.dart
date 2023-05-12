import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/helpers/network/network.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';

class ChatDetails extends StatefulWidget {
  final roomid;
  final userimage;
  final username;
  final usersarray;
  final type;

  const ChatDetails(
      {super.key,
      this.roomid,
      this.userimage,
      this.username,
      this.usersarray,
      this.type});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  late IO.Socket socket;
  String userId = "";
  TextEditingController messagecontroller = TextEditingController();

  List messageList = [];
  @override
  initState() {
    super.initState();

    connectsocket();
  }

  final ScrollController _scrollController = ScrollController();

  void connectsocket() {
    userId = Provider.of<userController>(context, listen: false)
        .userdata
        .sId
        .toString();

    try {
      // Configure socket transports must be sepecified
      socket = IO.io(ApiUrls().SocketUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'force new connection': true,
      });

      // Connect to websocket
      socket.connect();

      socket.on('connect', (_) {
        print('connect: ${socket.id}');

        socket.emit('joinRoom', {'user': userId, 'chatroom': widget.roomid});

        socket.on('getRoom', (data) {
          setState(() {
            messageList = data['data']['messages'];
            messageList = Set.of(messageList).toList();
          });
          Future.delayed(const Duration(seconds: 1), () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
            );
          });
        });

        socket.on('message', (data) {
          print(data);
          setState(() {
            if (messageList
                .where((element) => element['_id'] == data['data']['id'])
                .toList()
                .isNotEmpty) {
            } else {
              messageList.add(data['data']);
            }
          });
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    socket.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomSheet: getBottom(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: BackWidget(),
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.1,
              height: size.width * 0.1,
              child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: widget.userimage == ""
                      ? Image.asset('assets/images/imageplaceholder.png')
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.userimage.toString(),
                            placeholder: (context, url) => Container(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        )),
            ),
            const SizedBox(
              width: 10,
            ),
            widget.usersarray != null
                ? SizedBox(
                    height: 25,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) => Row(
                        children: [
                          Text(
                            '${widget.usersarray[index]['userName']} ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          index == 2
                              ? Text(
                                  '...',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  )
                : Text(
                    widget.username,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * 0.95,
                  child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        String userimage = "";
                        if (widget.usersarray != null) {
                          var data = widget.usersarray
                              .where((e) =>
                                  e['userID'] ==
                                  messageList[index]['user'].toString())
                              .toList();
                          userimage = data[0]['userImage'];
                        }
                        String formattedTime = DateFormat.jm().format(
                            DateTime.parse(messageList[index]['createdAt']));

                        return Row(
                          mainAxisAlignment:
                              messageList[index]['user'].toString() !=
                                      userId.toString()
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: size.width * 0.075,
                              height: size.width * 0.075,
                              child: CircleAvatar(
                                  radius: 100,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  child: widget.userimage == ""
                                      ? Image.asset(
                                          'assets/images/imageplaceholder.png')
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                widget.userimage.toString(),
                                            placeholder: (context, url) =>
                                                Container(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                            ),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Text(messageList[index]['message'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .merge(const TextStyle(
                                                color: Colors.white))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    formattedTime,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getBottom() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        controller: messagecontroller,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            hintStyle: TextStyle(color: Colors.grey)
                            // suffixIcon: Icon(
                            //   Icons.face,
                            //   color: primary_one,
                            //   size: 35,
                            // )
                            ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (messagecontroller.text.toString() != "") {
                        print({
                          'user': userId,
                          'chatroom': widget.roomid,
                          'message': messagecontroller.text.toString(),
                          'messageType': 'text'
                        });
                        socket.emit('sendMessage', {
                          'user': userId,
                          'chatroom': widget.roomid,
                          'message': messagecontroller.text.toString(),
                          'messageType': 'text'
                        });
                        FocusScope.of(context).unfocus();

                        setState(() {
                          messagecontroller.clear();
                        });
                      }
                    },
                    child: const Icon(
                      Icons.send,
                      size: 35,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

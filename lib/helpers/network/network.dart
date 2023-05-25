import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import 'package:henri_ppp/controller/user_controller.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  getApi(String url) async {
    // final query = params?.entries.map((e) => '${e.key}=${e.value}').join('&');

    final response = await http.get(
      // Uri.parse('$url?$query'),
      Uri.parse(url),
      headers: {
        'x-access-token': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final body = response.body;
      final jsonBody = json.decode(body);
      return jsonBody;
    }
  }

  postApi(String url, data) async {
    print('uuuu ${url}');
    String jsondata = json.encode(data);

    final response = await http.post(Uri.parse(url),
        headers: {
          'x-access-token': token,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsondata);
    print('uuuu ${response.body}');

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonBody = json.decode(body);
      return jsonBody as Map<String, dynamic>;
    }
  }

  postFormApi(String url, data, file) async {
    var postUri = Uri.parse(url);
    var request = http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    data.forEach((key, value) {
      request.fields['$key'] = value;
    });
    final headers = {'x-access-token': token};
    request.headers.addAll(headers);
    for (var i = 0; i < file.length; i++) {
      var multipartFile = await http.MultipartFile.fromPath(
          'images', file[i].path,
          filename: file[i].path.split('/').last,
          contentType: MediaType("image", "${file[i].path.split('.').last}"));
      request.files.add(multipartFile);
    }
    var response = await request.send();
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 200) {
      var resData = json.decode(res.body.toString());
      return resData;
    }
  }

  mediaFormUpload(String url, data, file, type) async {
    var postUri = Uri.parse(url);
    var request = http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    data.forEach((key, value) {
      request.fields['$key'] = value;
    });
    final headers = {'x-access-token': token};
    request.headers.addAll(headers);
    var multipartFile = await http.MultipartFile.fromPath(
        // file.path.split('.').last.toString().toUpperCase() == "MOV"
        //     ? "video"
        //     : file.path.split('.').last.toString().toUpperCase() == "MP4"
        //         ? "video"
        //         : "image",
        type,
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType(
            file.path.split('.').last.toString().toUpperCase() == "MOV"
                ? "video"
                : file.path.split('.').last.toString().toUpperCase() == "MP4"
                    ? "video"
                    : "image",
            "${file.path.split('.').last}"));
    request.files.add(multipartFile);
    var response = await request.send();
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 200 || res.statusCode == 500) {
      var resData = json.decode(res.body.toString());
      return resData;
    }
  }
}

class ApiUrls {
  // static const String baseUrl = "http://3.111.58.237:3000";
  static const String baseUrl = "http://localhost:3000";

  String SocketUrl = "http://localhost:3000";

  //For Users
  String login = "$baseUrl/login";
  String register = "$baseUrl/register";

  String updateUser = "$baseUrl/updateUser";
  String getUserByUserID = "$baseUrl/getUserByUserID";
  String followOrUnfollow = "$baseUrl/followOrUnfollow";
  String getUsersFans = "$baseUrl/getUsersFans";
  String getUserTeamMates = "$baseUrl/getUserTeamMates";
  String getAverageRating = "$baseUrl/getAverageRating";

  //For Feed
  String createNewsFeed = "$baseUrl/createNewsFeed";
  String getNewsFeed = "$baseUrl/getNewsFeed";
  String newsFeedComment = "$baseUrl/newsFeedComment";
  String ratingnewsFeed = "$baseUrl/ratingnewsFeed";

  //For Status
  String createStatus = "$baseUrl/createStatus";
  String getStatus = "$baseUrl/getStatus";

  //For Chat
  String createChatRoom = "$baseUrl/createChatRoom";
  String getChatRooms = "$baseUrl/getChatRooms";
}

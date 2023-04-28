import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import 'package:henri_ppp/providers/user_provider.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  // String baseUrl = "http://localhost:3000";
  String baseUrl = "http://3.111.58.237:3000";

  getApi(String url) async {
    // final query = params?.entries.map((e) => '${e.key}=${e.value}').join('&');

    final response = await http.get(
      // Uri.parse('$url?$query'),
      Uri.parse('$baseUrl/$url'),
      headers: {
        'x-access-token': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody;
  }

  postApi(String url, data) async {
    String jsondata = json.encode(data);

    final response = await http.post(Uri.parse('$baseUrl/$url'),
        headers: {
          'x-access-token': token,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsondata);
    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody as Map<String, dynamic>;
  }

  postFormApi(String url, data, file) async {
    var postUri = Uri.parse('$baseUrl/$url');
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
}

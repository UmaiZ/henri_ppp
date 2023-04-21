import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  getApi(String url) async {
    // final query = params?.entries.map((e) => '${e.key}=${e.value}').join('&');

    final response = await http.get(
      // Uri.parse('$url?$query'),
      Uri.parse('$url'),
      headers: {
        // 'x-access-token': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody as Map<String, dynamic>;
  }

  postApi(String url, data) async {
    // final query = params?.entries.map((e) => '${e.key}=${e.value}').join('&');
    //     Map<String, String> requestHeaders = {
    //   'x-access-token': token,
    //   'Content-Type': 'application/json'
    // };
    // final response =
    //     await http.post(url, headers: requestHeaders, body: jsonBody);
    String jsondata = json.encode(data);

    final response = await http.post(
        // Uri.parse('$url?$query'),
        Uri.parse('$url'),
        headers: {
          // ...?headers,
          // 'x-access-token': token,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsondata);
    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody as Map<String, dynamic>;
  }
}

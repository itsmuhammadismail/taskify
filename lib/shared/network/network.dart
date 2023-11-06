import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:taskify/resources/constants.dart';

class NetworkHelper {
  static Future request({
    required String url,
    Map<String, dynamic>? data,
    String token = '',
    String method = 'GET',
  }) async {
    Map<String, String> headers = {};

    if (method != 'GET') {
      headers['Content-Type'] = 'application/json';
    }

    var request = http.Request(method, Uri.parse('$kHost$url'));
    request.body = jsonEncode(data);
    print('$kHost$url');
    print(headers);
    print(request.body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }
}

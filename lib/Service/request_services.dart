import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RequestService {
  static Future<http.Response> getRequest(
      {String url, Map<String, String> headers}) {
    if (headers != null) return http.get(url, headers: headers);
    return http.get(url);
  }

  static Future<http.Response> patchRequest(
      {String url, Map<String, String> headers, body}) {
    print("URL $url \n HEADERS : $headers \n BODY : $body");
    return http.patch(url, headers: headers, body: body);
  }

  static Future<http.Response> postRequest(
      {String url, Map<String, String> header, body}) {
    print("URL $url \n BODY : $body");
    return http.post(url,headers: header,body: body);
  }

  static Future<dynamic> postImageRequest(
      {String url, Map<String, String> headers, File body}) async {
    print("URL $url \n HEADERS : $headers \n BODY : ${body.runtimeType}");

    try {
      List<int> imageBytes = body.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      return http.post(url,
          headers: headers, body: jsonEncode({"image": base64Image}));
    } catch (e) {
      print('EX : $e');
    }
  }
}
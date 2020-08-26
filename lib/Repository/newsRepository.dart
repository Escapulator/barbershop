import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/News.dart';
import 'package:vintage_barber/Service/request_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getNews() async {
  final url = APIConstant.NEWS_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        var newsObjsJson = jsonDecode(response.body)['news'] as List;
        return newsObjsJson.map((newsJson) => News.fromJson(newsJson)).toList();
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
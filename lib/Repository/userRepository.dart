import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/Service/request_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future login(String email, String password) async {
  final url = '${APIConstant.LOGIN_URL}?email=$email&password=$password';
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(jsonDecode(response.body)));
        APIConstant.CURRENT_USER = userFromJson(jsonEncode(jsonDecode(response.body)['user']));
        return userFromJson(jsonEncode(jsonDecode(response.body)['user']));
      }
      return jsonDecode(response.body)['msg'];
      break;
    case 500:
      return jsonDecode(response.body)['msg'];
      break;
    default:
      return (response.body);
  }
}

Future register(User user) async {
  final url = '${APIConstant.REGISTRATION_URL}';
  final response = await RequestService.postRequest(url: url,header: {"Content-Type": "application/json"}, body: jsonEncode(user.toJson()));
  print(jsonDecode(response.body));
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        return jsonDecode(response.body)['status'];
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}

Future update(User user) async {
  final url = '${APIConstant.USER_UPDATE_URL}';
  var body;
  if(user.imageEdit) {
    List<int> imageBytes = user.imageSrc.readAsBytesSync();
    body = jsonEncode({"updateData":user.toJsonUpdate(), "imageSrc": 'data:image/jpeg;base64,'+base64Encode(imageBytes), "imageEdit":user.imageEdit});
  } else {
    body = jsonEncode({"updateData":user.toJsonUpdate(), "imageEdit":user.imageEdit});
  }
  final response = await RequestService.postRequest(url: url,header: {"Content-Type": "application/json"}, body: body);

  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(jsonDecode(response.body)));
        APIConstant.CURRENT_USER = userFromJson(jsonEncode(jsonDecode(response.body)['user']));
        return userFromJson(jsonEncode(jsonDecode(response.body)['user']));
      }
      return jsonDecode(response.body)['message'];
      break;
    case 500:
      return jsonDecode(response.body)['message'];
      break;
    default:
      return (response.body);
  }
}
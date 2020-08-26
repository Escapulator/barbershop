import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Service/request_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getContactUs() async {
  final url = APIConstant.CONTACTUS_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        return jsonDecode(response.body)['contactUs'];
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Service/request_services.dart';


Future getAboutUs() async {
  final url = APIConstant.ABOUTUS_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        return jsonDecode(response.body)['aboutUs'];
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
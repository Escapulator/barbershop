import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Package.dart';
import 'package:vintage_barber/Service/request_services.dart';

Future getPackages() async {
  final url = APIConstant.HAIR_PACKAGE_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        var packageObjsJson = jsonDecode(response.body)['data'] as List;
        return packageObjsJson.map((packageJson) => Package.fromJson(packageJson)).toList();
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Barber.dart';
import 'package:vintage_barber/Service/request_services.dart';

Future getBarbers() async {
  final url = APIConstant.BARBERS_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        var BarberObjsJson = jsonDecode(response.body)['data'] as List;
        return BarberObjsJson.map((BarberJson) => Barber.fromJson(BarberJson)).toList();
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
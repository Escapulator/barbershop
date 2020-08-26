import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Booking.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/Service/request_services.dart';

Future submitAppointment(Booking booking) async {
  final url = APIConstant.APPOINTMENT_SUBMIT_URL;
  final response = await RequestService.postRequest(url: url,header: {"Content-Type": "application/json"}, body: jsonEncode(booking.toJson()));
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        return jsonDecode(response.body)['status'];
      }
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}

Future getBookings() async {
  final url = APIConstant.ALL_APPOINTMENT_URL+"?id="+APIConstant.CURRENT_USER.id.toString();
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        print(jsonDecode(response.body)['data']);
        var bookingObjsJson = jsonDecode(response.body)['data'] as List;
        return bookingObjsJson.map((bookingJson) => Booking.fromJson(bookingJson)).toList();
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
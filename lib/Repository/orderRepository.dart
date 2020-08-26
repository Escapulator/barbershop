import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/CartItems.dart';
import 'package:vintage_barber/Models/Order.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/Service/request_services.dart';

Future submitOrder(Order order) async {
  final url = APIConstant.CART_URL + "?data="+jsonEncode(order.toJson());
  final response = await RequestService.getRequest(url: url);
  print(url);
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        print(jsonDecode(response.body));
        return jsonDecode(response.body)['status'];
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
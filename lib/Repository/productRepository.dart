import 'dart:convert';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Package.dart';
import 'package:vintage_barber/Models/Product.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/Service/request_services.dart';

Future getProducts() async {
  final url = APIConstant.PRODUCT_URL;
  final response = await RequestService.getRequest(url: url);
  switch (response.statusCode) {
    case 200:
      if(jsonDecode(response.body)['status'] == "success") {
        var productObjsJson = jsonDecode(response.body)['products'] as List;
        return productObjsJson.map((productJson) => Product.fromJson(productJson)).toList();
      }
      return jsonDecode(response.body)['message'];
      break;
    default:
      return jsonDecode(response.body)['message'];
  }
}
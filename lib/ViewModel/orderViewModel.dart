
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Order.dart';
import 'package:vintage_barber/Models/Product.dart';
import 'package:vintage_barber/MyConstants.dart';

import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/orderRepository.dart' as orderRepo;


class orderViewModel implements MyRequest{

  addOrder() async {
    MyConstant.order.userId = APIConstant.CURRENT_USER.id;
    MyConstant.order.cart = MyConstant.cart;
    final result = await orderRepo.submitOrder(MyConstant.order);
    if (result != null && result == "success") {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  bool isloading = false;

  @override
  bool onSuccess;

  @override
  String responseMessage = "None";
}
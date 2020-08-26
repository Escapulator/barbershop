
import 'package:vintage_barber/Models/Product.dart';

import 'package:vintage_barber/my_request.dart';
import 'package:vintage_barber/Repository/productRepository.dart' as productRepo;


class productViewModel implements MyRequest{

  getAllProducts() async {
    final result = await productRepo.getProducts();
    if (result is List<Product> && result != null ) {
      onSuccess = true;
      return result;
    } else {
      onSuccess = false;
      responseMessage = result;
    }
  }

  bool isloading = true;

  @override
  bool onSuccess;

  @override
  String responseMessage = "None";
}
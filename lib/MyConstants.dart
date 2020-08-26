import 'package:vintage_barber/Models/Booking.dart';
import 'package:vintage_barber/Models/CartItems.dart';
import 'package:vintage_barber/Models/Order.dart';
import 'package:vintage_barber/Models/Product.dart';


class MyConstant {
  static Booking booking = new Booking(total: 0);
  static List <CartItem> cart = new List<CartItem>();
  static Order order = new Order(pamount:0, paymethod: "cash");
  static List<Product> allproducts = new List<Product>();
}
import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.userId,
    this.paymethod,
    this.pamount,
    this.cart,
  });

  int userId;
  List cart;
  String paymethod;
  int pamount;
  bool isSelected = false;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    userId: json["userId"],
    paymethod: json["paymethod"],
    pamount: json["pamount"],
    cart:json["cart"],
  );

   List toJson() => [ {
    "userId": userId,
    "paymethod": paymethod,
    "pamount": pamount,
    "cart" :cart,
  }];

//   addOrder() async{
//    try{
//        var order = Order(userId:userId,paymethod:paymethod,pamount: pamount,pid:pid);
//        return order;
//    }catch(e){
//      print (e);
//    }
//  }
}
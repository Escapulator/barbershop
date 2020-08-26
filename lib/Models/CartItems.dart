import 'dart:convert';
import 'package:flutter/cupertino.dart';

CartItem orderFromJson(String str) => CartItem.fromJson(json.decode(str));

String orderToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
   String id;
   String title;
   int quantity;
   int pamount;
   int pid;

  CartItem(
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.pamount,
    @required this.pid,
  );

  factory CartItem.fromJson(Map<String, dynamic> json) {
   return
    new CartItem(
      json['id'],
      json["title"],
      json["quantity"],
      json["pamount"],
      json["pid"],
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "pamount": quantity,
   // "pamount" :pamount,
    "pid" :pid,
  };
}

//  class cart with ChangeNotifier{
//     Map<String,CartItem> _items = {};
//     Map<String,CartItem> get items{
//       return {...items};
//     }
//
//     int get itemCount {
//       return _items.length;
//     }
//
//     void addItem(String pid,String title,double price){
//        if(_items.containsKey(pid)){
//          _items.update(pid, (existingCartItem) => CartItem(id:DateTime.now().toString(),title:existingCartItem.title,quantity:existingCartItem.quantity+1,price: existingCartItem.price));
//        }else{
//          _items.putIfAbsent(pid,
//                  () => CartItem(
//            title: title,
//            id: DateTime.now().toString(),
//            quantity: 1,
//            price: price,
//          ));
//        }
//        notifyListeners();
//     }
//     void removeItem(String id){
//       _items.remove(id);
//       notifyListeners();
//     }
//
//     void removeSingleItem(String id){
//       if(!_items.containsKey(id)){
//         return;
//       }if(_items[id].quantity >1){
//         _items.update(id, (existingCartItem) => CartItem(id:DateTime.now().toString(),title:existingCartItem.title,quantity:existingCartItem.quantity-1,price: existingCartItem.price));
//       }
//       notifyListeners();
//     }
//     void clear(){
//       _items = {};
//       notifyListeners();
//     }
//  }

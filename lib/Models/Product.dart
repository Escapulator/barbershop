import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.status,
    this.image,
    this.updated_price,
  });

  int id;
  String title;
  int price;
  bool status;
  String image;
  int quantity=1;
  int updated_price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    status: json["status"],
    image: json["image"],
    updated_price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "status": status,
    "image": image,
  };
}

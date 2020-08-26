import 'dart:convert';

Barber barberFromJson(String str) => Barber.fromJson(json.decode(str));

String barberToJson(Barber data) => json.encode(data.toJson());

class Barber {
  Barber({
    this.id,
    this.name,
    this.profilePic,
  });

  int id;
  String name;
  String profilePic;
  bool isSelected = false;

  factory Barber.fromJson(Map<String, dynamic> json) => Barber(
    id: json["id"],
    name: json["name"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_pic": profilePic,
  };
}

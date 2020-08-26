import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.username,
    this.usernameCanonical,
    this.email,
    this.emailCanonical,
    this.enabled,
    this.password,
    this.roles,
    this.name,
    this.md5Password,
    this.phone,
    this.profilePic,
  });

  int id;
  String username;
  String usernameCanonical;
  String email;
  String emailCanonical;
  bool enabled;
  String password;
  List<dynamic> roles;
  String name;
  String md5Password;
  String phone;
  String profilePic;
  String cPassword;
  File imageSrc;
  bool imageEdit;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    usernameCanonical: json["username_canonical"],
    email: json["email"],
    emailCanonical: json["email_canonical"],
    enabled: json["enabled"],
    password: json["password"],
    roles: List<dynamic>.from(json["roles"].map((x) => x)),
    name: json["name"],
    md5Password: json["md5_password"],
    phone: json["phone"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1["data"] = data;
    return data1;
  }

  Map<String, dynamic> toJsonUpdate()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["cPassword"] = cPassword;
    return data;
  }



}

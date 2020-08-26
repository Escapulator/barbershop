import 'dart:convert';

import 'package:vintage_barber/Models/Barber.dart';
import 'package:vintage_barber/Models/Package.dart';
import 'package:vintage_barber/Models/User.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.serviceId,
    this.time,
    this.barber,
    this.date,
    this.total,
    this.user,
    this.PayMethod,
    this.id,
    this.Status,
    this.hair_package,
    this.hair_staff,
    this.userData,
  });

  int id;
  int serviceId;
  String time;
  int Status;
  int barber;
  String date;
  int total;
  int user;
  String PayMethod;
  String barberName;
  String ServiceName;
  Package hair_package;
  Barber hair_staff;
  User userData;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      Booking(
        id: json["id"],
        total: json["amount"],
        date: json["date"],
        Status: json["status"],
        time: json["time"],
        hair_package: json['hair_package'] != null
            ? new Package.fromJson(json['hair_package'])
            : null,
        hair_staff: json['hair_staff'] != null
            ? new Barber.fromJson(json['hair_staff'])
            : null,
        userData: json['user'] != null ? new User.fromJson(json['user']) : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["serviceId"] = this.serviceId;
    data["time"] = this.time;
    data["barber"] = this.barber;
    data["data"] = this.date;
    data["total"] = this.total;
    data["user"] = this.user;
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['data'] = data;
    return data1;
  }
}

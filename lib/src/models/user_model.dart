// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? surname;
  String? dni;
  DateTime? birthOfDay;
  String? user;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.surname,
    this.dni,
    this.birthOfDay,
    this.user,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    dni: json["dni"],
    birthOfDay: json["birthOfDay"] == null ? null : DateTime.parse(json["birthOfDay"]),
    user: json["user"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "dni": dni,
    "birthOfDay": birthOfDay?.toIso8601String(),
    "user": user,
    "password": password,
  };
}

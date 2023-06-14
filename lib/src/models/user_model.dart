// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? names;
  String? surnames;
  String? dni;
  String? born;
  String? gender;
  String? cellphone;
  String? email;
  String? password;
  String? confirmPassword;
  String? imgProfile;
  String? status;
  String? version;
  String? txUser;
  String? txHost;
  String? txDate;

  UserModel({
    this.id,
    this.names,
    this.surnames,
    this.dni,
    this.born,
    this.gender,
    this.cellphone,
    this.email,
    this.password,
    this.confirmPassword,
    this.imgProfile,
    this.status,
    this.version,
    this.txUser,
    this.txHost,
    this.txDate
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    names: json["names"],
    surnames: json["surnames"],
    dni: json["dni"],
    born: json["born"],
    gender: json["gender"],
    cellphone: json["cellphone"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    imgProfile: json["imgProfile"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "names": names,
    "surnames": surnames,
    "dni": dni,
    "born": born,
    "gender": gender,
    "cellphone": cellphone,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "imgProfile": imgProfile,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
  };
}

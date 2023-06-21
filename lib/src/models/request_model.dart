// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RequestModel> requestModelFromJson(String str) => List<RequestModel>.from(json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  int? idRequest;
  int? personId;
  int? person2Id;
  int? serviceId;
  int? addressId;
  String? beginDate;
  String? endDate;
  int? orderStatus;
  bool? status;
  int? version;
  String? txUser;
  String? txHost;
  String? txDate;
  Servicee? servicee;
  Address? address;
  Person? person;
  Person? person1;

  RequestModel({
    this.idRequest,
    this.personId,
    this.person2Id,
    this.serviceId,
    this.addressId,
    this.beginDate,
    this.endDate,
    this.orderStatus,
    this.status,
    this.version,
    this.txUser,
    this.txHost,
    this.txDate,
    this.servicee,
    this.address,
    this.person,
    this.person1,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
    idRequest: json["idRequest"],
    personId: json["personId"],
    person2Id: json["person2Id"],
    serviceId: json["serviceId"],
    addressId: json["addressId"],
    beginDate: json["beginDate"],
    endDate: json["endDate"],
    orderStatus: json["orderStatus"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
    servicee: Servicee.fromJson(json["servicee"]),
    address: Address.fromJson(json["address"]),
    person: Person.fromJson(json["person"]),
    person1: Person.fromJson(json["person1"]),
  );

  Map<String, dynamic> toJson() => {
    "idRequest": idRequest,
    "personId": personId,
    "person2Id": person2Id,
    "serviceId": serviceId,
    "addressId": addressId,
    "beginDate": beginDate,
    "endDate": endDate,
    "orderStatus": orderStatus,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
    "servicee": servicee!.toJson(),
    "address": address!.toJson(),
    "person": person!.toJson(),
    "person1": person1!.toJson(),
  };
}

class Address {
  final int idAddress;
  final int personId;
  final String city;
  final String alias;
  final String avenue;
  final String street;
  final String number;
  final String building;
  final String apartment;
  final bool status;
  final int version;
  final String txUser;
  final String txHost;
  final String txDate;
  final Person person;

  Address({
    required this.idAddress,
    required this.personId,
    required this.city,
    required this.alias,
    required this.avenue,
    required this.street,
    required this.number,
    required this.building,
    required this.apartment,
    required this.status,
    required this.version,
    required this.txUser,
    required this.txHost,
    required this.txDate,
    required this.person,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    idAddress: json["idAddress"],
    personId: json["personId"],
    city: json["city"],
    alias: json["alias"],
    avenue: json["avenue"],
    street: json["street"],
    number: json["number"],
    building: json["building"],
    apartment: json["apartment"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
    person: Person.fromJson(json["person"]),
  );

  Map<String, dynamic> toJson() => {
    "idAddress": idAddress,
    "personId": personId,
    "city": city,
    "alias": alias,
    "avenue": avenue,
    "street": street,
    "number": number,
    "building": building,
    "apartment": apartment,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
    "person": person.toJson(),
  };
}

class Person {
  final int idPerson;
  final String names;
  final String surnames;
  final String dni;
  final String born;
  final String gender;
  final String cellPhone;
  final String email;
  final String password;
  final String? imgProfile;
  final String accountType;
  final bool status;
  final int version;
  final String txUser;
  final String txHost;
  final String txDate;

  Person({
    required this.idPerson,
    required this.names,
    required this.surnames,
    required this.dni,
    required this.born,
    required this.gender,
    required this.cellPhone,
    required this.email,
    required this.password,
    this.imgProfile,
    required this.accountType,
    required this.status,
    required this.version,
    required this.txUser,
    required this.txHost,
    required this.txDate,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    idPerson: json["idPerson"],
    names: json["names"],
    surnames: json["surnames"],
    dni: json["dni"],
    born: json["born"],
    gender: json["gender"],
    cellPhone: json["cellPhone"],
    email: json["email"],
    password: json["password"],
    imgProfile: json["imgProfile"],
    accountType: json["accountType"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
  );

  Map<String, dynamic> toJson() => {
    "idPerson": idPerson,
    "names": names,
    "surnames": surnames,
    "dni": dni,
    "born": born,
    "gender": gender,
    "cellPhone": cellPhone,
    "email": email,
    "password": password,
    "imgProfile": imgProfile,
    "accountType": accountType,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
  };
}

class Servicee {
  final int idService;
  final String nameService;
  final String descriptionNameService;
  final int priceHourBase;
  final String imageIcon;
  final bool status;
  final int version;
  final String txUser;
  final String txHost;
  final String txDate;

  Servicee({
    required this.idService,
    required this.nameService,
    required this.descriptionNameService,
    required this.priceHourBase,
    required this.imageIcon,
    required this.status,
    required this.version,
    required this.txUser,
    required this.txHost,
    required this.txDate,
  });

  factory Servicee.fromJson(Map<String, dynamic> json) => Servicee(
    idService: json["idService"],
    nameService: json["nameService"],
    descriptionNameService: json["descriptionNameService"],
    priceHourBase: json["priceHourBase"],
    imageIcon: json["imageIcon"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
  );

  Map<String, dynamic> toJson() => {
    "idService": idService,
    "nameService": nameService,
    "descriptionNameService": descriptionNameService,
    "priceHourBase": priceHourBase,
    "imageIcon": imageIcon,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
  };
}

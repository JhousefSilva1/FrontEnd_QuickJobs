// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceModel {
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

  ServiceModel({
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

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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

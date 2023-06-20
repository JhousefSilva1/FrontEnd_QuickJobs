// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RequestModel> requestModelFromJson(String str) => List<RequestModel>.from(json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  final int idRequest;
  final int idPerson;
  final int idPerson1;
  final int idService;
  final int idAddress;
  final String beginDate;
  final String endDate;
  final int orderStatus;
  final bool status;
  final int version;
  final String txUser;
  final String txHost;
  final String txDate;

  RequestModel({
    required this.idRequest,
    required this.idPerson,
    required this.idPerson1,
    required this.idService,
    required this.idAddress,
    required this.beginDate,
    required this.endDate,
    required this.orderStatus,
    required this.status,
    required this.version,
    required this.txUser,
    required this.txHost,
    required this.txDate,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
    idRequest: json["idRequest"],
    idPerson: json["idPerson"],
    idPerson1: json["idPerson1"],
    idService: json["idService"],
    idAddress: json["idAddress"],
    beginDate: json["beginDate"],
    endDate: json["endDate"],
    orderStatus: json["orderStatus"],
    status: json["status"],
    version: json["version"],
    txUser: json["txUser"],
    txHost: json["txHost"],
    txDate: json["txDate"],
  );

  Map<String, dynamic> toJson() => {
    "idRequest": idRequest,
    "idPerson": idPerson,
    "idPerson1": idPerson1,
    "idService": idService,
    "idAddress": idAddress,
    "beginDate": beginDate,
    "endDate": endDate,
    "orderStatus": orderStatus,
    "status": status,
    "version": version,
    "txUser": txUser,
    "txHost": txHost,
    "txDate": txDate,
  };
}

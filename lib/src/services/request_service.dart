import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/models/request_model.dart';
import 'package:quickjobsbol/src/services/services.dart';

class RequestService{
  final _storage = const FlutterSecureStorage();
  final _services = Services();

  Future addRequest(RequestModel request) async{
    String? id = await _storage.read(key: 'id');
    String url = '${Globals.apiUrl}/requests/persons/$id';
    var body = jsonEncode({
      'personId': id,
      'person2Id': id,
      'serviceId': request.serviceId,
      'addressId': request.addressId,
      'beginDate': request.beginDate,
      'endDate': request.beginDate,
      'orderStatus': request.orderStatus,
      'status': request.status,
      'version': request.version,
      'txUser': request.txUser,
      'txHost': request.txHost,
      'txDate': request.txDate
    });
    final response = await _services.postHttp(url, body, 1);
    print(response.body);
    if(response.statusCode == 200){
      return 200;
    }else{
      return 0;
    }
  }

  Future<List<RequestModel>> getRequest() async{
    String url = '${Globals.apiUrl}/requests';
    final response = await _services.getHttp(url, 1);
    if(response.statusCode == 200){
      final requestModel = requestModelFromJson(response.body);
      return requestModel;
    }else{
      return [];
    }
  }
}
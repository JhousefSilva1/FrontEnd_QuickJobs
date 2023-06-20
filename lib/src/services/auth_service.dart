import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/services/services.dart';

class AuthService{
  final _storage = const FlutterSecureStorage();
  final _services = Services();

  Future profile() async{
    String? id = await _storage.read(key: 'id');
    String url = '${Globals.apiUrl}/persons/$id';
    final response = await _services.getHttp(url, 1);
    if(response.statusCode == 200){
      final userModel = userModelFromJson(response.body);
      return userModel;
    }else{
      return 0;
    }
  }

  Future signIn(UserModel user) async{
    String url = '${Globals.apiUrl}/auth/login';
    var body = jsonEncode({
      'email': user.email,
      'password': user.password
    });
    final response = await _services.postHttp(url, body, 0);
    print(response.body);
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body);
      final token = decodedData['token']; //extract token value from http authentication response
      var jwtToken = _services.parseJwtPayLoad(token);
      await _services.secureStorage(decodedData, jwtToken);
      print(decodedData);
      return 200;
    }else{
      return 0;
    }

  }

  Future signUp(UserModel user) async{
    String url = '${Globals.apiUrl}/persons';
    var body = jsonEncode({
      'names': user.names,
      'surnames': user.surnames,
      "dni": user.dni,
      "born": user.born,
      "gender": user.gender,
      "cellPhone": user.cellphone,
      "email": user.email,
      "password": user.password,
      "imgProfile": user.imgProfile,
      "accountType": user.accountType == 'Cliente'? 'Customer': 'Employee',
      "status": user.status,
      "version": user.version,
      "txUser": user.txUser,
      "txHost": user.txHost,
      "txDate": user.txDate
    });
    final response = await _services.postHttp(url, body, 0);
    if(response.statusCode == 200){
      return 200;
    }else{
      return 0;
    }
  }
}
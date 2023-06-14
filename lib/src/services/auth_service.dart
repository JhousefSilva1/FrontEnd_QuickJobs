import 'dart:convert';

import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/services/services.dart';

class AuthService{
  final _services = Services();

  Future signIn(UserModel user) async{
    String url = '${Globals.apiUrl}/auth/signin';
    var body = jsonEncode({
      'email': user.email,
      'password': user.password
    });
    final response = await _services.postHttp(url, body, 0);
    print(response.body);
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body);
      final token = decodedData['accessToken']; //extract token value from http authentication response
      var jwtToken = _services.parseJwtPayLoad(token);
      await _services.secureStorage(decodedData, jwtToken);
      print(decodedData);
      return 200;

    }else{
      return 0;
    }

  }

  Future signUp(UserModel user) async{
    String url = '${Globals.apiUrl}/auth/signup';
    var body = jsonEncode({
      'username': user.names,
      'email': user.email,
      'password': user.password,
      'role': ['admin']
    });
    final response = await _services.postHttp(url, body, 0);
    print(response.body);
  }
}
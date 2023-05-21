import 'dart:convert';

import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/services/services.dart';

class AuthService{
  final _services = Services();

  Future singIn() async{
    String url = '${Globals.apiUrl}/auth/login';
    var body = jsonEncode({});
    final response = await _services.postHttp(url, body, 0);
  }
}
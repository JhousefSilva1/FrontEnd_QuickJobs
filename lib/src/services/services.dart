import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quickjobsbol/src/app/constants.dart';

class Services{
  final _storage = const FlutterSecureStorage();

  var headerJson = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json;charset=UTF-8',
    'Access-Control-Allow-Origin': '*',
  };

  headerAccessToken() async {
    String? accessToken = await _storage.read(key: 'accessToken');
    return <String, String>{
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
  }

  Future<bool> verifyInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future postHttp(String url, body, int headerAccess) async {
    var header = headerAccess == 0? 
      headerJson: 
      await headerAccessToken();

    final verifyInternetGoogle = await verifyInternet();
    if (verifyInternetGoogle == true) {
      try {
        final resp = await http.post(Uri.parse(url), headers: header, body: body);
        return resp;
      } on TimeoutException catch (e) {
        print(e);
        return Constants.checkServer;
      } on SocketException catch (e) {
        print(e);
        return Constants.checkServer;
      } catch (e) {
        return Constants.checkServer;
      }
    } else {
      return Constants.checkInternet;
    }
  }

  Future getHttp(String url, int headerAccess) async {
    var header = headerAccess == 0? 
      headerJson: 
      await headerAccessToken();
    final verifyInternetGoogle = await verifyInternet();
    if (verifyInternetGoogle == true) {
      try {
        final resp = await http.get(Uri.parse(url), headers: header);
        return resp;
      } on TimeoutException catch (e) {
        print(e);
        return Constants.checkServer;
      } on SocketException catch (e) {
        print(e);
        return Constants.checkServer;
      } catch (e) {
        print(e);
        return Constants.checkServer;
      }
    } else {
      return Constants.checkInternet;
    }
  }

  Future putHttp(String url, body, int headerAccess) async {
    var header = headerAccess == 0? 
      headerJson: 
      await headerAccessToken();
    final verifyInternetGoogle = await verifyInternet();
    if (verifyInternetGoogle == true) {
      try {
        final resp = await http.put(Uri.parse(url), headers: header, body: body);
        return resp;
      } on TimeoutException catch (e) {
        print(e);
        return Constants.checkServer;
      } on SocketException catch (e) {
        print(e);
        return Constants.checkServer;
      } catch (e) {
        print(e);
        return Constants.checkServer;
      }
    } else {
      return Constants.checkInternet;
    }
  }

  Future deleteHttp(String url, int headerAccess) async {
    var header = headerAccess == 0? 
      headerJson: 
      await headerAccessToken();
    final verifyInternetGoogle = await verifyInternet();
    if (verifyInternetGoogle == true) {
      try {
        final resp = await http.delete(Uri.parse(url), headers: header);
        return resp;
      } on TimeoutException catch (e) {
        print(e);
        return Constants.checkServer;
      } on SocketException catch (e) {
        print(e);
        return Constants.checkServer;
      } catch (e) {
        print(e);
        return Constants.checkServer;
      }
    } else {
      return Constants.checkInternet;
    }
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      // throw Exception(AuthTokenExpire);
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      // throw Exception(AuthTokenExpire);
    }
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    return utf8.decode(base64Url.decode(output));
  }

  Future secureStorage(decodedData, jwtToken) async{
    final accessToken = decodedData['token'];
    final userName = jwtToken['names'];
    final surnamesName = jwtToken['surnames'];
    final email = jwtToken['sub'];
    final accountType = jwtToken['accountType'];
    final id = jwtToken['id'];
    const String accessTokenKey = 'accessToken';
    final String accessTokenValue = accessToken;
    const String userNameKey = 'userName';
    final String userNameValue = userName;
    const String surnamesNameKey = 'surnamesName';
    final String surnamesNameValue = surnamesName;
    const String emailKey = 'emailName';
    final String emailValue = email;
    const String accountTypeNameKey = 'accountType';
    final String accountTypeNameValue = accountType;
    const String idNameKey = 'id';
    final int idNameValue = id;

    // const String nameKey = 'name';
    // final String nameValue = jwtToken['name'];
    await _storage.write(key: accessTokenKey, value: accessTokenValue);
    await _storage.write(key: userNameKey, value: userNameValue);
    await _storage.write(key: surnamesNameKey, value: surnamesNameValue);
    await _storage.write(key: emailKey, value: emailValue);
    await _storage.write(key: accountTypeNameKey, value: accountTypeNameValue);
    await _storage.write(key: idNameKey, value: idNameValue.toString());
  }
}
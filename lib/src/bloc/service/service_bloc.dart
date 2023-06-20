import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState>{
  ServiceBloc() : super(ServiceInitial());

  final _storage = const FlutterSecureStorage();
  final _servicesController = StreamController<List<String>>();
  Stream<List<String>> get servicesStream => _servicesController.stream;

  Future getAccount() async {
    final account = await _storage.readAll();
    return account;
  }

  Future<void> getServices() async {
    try {
      // Lógica para obtener los nombres desde una fuente de datos remota
      final nombres = ['jose'];
      _servicesController.add(nombres);
      // return true;
    } catch (e) {
      print(e);
      _servicesController.addError(e);
      // return false;
    }
  }

  Future<void> logout() async{
    await _storage.deleteAll();
  }

  void dispose() {
    _servicesController.close();
  }
}
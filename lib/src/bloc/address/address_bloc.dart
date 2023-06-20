import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'address_event.dart';
part 'address_state.dart';

class ServiceBloc extends Bloc<AddressEvent, AddressState>{
  ServiceBloc() : super(AddressInitial());

  final _storage = const FlutterSecureStorage();
  final _addressController = StreamController<List<String>>();
  Stream<List<String>> get addressStream => _addressController.stream;

  Future<void> getAddress() async {
    try {
      // Lógica para obtener los nombres desde una fuente de datos remota
      final nombres = ['jose'];
      _addressController.add(nombres);
      // return true;
    } catch (e) {
      print(e);
      _addressController.addError(e);
      // return false;
    }
  }

  void dispose() {
    _addressController.close();
  }
}
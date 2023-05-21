import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final _birthOfDayController = BehaviorSubject<String>();
  final _dniController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _surnameController = BehaviorSubject<String>();
  final _userController = BehaviorSubject<String>();

  // getters for Streams
  Stream<String> get birthOfDayStream => _birthOfDayController.stream;
  Stream<String> get dniStream => _dniController.stream;
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get surnameStream => _surnameController.stream;
  Stream<String> get userStream => _userController.stream.transform(validateUser);

  // getters for Sink
  Function(String) get changeBirthOfDay => _birthOfDayController.sink.add;
  Function(String) get changeDni => _dniController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeSurname => _surnameController.sink.add;
  Function(String) get changeUser => _userController.sink.add;

  Stream<bool> get formLoginValidStream => CombineLatestStream.combine2(userStream, passwordStream, (u, p) => true);

  void dispose() {
    _birthOfDayController.close();
    _dniController.close();
    _emailController.close();
    _nameController.close();
    _passwordController.close();
    _surnameController.close();
    _userController.close();
  }

  UserModel user = UserModel();
  AuthBloc() : super(AuthInitialState(newUser: UserModel(name: 'juan', surname: 'perez'))){
    on<ActivateAuth>((event, emit) {
      print('activateuser called');
    });
  } 

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      var pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Error');
      }
    }
  );

  final validateUser = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      String pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚ ]+$';
      RegExp regExp = RegExp(pattern);
      if(regExp.hasMatch(name)){
        sink.add(name);
      }else{
        sink.addError(Texts.incorrectUser);
      }
    }
  );
}

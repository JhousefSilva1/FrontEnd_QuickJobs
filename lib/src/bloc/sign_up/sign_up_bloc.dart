import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  final _accountTypeController = BehaviorSubject<String>();
  final _birthOfDayController = BehaviorSubject<String>();
  final _cellphoneController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _dniController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _genderController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _surnameController = BehaviorSubject<String>();

  // getters for Streams
  Stream<String> get accountTypeStream => _accountTypeController.stream;
  Stream<String> get birthOfDayStream => _birthOfDayController.stream;
  Stream<String> get cellphoneStream => _cellphoneController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
  Stream<String> get dniStream => _dniController.stream;
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get genderStream =>
      _genderController.stream.transform(validateUser);
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get surnameStream => _surnameController.stream;

  // getters for Sink
  Function(String) get changeAccountType => _accountTypeController.sink.add;
  Function(String) get changeBirthOfDay => _birthOfDayController.sink.add;
  Function(String) get changeCellphone => _cellphoneController.sink.add;
  Function(String) get changeConfirmPassword =>
      _confirmPasswordController.sink.add;
  Function(String) get changeDni => _dniController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeGender => _genderController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeSurname => _surnameController.sink.add;

  Stream<bool> get formSignUpValidStream => CombineLatestStream.combine7(
      nameStream,
      surnameStream,
      dniStream,
      cellphoneStream,
      emailStream,
      passwordStream,
      confirmPasswordStream,
      (n, s, d, c, e, p, cp) => true);

  void dispose() {
    _accountTypeController.close();
    _birthOfDayController.close();
    _cellphoneController.close();
    _confirmPasswordController.close();
    _dniController.close();
    _emailController.close();
    _genderController.close();
    _nameController.close();
    _passwordController.close();
    _surnameController.close();
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // AuthService _authService = AuthService();
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();
      await Future.delayed(const Duration(seconds: 10));
      try {
        //TODO: Change api
        // var signIn = await _authService.signIn(event.user);
        var signIn = 200;
        if (signIn == 200) {
          yield SignUpSuccess();
        } else {
          yield SignUpFailure('Error');
        }
      } catch (error) {
        yield SignUpFailure(error.toString());
      }
    }
  }

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Error');
    }
  });

  final validateUser =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    String pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚ ]+$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(name)) {
      sink.add(name);
    } else {
      sink.addError(Texts.incorrectUser);
    }
  });
}

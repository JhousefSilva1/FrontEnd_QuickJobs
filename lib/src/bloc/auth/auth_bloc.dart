import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/services/auth_service.dart';
import 'package:quickjobsbol/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

import '../../app/texts.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // getters for Streams
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream;

  // getters for Sink
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get formLoginValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    AuthService authService = AuthService();
    if (event is AuthButtonPressed) {
      yield AuthLoading();
      try {
        //TODO: Change api
        var signIn = await authService.signIn(event.user);
        // var signIn = 200;
        if (signIn == 200) {
          yield AuthSuccess();
        } else {
          yield AuthFailure('Error');
        }
      } catch (error) {
        yield AuthFailure(error.toString());
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

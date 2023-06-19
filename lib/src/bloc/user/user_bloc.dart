import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserUploaded(user: UserModel()));

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      // Simula una carga asíncrona de datos
      // await Future.delayed(Duration(seconds: 2));

      try {
        // Realiza la lógica para cargar los datos iniciales del perfil
        final user = UserModel(accountType: 'Employee', born: '23/10/1996', cellphone: '77748484', dni: '12345678', email: 'Jose.pozo@ucb.edu.bo', names: 'Jose', surnames: 'Pozo', gender: 'Masculino');

        yield UserUploaded(user: user);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
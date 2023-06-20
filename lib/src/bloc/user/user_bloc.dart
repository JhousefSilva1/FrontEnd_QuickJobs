import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/services/auth_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserUploaded(user: UserModel()));

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    AuthService authService = AuthService();
    if (event is LoadUser) {
      yield UserLoading();
      try {
        var profile = await authService.profile();
        yield UserUploaded(user: profile);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
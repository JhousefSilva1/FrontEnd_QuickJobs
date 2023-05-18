part of 'auth_bloc.dart';

@immutable
abstract class AuthState{
  final UserModel user;
  const AuthState({
    required this.user
  }); 

  @override
  UserModel get props => user;
}

class AuthInitialState extends AuthState {
  final UserModel newUser;
  const AuthInitialState({required this.newUser}):super(user: newUser);
}

class AuthSuccessState extends AuthState {
  final UserModel newUser;
  const AuthSuccessState({required this.newUser}):super(user: newUser);
}


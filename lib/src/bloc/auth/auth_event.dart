part of 'auth_bloc.dart';

class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthButtonPressed extends AuthEvent {
  UserModel user;

  AuthButtonPressed({required this.user});

  @override
  List<Object> get props => [user];
}

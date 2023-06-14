part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class ActivateAuth extends AuthEvent{
  final user;

  ActivateAuth({this.user});
}

class EmailChanged extends AuthEvent{
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthEvent{
  final String password;

  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignInAuth extends AuthEvent{
  UserModel user;

  SignInAuth({required this.user});
}

class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  UserModel user;

  LoginButtonPressed({required this.user});

  @override
  List<Object> get props => [user];
}

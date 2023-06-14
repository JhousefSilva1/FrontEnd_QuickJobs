part of 'auth_bloc.dart';

abstract class AuthState{
  UserModel user;
  bool isAuth;
  AuthState({
    required this.user,
    this.isAuth: false
  }); 

  @override
  UserModel get props => user;
}

class AuthInitialState extends AuthState {
  final UserModel newUser;
  AuthInitialState({required this.newUser}):super(user: newUser);
}

class AuthSuccessState extends AuthState {
  final UserModel newUser;
  bool isAuth;
  AuthSuccessState({required this.newUser,this.isAuth: true}):super(user: newUser);
}

class AuthFailedState extends AuthState {
  final UserModel newUser;
  bool isAuth;
  AuthFailedState({required this.newUser, this.isAuth: false}):super(user: newUser);
}

class LoginState{
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
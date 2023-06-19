part of 'sign_up_bloc.dart';

class SignUpEvent {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  UserModel user;

  SignUpButtonPressed({required this.user});

  @override
  List<Object> get props => [user];
}

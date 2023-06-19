part of 'user_bloc.dart';

class UserState {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserUploaded extends UserState {
  UserModel user;

  UserUploaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserError extends UserState {}
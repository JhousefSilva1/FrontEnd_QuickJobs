part of 'request_bloc.dart';

class RequestState{
  const RequestState();

  @override
  List<Object> get props => [];
}

class RequestInitial extends RequestState {}

class RequestLoading extends RequestState {}

class RequestSuccess extends RequestState {}

class RequestFailure extends RequestState {
  final String error;

  RequestFailure(this.error);

  @override
  List<Object> get props => [error];
}
part of 'request_bloc.dart';

class RequestEvent {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class RequestButtonPressed extends RequestEvent {
  RequestModel request;

  RequestButtonPressed({required this.request});

  @override
  List<Object> get props => [request];
}

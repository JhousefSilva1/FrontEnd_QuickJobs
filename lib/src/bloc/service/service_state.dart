part of 'service_bloc.dart';

class ServiceState{
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceSuccess extends ServiceState {}

class ServiceFailure extends ServiceState {
  final String error;

  ServiceFailure(this.error);

  @override
  List<Object> get props => [error];
}
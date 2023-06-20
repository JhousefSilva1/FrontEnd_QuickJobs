part of 'address_bloc.dart';

class AddressState{
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {}

class AddressFailure extends AddressState {
  final String error;

  AddressFailure(this.error);

  @override
  List<Object> get props => [error];
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestInitial());

  final _beginDateController = BehaviorSubject<String>();
  final _endDateController = BehaviorSubject<String>();
  final _idAddressController = BehaviorSubject<String>();
  final _idPersonController = BehaviorSubject<String>();
  final _idPerson1Controller = BehaviorSubject<String>();
  final _idRequestController = BehaviorSubject<String>();
  final _idServiceController = BehaviorSubject<String>();
  final _orderStatusController = BehaviorSubject<String>();
  // final _cellphoneController = BehaviorSubject<String>();
  // final _confirmPasswordController = BehaviorSubject<String>();
  // final _dniController = BehaviorSubject<String>();
  // final _emailController = BehaviorSubject<String>();
  // final _genderController = BehaviorSubject<String>();
  // final _nameController = BehaviorSubject<String>();
  // final _passwordController = BehaviorSubject<String>();
  // final _surnameController = BehaviorSubject<String>();

  // getters for Streams
  Stream<String> get beginDateStream => _beginDateController.stream;
  Stream<String> get endDateStream => _endDateController.stream;
  Stream<String> get idAddressStream => _idAddressController.stream;
  Stream<String> get idPersonStream => _idPersonController.stream;
  Stream<String> get idPerson1Stream => _idPerson1Controller.stream;
  Stream<String> get idRequestStream => _idRequestController.stream;
  Stream<String> get idServiceStream => _idServiceController.stream;
  Stream<String> get orderStatusStream => _orderStatusController.stream;

  // getters for Sink
  Function(String) get changeBeginDate => _beginDateController.sink.add;
  Function(String) get changeEndDate => _endDateController.sink.add;
  Function(String) get changeIdAddress => _idAddressController.sink.add;
  Function(String) get changeIdPerson => _idPersonController.sink.add;
  Function(String) get changeIdPerson1 => _idPerson1Controller.sink.add;
  Function(String) get changeIdRequest => _idRequestController.sink.add;
  Function(String) get changeIdService => _idServiceController.sink.add;
  Function(String) get changeOrderStatus => _orderStatusController.sink.add;

  // Stream<bool> get formSignUpValidStream => CombineLatestStream.combine7(nameStream, surnameStream, dniStream, cellphoneStream, emailStream, passwordStream, confirmPasswordStream, (n, s, d, c, e,p, cp) => true);

  void dispose() {
    _beginDateController.close();
    _endDateController.close();
    _idAddressController.close();
    _idPersonController.close();
    _idPerson1Controller.close();
    _idRequestController.close();
    _orderStatusController.close();
  }

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    // AuthService authService = AuthService();
    if (event is RequestButtonPressed) {
      yield RequestLoading();
      try {
        // var signIn = await authService.signUp(event.user);
        var signIn = 200;
        if (signIn == 200) {
          yield RequestSuccess();
        } else {
          yield RequestFailure('Error');
        }
      } catch (error) {
        yield RequestFailure(error.toString());
      }
    }
  }
}

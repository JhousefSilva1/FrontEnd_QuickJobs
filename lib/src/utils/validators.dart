// import 'dart:async';

// import 'package:quickjobsbol/src/app/texts.dart';

// class Validators{
//   final validateEmail = StreamTransformer<String, String>.fromHandlers(
//     handleData: (email, sink){
//       var pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//       RegExp regExp = RegExp(pattern);

//       if(regExp.hasMatch(email)){
//         sink.add(email);
//       }else{
//         sink.addError('Error');
//       }
//     }
//   );

//   final validateUser = StreamTransformer<String, String>.fromHandlers(
//     handleData: (name, sink){
//       String pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚ ]+$';
//       RegExp regExp = RegExp(pattern);
//       if(regExp.hasMatch(name)){
//         sink.add(name);
//       }else{
//         sink.addError(Texts.incorrectUser);
//       }
//     }
//   );
// }
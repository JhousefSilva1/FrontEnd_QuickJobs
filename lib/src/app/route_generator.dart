import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/pages/http_not_found_view.dart';
import 'package:quickjobsbol/src/pages/principal_view.dart';
import 'package:quickjobsbol/src/pages/sign_in_view.dart';
import 'package:quickjobsbol/src/pages/sign_up_view.dart';
import 'package:quickjobsbol/src/services/auth_service.dart';

class RouteGenerator{
  static Route generateRoute(RouteSettings settings){
    AuthService _authService = AuthService();
    // final args = settings.arguments;
    final authBloc = AuthBloc(_authService);

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => SignInView(authBloc: authBloc));
      case '/principal':
        return MaterialPageRoute(builder: (context) => const PrincipalView());
      case '/signIn':
        return MaterialPageRoute(builder: (context) => SignInView(authBloc: authBloc));
      case '/signUp':
        return MaterialPageRoute(builder: (context) => SignUpView(authBloc: authBloc));
      default:
        return MaterialPageRoute(builder: (context) => const HttpNotFoundView());
    }
  }
}
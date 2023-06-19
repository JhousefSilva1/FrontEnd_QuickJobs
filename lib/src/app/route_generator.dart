import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/pages/add_address_view.dart';
import 'package:quickjobsbol/src/pages/address_view.dart';
import 'package:quickjobsbol/src/pages/documents_view.dart';
import 'package:quickjobsbol/src/pages/http_not_found_view.dart';
import 'package:quickjobsbol/src/pages/principal_view.dart';
import 'package:quickjobsbol/src/pages/profile_view.dart';
import 'package:quickjobsbol/src/pages/request_view.dart';
import 'package:quickjobsbol/src/pages/services_view.dart';
import 'package:quickjobsbol/src/pages/sign_in_view.dart';
import 'package:quickjobsbol/src/pages/sign_up_view.dart';

class RouteGenerator{
  static Route generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => const SignInView());
      case '/addAddress':
        return MaterialPageRoute(builder: (context) => const AddAddressView());
      case '/address':
        return MaterialPageRoute(builder: (context) => AddressView());
      case '/documents':
        return MaterialPageRoute(builder: (context) => const DocumentsView());
      case '/principal':
        return MaterialPageRoute(builder: (context) => PrincipalView());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case '/request':
        return MaterialPageRoute(builder: (context) => RequestView(requestId: args as int));
      case '/services':
        return MaterialPageRoute(builder: (context) => const ServicesView());
      case '/signIn':
        return MaterialPageRoute(builder: (context) => const SignInView());
      case '/signUp':
        return MaterialPageRoute(builder: (context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (context) => const HttpNotFoundView());
    }
  }
}
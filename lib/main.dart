import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickjobsbol/src/app/route_generator.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/bloc/service/service_bloc.dart';
import 'package:quickjobsbol/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:quickjobsbol/src/bloc/user/user_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ServiceBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => UserBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(229, 229, 229, 1),
          ),
          primaryColor: PalleteColor.primaryColor,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: PalleteColor.strokeColor),
            headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: PalleteColor.greyColor),
            headlineMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: PalleteColor.darkSkyBlueColor),
            displaySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: PalleteColor.strokeColor),
            displayMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
            displayLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: PalleteColor.greyColor),
            bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: PalleteColor.greyColor),
            bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: PalleteColor.darkSkyBlueColor),
            titleMedium: TextStyle(fontSize: 16.0, color: PalleteColor.darkSkyBlueColor),
            titleSmall: TextStyle(fontSize: 11.0, color: PalleteColor.blackColor),
            bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: PalleteColor.primaryColor)
          )
        ),
        title: 'Quick Jobs',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
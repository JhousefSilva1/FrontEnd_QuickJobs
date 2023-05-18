import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class SignInView extends StatelessWidget {
  final AuthBloc authBloc;

  const SignInView({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  Text(Texts.welcome, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Text(Texts.signInDescription, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 80),
                  Form(
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            StreamBuilder(
                              stream: authBloc.userStream,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    errorText: snapshot.hasError? Texts.incorrectUser: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    hintText: Texts.hintUser,
                                    labelText: Texts.user,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.account_circle_rounded, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  onChanged: authBloc.changeUser,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyUser: null,
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            StreamBuilder(
                              stream: authBloc.passwordStream,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    errorText: snapshot.hasError? Texts.incorrectPassword: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor, width: 1.2),
                                    ),
                                    hintText: Texts.hintPassword,
                                    labelText: Texts.password,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.lock, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIcon: const Padding(padding: EdgeInsets.only(right: 10.0), child: Icon(Icons.visibility_off_outlined, color: PalleteColor.primaryColor, /*color: model.suffixIconColor*/)),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  maxLines: 1,
                                  onChanged: authBloc.changePassword,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyPassword: null,
                                );
                              },
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: PalleteColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                onPressed: () {
                                  print(Texts.signIn);
                                }, 
                                child: Text(Texts.signIn, style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.whiteColor)))
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: PalleteColor.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                onPressed: () {
                                  print(Texts.signUp);
                                  Navigator.of(context).pushNamed('/signUp');
                                }, 
                                child: Text(Texts.signUp, style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
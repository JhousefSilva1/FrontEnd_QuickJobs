import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class SignUpView extends StatelessWidget {
  final AuthBloc authBloc;
  const SignUpView({super.key, required this.authBloc});

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
                  const SizedBox(height: 80),
                  Text(Texts.createAccount, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Text(Texts.signUpDescription, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 40),
                  Form(
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            StreamBuilder(
                              stream: authBloc.nameStream,
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
                                    errorText: snapshot.hasError? Texts.incorrectName: '',
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
                                    labelText: Texts.name,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.account_circle_rounded, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  onChanged: authBloc.changeName,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyName: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: authBloc.surnameStream,
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
                                    errorText: snapshot.hasError? Texts.incorrectSurname: '',
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
                                    hintText: Texts.hintSurname,
                                    labelText: Texts.surname,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.account_circle_rounded, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  onChanged: authBloc.changeSurname,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptySurname: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: authBloc.dniStream,
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
                                    errorText: snapshot.hasError? Texts.incorrectDni: '',
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
                                    hintText: Texts.hintDni,
                                    labelText: Texts.dni,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.art_track_rounded, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  onChanged: authBloc.changeDni,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyDni: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: authBloc.birthOfDayStream,
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
                                    errorText: snapshot.hasError? Texts.incorrectBirthOfDay: '',
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
                                    hintText: Texts.hintBirthOfDay,
                                    labelText: Texts.birthOfDay,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.cake_sharp, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  onChanged: authBloc.changeBirthOfDay,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyBirthOfDay: null,
                                );
                              },
                            ),
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
                            const SizedBox(height: 20),
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
                                child: Text(Texts.signUp, style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.whiteColor)))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
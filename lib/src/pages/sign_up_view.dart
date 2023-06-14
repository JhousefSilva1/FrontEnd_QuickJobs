import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class SignUpView extends StatefulWidget {
  final AuthBloc authBloc;
  const SignUpView({super.key, required this.authBloc});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  UserModel _userModel = UserModel();
  bool _showConfirmPassword = true;
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.authBloc,
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
                    key: _formKey,
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            StreamBuilder(
                              stream: widget.authBloc.nameStream,
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
                                  onChanged: widget.authBloc.changeName,
                                  onSaved: (value) => _userModel.names = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyName: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.surnameStream,
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
                                  onChanged: widget.authBloc.changeSurname,
                                  onSaved: (value) => _userModel.surnames = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptySurname: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.dniStream,
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
                                  onChanged: widget.authBloc.changeDni,
                                  onSaved: (value) => _userModel.dni = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyDni: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.birthOfDayStream,
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
                                  onChanged: widget.authBloc.changeBirthOfDay,
                                  onSaved: (value) => _userModel.born = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyBirthOfDay: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.genderStream,
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
                                    hintText: Texts.hintGender,
                                    labelText: Texts.gender,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.male_outlined, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  onChanged: widget.authBloc.changeGender,
                                  onSaved: (value) => _userModel.gender = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyUser: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.cellphoneStream,
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
                                    hintText: Texts.hintCellPhone,
                                    labelText: Texts.cellphone,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.phone, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                  onChanged: widget.authBloc.changeCellphone,
                                  onSaved: (value) => _userModel.cellphone = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyCellPhone: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.emailStream,
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
                                    hintText: Texts.hintEmail,
                                    labelText: Texts.email,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.account_circle_rounded, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  maxLines: 1,
                                  onChanged: widget.authBloc.changeUser,
                                  onSaved: (value) => _userModel.email = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.passwordStream,
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10.0), 
                                      child: IconButton(
                                        icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility, color: PalleteColor.primaryColor), 
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = !_showPassword;
                                          });
                                        },
                                      )
                                    ),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  maxLines: 1,
                                  obscureText: _showPassword,
                                  onChanged: widget.authBloc.changePassword,
                                  onSaved: (value) => _userModel.password = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyPassword: null,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: widget.authBloc.confirmPasswordStream,
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
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10.0), 
                                      child: IconButton(
                                        icon: Icon(_showConfirmPassword ? Icons.visibility_off : Icons.visibility, color: PalleteColor.primaryColor), 
                                        onPressed: () {
                                          setState(() {
                                            _showConfirmPassword = !_showConfirmPassword;
                                          });
                                        },
                                      )
                                    ),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  maxLines: 1,
                                  obscureText: _showConfirmPassword,
                                  onChanged: widget.authBloc.changeConfirmPassword,
                                  onSaved: (value) => _userModel.confirmPassword = value,
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
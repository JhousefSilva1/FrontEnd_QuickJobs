import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool _showConfirmPassword = true;
  final _userModel = UserModel();
  bool _showPassword = true;
  String dateBirthday = '';
  final _accountType = const [
    'Cliente',
    'Empleado',
  ];
  final _gender = const [
    'Femenino',
    'Masculino',
  ];
  String _selectedAccountTye = 'Cliente';
  String _selectedOption = 'Femenino';

  @override
  Widget build(BuildContext context) {
    TextEditingController birthdayController = TextEditingController(text: dateBirthday);
    final signUpBloc = SignUpBloc();
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if(state is SignUpLoading){
          QuickAlert.show(
            context: context, 
            type: QuickAlertType.loading,
            text: Texts.registeringUser,
            barrierDismissible: false,
            backgroundColor: PalleteColor.whiteColor,
          );
        }else if(state is SignUpSuccess){
          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        }else{
          Navigator.of(context).pop();
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: Texts.failedRegisterUser,
            confirmBtnText: Texts.accept,
            confirmBtnColor: PalleteColor.greyColor
          );
        }
      },
      child: Scaffold(
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
                            stream: signUpBloc.nameStream,
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
                                onChanged: signUpBloc.changeName,
                                onSaved: (value) => _userModel.names = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) => value!.isEmpty? Texts.emptyName: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.surnameStream,
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
                                onChanged: signUpBloc.changeSurname,
                                onSaved: (value) => _userModel.surnames = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) => value!.isEmpty? Texts.emptySurname: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.dniStream,
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
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: signUpBloc.changeDni,
                                onSaved: (value) => _userModel.dni = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyDni: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.birthOfDayStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                controller: birthdayController,
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
                                onChanged: signUpBloc.changeBirthOfDay,
                                onTap: (){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  _selectDate(context, birthdayController);
                                },
                                onSaved: (value) => _userModel.born = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyBirthOfDay: null,
                                enableInteractiveSelection: false,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.genderStream,
                            builder: (context, snapshot) {
                              return DropdownButtonFormField<String>(
                                value: _selectedOption,
                                items: _gender.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue!;
                                    _userModel.gender = newValue;
                                  });
                                  signUpBloc.changeGender(newValue!);
                                },
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
                                onSaved: (value) => _userModel.gender = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyUser: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.cellphoneStream,
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
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                onChanged: signUpBloc.changeCellphone,
                                onSaved: (value) => _userModel.cellphone = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyCellPhone: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.accountTypeStream,
                            builder: (context, snapshot) {
                              return DropdownButtonFormField<String>(
                                value: _selectedAccountTye,
                                items: _accountType.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedAccountTye = newValue!;
                                    _userModel.accountType = newValue == 'Cliente'? 'Customer': 'Employee';
                                  });
                                  signUpBloc.changeAccountType(newValue!);
                                },
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
                                  labelText: Texts.accountType,
                                  labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                  prefixIcon: Icon(Icons.male_outlined, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                ),
                                onSaved: (value) => _userModel.accountType = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.emailStream,
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
                                onChanged: signUpBloc.changeEmail,
                                onSaved: (value) => _userModel.email = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.passwordStream,
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
                                      icon: Icon(!_showPassword ? Icons.visibility_off : Icons.visibility, color: PalleteColor.primaryColor), 
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
                                onChanged: signUpBloc.changePassword,
                                onSaved: (value) => _userModel.password = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyPassword: null,
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: signUpBloc.confirmPasswordStream,
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
                                      icon: Icon(!_showConfirmPassword ? Icons.visibility_off : Icons.visibility, color: PalleteColor.primaryColor), 
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
                                onChanged: signUpBloc.changeConfirmPassword,
                                onSaved: (value) => _userModel.confirmPassword = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyPassword: null,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          StreamBuilder(
                            stream: signUpBloc.formSignUpValidStream,
                            builder: (context, snapshot) {
                              return SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: PalleteColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onPressed: () => submit(),
                                  child: Text(Texts.signUp, style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.whiteColor)))
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  _selectDate(BuildContext context, TextEditingController birthdayController) async{
    String languageCode = Localizations.localeOf(context).languageCode;
    DateTime? picked = await showRoundedDatePicker(
      fontFamily: 'Poppins',
      context: context, 
      initialDate: DateTime(DateTime.now().year-12,  DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(1930), 
      lastDate: DateTime(DateTime.now().year-12,  DateTime.now().month, DateTime.now().day),
      locale: Locale(languageCode),
      borderRadius: 30.0,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: PalleteColor.whiteColor),
          bodySmall: TextStyle(fontSize: 12.0, color: PalleteColor.primaryColor),
        ),
      )
    );
    if(picked != null){
      setState(() {
        final date = DateFormat('dd-MM-yyyy').format(picked).toString();
        birthdayController.text = date;
        _userModel.born = birthdayController.text;
        dateBirthday = birthdayController.text;
      });
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void submit()async {
    if(_validateAndSave()) {
      if(_userModel.password == _userModel.confirmPassword){
        final ipv4 = await Ipify.ipv4();
        _userModel.txHost = ipv4;
        _userModel.version = Globals.version;
        _userModel.status = true;
        _userModel.txDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
        _userModel.txUser = '${_userModel.names} ${_userModel.surnames}';
        BlocProvider.of<SignUpBloc>(context).add(SignUpButtonPressed(user: _userModel));
      }else{
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: Texts.passwordNotMatch,
          confirmBtnText: Texts.accept,
          confirmBtnColor: PalleteColor.greyColor
        );
      }
    }
  }
}
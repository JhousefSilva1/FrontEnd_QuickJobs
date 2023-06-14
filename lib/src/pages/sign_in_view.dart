import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/auth/auth_bloc.dart';
import 'package:quickjobsbol/src/models/user_model.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class SignInView extends StatefulWidget {
  final AuthBloc authBloc;

  const SignInView({super.key, required this.authBloc});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _userModel = UserModel();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
          CircularProgressIndicator();
        }else if(state is LoginSuccess){
          Navigator.pushReplacementNamed(context, '/principal');
        }else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Error'),
                content: Text(state.toString()),
                actions: [
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
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
                const SizedBox(height: 150),
                Text(Texts.welcome, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text(Texts.signInDescription, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 80),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    child: Center(
                      child: Column(
                        children: <Widget>[
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
                                onChanged: widget.authBloc.changeEmail,
                                onSaved: (value) => _userModel.email = value,
                                style: Theme.of(context).textTheme.headlineMedium,
                                validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
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
                          const SizedBox(height: 50),
                          StreamBuilder(
                            stream: widget.authBloc.formLoginValidStream,
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
                                  onPressed: snapshot.hasData? () {
                                    submit();
                                  }: null, 
                                  child: Text(Texts.signIn, style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.whiteColor)))
                                ),
                              );
                            },
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
      )
    );
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void submit(){
    if(_validateAndSave()){
      print(_userModel.email);
      print(_userModel.password);
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(user: _userModel));
      print('aux.toString()');
    }
  }
}
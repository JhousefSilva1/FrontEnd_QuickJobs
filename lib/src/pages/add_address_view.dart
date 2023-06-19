import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PalleteColor.whiteColor,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: ()=> Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: PalleteColor.primaryColor)
          ),
          title: Text('Agregar Direcciones', style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Text('Mis Direcciones', style: Theme.of(context).textTheme.titleLarge),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'Casa',
                  labelText: 'Alias de direccion',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.datetime,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'La Paz',
                  labelText: 'Ciudad',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'Juan del granado',
                  labelText: 'Avenida',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'Calle 2',
                  labelText: 'Calle',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: '123',
                  labelText: 'Numero',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'Entel 1',
                  labelText: 'Edificio o Condominio',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: '123',
                  labelText: 'Departamento',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                  ),
                  hintText: 'Descripcion',
                  labelText: 'Referencias',
                  labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 5,
                // onChanged: widget.authBloc.changeEmail,
                // onSaved: (value) => _userModel.email = value,
                style: Theme.of(context).textTheme.headlineMedium,
                // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                  child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.015, horizontal: MediaQuery.of(context).size.width*0.05),
                    backgroundColor: PalleteColor.strokeColor,
                    shape: const StadiumBorder(),
                  ), // snapshot.hasData? () => submit(user): null,
                  child: Text('Agregar Direccion', style: Theme.of(context).textTheme.titleLarge!.merge(const TextStyle(color: PalleteColor.whiteColor))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
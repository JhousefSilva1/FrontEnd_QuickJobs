import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickjobsbol/src/app/globals.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/request/request_bloc.dart';
import 'package:quickjobsbol/src/models/request_model.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class RequestView extends StatefulWidget {
  RequestView({super.key, required this.requestId});
  List requestId;

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final _formKey = GlobalKey<FormState>();
  RequestModel _requestModel = RequestModel();
  String beginDate = '';
  String endDate = '';
  String title = '';
  int id = 0;

  @override
  void initState() {
    id = widget.requestId[0]; 
    title = widget.requestId[1]; 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController beginDateController = TextEditingController(text: beginDate);
    TextEditingController endDateController = TextEditingController(text: endDate);
    final requestBloc = RequestBloc();
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
          title: Text('Mis Solicitudes', style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: BlocListener<RequestBloc, RequestState>(
          listener: (context, state) {
            if(state is RequestLoading){
              QuickAlert.show(
                context: context, 
                type: QuickAlertType.loading,
                text: Texts.registeringUser,
                barrierDismissible: false,
                backgroundColor: PalleteColor.whiteColor,
              );
            }else if(state is RequestSuccess){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                children: [
                  Text('Busquemos lo que necesitas', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        id == 1 ? Icon(Icons.lightbulb, color: PalleteColor.primaryColor, size: 50): id == 2? Icon(Icons.water_drop_sharp, color: PalleteColor.primaryColor, size: 50): id == 3? Icon(Icons.brush_sharp, color: PalleteColor.primaryColor, size: 50): id == 4? Icon(Icons.carpenter_rounded, color: PalleteColor.primaryColor, size: 50): id == 5? Icon(Icons.cookie_sharp, color: PalleteColor.primaryColor, size: 50): id == 6? Icon(Icons.eco_outlined, color: PalleteColor.primaryColor, size: 50): id == 7? Icon(Icons.car_repair_sharp, color: PalleteColor.primaryColor, size: 50): Icon(Icons.wash_outlined, color: PalleteColor.primaryColor, size: 50),
                        const SizedBox(height: 8),
                        Text(title, style: Theme.of(context).textTheme.bodyLarge,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          children: [
                            StreamBuilder(
                              stream: requestBloc.beginDateStream,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  controller: beginDateController,
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
                                    labelText: Texts.beginDate,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.date_range, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  onChanged: requestBloc.changeBeginDate,
                                  onTap: (){
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    _selectDate(context, beginDateController);
                                  },
                                  // onSaved: (value) => _requestModel.beginDate = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyBirthOfDay: null,
                                  enableInteractiveSelection: false,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: requestBloc.endDateStream,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  controller: endDateController,
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
                                    labelText: Texts.beginHour,
                                    labelStyle: snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): Theme.of(context).textTheme.bodyMedium,
                                    prefixIcon: Icon(Icons.date_range, color: snapshot.hasError? PalleteColor.redColor: PalleteColor.primaryColor),
                                    suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  onChanged: requestBloc.changeEndDate,
                                  onTap: (){
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    _selectTime(context, endDateController);
                                  },
                                  // onSaved: (value) => _userModel.born = value,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  validator: (value) => value!.isEmpty? Texts.emptyBirthOfDay: null,
                                  enableInteractiveSelection: false,
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: requestBloc.idAddressStream,
                              builder: (context, snapshot) {
                                return TextFormField(
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
                                    hintText: 'Achumani',
                                    labelText: 'Seleccione su direccion',
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
                                );
                              },
                            ),
                            // StreamBuilder(
                            //   stream: requestBloc.idAddressStream,
                            //   builder: (context, snapshot) {
                            //     return TextFormField(
                            //       decoration: InputDecoration(
                            //         contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            //         enabledBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         errorBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                            //         fillColor: Colors.white,
                            //         filled: true,
                            //         focusedBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         focusedErrorBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         hintText: 'La Paz',
                            //         labelText: 'Ciudad',
                            //         labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                            //         prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                            //         suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                            //       ),
                            //       keyboardType: TextInputType.text,
                            //       maxLines: 1,
                            //       // onChanged: widget.authBloc.changeEmail,
                            //       // onSaved: (value) => _userModel.email = value,
                            //       style: Theme.of(context).textTheme.headlineMedium,
                            //       // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                            //     );
                            //   },
                            // ),
                            // StreamBuilder(
                            //   stream: requestBloc.,
                            //   builder: (context, snapshot) {
                            //     return TextFormField(
                            //       decoration: InputDecoration(
                            //         contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            //         enabledBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         errorBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                            //         fillColor: Colors.white,
                            //         filled: true,
                            //         focusedBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         focusedErrorBorder: const OutlineInputBorder(
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //           borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //         ),
                            //         hintText: 'La Paz',
                            //         labelText: 'Ciudad',
                            //         labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                            //         prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                            //         suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                            //       ),
                            //       keyboardType: TextInputType.text,
                            //       maxLines: 1,
                            //       // onChanged: widget.authBloc.changeEmail,
                            //       // onSaved: (value) => _userModel.email = value,
                            //       style: Theme.of(context).textTheme.headlineMedium,
                            //       // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                            //     );
                            //   },
                            // ),
                            
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            //     enabledBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                            //     fillColor: Colors.white,
                            //     filled: true,
                            //     focusedBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     focusedErrorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     hintText: 'Achumani',
                            //     labelText: 'Calle o Avenida',
                            //     labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                            //     prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                            //     suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                            //   ),
                            //   keyboardType: TextInputType.text,
                            //   maxLines: 1,
                            //   // onChanged: widget.authBloc.changeEmail,
                            //   // onSaved: (value) => _userModel.email = value,
                            //   style: Theme.of(context).textTheme.headlineMedium,
                            //   // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                            // ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            //     enabledBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                            //     fillColor: Colors.white,
                            //     filled: true,
                            //     focusedBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     focusedErrorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     hintText: 'Achumani',
                            //     labelText: 'Zona',
                            //     labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                            //     prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                            //     suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                            //   ),
                            //   keyboardType: TextInputType.text,
                            //   maxLines: 1,
                            //   // onChanged: widget.authBloc.changeEmail,
                            //   // onSaved: (value) => _userModel.email = value,
                            //   style: Theme.of(context).textTheme.headlineMedium,
                            //   // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                            // ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            //     enabledBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     errorText: /*snapshot.hasError? Texts.incorrectUser: */'',
                            //     fillColor: Colors.white,
                            //     filled: true,
                            //     focusedBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     focusedErrorBorder: const OutlineInputBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //       borderSide: BorderSide(color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor, width: 1.2),
                            //     ),
                            //     hintText: '77790909',
                            //     labelText: 'Numero',
                            //     labelStyle: /*snapshot.hasError? Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.redColor)): */Theme.of(context).textTheme.bodyMedium,
                            //     prefixIcon: const Icon(Icons.account_circle_rounded, color: /*snapshot.hasError? PalleteColor.redColor:*/ PalleteColor.primaryColor),
                            //     suffixIconConstraints: const BoxConstraints(maxWidth: 50.0, minWidth: 30.0, minHeight: 10.0),
                            //   ),
                            //   keyboardType: TextInputType.emailAddress,
                            //   maxLines: 1,
                            //   // onChanged: widget.authBloc.changeEmail,
                            //   // onSaved: (value) => _userModel.email = value,
                            //   style: Theme.of(context).textTheme.headlineMedium,
                            //   // validator: (value) => value!.isEmpty? Texts.emptyEmail: null,
                            // ),
          
                          ],
                        ),
                      ),
                    )
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .45,
                          child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.015, horizontal: MediaQuery.of(context).size.width*0.05),
                            backgroundColor: PalleteColor.strokeColor,
                            shape: const StadiumBorder(),
                          ), // snapshot.hasData? () => submit(user): null,
                          child: Text('Cancelar', style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(color: Theme.of(context).primaryColor))),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .45,
                          child: ElevatedButton(
                          onPressed: () => submit(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.015, horizontal: MediaQuery.of(context).size.width*0.05),
                            backgroundColor: PalleteColor.strokeColor,
                            shape: const StadiumBorder(),
                          ), // snapshot.hasData? () => submit(user): null,
                          child: Text('Publicar', style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(color: Theme.of(context).primaryColor))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  _selectDate(BuildContext context, TextEditingController dateController) async{
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
        dateController.text = date;
        // _userModel.born = dateController.text;
        beginDate = dateController.text;
      });
    }
  }

  _selectTime(BuildContext context, TextEditingController dateController) async{
    String languageCode = Localizations.localeOf(context).languageCode;
    var picked = await showRoundedTimePicker(
      fontFamily: 'Poppins',
      context: context, 
      initialTime: TimeOfDay.now(),
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
        final date = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        dateController.text = date;
        // _userModel.born = dateController.text;
        endDate = dateController.text;
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

  void submit() async {
    // if(_validateAndSave()){
      final ipv4 = await Ipify.ipv4();
      _requestModel.txHost = ipv4;
      _requestModel.beginDate = '$beginDate $endDate';
      _requestModel.addressId = 1;
      _requestModel.personId = 2;
      _requestModel.person2Id = 2;
      _requestModel.serviceId = id;
      _requestModel.orderStatus = 3;
      _requestModel.status = true;
      _requestModel.version = Globals.version;
      _requestModel.txDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
      _requestModel.txUser = 'admin';

      BlocProvider.of<RequestBloc>(context).add(RequestButtonPressed(request: _requestModel));
    // }
  }
}
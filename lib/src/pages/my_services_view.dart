import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickjobsbol/src/bloc/request/request_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class MyServicesView extends StatefulWidget {
  MyServicesView({super.key, required this.serviceType});
  int serviceType;

  @override
  State<MyServicesView> createState() => _MyServicesViewState();
}

class _MyServicesViewState extends State<MyServicesView> {
  final RequestBloc requestBloc = RequestBloc();

  @override
  void initState() {
    super.initState();
    requestBloc.getRequest(widget.serviceType);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: requestBloc.requestStream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return const Text('Error');
        }else{
          if(snapshot.data!.length == 0){
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty, color: PalleteColor.greyColor, size: 50),
                  Text('Aun no se tiene servicios', style: Theme.of(context).textTheme.labelMedium!.merge(TextStyle(fontSize: 20)))

                ],
              ) 
            );
          }else{
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: MediaQuery.of(context).size.height*0.01);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: ()async{
                          QuickAlert.show(
                            context: context, 
                            type: QuickAlertType.confirm,
                            text: 'Completar?',
                            onConfirmBtnTap: () async{
                              await requestBloc.updateRequest(snapshot.data![index], snapshot.data![index].idRequest!);
                              Navigator.of(context).pop();
                            }
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10,10,10,0),
                          width: double.infinity,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Nombres',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Text(snapshot.data![index].person1!.names,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Apellidos',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Text(snapshot.data![index].person1!.surnames,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Servicio',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Text(snapshot.data![index].servicee!.nameService,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Fecha',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Text(snapshot.data![index].beginDate!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Descripcion',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Expanded(
                                        child: Text(snapshot.data![index].servicee!.descriptionNameService,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(child: Divider(thickness: 0.5, color: Theme.of(context).hintColor.withOpacity(0.9))),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Costo Total',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                      ),
                                      Text('${snapshot.data![index].servicee!.priceHourBase} BS',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }
}